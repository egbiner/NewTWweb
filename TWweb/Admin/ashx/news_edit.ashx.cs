using MyClass;
using System;
using System.Web;
using System.Web.SessionState;

namespace startup_hatch.ashx
{
    /// <summary>
    /// edit_news 的摘要说明
    /// </summary>
    public class edit_news : IHttpHandler, IRequiresSessionState
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

            object ido = context.Request["id"];
            if (ido == null)
            {
                context.Response.Write("id 参数错误！");
                return;
            }
            int id = int.Parse(ido.ToString());

            News news = new News(id);
            news.type_id = int.Parse(context.Request["type_id"]);
            news.title = context.Request["title"];
            news.contents = context.Request["content"];
            //news.author_id = admin.id;
            news.publish_time = DateTime.Parse(context.Request["publish_time"]);


            int edit = News.EditNews(news);
            if (edit == 1)
            {
                context.Response.Write("OK");
                return;
            }
            context.Response.Write("修改失败！");
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