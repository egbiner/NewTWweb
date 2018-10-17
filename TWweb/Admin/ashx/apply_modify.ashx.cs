using MyClass;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace TWweb.Admin.ashx
{
    /// <summary>
    /// apply_modify 的摘要说明
    /// </summary>
    public class apply_modify : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            int status = 1;
            string msg = "修改失败";

            string id = context.Request["id"];
            string date = context.Request["date"];
            string day = date;
            string star_time = context.Request["use_start_time"];
            string end_time = context.Request["use_end_time"];
            string ac_start_time = context.Request["ac_start_time"];
            string ac_end_time = context.Request["ac_end_time"];

            DateTime use_time_start = DateTime.Parse(date + " " + star_time);
            DateTime use_time_end = DateTime.Parse(date + " " + end_time);
            if (DateTime.Compare(use_time_end, use_time_start) != 1)
            {
                msg = "时间错误";
            }
            else
            {
                int i = SqlHelper.ExecuteNonQuery("update auditorium set use_time_start = @use_time_start,use_time_end = @use_time_end,day = @day,ac_start_time=@ac_start_time,ac_end_time=@ac_end_time where id = @id",
                        new SqlParameter("@use_time_start", use_time_start),
                        new SqlParameter("@use_time_end", use_time_end),
                        new SqlParameter("@day", day),
                        new SqlParameter("@ac_start_time", ac_start_time),
                        new SqlParameter("@ac_end_time", ac_end_time),
                        new SqlParameter("@id", id));
                if (i == 1)
                {
                    status = 0;
                    msg = "修改成功";
                }
            }
            JavaScriptSerializer json = new JavaScriptSerializer();
            Dictionary<string, object> dictionaty = new Dictionary<string, object>();
            dictionaty.Add("status", status);
            dictionaty.Add("msg", msg);
            string jsonStr = json.Serialize(dictionaty);
            context.Response.Write(jsonStr);
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