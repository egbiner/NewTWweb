
using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace TWweb.Web.ashx
{
    /// <summary>
    /// getDoc 的摘要说明
    /// </summary>
    public class getDoc : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
           
            DataTable dt = null;
            if (context.Request["id"] != null)
            {
                string id = context.Request["id"];
                dt = SqlHelper.ExecuteDataTable("select * from auditorium where id = @id",
                new SqlParameter("@id", id));
            }
            string tempFile = HttpContext.Current.Request.PhysicalApplicationPath + "Web\\upload\\yanyiting\\ApplyFormModel.docx";
            string saveFile = HttpContext.Current.Request.PhysicalApplicationPath + "Web\\upload\\yanyiting\\" + (dt.Rows[0]["id"].ToString()).Trim() + "_" + (dt.Rows[0]["activity"].ToString()).Trim() + ".docx";
            WordHelper.ExportApplyForm(tempFile,saveFile,dt);
            context.Response.Write(dt.Rows[0]["ap_user"]);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }

}