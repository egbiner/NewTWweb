using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace TWweb.Web
{
    public partial class index : System.Web.UI.Page
    {
        public Page news_pages1 = null;
        public Page news_pages5 = null;
        public Page news_pages6 = null;
        public Page news_pages7 = null;
        public Page news_pages8 = null;
        public Page news_pages9 = null;
        public Page news_pages10 = null;
        public Page news_pages11 = null;
        public Page news_pages12 = null;

        public DataTable t_scroll_img = null;
        public DataTable t_friend_url = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Context.Request["id"];
            if(id!=null)
            {
                t_scroll_img = News.getScrollImgById(int.Parse(id));
            }
            else
            {
                t_scroll_img = SqlHelper.ExecuteDataTable("select * from scroll_img where show=1");
            }
            news_pages1 = News.GetNewsPage(7, 1, 25);
            news_pages5 = News.GetNewsPage(5, 1, 5);
            news_pages6 = News.GetNewsPage(5, 1, 6);
            news_pages7 = News.GetNewsPage(8, 1, 7);
            news_pages8 = News.GetNewsPage(5, 1, 8);
            news_pages9 = News.GetNewsPage(5, 1, 9);
            news_pages10 = News.GetNewsPage(5, 1, 10);
            news_pages11 = News.GetNewsPage(5, 1, 11);
            news_pages12 = News.GetNewsPage(5, 1, 12);
            t_friend_url = SqlHelper.ExecuteDataTable("select * from friend_url where show=1");
        }
    }
}