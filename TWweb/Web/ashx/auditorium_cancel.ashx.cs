using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace TWweb.Web.ashx
{
    /// <summary>
    /// auditorium_cancel 的摘要说明
    /// </summary>
    public class auditorium_cancel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int recode = int.Parse(context.Request["recode"]);
            DataTable dt = SqlHelper.ExecuteDataTable("select * from auditorium where id = @id",
                new SqlParameter("@id", recode));
            JavaScriptSerializer jss = new JavaScriptSerializer();
            Dictionary<string, object> dic = new Dictionary<string, object>();
            if (dt.Rows.Count == 0)  //未找到回执
            {
                dic.Add("result", "取消失败，未找到回执码");
                dic.Add("status", "0");
                string erro = jss.Serialize(dic);
                context.Response.Write(erro);
                return;
            }
            if (Convert.ToInt32(dt.Rows[0]["status"]) == 3)    //已取消
            {
                dic.Add("result", "取消失败，申请已被取消");
                dic.Add("status", "0");
                string erro = jss.Serialize(dic);
                context.Response.Write(erro);
                return;
            }
            SqlHelper.ExecuteNonQuery("update auditorium set status=3 where id = @id", new SqlParameter("@id", recode));//取消成功
            SqlHelper.ExecuteNonQuery("update auditorium set update_time=@update_time where id = @id", new SqlParameter("@id", recode), new SqlParameter("@update_time", DateTime.Now));
            dic.Add("result", "取消成功！");
            dic.Add("status", "1");
            string jsonS = jss.Serialize(dic);
            context.Response.Write(jsonS);

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