using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TWweb.Admin
{
    public partial class scroll_img : System.Web.UI.Page
    {
        public DataTable t = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            t = SqlHelper.ExecuteDataTable("select * from scroll_img");
        }
    }
}