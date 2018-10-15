using MyClass;
using System;
using System.Data;

namespace TWweb.Web
{
    public partial class news_list_iframe : System.Web.UI.Page
    {
        public string news_type = null;
        public int page_num;
        public string nav_name;
        public DataTable t_news_type;
        public DataTable t_news_list;
        public Page news_page = null;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            news_type = Context.Request["news_type"] == null ? "25" : Context.Request["news_type"];
            page_num = Context.Request["page_num"] == null ? 1 : int.Parse(Context.Request["page_num"].ToString());
            news_page = News.GetNewsPage(18, page_num, int.Parse(news_type));

        }
    }
}