<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="applyform_modle.aspx.cs" Inherits="TWweb.Admin.applyform_modle" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset="utf-8" />
		<meta charset="utf-8">
		<title>大活表格</title>

        <script type="text/javascript" src="../Web/js/jquery.js"></script>
        <link href="../Web/css/new_file.css" rel="stylesheet" />
        <link href="../Web/css/layer.css" rel="stylesheet" />
        <script type="text/javascript" src="../Web/js/layer.js"></script>
        <script src="../Web/js/lq.datetimepick.js"></script>
        <script src="../Web/js/selectUi.js"></script>
          
	</head>
	<body >
        <br />
		<div class="content">
			<table style="float: left;" width="100%" height="100%" border="1">
					<tr>
						<td style="height: 50px;" rowspan="2" align="center">使用时间</td>

					</tr>  
					<tr>
						<td width="75%" colspan="3"> 
            <div class="table-form service-form">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-cell">
                        <tbody>
                            <tr>
                                <td><%=((DateTime)dt.Rows[0]["use_time_start"]).ToString("yyyy-MM-dd HH:mm")%> - <%=((DateTime)dt.Rows[0]["use_time_end"]).ToString("HH:mm")%></td>
                            </tr>
                        </tbody>
                    </table>
</div>								
						</td>
					</tr>
					<tr>
						<td width="25%" align="center">申请单位负责人</td>
						<td width="25%"><input name="fz_user" class="txt" type="text" value=" <%=dt.Rows[0]["fz_user"] %>"/></td>
						<td width="20%" align="center">电话</td>
						<td width="25%"><input name="fz_phone" class="txt" type="text" value=" <%=dt.Rows[0]["fz_phone"] %>"/></td>
					</tr>
					<tr>
						<td width="25%" align="center">申请人</td>
						<td width="25%"><input name="ap_user"  class="txt" type="text" value=" <%=dt.Rows[0]["ap_user"] %>"/></td>
						<td width="25%" align="center">电话</td>
						<td width="25%"><input name="ap_phone"  class="txt" type="text"  value=" <%=dt.Rows[0]["ap_phone"] %>"/></td>
					</tr>
					<tr>
						<td width="25%" align="center">活动联系人</td>
						<td width="25%"><input  name="ac_linkman" class="txt" type="text" value=" <%=dt.Rows[0]["ac_linkman"] %>"/></td>
						<td width="25%" align="center">电话</td>
						<td width="25%"><input name="ac_linkman_phone"  class="txt" type="text" value=" <%=dt.Rows[0]["ac_linkman_phone"] %>"/></td>
					</tr>
					<tr>
						<td style="height: 70px;" align="center">主要出席人员姓名及其职务</td>
						<td colspan="3"><p> <%=dt.Rows[0]["main_attend"] %></p></td> 
					</tr>
					<tr>
						<td style="height: 70px;" align="center">活动名称</td>
						<td colspan="3"><p> <%=dt.Rows[0]["activity"] %></pr></td> 
					</tr>
					<tr>
						<td style="height: 40px;" align="center">活动参与人数</td>
						<td colspan="3"><p> <%=dt.Rows[0]["participants_num"] %></p></td> 
					</tr>
					<tr>
						<td style="height: 40px;" align="center">是否阅读演艺厅使用注意事项</td>
						<td colspan="3">
                            <p>是</p>
						</td> 
					</tr>
					<tr>
						<td style="height: 80px;" align="center">申请事由</td>
						<td colspan="3"><p> <%=dt.Rows[0]["ap_reason"] %></p></td> 
					</tr>
					<tr>
						<td style="height: 70px;" align="center">需要设备</td>
						<td style="word-break: break-all;" colspan="3">
							<p> <%=dt.Rows[0]["device_need"] %></p>
					</tr>
					<tr>
						<td style="height: 80px;" align="center">申请单位意见</td>
						<td colspan="3">
							<p> <%=dt.Rows[0]["ap_opinion"] %></p>
						</td> 
					</tr>
					<tr>
						<td style="height: 40px;" align="center">该时间段教室是否为空</td>
						<td colspan="3">
                            <p> 是</p>
						</td> 
					</tr>
			</table>
                                      <fieldset>
                        <legend>处理状态</legend>
                            <div class="row">
                                <div style="text-align:center">
                              <%if (int.Parse(dt.Rows[0]["status"].ToString()) == 0) { %>
                                    <h2 style="color:blue">未处理</h2>
                                <%} else if (int.Parse(dt.Rows[0]["status"].ToString()) == 2) { %>
                                    <h2 style="color:red">已拒接申请</h2>
                                    <p><%=((DateTime)dt.Rows[0]["handle_time"]).ToString("F") %></p>
                                    <p>拒绝原因:<%=dt.Rows[0]["reason"]%></p>
                                <%} else{%>
                                    <h2 style="color:green">已接受申请</h2>
                                    <p><%=((DateTime)dt.Rows[0]["handle_time"]).ToString("F") %></p>
                                <%} %>
                                </div>
                            </div>
                    </fieldset>
		</div>	
      
	</body>
</html>