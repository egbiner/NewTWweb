<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebUI.admin2.login" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="renderer" content="webkit" />
    <meta charset="utf-8" />
    <title>登录</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="css/style2.css" />
    <link href="../Web/img/icon2.ico" rel="shortcut icon" />

    <style>
        body {
            height: 100%;
            background: black;
            overflow: hidden;
        }
        canvas {
            z-index: -1;
            position: absolute;
        }
    </style>
    <script src="js/jquery1.js"></script>
    <script src="js/Particleground.js"></script>
    <script src="js/jquery.form.js"></script>
    <script>
        $(document).ready(function () {
            //粒子背景特效
            $('body').particleground({
                dotColor: '#0d81cc',
                lineColor: '#0a67a3'
            });
            // ajaxForm
            var options = {
                success: function (re_text) {
                    //alert(re_text);
                    if (re_text == "OK") {
                        location.href = "index.aspx";
                    } else {
                        alert("用户名或密码错误！");
                        subm.value = "立即登陆";
                    }
                },
                error: function (res_text) {
                    subm.value = "立即登陆";
                    alert("服务器错误：\n" + res_text.status);
                }
            };
            $("#login1").ajaxForm(options);
        });

        function check() {
            subm.value = "正在登陆。。。";
            if (usr.value == "" || paw.value == "") {
                alert("用户名或密码不能为空！");
                subm.value = "立即登陆";
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form action="ashx/login.ashx" id="login1" method="post" onsubmit="return check()">
        <dl class="admin_login">
            <dt>
                <strong>桂电校团委网站管理后台</strong>
                <em>GUET Student Finance System Manage</em>
            </dt>
            <dd class="user_icon">
                <input type="text" placeholder="账号" class="login_txtbx" name="username" id="usr" />
            </dd>
            <dd class="pwd_icon">
                <input type="password" placeholder="密码" class="login_txtbx" name="password" id="paw" />
            </dd>
            <dd>
                <input type="submit" value="立即登陆" class="submit_btn" id="subm" />
            </dd>
            <dd>
            </dd>
        </dl>
    </form>
</body>
</html>
