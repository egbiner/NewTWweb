using MyClass;
using System;
using System.Data;

namespace WebUI.admin2
{
    public partial class news_edit : System.Web.UI.Page
    {
        public News news = null;
        public DataTable t_news_type = null;
        public Admin adm = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            object username = Session["admin"];
            if (username == null)
            {
                Response.Redirect("index.aspx");
                return;
            }
            adm = new MyClass.Admin(username.ToString());
            object ido = Request["id"];
            if (ido == null)
            {
                Response.End();
            }
            int id = int.Parse(ido.ToString());
            news = new News(id);
            t_news_type = SqlHelper.ExecuteDataTable("select * from news_type order by nav_id,id");
        }
    }
}