
using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace TWweb.Web.ashx
{
    /// <summary>
    /// getDoc 的摘要说明
    /// </summary>
    public class getDoc : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
           
            DataTable dt = null;
            //try
            //{
                if (context.Request["id"] != null)
                {
                    string id = context.Request["id"];
                    dt = SqlHelper.ExecuteDataTable("select * from auditorium where id = @id",
                    new SqlParameter("@id", id));
                }
            //write(dt);
            string tempFile = HttpContext.Current.Request.PhysicalApplicationPath + "Web\\upload\\yanyiting\\ApplyFormModel.docx";
            string saveFile = HttpContext.Current.Request.PhysicalApplicationPath + "Web\\upload\\yanyiting\\" + (dt.Rows[0]["id"].ToString()).Trim() + "_" + (dt.Rows[0]["activity"].ToString()).Trim() + ".docx";
            WordHelper.ExportApplyForm(tempFile,saveFile,dt);
                context.Response.Write(dt.Rows[0]["ap_user"]);
            //}catch(Exception e)
            //{
            //    context.Response.Write("error");
            //}
        }


        public void write(DataTable dt)
        {
            DataTable tblDatas = new DataTable("Datas");
            DataColumn dc = null;
            //赋值给dc，是便于对每一个datacolumn的操作
            dc = tblDatas.Columns.Add("ID", Type.GetType("System.Int32"));
            dc.AutoIncrement = true;//自动增加
            dc.AutoIncrementSeed = 1;//起始为1
            dc.AutoIncrementStep = 1;//步长为1
            dc.AllowDBNull = false;//
            dc = tblDatas.Columns.Add("use_time_start", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("use_time_end", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("fz_user", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("fz_phone", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("ap_user", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("ap_phone", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("ac_linkman", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("ac_linkman_phone", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("main_attend", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("activity", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("ap_reason", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("device_need", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("ap_opinion", Type.GetType("System.String"));
            dc = tblDatas.Columns.Add("participants_num", Type.GetType("System.String"));


            DataRow newRow;
            newRow = tblDatas.NewRow();
            newRow["use_time_start"] = ((DateTime)dt.Rows[0]["use_time_start"]).ToString("yyyy 年 MM 月 dd 日  HH 点 mm 分");
            newRow["use_time_end"] = ((DateTime)dt.Rows[0]["use_time_end"]).ToString("yyyy 年 MM 月 dd 日  HH 点 mm 分");
            newRow["fz_user"] = dt.Rows[0]["fz_user"];
            newRow["fz_phone"] = dt.Rows[0]["fz_phone"];
            newRow["ap_user"] = dt.Rows[0]["ap_user"];
            newRow["ap_phone"] = dt.Rows[0]["ap_phone"];
            newRow["ac_linkman"] = dt.Rows[0]["ac_linkman"];
            newRow["ac_linkman_phone"] = dt.Rows[0]["ac_linkman_phone"];
            newRow["main_attend"] = dt.Rows[0]["main_attend"];
            newRow["activity"] = dt.Rows[0]["activity"];
            newRow["ap_reason"] = dt.Rows[0]["ap_reason"];
            newRow["device_need"] = dt.Rows[0]["device_need"];
            newRow["ap_opinion"] = dt.Rows[0]["ap_opinion"];
            newRow["participants_num"] = dt.Rows[0]["participants_num"];
            tblDatas.Rows.Add(newRow);

            Dictionary<string, string> dic = new Dictionary<string, string>();
            dic.Add("$use_time_start$", "use_time_start");
            dic.Add("$use_time_end$", "use_time_end");
            dic.Add("$fz_user$", "fz_user");
            dic.Add("$fz_phone$", "fz_phone");
            dic.Add("$ap_user$", "ap_user");
            dic.Add("$ap_phone$", "ap_phone");
            dic.Add("$ac_linkman$", "ac_linkman");
            dic.Add("$ac_linkman_phone$", "ac_linkman_phone");
            dic.Add("$main_attend$", "main_attend");
            dic.Add("$activity$", "activity");
            dic.Add("$ap_reason$", "ap_reason");
            dic.Add("$device_need$", "device_need");
            dic.Add("$ap_opinion$", "ap_opinion");
            dic.Add("$participants_num$", "participants_num");

            string tempFile = HttpContext.Current.Request.PhysicalApplicationPath + "Web\\upload\\yanyiting\\ApplyFormModel.doc";
            string saveFile = HttpContext.Current.Request.PhysicalApplicationPath + "Web\\upload\\yanyiting\\" + (dt.Rows[0]["id"].ToString()).Trim()+"_"+ (dt.Rows[0]["activity"].ToString()).Trim() + ".doc";
            WordUtility w = new WordUtility(tempFile, saveFile);
            w.GenerateWord(tblDatas, dic, null);
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