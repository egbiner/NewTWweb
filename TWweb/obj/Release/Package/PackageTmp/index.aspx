<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TWweb.Web.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Web/img/icon.ico" rel="shortcut icon" />
    <title>共青团桂林电子科技大学委员会</title>
    <link rel="stylesheet" href="Web/css/style1.css" />
    <script type="text/javascript" src="Web/js/jquery.js"></script>
    <script type="text/javascript" src="Web/js/scroll.js"></script>
    <script src="Web/js/script.js" language="JavaScript"></script>
    <script type="text/javascript" src="Web/js/index_min.js" ></script>
    <script>
        if ((screen.width == 1024) && (screen.height == 768)) {
            document.write("<body background='skins/default/ip.gif'>");
        }
        if ((screen.width == 1152) && (screen.height == 864)) {
            document.write("<body background='skins/default/message.gif'>");
        }
    </script>
    <script>//tab部分JS
        $(document).ready(function () {
            $("#content div").hide(); // Initially hide all content
            $("#tabs li:first").attr("id", "current"); // Activate first tab
            $("#content div:first").fadeIn(); // Show first tab content

            $('#tabs a').mouseover(function (e) {
                e.preventDefault();
                $("#content div").hide(); //Hide all content
                $("#tabs li").attr("id", ""); //Reset id's
                $(this).parent().attr("id", "current"); // Activate this
                $('#' + $(this).attr('title')).fadeIn(); // Show content for current tab
            });
        });
    </script>
    <script language="JavaScript">
        $(document).ready(function () {
            $('.list_lh li:even').addClass('lieven');
        })
        $(function () {
            $("div.list_lh").myScroll({
                speed: 40, //数值越大，速度越慢
                rowHeight: 68 //li的高度
            });
        });
    </script>
    <link rel="stylesheet" href="Web/dummy-images/orbit-1.2.3.css" />
    <script type="text/javascript" src="Web/dummy-images/jquery.orbit-1.2.3.min.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#featured').orbit();
        });
    </script>
