using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TWweb.Web.ashx
{
    /// <summary>
    /// searchResult 的摘要说明
    /// </summary>
    public class searchResult : IHttpHandler
    {
        public int status;
        public string redata = "";
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            try
            {
                int recode = int.Parse(context.Request["recode"]);
                DataTable dt = SqlHelper.ExecuteDataTable("select * from auditorium where id = @id",
                    new SqlParameter("@id", recode));

                string atag = "<br><a href='javascript:opendetail(" + dt.Rows[0]["id"] + ")'>查看申请表</a>";
                //string tips = "<p>您好"+ dt.Rows[0]["ap_user"] + "!,您申请的\" "+ dt.Rows[0]["activity"] + " \"已经处理</p>";
                string tips = "<p>您好！您申请的\" "+ dt.Rows[0]["activity"] + " \"已经处理</p>";
                if (dt != null)
                    status = Convert.ToInt32(dt.Rows[0]["status"]);
                if (status == 1)
                    redata = tips+ "<h1 style='text-align:center;color:green;'>申请成功</h1><p>" + ((DateTime)dt.Rows[0]["handle_time"]).ToString("F") + "</p>";
                else if (status == 2)
                    redata = tips+ "<h1 style='text-align:center;color:red;'> 申请失败</h1><p>" + ((DateTime)dt.Rows[0]["handle_time"]).ToString("F") + "</p><p>失败原因:" + dt.Rows[0]["reason"] + "</p>";
                else
                    redata = "<h1 style='text-align:center;color:blue;'>申请中</h1>";
                context.Response.Write(redata);
            }
            catch (Exception e)
            {
                context.Response.Write("<h1 style='text-align:center;'>未找到结果,请尝试重新输入回执码!</h1>");
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