using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TWweb.Web
{
    public partial class introduction : System.Web.UI.Page
    {
        public DataTable t = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Context.Request["type_id"].ToString();
            t = News.get_intr(int.Parse(id));
		}
    }
}