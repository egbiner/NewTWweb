using MyClass;
using System;
using System.Data;


namespace TWweb.Web
{
    public partial class activities_list : System.Web.UI.Page
    {
        public DataTable dt_ing = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取未过期的活动
            dt_ing = SqlHelper.ExecuteDataTable("select top(9) * from auditorium where status=1 and use_time_end >= GETDATE() order by use_time_start");
        }
    }
}