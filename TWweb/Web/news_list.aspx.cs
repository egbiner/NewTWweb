using MyClass;
using System;
using System.Data;

namespace TWweb.Web
{
    public partial class news_list : System.Web.UI.Page
    {
        public string news_type = null;
        public int page_num;
        public string nav_name;
        public DataTable t_news_type;
        public Page news_page = null;
        public DataTable t_friend_url = null;
        public DataTable t_news_hot = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            news_type = Context.Request["news_type"]==null?"25": Context.Request["news_type"];
            page_num = Context.Request["page_num"] == null ? 1 : int.Parse(Context.Request["page_num"].ToString());
            int nav_id = News.get_nav_id_by_news_type_id(int.Parse(news_type));
            DataTable t = News.get_navname_byid(nav_id);
            nav_name = t.Rows[0]["name"].ToString();
            t_news_type = News.get_newstype_by_nav_id(nav_id);
            news_page = News.GetNewsPage(18, page_num, int.Parse(news_type));
            t_friend_url = SqlHelper.ExecuteDataTable("select * from friend_url where show=1");
            t_news_hot = SqlHelper.ExecuteDataTable("select top 8 * from news order by click desc");
        }
    }
}