using MyClass;
using System;
using System.Data;
using System.Data.SqlClient;

namespace TWweb.Admin
{
    public partial class applyform_modle : System.Web.UI.Page
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