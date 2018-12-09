using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public class ApplyForm
    {


        public int id { get; set; }
        public DateTime use_time_start { get; set; }
        public DateTime use_time_end { get; set; }
        public string status { get; set; }
        public string activity { get; set; }
        public string fz_user { get; set; }
        public string fz_phone { get; set; }
        public string ap_user { get; set; }
        public string ap_phone { get; set; }
        public string ac_linkman { get; set; }
        public string ac_linkman_phone { get; set; }
        public string main_attend { get; set; }
        public string participants_num { get; set; }
        public string ap_reason { get; set; }
        public string device_need { get; set; }
        public string ap_opinion { get; set; }
        public string ac_start_time { get; set; }
        public string ac_end_time { get; set; }


        public ApplyForm(int id)
        {
            this.id = id;
            DataTable dt = SqlHelper.ExecuteDataTable(@"select * from auditorium where id=@id",
               new SqlParameter("@id", id)
               );
            this.id = int.Parse(dt.Rows[0]["id"].ToString());
            this.ap_opinion = dt.Rows[0]["ap_opinion"].ToString();
            this.device_need = dt.Rows[0]["device_need"].ToString();
            this.ap_reason = dt.Rows[0]["ap_reason"].ToString();
            this.participants_num = dt.Rows[0]["participants_num"].ToString();
            this.main_attend = dt.Rows[0]["main_attend"].ToString();
            this.ac_linkman_phone = dt.Rows[0]["ac_linkman_phone"].ToString();
            this.ac_linkman = dt.Rows[0]["ac_linkman"].ToString();
            this.ap_phone = dt.Rows[0]["ap_phone"].ToString();
            this.ap_user = dt.Rows[0]["ap_user"].ToString();
            this.fz_phone = dt.Rows[0]["fz_phone"].ToString();
            this.fz_user = dt.Rows[0]["fz_user"].ToString();
            this.status = dt.Rows[0]["status"].ToString();
            this.activity = dt.Rows[0]["activity"].ToString();
            this.ac_start_time = dt.Rows[0]["ac_start_time"].ToString();
            this.ac_end_time = dt.Rows[0]["ac_end_time"].ToString();

            this.use_time_start = DateTime.Parse(dt.Rows[0]["use_time_start"].ToString());
            this.use_time_end = DateTime.Parse(dt.Rows[0]["use_time_end"].ToString());
        }


        public static Page GetApplyInfoPage(int page_size, int page_number,int status)
        {
            DataTable dt = SqlHelper.ExecuteDataTable(page_size, page_number,
                    "select * from auditorium where status = @status order by use_time_start desc",
                    new SqlParameter("@status",status));
            List<ApplyForm> apply_lst = new List<ApplyForm>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int id = int.Parse(dt.Rows[i]["id"].ToString());
                ApplyForm af = new ApplyForm(id);
                apply_lst.Add(af);
            }
            int total = GetNewsCountOfApplyInfo(status);
            int total_page = total / page_size + 1;
            return new Page(apply_lst, total, page_size, page_number);
        }

        public static Page GetIng(int page_size, int page_number)
        {
            DataTable dt = SqlHelper.ExecuteDataTable(page_size, page_number,
                    "select * from auditorium where status in (0,1) and use_time_end >= GETDATE() order by use_time_start");
            List<ApplyForm> apply_lst = new List<ApplyForm>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int id = int.Parse(dt.Rows[i]["id"].ToString());
                ApplyForm af = new ApplyForm(id);
                apply_lst.Add(af);
            }
            int total = GetIngCount();
            int total_page = total / page_size + 1;
            return new Page(apply_lst, total, page_size, page_number);
        }

        public static Page GetEd(int page_size, int page_number)
        {
            DataTable dt = SqlHelper.ExecuteDataTable(page_size, page_number,
                    "select * from auditorium where status=1 and use_time_end < GETDATE() order by use_time_start desc");
            List<ApplyForm> apply_lst = new List<ApplyForm>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int id = int.Parse(dt.Rows[i]["id"].ToString());
                ApplyForm af = new ApplyForm(id);
                apply_lst.Add(af);
            }
            int total = GetEdCount();
            int total_page = total / page_size + 1;
            return new Page(apply_lst, total, page_size, page_number);
        }


        public static int GetNewsCountOfApplyInfo(int status)
        {
            string count = SqlHelper.ExecuteScalar("select count(1) from auditorium where status = @status",
                new SqlParameter("@status",status)).ToString();
            return int.Parse(count);
        }

        public static int GetIngCount()
        {
            string count = SqlHelper.ExecuteScalar("select count(*) from auditorium where status in (0,1) and use_time_end >= GETDATE()").ToString();
            return int.Parse(count);
        }

        public static int GetEdCount()
        {
            string count = SqlHelper.ExecuteScalar("select count(*) from auditorium where status=1 and use_time_end < GETDATE()").ToString();
            return int.Parse(count);
        }

    }
}
