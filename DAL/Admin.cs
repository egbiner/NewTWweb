using System.Data;
using System.Data.SqlClient;

namespace MyClass
{
    public class Admin
    {
        public int id { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string name { get; set; }
        public int type_id { get; set; }
        public string newstype_id { get; set; }

        public Admin(string username) //构造函数
        {
            DataTable all_info = SqlHelper.ExecuteDataTable(
                "select * from admin where username=@username",
                new SqlParameter("@username", username)
                );
            if (all_info.Rows.Count == 0)
            {
                return;
            }
            this.username = all_info.Rows[0]["username"].ToString();
            this.name= all_info.Rows[0]["name"].ToString();
            this.password = all_info.Rows[0]["password"].ToString();
            this.id = (int)all_info.Rows[0]["id"];
            this.type_id=(int)all_info.Rows[0]["type_id"];
            this.newstype_id= all_info.Rows[0]["newstype_id"].ToString();
        }
        

        public int Login(string paw) //登陆
        {
            if (this == null)
            {
                return 1;
            }
            if (paw == this.password)
            {
                return 0;
            }
            return 2;
        }

        public int pwd_change(string pwd_new,int id)
        {
            return  SqlHelper.ExecuteNonQuery(
                "update admin set password=@password where id=@id",
                new SqlParameter("@id", id),
                new SqlParameter("@password", pwd_new)
                );
        }
    }
}
