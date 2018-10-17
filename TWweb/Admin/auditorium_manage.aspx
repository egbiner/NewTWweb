<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="auditorium_manage.aspx.cs" Inherits="TWweb.Admin.yanyiting_manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/admin_index.css" rel="stylesheet" />
    <link href="css/admin_index2.css" rel="stylesheet" />
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/do_ajax.js"></script>
<%--    <script src="../Web/js/layer.js"></script>
    <link href="../Web/css/layer.css" rel="stylesheet" />--%>
    <script src="../Web/js/layui/layui.js"></script>
    <link href="../Web/js/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">演艺厅申请情况</h2>
             <div class="search" style="margin-top:3px">
            <span class="sttl">类型：</span>
                <select name="status" id="status" onchange="ChangeType(this.value)">
                    <option value="0">待审核</option>
                    <option value="1">已通过</option>
                    <option value="2">已拒绝</option>
                </select>
                 </div>
        </div>
            <table class="table">
        <tr>
            <th>回执码</th>
            <th>申请使用日期</th>
            <th>具体使用时间</th>
            <th style="max-width:200px!important">活动名称</th>
            <th>申请人</th>
            <th>进行状况</th>
            <th colspan="5">操作</th>
        </tr>

        <% foreach (var alt in apply_page.applypages)
                { %>
        <tr>
            <td><%=alt.id %></td>
            <td><%=alt.use_time_start.ToString("yyyy-MM-dd")%></td>
            <td><%=alt.use_time_start.ToString("t")+"-"+ alt.use_time_end.ToString("t")%></td>
            <td><%=alt.activity%></td>
            <td><%=alt.ap_user %></td>
            <%if (int.Parse(alt.status.ToString()) == 0) { %>
                <td style="color:blue">待处理</td>
            <%} else if (int.Parse(alt.status.ToString()) == 2) { %>
                <td style="color:red">已拒绝</td>
            <%} else{%>
                <td style="color:green">已通过</td>
            <%} %>
            <td>
                <a href="javascript:opendetail(<%=alt.id %>)">查看详细</a>
            </td>
<%--            <td>
                <a style="color:blue" href="javascript:manage('reset', '<%=alt.id %>')">重置</a>
            </td>--%>
             <td>
                <a style="color:blue" href="javascript:modify(<%=alt.id %>)">修改</a>
            </td>
            <td>
                <a style="color:green" href="javascript:check('<%=alt.id %>')">通过</a>
            </td>
            <td>
                <a style="color:orangered" href="javascript:dis_prompt(<%=alt.id %>)">拒绝</a>
            </td>
            <td>
                <a href="javascript:manage('del', '<%=alt.id %>')" class="del_but">删除</a>
            </td>
        </tr>
        <% } %>
    </table>
        <aside class="paging">
            <span>跳至第:</span>
            <input type="number" min="1" max="<%=apply_page.total_page %>" value="<%=page_num %>" id="page_number">
            <span>页</span>
            <a class="sure_but" onclick="goToPage()">确定</a>
            <span>共 <span id="total_page"><%=apply_page.total_page %></span> 页　</span>
            <a onclick="ToPage(--page_num)">上一页</a>
            <a onclick="ToPage(++page_num)">下一页</a>
        </aside>

        <script>
            var total_page = <%=apply_page.total_page %>;
            var page_num = <%=page_num %>;
            var status = <%=status %>;
            $("#status").val(status);

            function ToPage(page_number) {
                if (page_number < 1) {
                    page_num = 1;
                    return;
                }
                else if (page_number > total_page) {
                    page_num = total_page;
                    return;
                }
                location.href = "auditorium_manage.aspx?page_num=" + page_number + "&status=" + status;
            }
            function goToPage() {
                page_num = document.getElementById("page_number").value;
                ToPage(page_num);
            }
            function dis_prompt(id) {
                var reason = prompt("请输入拒绝原因", "");
                if (reason != null && reason != "") {
                    manage("reject", id + "$" + reason);
                }
            }
            function opendetail(id) {
                layui.use('layer', function () {
                    var $ = layui.jquery, layer = layui.layer;
                    layer.open({
                        title: '申请详情',
                        type: 2,
                        area: ['790px', '80%'], //宽高
                        shade: 0,
                        content: 'applyform_modle.aspx?id=' + id,
                        maxmin: true,
                    });
                });
            }

            function modify(id) {
                layui.use('layer', function () {
                    var $ = layui.jquery, layer = layui.layer;
                    layer.open({
                        title: '修改时间',
                        type: 2,
                        area: ['700px', '500px'], //宽高
                        shade: 0,
                        content: 'apply_modify.aspx?id=' + id,
                        maxmin: true,
                    });
                });
            }
            function manage(action, id) {
                switch (action) {
                    case "reset":
                        DoAjax("你确定要重置？", "ashx/yanyiting_manage.ashx", id, action);
                        break;
                    case "pass":
                        DoAjax("你确定要通过？", "ashx/yanyiting_manage.ashx", id, action);
                        break;
                    case "reject":
                        DoAjax("你确定要拒绝？", "ashx/yanyiting_manage.ashx", id, action);
                        break;
                    case "del":
                        DoAjax("你确定要删除？", "ashx/yanyiting_manage.ashx", id, action);
                        break;
                }
            }

            function ChangeType(_status) {
                status = _status;
                ToPage(page_num);
            }

            function check(id) {
                $.ajax({
                    type: "POST",
                    url: 'ashx/yanyiting_manage.ashx',
                    data: {
                        "id": id,
                        "status": "check"
                    },
                    success: function (data) {
                        if (data != "OK")
                            alert("时间存在冲突！");
                        else {
                            manage('pass', id);
                        }
                    },
                    error: function () {
                        alert("服务器错误")
                    }
                });
            }
        </script>
    </div>
</body>
</html>