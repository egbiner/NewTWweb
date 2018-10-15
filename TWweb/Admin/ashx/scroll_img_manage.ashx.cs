using MyClass;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.SessionState;

namespace TWweb.Admin.ashx
{
    /// <summary>
    /// scroll_img_manage 的摘要说明
    /// </summary>
    public class scroll_img_manage : IHttpHandler, IRequiresSessionState
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
            string img_id = context.Request["id"];
            int i;
            switch (action)
            {
                case "del":
                    DataTable t = SqlHelper.ExecuteDataTable("select image_url from scroll_img where id=@id",
                        new SqlParameter("@id", img_id));
                    string path="../../"+t.Rows[0]["image_url"].ToString();
                    path = System.Web.HttpContext.Current.Server.MapPath(path);
                    File.Delete(path);
                    i = SqlHelper.ExecuteNonQuery("delete from scroll_img where id=@id",
                        new SqlParameter("@id", img_id));
                    if (i==1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "show":
                    i=SqlHelper.ExecuteNonQuery("update scroll_img set show=1 where id=@id",
                        new SqlParameter("@id", img_id));
                    if(i==1)
                        context.Response.Write("OK");
                    else
                        context.Response.Write("操作失败！");
                    break;
                case "hide":
                    i=SqlHelper.ExecuteNonQuery("update scroll_img set show=0 where id=@id",
                        new SqlParameter("@id", img_id));
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