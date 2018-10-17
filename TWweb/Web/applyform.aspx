<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="applyform.aspx.cs" Inherits="TWweb.Web.applyform" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset="utf-8" />
		<meta charset="utf-8">
		<title>大活表格</title>

        <script type="text/javascript" src="js/jquery.js"></script>
        <link href="css/new_file.css" rel="stylesheet" />
        <link href="css/layer.css" rel="stylesheet" />
        <script src="js/layui/layui.js"></script>
        <script src="js/lq.datetimepick.js"></script>
        <script src="js/selectUi.js"></script>
        <script type="text/javascript">
            layui.use('layer', function () {
                var $ = layui.jquery, layer = layui.layer;

            window.sub = function(){
                    layer.open({
                        title: '申请须知',
                        type: 1,
                        shade: 0,
                        area: ['600px', '320px'], //宽高
                        content: '<div style="padding:20px;line-height:30px"><p>1、	仔细阅读《演艺厅使用注意事项》，凡提交《演艺厅使用登记表》即默认同意《演艺厅使用注意事项》的规章制度，请爱护演艺厅的设施设备，如有损坏，照价赔偿。</p><p>2、	现场不允许拉横幅、贴装饰品。</p></div>',
                        btn: '确定',
                        btnAlign: 'c',
                        yes: function (index, layero) {
                            subajax();
                            layer.close(index);
                        }
                    });
                }

               window.subajax = function(){
                    $.ajax({
                        type: "POST",
                        url: 'ashx/apply.ashx',
                        data: $("#form1").serialize(),
                        success: function (data) {
                            if (data == "error")
                                alertTips("请检查表单内容是否填写完整！");
                            else if (data == "time_error") {
                                alertTips("时间选择错误");
                            } else if (data.indexOf("repeat") >= 0) {
                                alertTips("时间段" + data.split('#')[1] + "已被申请！请重新选择其他时间段。")
                            }
                            else {
                                getDoc(data);
                                wait();
                            }
                        },
                        error: function () {
                            alert("服务器错误")
                        }
                    });
                }

                //获取doc文档
               window.getDoc = function(id){
                    $.ajax({
                        type: "POST",
                        url: 'ashx/getDoc.ashx',
                        data: { "id": id },
                        success: function (data) {
                            if (data == "error")
                                alertTips("申请成功，活动名存在非法字符导致文件生成失败!");
                            else
                                location.href = "recode.aspx?recode=" + id;
                        },
                        error: function () {
                            alert("服务器错误")
                        }
                    });
                }

               window.wait =  function() {
                    layer.msg('正在为您加载,请稍等 ', {
                        time: 10000,
                    });
                }

               window.alertTips = function(tip) {
                    layer.open({
                        title: "Tips",
                        type: 0,
                        content: tip,
                        shade: 0,
                    });
                }
            });
        </script>
	</head>
	<body >
        <br />
		<div class="content">
            <form id="form1">
			<table style="float: left;" width="100%" height="100%" border="1">
					<tr>
						<td width="30%" rowspan="2" align="center">申请时间</td>
					</tr>  
					<tr>
					<td width="75%" colspan="3"> 
            <div class="table-form service-form">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-cell">
                        <tbody>
                            <tr>
                                <th width="10%"><span>日期：</span></th>
                                <td width="100px">
                                    <div class="form-group float-left w140" style="width: 100px;">
                                        <input type="text" name="date" id="datetimepicker3" class="form-control" value="<%=now %>"/>
                                    </div>
                                </td>
                                <th width="7.5%"><span></span></th>
                                <td>
                                    <div class="form-group float-left w140" style="width: 100px;">
                                        <input type="text" name="use_start_time" id="datetimepicker1" class="form-control" />
                                    </div>
                                    <div class="float-left form-group-txt">至</div>
                                    <div class="form-group float-left w140" style="width: 100px;">
                                        <input type="text" name="use_end_time" id="datetimepicker2" class="form-control"/>
                                    </div>

                                </td>                                
                            </tr>
                        </tbody>
                    </table>
