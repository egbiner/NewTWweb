using MyClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TWweb.Web
{
    public partial class news_detail : System.Web.UI.Page
    {
        public News news = null;
        public string nav_name;
        public DataTable t_news_type;
        public string news_type_id;
        public DataTable t_friend_url = null;
        public DataTable t_news_hot = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            int id = 1;
            object id_ob = Request["id"];
            if (id_ob != null)
            {
                id = int.Parse(id_ob.ToString());
            }
            news_type_id = SqlHelper.ExecuteScalar("select type_id from news where id=@id",
                new System.Data.SqlClient.SqlParameter("@id", id)).ToString();
            int nav_id = int.Parse(SqlHelper.ExecuteScalar("select nav_id from news_type where id=@id",
                   new System.Data.SqlClient.SqlParameter("@id", news_type_id)).ToString());
            DataTable t = SqlHelper.ExecuteDataTable("select name from nav_name where id=@id",
                new System.Data.SqlClient.SqlParameter("@id", nav_id));
            nav_name = t.Rows[0]["name"].ToString();
            t_news_type = SqlHelper.ExecuteDataTable("select * from news_type where nav_id=@id",
                new System.Data.SqlClient.SqlParameter("@id", nav_id));
            news = new News(id);
            News.ReadNum(id);
            t_friend_url = SqlHelper.ExecuteDataTable("select * from friend_url where show=1");
            t_news_hot = SqlHelper.ExecuteDataTable("select top 8 * from news order by click desc");

        }
    }
}