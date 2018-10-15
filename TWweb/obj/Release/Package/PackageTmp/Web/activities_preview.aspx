<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activities_preview.aspx.cs" Inherits="TWweb.Web.activities_list" %>

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
        th{
            border-bottom:1.5px solid #CCCCCC;
        }
    </style>
</head>
<body>

<div class="box" style="margin-left:20px;margin-top:30px;height:700px;width:700px;border-collapse: collapse;">
    <div class="right">
        <br />
		<h3>活动预告</h3>
        <%if (dt_ing.Rows.Count == 0){ %>
            <h3 style="position: fixed;bottom:50px">暂无更多活动,敬请期待~</h3>
         <%}else{%>
            <table border="0" style="table-layout:fixed;margin:20px 10px 0px 10px;" cellspacing="0" cellpadding="0">
                <tr>
                    <th style="width:200px;">活动名称</th>
                    <th style="width:150px">开始时间</th>
                    <th style="width:150px">结束时间</th>
                    <th style="width:50px">申请人</th>
                    <th style="width:100px">申请人电话</th>
                </tr>
                <%for (int i = 0; i < dt_ing.Rows.Count; i++){ %>
                    <tr>
                        <td><%=dt_ing.Rows[i]["activity"] %></td>
                        <td><%=((DateTime)dt_ing.Rows[i]["use_time_start"]).ToString("yyyy-MM-dd HH:mm")%></td>
                        <td><%=((DateTime)dt_ing.Rows[i]["use_time_end"]).ToString("yyyy-MM-dd HH:mm")%></td>
                        <td><%=dt_ing.Rows[i]["ap_user"] %></td>
                        <td><%=dt_ing.Rows[i]["ap_phone"] %></td>
                    </tr>
                <%} %>
            </table>
        <%} %>
	</div>
<%--	<div  class="event_list">
	<ul>
        <br />
		<div>
        <%if (dt_ing.Rows.Count!= 0){%>
			    <h3 id="2018"><%=((DateTime)dt_ing.Rows[0]["use_time_start"]).ToString("yyyy")%></h3>
            <%for (int i = 0; i < dt_ing.Rows.Count; i++)
                    { %>
                <li>
			    <span><%=((DateTime)dt_ing.Rows[i]["use_time_start"]).ToString("M") %></span>
                
			    <p><span><%=dt_ing.Rows[i]["activity"] %><br /><%=((DateTime)dt_ing.Rows[i]["use_time_start"]).ToString("t")+"-"+((DateTime)dt_ing.Rows[i]["use_time_end"]).ToString("t")%></span></p>
			    </li>
            <%} %>
		<%} %>
		</div>
		<div>
			    <h3 id="2019">More</h3>
			<li>
			<span></span>
			<p><span>更多活动,敬请期待~</span></p>
			</li>
			
		</div>
		
	</ul>
	</div>--%>
	</div>
</body>
</html>