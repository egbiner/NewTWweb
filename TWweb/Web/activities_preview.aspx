<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activities_preview.aspx.cs" Inherits="TWweb.Web.activities_list" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/about1.css">
<script src="js/layui/layui.js"></script>
<link href="js/layui/css/layui.css" rel="stylesheet" />
<title>时间轴 </title>
    <style>
        td{
            height:50px;
            text-align:center;
            border-bottom: dashed 1px #CCCCCC;
        }
        th{
            border-bottom:1.5px solid #CCCCCC;
            line-height:30px;
        }
        .layui-laypage a{
            background-color:#fffbd4;
        }
    </style>
</head>
<body>

<div class="box" style="margin-left:20px;margin-top:30px;height:700px;width:700px;border-collapse: collapse;">
    <div class="right">
        <br />
		<h3>活动预告</h3>
         <%if (apply_page.applypages == null){ %>
            <h3 style="position: fixed;bottom:50px">暂无更多活动,敬请期待~</h3>
         <%}else{%>
            <table border="0" style="table-layout:fixed;margin:20px 10px 0px 10px;" cellspacing="0" cellpadding="0">
                <tr>
                    <th style="width:200px;">活动名称</th>
                    <th style="width:200px">申请时间</th>
                    <th style="width:100px">活动时间</th>
                    <th style="width:50px">申请人</th>
                    <th style="width:100px">申请人电话</th>
                </tr>
                <% foreach (var alt in apply_page.applypages){ %>
                    <tr>
                        <td><%=alt.activity %></td>
                        <td><%=((DateTime)alt.use_time_start).ToString("yyyy-MM-dd HH:mm")%>~<%=((DateTime)alt.use_time_end).ToString("HH:mm")%></td>
                        <td><%=((DateTime)alt.use_time_start).ToString("HH:mm")%>~<%=((DateTime)alt.use_time_end).ToString("HH:mm")%></td>
                        <td><%=alt.ap_user %></td>
                        <td><%=alt.ap_phone %></td>
                    </tr>
                <%} %>
            </table>
        <%} %>
	</div>
    <div style="text-align:center;" id="page_pack"></div>
	</div>
</body>
</html>
<script>
    var count = <%=count%>;
    var curr = <%=page%>;
    var limit = 9;
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
            , layer = layui.layer;

        laypage.render({
            elem: 'page_pack'
            , count: count
            , limit: limit
            , curr: curr
            , layout: ['prev', 'next']
            , jump: function (obj,first) {
                if (!first) {
                    location.href = "activities_preview.aspx?page=" + obj.curr + "&limit=" +limit;
                }
            }
        });
    });
</script>