using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

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
            context.Response.ContentType = "text/plain";
            try
            {
                //模板文件
                string tempFile = HttpContext.Current.Request.PhysicalApplicationPath + "Web\\upload\\yanyiting\\ApplyFormModel.docx";
                int recode = int.Parse(context.Request["recode"]);
                DataTable dt = SqlHelper.ExecuteDataTable("select * from auditorium where id = @id",
                    new SqlParameter("@id", recode));
                if (dt.Rows.Count == 0)
                {
                    JavaScriptSerializer jss = new JavaScriptSerializer();
                    Dictionary<string, object> dic= new Dictionary<string, object>();
                    dic.Add("result", "<h1 style='text-align:center;'>未找到结果,请尝试重新输入回执码!</h1>");
                    string jsonS = jss.Serialize(dic);
                    context.Response.Write(jsonS);
                    return;
                }

                //即将返回Json数据
                string url = "upload/yanyiting/" + dt.Rows[0]["id"] + "_" + dt.Rows[0]["activity"] + ".docx";
                string filename = dt.Rows[0]["activity"].ToString();

                //提示
                string atag = "<br><a href='javascript:opendetail(" + dt.Rows[0]["id"] + ")'>查看申请表</a>";
                //string tips = "<p>您好！您申请的\" "+ dt.Rows[0]["activity"] + " \"已经处理</p>";
                string tips = "";
                status = Convert.ToInt32(dt.Rows[0]["status"]);
                if (status == 1)
                {
                    redata = tips + "<h1 style='text-align:center;color:green;'>申请成功</h1><p>" + ((DateTime)dt.Rows[0]["handle_time"]).ToString("F") + "</p>";
                    string saveFile = HttpContext.Current.Request.PhysicalApplicationPath + "Web\\upload\\yanyiting\\" + (dt.Rows[0]["id"].ToString()).Trim() + "_" + (dt.Rows[0]["activity"].ToString()).Trim() + "_1.docx";
                    //重新生成已通过文件
                    if (!File.Exists(saveFile))
                        WordHelper.ExportApplyForm(tempFile, saveFile, dt);
                    filename = dt.Rows[0]["activity"].ToString()+"(已更新)";
                    url = "upload/yanyiting/" + dt.Rows[0]["id"] + "_" + dt.Rows[0]["activity"] + "_1.docx";
                }
                else if (status == 2)
                {
                    redata = tips + "<h1 style='text-align:center;color:red;'> 申请失败</h1><p>" + ((DateTime)dt.Rows[0]["handle_time"]).ToString("F") + "</p><p>失败原因:" + dt.Rows[0]["reason"] + "</p>";
                }
                else if (status == 3)
                {
                    redata = "<h1 style='text-align:center;color:red;'> 已取消</h1><p>" + ((DateTime)dt.Rows[0]["update_time"]).ToString("F") + "</p>";
                }
                else
                    redata = "<h1 style='text-align:center;color:blue;'>申请中</h1>";

                JavaScriptSerializer json = new JavaScriptSerializer();
                Dictionary<string, object> dictionaty = new Dictionary<string, object>();
                dictionaty.Add("result", redata);
                dictionaty.Add("status", status);
                dictionaty.Add("fileName", filename);
                dictionaty.Add("url", url);
                string jsonStr = json.Serialize(dictionaty);

                context.Response.Write(jsonStr);
            }
            catch (Exception e)
            {
                JavaScriptSerializer json = new JavaScriptSerializer();
                Dictionary<string, object> dictionaty = new Dictionary<string, object>();
                dictionaty.Add("result", "<h1 style='text-align:center;'>发生未知错误!</h1>");
                dictionaty.Add("status", 3);
                string jsonStr = json.Serialize(dictionaty);
                context.Response.Write(jsonStr);
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