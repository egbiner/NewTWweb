using MyClass;
using System;
using System.Data;

namespace TWweb.Web
{
    public partial class auditorium : System.Web.UI.Page
    {
        public int page_num;
        public DataTable t_friend_url = null;
        public DataTable t_news_hot = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            page_num = Context.Request["page_num"] == null ? 1 : int.Parse(Context.Request["page_num"].ToString());
            t_friend_url = SqlHelper.ExecuteDataTable("select * from friend_url where show=1");
            t_news_hot = SqlHelper.ExecuteDataTable("select top 8 * from news order by click desc");
        }
    }
}