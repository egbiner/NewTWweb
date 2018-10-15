<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pwd_change.aspx.cs" Inherits="WebUI.admin2.pwd_change" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="css/admin_index.css" />
    <link rel="stylesheet" type="text/css" href="css/admin_index2.css" />

    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/user/show_kind_editor.js"></script>
</head>
<body>
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">修改密码</h2>
        </div>
        <form action="ashx/update_password.ashx" id="form1" method="post" onsubmit="return check()">
            <table class="add_act_tb">
                <tr>
                    <td class="left_td2">
                        <span>旧密码：</span>
                    </td>
                    <td>
                        <input name="pwd_old" id="pwd_old" type="password">
                    </td>
                </tr>
                <tr>
                    <td class="left_td2">
                        <span>新密码：</span>
                    </td>
                    <td>
                        <input name="pwd_new" id="pwd_new" type="password">
                    </td>
                </tr>
                <tr>
                    <td class="left_td2">
                        <span>确认新密码：</span>
                    </td>
                    <td>
                        <input id="pwd_new2" type="password">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" class="link_btn">确定修改</button>
                    </td>
                </tr>
            </table>
        </form>

        <script>
            function check() {
                if (document.getElementById("pwd_old").value == "") {
                    alert("请填写原密码！");
                    return false;
                }
                else if (document.getElementById("pwd_old").value != <%=admin_pwd_ture %>)
                {
                alert("原密码填写不正确！");
            return false;
        }
        var pwd_new = document.getElementById("pwd_new").value;
        if (pwd_new == "") {
            alert("请填写新密码！");
            return false;
        }
        if (document.getElementById("pwd_new2").value != pwd_new) {
            alert("两次密码不一致！");
            return false;
        }
        return true;
        }
        $(document).ready(function () {
            var options = {
                success: function (res_text) {
                    if (res_text == "OK") {
                        alert("修改成功！");
                        window.location.reload();
                    } else {
                        alert("修改失败！" + res_text);
                    }
                },
                error: function (res_text) {
                    alert("服务器错误 " + res_text.status + "，修改失败！");
                }
            };
            $("#form1").ajaxForm(options);
        });
        </script>

    </div>
</body>
</html>
