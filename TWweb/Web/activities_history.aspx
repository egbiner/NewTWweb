<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activities_history.aspx.cs" Inherits="TWweb.Web.activities_history" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/about1.css">
<title>时间轴 </title>
    <style>
        td{
            height:50px;
            text-align:center;
            border-bottom: dashed 1px #CCCCCC;
        }
        /*tr{
            line-height:40px;
        }*/
        th{
            border-bottom:1.5px solid #CCCCCC;
        }
    </style>
</head>
<body>

<div class="box" style="margin-left:20px;margin-top:30px;height:700px;width:700px;border-collapse: collapse;">
	<div class="right">
        <br />
		<h3>最近活动预览</h3>
        <table border="0" style="table-layout:fixed;margin:20px 10px 0px 10px;" cellspacing="0" cellpadding="0">
            <tr>
                <th style="width:200px;">活动名称</th>
                <th style="width:150px">开始时间</th>
                <th style="width:150px">结束时间</th>
                <th style="width:50px">申请人</th>
                <th style="width:100px">申请人电话</th>
            </tr>
            <%for (int i = 0; i < dt_ed.Rows.Count; i++)
                    { %>
                <tr>
                    <td><%=dt_ed.Rows[i]["activity"] %></td>
                    <td><%=((DateTime)dt_ed.Rows[i]["use_time_start"]).ToString("yyyy-MM-dd HH:mm")%></td>
                    <td><%=((DateTime)dt_ed.Rows[i]["use_time_end"]).ToString("yyyy-MM-dd HH:mm")%></td>
                    <td><%=dt_ed.Rows[i]["ap_user"] %></td>
                    <td><%=dt_ed.Rows[i]["ap_phone"] %></td>
                </tr>
            <%} %>
        </table>
	</div>
	</div>
</body>
</html>