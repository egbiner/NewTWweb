<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebUI.admin2.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>共青团桂林电子科技大学委员会</title>
    <meta name="author" content="DeathGhost" />
    <link href="../Web/img/icon2.ico" rel="shortcut icon" />
    <link rel="stylesheet" type="text/css" href="css/admin_index.css" />
    <link rel="stylesheet" type="text/css" href="css/admin_index2.css" />
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/admin_index.js"></script>
</head>

<body class="box">
<header class="header">
    <h1>校团委网站管理后台</h1>
    <ul class="rt_nav">
        <li><a href="#" target="_blank" class="website_icon"><%=admin.name %></a></li>
        <li><a href="login.aspx?logout=1" class="quit_icon">安全退出</a></li>
    </ul>
</header>
<div class="content0">
    <aside class="lt_aside_nav content mCustomScrollbar">
        <h2><a href="#">菜单</a></h2>
        <ul>
            <li>
                <dl class="menu">
                    <dd><a href="#" id="news_list" class="active">新闻管理</a></dd>
                    <dd><a href="#" id="news_add">发布新闻</a></dd>
                    <%if (admin.type_id == 1)
                        { %>
                    <dd><a href="#" id="scroll_img">首页滚动图设置</a></dd>
                    <dd><a href="#" id="url_add">友情链接管理</a></dd>
                    <dd><a href="#" id="auditorium_manage">演艺厅管理</a></dd>
                    <%} %>
                    <dd><a href="#" id="pwd_change">修改密码</a></dd>
                </dl>
            </li>
            <li>
                <p class="btm_infor">© 校团委</p>
            </li>
        </ul>
    </aside>
    <iframe class="right" id="iframe1" src="news_list.aspx"></iframe>
</div>
</body>
</html>
