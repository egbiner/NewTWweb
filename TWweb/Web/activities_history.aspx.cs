﻿using DAL;
using MyClass;
using System;
using System.Data;


namespace TWweb.Web
{
    public partial class activities_history : System.Web.UI.Page
    {
        public Page apply_page = null;
        public int page = 1;
        public int count = 10;
        public int limit = 9;
        //public int condition = 0;// 0全部 1最近一个月
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["page"] != null)
            {
                page = Convert.ToInt32(Request["page"]);
            }
            if (Request["limit"] != null)
            {
                limit = Convert.ToInt32(Request["limit"]);
            }
            //if (Request["condition"] != null)
            //{
            //    condition = Convert.ToInt32(Request["condition"]);
            //}
            apply_page = ApplyForm.GetEd(limit, page);
            count = ApplyForm.GetEdCount();
        }
    }
}