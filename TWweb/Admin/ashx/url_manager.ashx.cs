using MyClass;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace TWweb.Admin.ashx
{
    /// <summary>
    /// url_manager 的摘要说明
    /// </summary>
    public class url_manager : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            string action = context.Request["status"];
            string url_id = context.Request["id"];
            int i;
            switch (action)
            {
                case "del":
                    DataTable t = SqlHelper.ExecuteDataTable("select url from friend_url where id=@id",
                        new SqlParameter("@id", url_id));
                    i = SqlHelper.ExecuteNonQuery("delete from friend_url where id=@id",
                        new SqlParameter("@id", url_id));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "show":
                    i = SqlHelper.ExecuteNonQuery("update friend_url set show=1 where id=@id",
                        new SqlParameter("@id", url_id));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "hide":
                    i = SqlHelper.ExecuteNonQuery("update friend_url set show=0 where id=@id",
                        new SqlParameter("@id", url_id));
                    if (i == 1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "add":
                    string[] array = url_id.Split('|');
                    i = SqlHelper.ExecuteNonQuery("insert into friend_url(url,name) values(@url,@name)",
                        new SqlParameter("@url", array[0]),
                        new SqlParameter("@name", array[1]));
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

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}