using MyClass;
using System;
using System.IO;
using System.Web;
using System.Web.SessionState;


namespace TWweb.Admin.ashx
{
    /// <summary>
    /// update_password 的摘要说明
    /// </summary>
    public class update_password : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest (HttpContext context)
        {
            context.Response.ContentType = "text/html";
            string pwd_new = context.Request["pwd_new"];

            object username = context.Session["admin"];
            if (username == null)
            {
                context.Response.Write("未登录！");
                return;
            }
            MyClass.Admin admin = new MyClass.Admin(username.ToString());
            if(admin.pwd_change(pwd_new,admin.id)==1)
            {             
                context.Response.Write("OK");
            }
            else
            {
                context.Response.Write("NO");
            }
        }
     
        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}