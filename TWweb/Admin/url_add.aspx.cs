using System;
using MyClass;
using System.Data;

namespace TWweb.Admin
{
    public partial class url_add : System.Web.UI.Page
    {
        public DataTable url_add1;
        public DataTable url_table;
        public DataTable GetFriend_url()
        {
            url_add1 = SqlHelper.ExecuteDataTable(
                "select * from friend_url"
                );
            if (url_add1.Rows.Count == 0)
            {
                return null;
            }
            return url_add1;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

         url_table = GetFriend_url();
        }//链接到friend_url数据库
    
        
    }
}