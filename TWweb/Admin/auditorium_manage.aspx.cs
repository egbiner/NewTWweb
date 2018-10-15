using DAL;
using MyClass;
using System;
using System.Data;


namespace TWweb.Admin
{
    public partial class yanyiting_manage : System.Web.UI.Page
    {
        public Page apply_page = null;
        public int page_num = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            object username = Session["admin"];
            if (username == null)
            {
                Response.Redirect("index.aspx");
                return;
            }
            object page_num_ob = Request["page_num"];
            if (page_num_ob != null)
            {
                page_num = int.Parse(page_num_ob.ToString());
            }
            apply_page = ApplyForm.GetApplyInfoPage(10, page_num);
        }
    }
}