using System;
using MyClass;
using System.Data;

namespace WebUI.admin2
{
    public partial class news_list : System.Web.UI.Page
    {
        public Page news_page = null;
        public int page_num = 1;
        public int navId;
        public DataTable t_news_type = null;
        public DataTable t_nav_name = null;
        public Admin adm = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            object username = Session["admin"];
            if (username == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            adm = new MyClass.Admin(username.ToString());
            navId = int.Parse(adm.newstype_id);
            object page_num_ob = Request["page_num"];
            if (page_num_ob != null)
            {
                page_num = int.Parse(page_num_ob.ToString());
            }
            object navId_ob = Request["navId"];
            if (navId_ob != null)
            {
                navId = int.Parse(navId_ob.ToString());
            }
            news_page = News.GetNewsPage(10, page_num, navId);
            t_news_type = SqlHelper.ExecuteDataTable("select * from news_type order by nav_id,id");
            t_nav_name = SqlHelper.ExecuteDataTable("select * from nav_name");
        }
    }
}