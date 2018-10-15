using System;

namespace WebUI.admin2
{
    public partial class index : System.Web.UI.Page
    {
        public MyClass.Admin admin;

        protected void Page_Load(object sender, EventArgs e)
        {
            object username = Session["admin"];
            if (username == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            admin = new MyClass.Admin(username.ToString());
        }
    }
}