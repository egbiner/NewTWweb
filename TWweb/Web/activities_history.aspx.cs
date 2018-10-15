using MyClass;
using System;
using System.Data;


namespace TWweb.Web
{
    public partial class activities_history : System.Web.UI.Page
    {
        public DataTable dt_ed = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取已过期的活动
            dt_ed = SqlHelper.ExecuteDataTable("select top(8) * from auditorium where status=1 and use_time_end < GETDATE() order by use_time_end DESC");
        }
    }
}