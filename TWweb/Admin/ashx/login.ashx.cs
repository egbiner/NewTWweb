using MyClass;
using System.Web;
using System.Web.SessionState;

namespace NewWebUI.ashx
{
    /// <summary>
    /// login 的摘要说明
    /// </summary>
    public class login : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";

            string username = context.Request["username"];
            string password = context.Request["password"];

            Admin user = new Admin(username);

            if (user.Login(password) == 0)
            {
                context.Session["admin"] = user.username;
                context.Response.Write("OK");
            }
            else
            {
                context.Response.Write("NO");
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