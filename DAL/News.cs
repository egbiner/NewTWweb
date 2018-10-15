using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace MyClass
{
    public class News
    {
        public int id { get; set; }
        public int type_id { get; set; }
        public string type_name { get; set; }
        public string title { get; set; }
        public int author_id { get; set; }
        public string author { get; set; }
        public string contents { get; set; }
        public DateTime publish_time { get; set; }
        public int click { get; set; }

        public News() { }

        public News(int id)
        {
            DataTable dt = SqlHelper.ExecuteDataTable(@"select * from v_news where id=@id",
                new SqlParameter("@id", id)
                );
            this.id = int.Parse(dt.Rows[0]["id"].ToString());
            this.type_id = int.Parse(dt.Rows[0]["type_id"].ToString());
            this.click = int.Parse(dt.Rows[0]["click"].ToString());
            this.type_name = dt.Rows[0]["type_name"].ToString();
            this.title = dt.Rows[0]["title"].ToString();
            this.author = dt.Rows[0]["author"].ToString();
            this.contents = dt.Rows[0]["contents"].ToString();
            this.publish_time = DateTime.Parse(dt.Rows[0]["publish_time"].ToString());
        }

        public static Page GetNewsPage(int page_size, int page_number, int type_id)
        {
            DataTable dt = SqlHelper.ExecuteDataTable(page_size, page_number,
                "select id from v_news where type_id=@type_id order by publish_time desc",
                new SqlParameter("@type_id", type_id)
                );
            List<News> news_lst = new List<News>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int id = int.Parse(dt.Rows[i]["id"].ToString());
                News news = new News(id);
                news_lst.Add(news);
            }
            int total = GetNewsCountOfType(type_id);
            int total_page = total / page_size + 1;
            return new Page(news_lst, total, page_size, page_number);
        }

        public static int GetNewsCountOfType(int type_id)
        {
            string count = SqlHelper.ExecuteScalar("select count(1) from news where type_id=@type_id",
                new SqlParameter("@type_id", type_id)).ToString();
            return int.Parse(count);
        }

        public static int AddNews(News news)
        {
            return SqlHelper.ExecuteNonQuery(
                @"insert into news (type_id, title, author, contents, publish_time, click)
                    values(@type_id, @title, @author, @contents, @publish_time, 0)",
                new SqlParameter("@type_id", news.type_id),
                new SqlParameter("@title", news.title),
                new SqlParameter("@author", news.author),
                new SqlParameter("@contents", news.contents),
                new SqlParameter("@publish_time", news.publish_time)
                );
        }

        public static int EditNews(News news)
        {
            return SqlHelper.ExecuteNonQuery(
                @"update news set type_id=@type_id,title=@title,author=@author,contents=@contents,publish_time=@publish_time where id=@id",
                new SqlParameter("@type_id", news.type_id),
                new SqlParameter("@title", news.title),
                new SqlParameter("@author", news.author),
                new SqlParameter("@contents", news.contents),
                new SqlParameter("@id", news.id),
                new SqlParameter("@publish_time", news.publish_time)
                );
        }

        public static int DeleteNews(int id)
        {
            return SqlHelper.ExecuteNonQuery(
                "delete from news where id=@id",
                new SqlParameter("@id", id)
                );
        }

        public static DataTable GetNewssByType(int type_id)
        {
            return SqlHelper.ExecuteDataTable(
                @"select id, title, username as publisher, publish_time, last_editItime 
                from v_news where type_id=@type_id where id <> 1",
                new SqlParameter("@type_id", type_id)
                );
        }

        public static string GetTypeName(int type_id)
        {
            return SqlHelper.ExecuteScalar(
                @"select name from news_type where id=@type_id",
                new SqlParameter("@type_id", type_id)
                ).ToString();
        }

        public static DataTable GetNewsByID(int id)
        {
            return SqlHelper.ExecuteDataTable(
                "select * from v_news where id=@id",
                new SqlParameter("@id", id)
                );
        }

        public static int ReadNum(int id)
        {
            return SqlHelper.ExecuteNonQuery(
                "update news set click=click+1 where id=@id",
                new SqlParameter("@id", id)
                );
        }

        public static int get_nav_id_by_news_type_id(int id)
        {
            return int.Parse(SqlHelper.ExecuteScalar("select nav_id from news_type where id=@id",
                   new System.Data.SqlClient.SqlParameter("@id", id)).ToString());
        }
        public static DataTable get_navname_byid(int nav_id)
        {
            return SqlHelper.ExecuteDataTable("select name from nav_name where id=@id",
                new System.Data.SqlClient.SqlParameter("@id", nav_id));
        }
        public static DataTable get_newstype_by_nav_id(int nav_id)
        {
            return SqlHelper.ExecuteDataTable("select * from news_type where nav_id=@id",
                new System.Data.SqlClient.SqlParameter("@id", nav_id));
        }
        public static DataTable get_intr(int id)
        {
            return SqlHelper.ExecuteDataTable("select * from news where type_id=@id",
                new System.Data.SqlClient.SqlParameter("@id", id));
        }

        public static DataTable getScrollImgById(int id)
        {
            return SqlHelper.ExecuteDataTable("select * from scroll_img where id=@id",
                new SqlParameter("@id",id));
        }

        public static Page GetSearchPage(int page_size, int page_number, string key)
        {
            DataTable dt = SqlHelper.ExecuteDataTable(page_size, page_number,
                    "select * from v_news where title like @title order by publish_time desc",
                    new SqlParameter("@title", "%" + key + "%"));
            List<News> news_lst = new List<News>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int id = int.Parse(dt.Rows[i]["id"].ToString());
                News news = new News(id);
                news_lst.Add(news);
            }
            int total = GetNewsCountOfKey(key);
            int total_page = total / page_size + 1;
            return new Page(news_lst, total, page_size, page_number);
        }

        public static int GetNewsCountOfKey(string key)
        {
            string count = SqlHelper.ExecuteScalar("select count(1) from news where title like @title",
                new SqlParameter("@title", "%" + key + "%")).ToString();
            return int.Parse(count);
        }
    }
}
