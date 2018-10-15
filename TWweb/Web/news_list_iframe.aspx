<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_list_iframe.aspx.cs" Inherits="TWweb.Web.news_list_iframe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        .content {
            width: 100%;
            min-height: 400px;
            margin-bottom: 13px;
            float: left;
        }

            .content ul {
                width: 100%;
                /*border-bottom: 1px dashed #ccc;*/
                margin-bottom: 8px;
            }

                .content ul li {
                    list-style: disc;
                    float: none;
                    line-height: 30px;
                    border-bottom: 1px dashed #ccc;
                }

            .content a:hover {
                color: #d71212;
            }

        a {
            text-decoration: none;
            color: #000000;
        }

            a:hover {
                text-decoration: none;
                color: #d71212;
            }

        span {
            margin-right: 5%;
        }

        .paging {
            margin: 8px 0;
            overflow: hidden;
            text-align: right;
        }
        .paging span{
            margin:0px!important;
        }
            .paging a {
                background: #fffbd4;
                border: 1px solid #CCC;
                color: #000000;
                padding: 5px 8px;
                display: inline-block;
                cursor: pointer;
            }

                .paging a:hover {
                    background: #7ff7ba;
                    border: 1px solid #CCC;
                }

                .paging a:active {
                    background: #17a578;
                    border: 1px #0e8f61 solid;
                }
    </style>
</head>
<body>
    <div class="content">
        <ul>
            <%foreach (var news in news_page.pages)
                { %>
            <li><a href="news_detail.aspx?id=<%=news.id %>" target="_blank" title="<%=news.title %>"><%if (news.title.Length <= 29)
                                                                                                                                 { %><%=news.title %><%}
                                                                                                     else
                                                                                                     { %><%=news.title.Substring(0, 27) + "……" %><%} %></a><span style="float: right;">[<%=news.publish_time.ToString("yyyy-MM-dd") %>]</span></li>
            <%} %>
        </ul>
        <aside class="paging">
            <span>跳至第:</span>
            <input type="number" min="1" max="<%=news_page.total_page %>" value="<%=page_num %>" id="page_number">
            <span>页</span>
            <a class="sure_but" onclick="goToPage()">确定</a>
            <span>共 <span id="total_page"><%=news_page.total_page %></span> 页　</span>
            <a onclick="ToPage(--page_num)">上一页</a>
            <a onclick="ToPage(++page_num)">下一页</a>
        </aside>
    </div>
        <script>
        var total_page = <%=news_page.total_page %>;
        var page_num = <%=page_num %>;

        function ToPage(page_number) {
            if (page_number < 1) {
                page_num = 1;
                return;
            }
            else if(page_number > total_page){
                page_num = total_page;
                return;
            }
            location.href="news_list_iframe.aspx?news_type=" + "<%=news_type %>" + "&page_num="+page_number;
        }

        function goToPage() {
            page_num = document.getElementById("page_number").value;
            ToPage(page_num);
        }
    </script>
</body>
</html>
