using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TWweb.Admin.ashx
{
    /// <summary>
    /// upload_scroll_img 的摘要说明
    /// </summary>
    public class upload_scroll_img : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");
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