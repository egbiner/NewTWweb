using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TWweb.Admin
{
    public partial class apply_modify : System.Web.UI.Page
    {
        public DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id;
            if (Request["id"] != null)
            {
                id = Convert.ToInt32(Request["id"]);
                dt = SqlHelper.ExecuteDataTable("select * from auditorium where id = @id",
                new SqlParameter("@id", id));
            }
        }
    }
}