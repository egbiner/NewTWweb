﻿using MyClass;
using System;
using System.Data;

namespace TWweb.Web
{
    public partial class news_search_list : System.Web.UI.Page
    {
        public int page_num;
        public Page news_page = null;
        public DataTable t_friend_url = null;
        public DataTable t_news_hot = null;
        public string key_s = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            key_s = Request["key"]==null?"":Request["key"];
            page_num = Context.Request["page_num"] == null ? 1 : int.Parse(Context.Request["page_num"].ToString());
            news_page = News.GetSearchPage(18, page_num, key_s);
            t_friend_url = SqlHelper.ExecuteDataTable("select * from friend_url where show=1");
            t_news_hot = SqlHelper.ExecuteDataTable("select top 8 * from news order by click desc");
        }
    }
}