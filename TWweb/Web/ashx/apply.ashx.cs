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
    /// apply 的摘要说明
    /// </summary>
    public class apply : IHttpHandler
    {
        string day;
        DateTime use_time_start,use_time_end;
        string activity;//活动名称
        string ap_user, ap_phone;//活动负责人
        string fz_user, fz_phone;//负责人
        string ac_linkman;//活动联系人
        string ac_linkman_phone;
        string main_attend;
        string participants_num;
        int isReadNotice;
        string ap_reason;//申请原由
        string device_need;//所需设备
        string ap_opinion;//申请单位意见
        int isNullRoom;
        // help Value
        string date;
        string star_time;
        string end_time;
        string ac_start_time;
        string ac_end_time;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            try
            {
                date = context.Request["date"];
                day = date;
                star_time = context.Request["use_start_time"];
                end_time = context.Request["use_end_time"];
                use_time_start = DateTime.Parse(date + " " + star_time);
                use_time_end = DateTime.Parse(date + " " + end_time);
                if (DateTime.Compare(use_time_end, use_time_start) != 1)
                {
                    context.Response.Write("time_error");
                    return;
                }
                ap_user = context.Request["ap_user"];
                ap_phone = context.Request["ap_phone"];
                fz_user = context.Request["fz_user"];
                fz_phone = context.Request["fz_phone"];
                ac_linkman = context.Request["ac_linkman"];
                ac_linkman_phone = context.Request["ac_linkman_phone"];
                main_attend = context.Request["main_attend"];
                participants_num = context.Request["participants_num"];
                isNullRoom = Convert.ToInt32(context.Request["isNullRoom"]);
                ap_reason = context.Request["ap_reason"];
                ap_opinion = context.Request["ap_opinion"];
                activity = context.Request["activity"];
                device_need = context.Request["device_need"];
                ac_start_time = context.Request["ac_start_time"];
                ac_end_time = context.Request["ac_end_time"];

                if (ac_start_time == "" || ac_end_time == "")
                {
                    context.Response.Write("error");
                    return;
                }

                if (check()==1)
                {
                    int re = insert();
                    if (re!=-1)
                    {
                        context.Response.Write(re);
                    }
                    else
                    {
                        context.Response.Write("error");
                    }
                }
                else
                {
                    context.Response.Write("repeat#"+repeat_time);
                }
            } catch(Exception e)
            {
                context.Response.Write("error");
                return;
            }
            
        }

        string repeat_time = "";
        //判断
        public int check()
        {
            //DataTable table = SqlHelper.ExecuteDataTable("select * from auditorium where status='1' and day=@day", new SqlParameter("@day", day));
            DataTable table = SqlHelper.ExecuteDataTable("select * from auditorium where status != '2' and  day=@day", new SqlParameter("@day", day));
            if (table.Rows.Count == 0)
            {
                return 1;
            }
            else
            {
                int flag = 1;
                for (int k = 0; k < table.Rows.Count; k++)
                {
                    if (!(DateTime.Compare(use_time_start, DateTime.Parse(table.Rows[k]["use_time_end"].ToString())) >= 0 || DateTime.Compare(use_time_end, DateTime.Parse(table.Rows[k]["use_time_start"].ToString())) <= 0))
                    {
                        string start_time = (table.Rows[k]["use_time_start"].ToString()).Split(' ')[1];
                        string end_time = (table.Rows[k]["use_time_end"].ToString()).Split(' ')[1];
                        repeat_time = start_time.Substring(0,start_time.LastIndexOf(':')) + "-" + end_time.Substring(0,end_time.LastIndexOf(':'));
                        flag = 0;
                        break;
                    }
                }
                if (flag == 1)
                {
                    return 1;
                }
                else
                {
                    return -1;
                }
            }
        }

        //插入数据
        public int insert()
        {
            int i = SqlHelper.ExecuteNonQuery("insert into auditorium(use_time_start,use_time_end,status,activity,ap_user,ap_phone,fz_user,fz_phone,ac_linkman,ac_linkman_phone,main_attend,participants_num,isNullRoom,ap_reason,ap_opinion,device_need,day,ac_start_time,ac_end_time,create_time) values(@use_time_start, @use_time_end,0, @activity,@ap_user,@ap_phone,@fz_user,@fz_phone,@ac_linkman,@ac_linkman_phone,@main_attend,@participants_num,@isNullRoom,@ap_reason,@ap_opinion,@device_need,@day,@ac_start_time,@ac_end_time,GETDATE())",
                    new SqlParameter("@use_time_start", use_time_start),
                    new SqlParameter("@use_time_end", use_time_end),
                    new SqlParameter("@activity", activity),
                    new SqlParameter("@ap_user", ap_user),
                    new SqlParameter("@ap_phone", ap_phone),
                    new SqlParameter("@fz_user", fz_user),
                    new SqlParameter("@ac_linkman", ac_linkman),
                    new SqlParameter("@ac_linkman_phone", ac_linkman_phone),
                    new SqlParameter("@main_attend", main_attend),
                    new SqlParameter("@participants_num", participants_num),
                    new SqlParameter("@isNullRoom", isNullRoom),
                    new SqlParameter("@ap_reason", ap_reason),
                    new SqlParameter("@ap_opinion", ap_opinion),
                    new SqlParameter("@device_need", device_need),
                    new SqlParameter("@day", day),
                    new SqlParameter("@fz_phone", fz_phone),
                    new SqlParameter("@ac_start_time", ac_start_time),
                    new SqlParameter("@ac_end_time", ac_end_time));

            if (i == 1)
            {
                DataTable dt = SqlHelper.ExecuteDataTable("select * from auditorium order by id DESC");
                int recode = Convert.ToInt32(dt.Rows[0]["id"]);
                return recode;
            }
            else
            {
                return -1;
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