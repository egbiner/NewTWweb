<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news_search_list.aspx.cs" Inherits="TWweb.Web.news_search_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="img/icon.ico" rel="shortcut icon" />
    <title>共青团桂林电子科技大学委员会</title>
    <link href="css/stylenewslist.css" rel="stylesheet" />
    <script src="../Admin/js/jquery-3.0.0.min.js"></script>
    <script src="js/news_list_select.js"></script>
    <script type="text/javascript" charset="UTF-8" src="js/prefixfree.min.js"></script>
    <style>
        .content{
	        margin-top: 0px;
            margin-left:50px;
	        }
        .paging {
            margin: 8px 0;
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
    <div class="all-web">
        <div class="header">
            <div class="badge"></div>
            <div class="nav">
                <ul>
                    <li><a href="../index.aspx">首页</a>
                    </li>
                    <li><a href="#">团情快讯</a>
                        <ul>
                            <li><a href="news_list.aspx?news_type=23">团委简介</a></li>
                            <li><a href="news_list.aspx?news_type=24">组织机构</a></li>
                            <li><a href="news_list.aspx?news_type=25">团委动态</a></li>

                        </ul>
                    </li>
                    <li><a href="#">学院动态 </a>
                        <ul>
                            <li><a href="news_list.aspx?news_type=9">学院团委风采</a></li>


                        </ul>
                    </li>
                    <li><a href="#">社团风采</a>
                        <ul>
                            <li><a href="news_list.aspx?news_type=3">社团简介</a></li>
                            <li><a href="news_list.aspx?news_type=4">社团动态</a></li>


                        </ul>
                    </li>

                    <li><a href="#">实践创新</a>
                        <ul>
                            <li><a href="news_list.aspx?news_type=5">社会实践</a></li>
                            <li><a href="news_list.aspx?news_type=6">创新创业</a></li>

                        </ul>
                    </li>

                    <li><a href="news_list.aspx?news_type=8">文件下载</a>
                    </li>
					<li><a href="auditorium.aspx">演艺厅</a></li>

					<li><a href="#">规章制度</a>
                        <ul>
                            <li><a href="news_list.aspx?news_type=32">办事流程</a></li>
                            <li><a href="news_list.aspx?news_type=33">管理制度</a></li>

                        </ul>
                    </li>

					 <li><a href="#">联系我们</a>
                        <ul>
                            <li><a href="news_list.aspx?news_type=34">团委电子邮箱</a></li>
                            <li><a href="news_list.aspx?news_type=35">领导邮箱</a></li>
							<li><a href="news_list.aspx?news_type=36">传真</a></li>
                        </ul>
                    </li>

                </ul>
            </div>

        </div>

        <div class="line"></div>


        <div class="body">
            <div class="place">
                当前位置：
                <a href="../index.aspx">首页</a>>>
        		<a href="javascript:void(0);">搜索</a>
            </div>
            <div class="line"></div>

            <div class="sidebar">
                <div class="menu">
                    <ul>
                        <li class="menu-tit">新闻显示</li>
                        <li><a href="javascript:void(0);">搜索结果</a></li>
                    </ul>
                </div>
                <div class="new">
                    <div class="new-title">
                        <div class="new-notice">热点新闻<a href="#">更多+</a></div>
                    </div>
                    <div class="new-content">
                        <ul>
                            <%for (int i = 0; i < t_news_hot.Rows.Count; i++)
                                {%>
                            <li><a href="news_detail.aspx?id=<%=t_news_hot.Rows[i]["id"] %>" target="_blank" title="<%=t_news_hot.Rows[i]["title"] %>"><%=t_news_hot.Rows[i]["title"].ToString().Length<17?t_news_hot.Rows[i]["title"].ToString():t_news_hot.Rows[i]["title"].ToString().Substring(0, 16)+"……" %></a><span style="float: right;">[<%=Convert.ToDateTime(t_news_hot.Rows[i]["publish_time"]).ToString("MM-dd") %>]</span></li>
                            <%} %>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="main">



        <div class="content">
            <%if (news_page.pages.Count == 0)
                {%>
            <p style="text-align:center">没有找到匹配的文章~</p>
            <%}
    else
    {%>
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
            <%} %>
    </div>
        <script>
            var key_s = "<%=key_s%>";
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
            location.href = "news_search_list.aspx?page_num=" + page_number + "&key=" + key_s;
        }

        function goToPage() {
            page_num = document.getElementById("page_number").value;
            ToPage(page_num);
            }
         
    </script>
                <div class="page">
            </div>
            </div>

            <div class="friendly-link">
                <div class="friendly-link-tit">友情链接:</div>
                <ul>
                    <%for (int i = 0; i < t_friend_url.Rows.Count; i++)
                        {%>
                    <li><a href="<%=t_friend_url.Rows[i]["url"] %>" target="_blank"><%=t_friend_url.Rows[i]["name"] %></a></li>
                    <%} %>
                </ul>
            </div>
            <div class="webo">

                <ul class="webo-link">
                    <li><a href="https://weibo.com/guetgqt" target="_blank">官方微博</a></li>
                    <li><a href="#">官方微信 </a></li>
                    <li><a href="http://qnzs.youth.cn/" target="_blank">青年之声</a></li>
                    <li><a href="#">新媒体联盟</a></li>


                </ul>

            </div>

        </div>

    </div>
    <div class="footer">

        <div class="line"></div>
        <div class="footer-bottom">
            <p>
                Copyright ©共青团桂林电子科技大学委员会<br />
                校址:中国广西桂林市七星区金鸡路1号    邮编:541004
                <br />
                桂林电子科技大学 团委 网络中心 审核通过
                <br />
                <a style="color: white;" href="../Admin/login.aspx" target="_blank">后台管理</a>
            </p>

        </div>
    </div>

</body>
</html>
