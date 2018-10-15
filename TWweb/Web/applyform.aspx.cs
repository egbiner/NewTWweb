using System;

namespace TWweb.Web
{
    public partial class applyform : System.Web.UI.Page
    {
        public string now;
        protected void Page_Load(object sender, EventArgs e)
        {
            now = DateTime.Now.ToString("yyyy-M-d");
        }
    }
}