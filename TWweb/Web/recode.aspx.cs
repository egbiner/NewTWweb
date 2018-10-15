using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TWweb.Web
{
    public partial class recode : System.Web.UI.Page
    {
        public string re_code = "";
        public string url = "#";
        public string filename = "文件";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["recode"] != null)
            {
                re_code = Request["recode"];
                DataTable dt = SqlHelper.ExecuteDataTable("select * from auditorium where id = @recode",
                    new SqlParameter("@recode", re_code));
                url = "upload/yanyiting/" + dt.Rows[0]["id"] +"_"+ dt.Rows[0]["activity"] + ".docx";
                filename = dt.Rows[0]["activity"].ToString();
            }
        }
    }
}