<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="apply_search.aspx.cs" Inherits="TWweb.Web.apply_search" %>

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

<script>
$(function(){
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
    <legend>申请结果查询</legend>
  </div>
    <fieldset style="height:150px">
    <legend>回执码填写</legend>
    <div class="row" style="text-align:center;">
      <label> 回执码:</label>
      <input class="txt" type="text" id="recode" />
    </div>
        <input type="button" onclick="search()" class="send" value="查询" />
    </fieldset>
    <fieldset style="min-height:100px">
    <legend>回执信息</legend>
     <div style="text-align:center" id="intext">
    </div>
    </fieldset>
    <fieldset>
    <legend>打印文件下载</legend>
     <div class="row">
      <label></label>
      <p style="text-align:center"><a id="file_download" target="_blank" href="#" ></a></p>
    </div>
        
    </fieldset>
    <div class="clearfloat" style="clear:both;height:0;font-size: 1px;line-height: 0px;"></div>
</div>
    <script type="text/javascript">
        function opendetail(id){
            window.open('applyform_modle.aspx?id='+id, 'new', 'location=no, toolbar=no,height=770,width=720');
            return false;
        }
        function search() {
            $.ajax({
                type: "POST",
                url: 'ashx/searchResult.ashx',
                data: { "recode": $("#recode").val() },
                dataType: 'html',
                success: function (data) { 
                    var objData = eval('(' + data + ')');
                    $("#intext").empty().append($(objData.result));
                    $("#file_download").empty().append(objData.fileName).attr("href", objData.url);
                },
            error: function () {
                alert("500 服务器返回错误")
            }
        })
        }
    </script>
</body>
</html>