</div>								
						</td>
					</tr>

                					<tr>
						<td width="30%" rowspan="2" align="center">具体活动时间</td>
					</tr>  
					<tr>
					<td width="75%" colspan="3"> 
            <div class="table-form service-form">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-cell">
                        <tbody>
                            <tr>
                                <th width="10%" ><span>时间：</span></th>
                                <td>
                                    <div class="form-group float-left w140" style="width: 100px;">
                                        <input type="text" name="ac_start_time" id="ac_start_time" class="form-control"  autocomplete="off"/>
                                    </div>
                                    <div class="float-left form-group-txt">至</div>
                                    <div class="form-group float-left w140" style="width: 100px;">
                                        <input type="text" name="ac_end_time" id="ac_end_time" class="form-control" autocomplete="off"/>
                                    </div>

                                </td>                                
                            </tr>
                        </tbody>
                    </table>
            </div>								
						</td>
					</tr>

					<tr>
						<td width="25%" align="center">申请单位负责人</td>
						<td width="25%"><input name="fz_user" class="txt" type="text" value="OOXX"/></td>
						<td width="20%" align="center">电话</td>
						<td width="25%"><input name="fz_phone" class="txt" type="text" value="OOXX"/></td>
					</tr>
					<tr>
						<td width="25%" align="center">申请人</td>
						<td width="25%"><input name="ap_user"  class="txt" type="text" value="OOXX"/></td>
						<td width="25%" align="center">电话</td>
						<td width="25%"><input name="ap_phone"  class="txt" type="text" value="OOXX"/></td>
					</tr>
					<tr>
						<td width="25%" align="center">活动联系人</td>
						<td width="25%"><input  name="ac_linkman" class="txt" type="text" value="OOXX"/></td>
						<td width="25%" align="center">电话</td>
						<td width="25%"><input name="ac_linkman_phone"  class="txt" type="text" value="OOXX"/></td>
					</tr>
					<tr>
						<td style="height: 70px;" align="center">主要出席人员姓名及其职务</td>
						<td colspan="3"><textarea name="main_attend">OOXX</textarea></td> 
					</tr>
					<tr>
						<td style="height: 70px;" align="center">活动名称</td>
						<td colspan="3"><input name="activity" class="txt" type="text" value="OOXX"/></td> 
					</tr>
					<tr>
						<td style="height: 70px;" align="center">活动参与人数</td>
						<td colspan="3"><input name="participants_num" class="txt" type="text" value="OOXX"/></td> 
					</tr>
					<tr>
						<td style="height: 40px;" align="center">是否阅读演艺厅使用注意事项</td>
						<td colspan="3">
							<select name="isReadNotice">
					        <option value="1">是</option>
					        <option value="0">否</option>
					      </select> 
						</td> 
					</tr>
					<tr>
						<td style="height: 80px;" align="center">申请事由</td>
						<td colspan="3"><textarea name="ap_reason">OOXX</textarea></td> 
					</tr>
					<tr>
						<td style="height: 120px;" align="center">需要设备</td>
						<td style="word-break: break-all;" colspan="3">
							<p><input type="checkbox" name="device_need" value="LED屏" />LED屏</p>
							<p><input type="checkbox" name="device_need" value="无线话筒" />无线话筒（<input name="x"  class="txt" type="text" style="width: 30px; border-bottom: solid 1px black;"/>个，最多四个，自备电池，一个话筒2个5号电池）</p>
						    <p><input type="checkbox" name="device_need" value="折叠椅" />折叠椅（<input name="x" class="txt" type="text" style="width: 30px; border-bottom: solid 1px black;"/>张，最多400张）</p>
						    <p><input type="checkbox" name="device_need" value="台式电脑" />台式电脑</p>
						    <p><input type="checkbox" name="device_need" value="灯光" />灯光</p></td> 
					</tr>
					<tr>
						<td style="height: 80px;" align="center">申请单位意见</td>
						<td colspan="3">
							<textarea name="ap_opinion">OOXX</textarea>
						</td> 
					</tr>
					<tr>
						<td style="height: 40px;" align="center">该时间段教室是否为空</td>
						<td colspan="3">
					      <select name="isNullRoom">
					        <option value="1">是</option>
					        <option value="0">否</option>
					      </select> 							
						</td> 
					</tr>
			<tr>
                 <td colspan="4"><input type="button" onclick="sub()" class="send" value="提交" /></td>
            </tr>
			</table>
                </form>
		</div>
