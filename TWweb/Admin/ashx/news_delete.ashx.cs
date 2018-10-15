using MyClass;
using System.Web;
using System.Web.SessionState;

namespace startup_hatch.ashx
{
    /// <summary>
    /// delete_news 的摘要说明
    /// </summary>
    public class delete_news : IHttpHandler, IRequiresSessionState
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
            Admin admin = new Admin(username.ToString());

            int news_id = int.Parse(context.Request["id"]);

            int del = News.DeleteNews(news_id);
            if (del == 1)
            {
                context.Response.Write("OK");
                return;
            }
            context.Response.Write("删除失败！");
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