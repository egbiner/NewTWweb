<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="auditorium.aspx.cs" Inherits="TWweb.Web.auditorium" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="img/icon.ico" rel="shortcut icon" />
    <title>共青团桂林电子科技大学委员会</title>
    <link href="css/stylenewslist.css" rel="stylesheet" />
    <script src="../Admin/js/jquery-3.0.0.min.js"></script>
    <script src="js/layui/layui.js"></script>
    <link href="js/layui/css/layui.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            layui.use('layer', function () {
                var $ = layui.jquery, layer = layui.layer;

                $(".menu a").click(function () {
                    $(".menu a").removeClass("active");
                    $(this).addClass("active");
                    if ($(this).attr('id') == 4) {
                        document.getElementById("iframe1").src = "apply_search.aspx";
                    } else if ($(this).attr('id') == 3) {
                        //notice();
                        document.getElementById("iframe1").src = "applyform.aspx";
                    } else if ($(this).attr('id') == 2) {
                        document.getElementById("iframe1").src = "activities_history.aspx";
                    } else if ($(this).attr('id') == 1)
                        document.getElementById("iframe1").src = "activities_preview.aspx";
                    else
                        document.getElementById("iframe1").src = "<%="news_list_iframe.aspx?page_num=" + page_num + "&news_type=31" %>";
                });
            });
            //须知弹层
            function notice() {
                layer.open({
                    title: '申请须知',
                    type: 1,
                    area: ['700px', '70%'], //宽高
                    content: '<div style="padding:40px;line-height:36px"><h2 style="text-align:center">大学生活动中心演艺厅使用注意事项</h2><p>1、填报场地申请后经由团委文如冰老师审批后方可使用演艺厅。</p><p>2、非指定演艺厅操作人员禁止进入控制室。</p><p>3、在布置场地过程中严禁使用胶类工具粘贴物品，不得在演艺厅内张贴或悬挂任何装饰品、横幅。</p><p>4、在布置场地时，不得以滑动的方式挪动桌椅，以防划伤地板。 </p><p>5、演艺厅原则上由使用单位自备话筒5号电池，严禁在室内吸烟，吃零食，丢纸屑，随地吐痰，用笔和其他东西刻写公物。</p><p>6、学生或社团组织在使用演艺厅时任何人不得乱动演艺厅电源，如需特殊用电请自行提前向后勤处申请电力维护，以确保用电安全。如需搭台、架灯光，请在审批前填写《搭建舞台架申请模板》。</p><p>7、严禁使用明火，在活动过程中不得使用烟花、蜡烛等易燃易爆物品。</p><p>8、使用组织要爱护演艺厅内的设备，严禁用手拍打话筒，椅子要轻拿轻放。演艺厅内灯光、音响等设备未经同意不得擅自操作和移动</p><p>9、主办方应合理控制活动时间，最多不得超过申请时长的30分钟，如若超过申请时长的30分钟，应在活动结束后重新续写申请表，并交给团委文如冰老师。</p><p>10、当活动结束后，主办方应将演艺厅打扫干净并将桌椅放在指定地点，活动主办方指定负责人应积极配合工作人员清点、检查演艺厅内卫生和设备状况，经演艺厅管理人员许可后方可离开。</p><p>11、演艺厅使用最终解释权归校团委所有，如有损坏，请使用单位照价赔偿。</p><p>12、直接在网上填报，单子上要填写正式开始的时间，申请表上要有负责老师的信息，由活动负责老师电话联系审核申请，不接受学生电话联系。填表后一式两份交到大学生活动中心406文如冰老师处（存档，0773-2328357）和大学生艺术团团长于梦龙处（安排开门，15078380908）</p><br/><p style="text-align:right">共青团桂林电子科技大学委员会<br/>2018年4月15日</p></div>',
                    closeBtn: 0,
                    btn: '我同意(10s)',
                    btnAlign: 'c',
                    maxmin: true,
                });
                $(".layui-layer-btn0").attr("style", "background-color:grey;");
                $(".layui-layer-btn0").css("pointer-events", "none");
                var sec = 10;
                var interval = window.setInterval(function () {
                    $(".layui-layer-btn0").text("我同意(" + (sec--) + "s)");
                    if (sec == -1) {
                        clearInterval(interval);
                        $(".layui-layer-btn0").text("我同意");
                        $(".layui-layer-btn0").removeAttr("style");
                    }
                }, 1000);
            }
        });
    </script>
    <script type="text/javascript" charset="UTF-8" src="js/prefixfree.min.js"></script>
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
            <%--<div class="photo"></div>--%>
            <div class="place">
                当前位置：
                <a href="../index.aspx">首页</a>>>
        		<a href="javascript:void(0);">演艺厅</a>

            </div>
            <div class="line"></div>

            <div class="sidebar">
                <div class="menu">
                    <ul>
                        <li class="menu-tit">演艺厅</li>
                        <li><a id="1" href="javascript:void(0);" class="active">活动预告</a></li>
                        <li><a id="2" href="javascript:void(0);" class="">往期活动</a></li>
                         <li><a id="3" href="javascript:void(0);" class="">在线申请</a></li>
                         <li><a id="4" href="javascript:void(0);" class="">申请查询</a></li>
                         <li><a id="5" href="javascript:void(0);" class="">其他信息</a></li>
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
                <iframe class="content" id="iframe1" onload="setIframeHeight(this)" scrolling="no" style="width: 100%;" frameborder="0" src="activities_preview.aspx"></iframe>
                <script>
                    function setIframeHeight(iframe) {
                        iframe.height = 600;
                        var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
                        iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
                    }
                    window.onresize = function () {
                        setIframeHeight(document.getElementById("iframe1"));
                    };
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