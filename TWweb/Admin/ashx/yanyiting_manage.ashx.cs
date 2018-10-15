using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace TWweb.Admin.ashx
{
    /// <summary>
    /// yanyiting_manage 的摘要说明
    /// </summary>
    public class yanyiting_manage : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            object username = context.Session["admin"];
            if (username == null)
            {
                context.Response.Write("未登录！");
                return;
            }
            string action = context.Request["status"];
            string id = context.Request["id"];
            int i;
            switch (action)
            {
                case "check":
                    DataTable t = SqlHelper.ExecuteDataTable("select * from auditorium where id=@id",
                        new SqlParameter("@id", id));
                    if (check(t)==1)
                    {
                        context.Response.Write("OK");
                    }
                    else
                    {
                        context.Response.Write("时间冲突!");
                    }
                    break;
                case "pass":
                    i = SqlHelper.ExecuteNonQuery("update auditorium set status=1,reason=null,handle_user=@username,handle_time=@handle_time where id=@id",
                        new SqlParameter("@id", id),
                        new SqlParameter("@username", username),
                        new SqlParameter("@handle_time", DateTime.Now));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "reject":
                    i = SqlHelper.ExecuteNonQuery("update auditorium set status=2,handle_user=@username,handle_time=@handle_time,reason=@reason where id=@id",
                        new SqlParameter("@username", username),
                        new SqlParameter("@reason", id.Split('$')[1]),
                        new SqlParameter("@handle_time", DateTime.Now),
                        new SqlParameter("@id", id.Split('$')[0]));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "reset":
                    i = SqlHelper.ExecuteNonQuery("update auditorium set status=0,handle_user=null,handle_time=null where id=@id",
                        new SqlParameter("@id", id));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "del":
                    i = SqlHelper.ExecuteNonQuery("delete from auditorium where id=@id",
                        new SqlParameter("@id", id));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                default:
                    context.Response.Write("未知的操作！");
                    break;
            }
        }

        public int check(DataTable t)
        {
            DataTable table = SqlHelper.ExecuteDataTable("select * from auditorium where status ='1' and day=@day", new SqlParameter("@day", DateTime.Parse(t.Rows[0]["use_time_start"].ToString()).ToString("yyyy-M-d")));
            if (table.Rows.Count == 0)
            {
                return 1;
            }
            else
            {
                int flag = 1;
                for (int k = 0; k < table.Rows.Count; k++)
                {
                    if (!(DateTime.Compare(DateTime.Parse(t.Rows[0]["use_time_start"].ToString()), DateTime.Parse(table.Rows[k]["use_time_end"].ToString())) >= 0 || DateTime.Compare(DateTime.Parse(t.Rows[0]["use_time_end"].ToString()), DateTime.Parse(table.Rows[k]["use_time_start"].ToString())) <= 0))
                    {
                        flag = 0;
                        break;
                    }
                }
                if (flag == 1)
                {
                    return 1;
                }
                else
                {
                    return -1;
                }
            }
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