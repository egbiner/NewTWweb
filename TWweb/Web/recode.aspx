<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="recode.aspx.cs" Inherits="TWweb.Web.recode" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>演艺厅申请</title>
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.ui.datepicker-zh-CN.js"></script><!--星期中文化-->                                                                               
<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="js/jquery-ui-timepicker-zh-CN.js"></script><!--文字中文化--> 

<script type="text/javascript">
    $(function () {
        //window.open('<%=url %>');
		   $("div").click(function(){
		        $(this).addClass("select");		
            });
})
</script>
<link href="css/zzsc.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <br />
<div class="exlist">
  <div class="exlist_title"><img src="img/paper-clip.png" /></div>
  <div id="title">
    <legend>申请成功</legend>
  </div>
    <fieldset>
    <legend>回执信息</legend>
    <div class="row">
      <label>1. 请务必记下回执码</label>
    </div>
     <div class="row">
      <label>2. 可通过此回执码可查询申请状态</label>
    </div>
<%--    <div class="row">
      <label>3. 温馨提示:可用手机拍照记下回执码</label>
    </div>--%>
    </fieldset>
    <fieldset>
    <legend>回执码</legend>
     <div class="row">
      <label></label>
      <h1 style="text-align:center"><%=re_code %></h1>
    </div>
    </fieldset>
     <fieldset>
    <legend>打印文件下载</legend>
     <div class="row">
      <label></label>
      <p style="text-align:center"><a target="_blank" href="<%=url %>" ><%=filename %></a></p>
    </div>
    </fieldset>
</div>
</body>
</html>