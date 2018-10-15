<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_list.aspx.cs" Inherits="WebUI.admin2.news_list" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="css/admin_index.css" />
    <link rel="stylesheet" type="text/css" href="css/admin_index2.css" />
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/do_ajax.js"></script>
</head>
<body>
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">文章管理</h2>         
                <input style="line-height:170%;" type="text" name="key" id="key"/>
                <button onclick="gotoSearch()" style="line-height:170%;">搜索 </button>               
            <div class="search">
                <span class="sttl">类型：</span>
                <select name="type_id" id="navid" onchange="ChangeType(this.value)">
                    <%if (adm.type_id == 2)
                        {%>
                    <%for (int j = 0; j < t_news_type.Rows.Count; j++)
    {%>
                    <%if (t_news_type.Rows[j]["id"].ToString() == adm.newstype_id)
    {%>
                    <option value="<%=t_news_type.Rows[j]["id"] %>"><%=t_news_type.Rows[j]["type_name"] %></option>
                    <%} %>

                    <%} %>
                    <%} %>
                    <%else
    { %>
                    <%for (int j = 0; j < t_news_type.Rows.Count; j++)
    {%>
                    <option value="<%=t_news_type.Rows[j]["id"] %>"><%=t_news_type.Rows[j]["type_name"] %></option>

                    <%} %>
                    <%} %>
                </select>
            </div>
        </div>
        <table class="table">
            <tr>
                <th>序号</th>
                <th>标题</th>
                <th>发布者</th>
                <th>时间</th>
                <th>点击量</th>
                <th colspan="3">操作</th>
            </tr>

            <% int i = news_page.number_start; %>
            <% foreach (var alt in news_page.pages)
                { %>
            <tr>
                <td><%=i++ %></td>
                <td class="td_news_title"><%=alt.title %></td>
                <td><%=alt.author %></td>
                <td><%=alt.publish_time.ToString("yyyy-MM-dd") %></td>
                <td><%=alt.click %></td>
                <td>
                    <a href="../web/news_detail.aspx?id=<%=alt.id %>" target="_blank">查看</a>
                </td>
                <td>
                    <a href="news_edit.aspx?id=<%=alt.id %>" class="blue_a">修改</a>
                </td>
                <td>
                    <a href="javascript:DeleNews(<%=alt.id %>, '<%=alt.title %>')" class="del_but">删除</a>
                </td>
            </tr>
            <% } %>
        </table>
        <aside class="paging">
            <span>跳至第:</span>
            <input type="number" min="1" max="<%=news_page.total_page %>" value="<%=page_num %>" id="page_number">
            <span>页</span>
            <a class="sure_but" onclick="goToPage()">确定</a>
            <span>共 <span id="total_page"><%=news_page.total_page %></span> 页　</span>
            <a onclick="ToPage(--page_num)">上一页</a>
            <a onclick="ToPage(++page_num)">下一页</a>
        </aside>

        <script>
            var total_page = <%=news_page.total_page %>;
            var page_num = <%=page_num %>;
            var navid = <%=navId %>;
            $("#navid").val(navid);

            function ToPage(page_number) {
                if (page_number < 1) {
                    page_num = 1;
                    return;
                }
                else if(page_number > total_page){
                    page_num = total_page;
                    return;
                }
                location.href="news_list.aspx?navId=" + navid + "&page_num="+page_number;
            }

            function goToPage() {
                page_num = document.getElementById("page_number").value;
                ToPage(page_num);
            }

            function ChangeType(navidc) {
                navid = navidc;
                ToPage(page_num);
            }

            function DeleNews(id, title) {
                DoAjax("确定要删除这篇新闻吗？\n\n" + title, "ashx/news_delete.ashx", id);
            }

            function gotoSearch() {
                var key = $("#key").val();
                if (key.trim() == "")
                { alert("请输入要搜索的内容"); return; }
                location.href = "news_search.aspx?page_num=1&key=" + key + "";
            }
        </script>
    </div>
</body>
</html>