</head>
<body>
    <div class="all-web">
        <div class="header">
            <div class="badge"></div>
            <div class="nav">
                <ul>
                    <li><a href="index.aspx">首页</a>
                    </li>
                    <li><a href="#">团情快讯</a>
                        <ul>
                            <li><a href="Web/news_list.aspx?news_type=23">团委简介</a></li>
                            <li><a href="Web/news_list.aspx?news_type=24">组织机构</a></li>
                            <li><a href="Web/news_list.aspx?news_type=25">团委动态</a></li>
                        </ul>
                    </li>
                    <li><a href="#">学院动态 </a>
                        <ul>
                            <li><a href="Web/news_list.aspx?news_type=9">学院团委风采</a></li>
                        </ul>
                    </li>
                    <li><a href="#">社团风采</a>
                        <ul>
                            <li><a href="Web/news_list.aspx?news_type=3">社团简介</a></li>
                            <li><a href="Web/news_list.aspx?news_type=4">社团动态</a></li>
                        </ul>
                    </li>

                    <li><a href="#">实践创新</a>
                        <ul>
                            <li><a href="Web/news_list.aspx?news_type=5">社会实践</a></li>
                            <li><a href="Web/news_list.aspx?news_type=6">创新创业</a></li>
                        </ul>
                    </li>

                    <li><a href="Web/news_list.aspx?news_type=8">文件下载</a></li>

                     <li><a href="Web/auditorium.aspx">演艺厅</a></li>

					<li><a href="#">规章制度</a>
                        <ul>
                            <li><a href="Web/news_list.aspx?news_type=32">办事流程</a></li>
                            <li><a href="Web/news_list.aspx?news_type=33">管理制度</a></li>

                        </ul>
                    </li>

					 <li><a href="#">联系我们</a>
                        <ul>
                            <li><a href="Web/news_list.aspx?news_type=34">团委电子邮箱</a></li>
                            <li><a href="Web/news_list.aspx?news_type=35">领导邮箱</a></li>
							<li><a href="Web/news_list.aspx?news_type=36">传真</a></li>
                        </ul>
                    </li>
                    <li>
                        <input type="text" name="key" id="key" class="input-text" placeholder="请输入搜索关键词"/>
                        <input type="image" src="Web/img/search.png" class="input-submit" onclick="search()"/>
                    </li>
                </ul>
            </div>

        </div>
        <div class="line"></div>
        <div class="body">
            <%--<div class="banner">
                <div class="container">
                    <div id="featured">
                        <%for (int i = 0; i < t_scroll_img.Rows.Count; i++)
                            { %>
                        <img src="<%=t_scroll_img.Rows[i]["image_url"] %>" />
                        <%} %>
                    </div>
                </div>
            </div>--%>
            <div class="next">
                <div class="next-active">
                    <div class="next-active-tit">
                        <div class="new-notice">团委动态<a href="Web/news_list.aspx?news_type=25">更多+</a></div>
                    </div>
                    <div class="next-active-con">
                        <div class="next-active-con-photo">
                            <div class="next-active-con-photo-all" id='all'>
                                <div class="next-active-con-photo-screen">
                                    <ul>
                                        <%for (int i = 0; i < t_scroll_img.Rows.Count; i++)
                                            { %>
                                        <li>

                                            <img src="<%=t_scroll_img.Rows[i]["image_url"] %>" />

                                        </li>
                                        <%} %>
                                    </ul>
                                </div>
                                <ol>
                                </ol>
                            </div>
                        </div>
                        <div class="next-active-con-new">
                            <div class="new-content">
                                <ul>
                                    <%  foreach (var news in news_pages1.pages)
                                        { %>
                                    <li>
                                        <a href="Web/news_detail.aspx?id=<%=news.id %>" target="_blank" title="<%=news.title %>"><%if (news.title.Length <= 24)
                                                                                                                                     { %><%=news.title %><%}
                                                                                                                                                             else
                                                                                                                                                             { %><%=news.title.Substring(0, 23) + "……" %><%} %></a><span style="float: right;">[<%=news.publish_time.ToString("MM-dd") %>]</span>
                                    </li>
                                    <%} %>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="notice-roll">
                    <div class="box">
                        <div class="bcon">
                            <div class="new-title">
                                <div class="new-notice">团内通知<a href="Web/news_list.aspx?news_type=7">更多+</a></div>
                            </div>
                            <div class="list_lh">
                                <div class="notice-roll-new-content">
                                    <ul>
                                        <%  foreach (var news in news_pages7.pages)
                                            { %>
                                        <li>
                                            <a href="Web/news_detail.aspx?id=<%=news.id %>" target="_blank" title="<%=news.title %>"><%if (news.title.Length <= 26)
                                                                                                                                         { %><%=news.title %><%}
                                                                                                                                                                 else
                                                                                                                                                                 { %><%=news.title.Substring(0, 25) + "……" %><%} %></a><span style="float: right;">[<%=news.publish_time.ToString("MM-dd") %>]</span>
                                        </li>
                                        <%} %>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="link"><a href="#"></a></div>

            <div class="all-new">
                <div class="new">
                    <div class="new-title">
                        <div class="new-notice">社会实践<a href="Web/news_list.aspx?news_type=5">更多+</a></div>
                    </div>
                    <div class="new-content">
                        <ul>
                            <%  foreach (var news in news_pages5.pages)
                                { %>
                            <li>
                                <a href="Web/news_detail.aspx?id=<%=news.id %>" target="_blank" title="<%=news.title %>"><%if (news.title.Length <= 25)
                                                                                                                             { %><%=news.title %><%}
                                                                                                                                                     else
                                                                                                                                                     { %><%=news.title.Substring(0, 24) + "……" %><%} %></a><span style="float: right;">[<%=news.publish_time.ToString("MM-dd") %>]</span>
                            </li>
                            <%} %>
                        </ul>
                    </div>
                </div>
                <div class="new">
                    <div class="new-title">
                        <div class="new-notice">创新创业<a href="Web/news_list.aspx?news_type=6">更多+</a></div>
                    </div>
                    <div class="new-content">
                        <ul>
                            <%  foreach (var news in news_pages6.pages)
                                { %>
                            <li>
                                <a href="Web/news_detail.aspx?id=<%=news.id %>" target="_blank" title="<%=news.title %>"><%if (news.title.Length <= 25)
                                                                                                                             { %><%=news.title %><%}                                                                                                                       else
                                                                                                                                                     { %><%=news.title.Substring(0, 24) + "……" %><%} %></a><span style="float: right;">[<%=news.publish_time.ToString("MM-dd") %>]</span>
                            </li>
                            <%} %>
                        </ul>
                    </div>
                </div>
                <div class="plan" style="text-align: center;">
                    <ul>
                        <li><a href="Web/news_list.aspx?news_type=29">一学一做专栏      </a></li>
                        <li><a href="Web/news_list.aspx?news_type=37">学生干部素质提升计划        </a></li>
                        <li><a href="Web/news_list.aspx?news_type=39">团支部活力提升计划         </a></li>
                    </ul>
                </div>
            </div>
            <div class="line"></div>
            <div class="body-bottom">
                <div class="body-bottom-tab">
                    <ul id="tabs" style="font-size: 16px;">
                        <li title="机电工程学院"><a href="Web/news_list.aspx?news_type=9" title="机电工程学院">机电工程</a></li>
                        <li title="信息与通信学院"><a href="Web/news_list.aspx?news_type=10" title="信息与通信学院">信息与通信</a></li>
                        <li title="计算机与信息安全学院"><a href="Web/news_list.aspx?news_type=11" title="计算机与信息安全学院">计算机与信息安全</a></li>
                        <li title="艺术与设计学院"><a href="Web/news_list.aspx?news_type=12" title="艺术与设计学院">艺术与设计</a></li>
                    </ul>
                    <a class="a_college" href="Web/news_list.aspx?news_type=9">更多>></a>
                    <div id="content">
                        <div id="机电工程学院" class="tab-content">
                            <ul>
                                <%  foreach (var news in news_pages9.pages)
                                    { %>
                                <li>
                                    <a href="Web/news_detail.aspx?id=<%=news.id %>" target="_blank" title="<%=news.title %>"><%if (news.title.Length <= 32)
                                                                                                                                 { %><%=news.title %><%}
                                                                                                                                                         else                                                                                                                 { %><%=news.title.Substring(0, 32) + "……" %><%} %></a><span style="float: right;">[<%=news.publish_time.ToString("MM-dd") %>]</span>
                                </li>
                                <%} %>
                            </ul>
                        </div>
                        <div id="信息与通信学院" class="tab-content">
                            <ul>
                                <%  foreach (var news in news_pages10.pages)
                                    { %>
                                <li>
                                    <a href="Web/news_detail.aspx?id=<%=news.id %>" target="_blank" title="<%=news.title %>"><%if (news.title.Length <= 32)
                                                                                                                                 { %><%=news.title %><%}
                                                                                                                                                         else
                                                                                                                                                         { %><%=news.title.Substring(0, 32) + "……" %><%} %></a><span style="float: right;">[<%=news.publish_time.ToString("MM-dd") %>]</span>
                                </li>
                                <%} %>
                            </ul>
                        </div>
                        <div id="计算机与信息安全学院" class="tab-content">
                            <ul>
                                <%  foreach (var news in news_pages11.pages)
                                    { %>
                                <li>
                                    <a href="Web/news_detail.aspx?id=<%=news.id %>" target="_blank" title="<%=news.title %>"><%if (news.title.Length <= 32)
                                                                                                                                 { %><%=news.title %><%}
                                                                                                                                                         else
                                                                                                                                                         { %><%=news.title.Substring(0, 32) + "……" %><%} %></a><span style="float: right;">[<%=news.publish_time.ToString("MM-dd") %>]</span>
                                </li>
                                <%} %>
                            </ul>
                        </div>
                        <div id="艺术与设计学院" class="tab-content">
                            <ul>
                                <%  foreach (var news in news_pages12.pages)
                                    { %>
                                <li>
                                    <a href="Web/news_detail.aspx?id=<%=news.id %>" target="_blank" title="<%=news.title %>"><%if (news.title.Length <= 32)
                                                                                                                                 { %><%=news.title %><%}
                                                                                                                                                         else
                                                                                                                                                         { %><%=news.title.Substring(0, 32) + "……" %><%} %></a><span style="float: right;">[<%=news.publish_time.ToString("MM-dd") %>]</span>
                                </li>
                                <%} %>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="download">
                    <div class="download-til">下载专区<a href="Web/news_list.aspx?news_type=8">更多>></a></div>
                    <div class="dowload-content">
                        <ul>
                            <%  foreach (var news in news_pages8.pages)
                                { %>
                            <li>
                                <a href="Web/news_detail.aspx?id=<%=news.id %>" target="_blank" title="<%=news.title %>"><span style="color: #D81513;">>></span><%if (news.title.Length <= 19)
                                                                                                                                                                    { %><%=news.title %><%}
                                                                                                                                                                                            else
                                                                                                                                                                                            { %><%=news.title.Substring(0, 18) + "……" %><%} %></a><span style="float: right;">[<%=news.publish_time.ToString("MM-dd") %>]</span>
                            </li>
                            <%} %>
                        </ul>
                    </div>
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
                    <li><a href="javascript:void(0);" id="wechat">官方微信 </a></li>
                    <li><a href="http://gliet.gx.qnzs.youth.cn/" target="_blank">青年之声</a></li>
                    <li><a href="javascript:void(0);">新媒体联盟</a></li>
                </ul>
            </div>
            <script>
                function search() {
                    var key = $("#key").val();
                    location.href = "Web/news_search_list.aspx?key="+key;
                }
                $(document).ready(function () {
                    $("#wechat").hover(function () {
                        $("#wechat_img").show();
                    });
                    $("#wechat").mouseout(function () {
                        $("#wechat_img").hide();
                    });
                });
            </script>
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
