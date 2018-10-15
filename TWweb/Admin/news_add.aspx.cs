using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebUI.admin2
{
    public partial class news_add : System.Web.UI.Page
    {
        public DataTable t_news_type = null;
        public Admin adm = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            t_news_type = SqlHelper.ExecuteDataTable("select * from news_type order by nav_id,id");
            object username = Session["admin"];
            if (username == null)
            {
                Response.Redirect("index.aspx");
                return;
            }
            adm = new MyClass.Admin(username.ToString());
        }
    }
}