<script type="text/javascript">
    $(function () {
        var time_flag = 1;
        function check_time(data) {
            var time = new Array();
            time[0] = '12:30';
            time[1] = '13:00';
            time[2] = '13:30';
            time[3] = '14:00';
            for (x in time) {
                if (time[x] == data) {
                    alert("12:30 ~ 14:00 时间段内不能申请！");
                    $("#datetimepicker1").val('18:00');
                }
            }
            if (data.split(':')[0] <= 12) {
                time_flag = 0;
                $("#datetimepicker2").val('12:00');
            } else {
                time_flag = 1;
            }
        }

        $("#datetimepicker1").on("click", function (e) {
            e.stopPropagation();
            $(this).lqdatetimepicker({
                css: 'datetime-hour',
                date: {
                    'H': {
                        begin: '8:30', 
                        end: '22:30', 
                        step: "30" 
                    },
                    'D': {
                        month: new Date(), 
                        selected: (new Date()).getDate()
                    },
                    'M': {
                        begin: 1, 
                        end: 12,
                        selected: (new Date()).getMonth() + 1  
                    },
                    'Y': {
                        begin: 2001,
                        end: (new Date()).getFullYear(), 
                        selected: (new Date()).getFullYear() 
                    }
                },
                offset: {
                    left: -220, //向左偏移的位置
                    top: 10 //向上偏移的位置
                },
                selectback: function () {
                    //$("#ac_start_time").val($("#datetimepicker1").val());
                    check_time($("#datetimepicker1").val());
                }
            });

        });


        $("#datetimepicker2").on("click", function (e) {
            e.stopPropagation();
            var start_time = $("#datetimepicker1").val();
            if (time_flag == 0) {
                $(this).lqdatetimepicker({
                    css: 'datetime-hour',
                    date: {
                        'H': {
                            begin: start_time,
                            end: '12:00',
                            step: "30"
                        },
                        'D': {
                            month: new Date(),
                            selected: (new Date()).getDate()
                        },
                        'M': {
                            begin: 1,
                            end: 12,
                            selected: (new Date()).getMonth() + 1
                        },
                        'Y': {
                            begin: 2001,
                            end: (new Date()).getFullYear(),
                            selected: (new Date()).getFullYear()
                        }
                    },
                    offset: {
                        left: -356, //向左偏移的位置
                        top: 10 //向上偏移的位置
                    },
                    selectback: function () {
                        //$("#ac_end_time").val($("#datetimepicker2").val());
                    }
                });
            } else {
                $(this).lqdatetimepicker({
                    css: 'datetime-hour',
                    date: {
                        'H': {
                            begin: start_time,
                            end: '22:30',
                            step: "30"
                        },
                        'D': {
                            month: new Date(),
                            selected: (new Date()).getDate()
                        },
                        'M': {
                            begin: 1,
                            end: 12,
                            selected: (new Date()).getMonth() + 1
                        },
                        'Y': {
                            begin: 2001,
                            end: (new Date()).getFullYear(),
                            selected: (new Date()).getFullYear()
                        }
                    },
                    offset: {
                        left: -356, //向左偏移的位置
                        top: 10 //向上偏移的位置
                    },
                    selectback: function () {
                        //$("#ac_end_time").val($("#datetimepicker2").val());
                    }
                });
            }
        });


        $("#datetimepicker3").on("click", function (e) {
            e.stopPropagation();
            $(this).lqdatetimepicker({
                css: 'datetime-day',
                offset: {
                    left: -70, //向左偏移的位置
                    top: 10 //向上偏移的位置
                },
                dateType: 'D',
                selectback: function () {

                }
            });

        });

        $("#ac_start_time").on("click", function (e) {
            e.stopPropagation();
            $(this).lqdatetimepicker({
                css: 'datetime-hour',
                date: {
                    'H': {
                        begin: $("#datetimepicker1").val(),
                        end: $("#datetimepicker2").val(),
                        step: "30"
                    },
                    'D': {
                        month: new Date(),
                        selected: (new Date()).getDate()
                    },
                    'M': {
                        begin: 1,
                        end: 12,
                        selected: (new Date()).getMonth() + 1
                    },
                    'Y': {
                        begin: 2001,
                        end: (new Date()).getFullYear(),
                        selected: (new Date()).getFullYear()
                    }
                },
                offset: {
                    left: -220, //向左偏移的位置
                    top: 10 //向上偏移的位置
                },
                selectback: function () {
                    
                }
            });
        });

        $("#ac_end_time").on("click", function (e) {
            e.stopPropagation();
            $(this).lqdatetimepicker({
                css: 'datetime-hour',
                date: {
                    'H': {
                        begin: $("#ac_start_time").val(),
                        end: $("#datetimepicker2").val(),
                        step: "30"
                    },
                    'D': {
                        month: new Date(),
                        selected: (new Date()).getDate()
                    },
                    'M': {
                        begin: 1,
                        end: 12,
                        selected: (new Date()).getMonth() + 1
                    },
                    'Y': {
                        begin: 2001,
                        end: (new Date()).getFullYear(),
                        selected: (new Date()).getFullYear()
                    }
                },
                offset: {
                    left: -220, //向左偏移的位置
                    top: 10 //向上偏移的位置
                },
                selectback: function () {
                    
                }
            });
        });
    });
</script>		
	</body>
</html>