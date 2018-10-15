using MyClass;
using System;


namespace TWweb.Admin
{
    public partial class news_search : System.Web.UI.Page
    {
        public Page news_page = null;
        public int page_num = 1;
        public string key_s = "";
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
            string key = Request["key"];
            key_s = key;
            news_page = News.GetSearchPage(10, page_num, key);
        }
    }
}