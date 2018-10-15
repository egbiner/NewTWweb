using System;

namespace WebUI.admin2
{
    public partial class pwd_change : System.Web.UI.Page
    {
        public string admin_pwd_ture;
        protected void Page_Load(object sender, EventArgs e)
        {
            object username = Session["admin"];
            if (username == null)
            {
                Response.Redirect("index.aspx");
                return;
            }
            MyClass.Admin admin = new MyClass.Admin(username.ToString());
            admin_pwd_ture = admin.password;
        }
    }
}