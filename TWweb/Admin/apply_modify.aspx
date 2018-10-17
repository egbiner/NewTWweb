<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="apply_modify.aspx.cs" Inherits="TWweb.Admin.apply_modify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Web/css/new_file.css" rel="stylesheet" />
    <script src="js/jquery-1.9.1.min.js"></script>
    <link href="../Web/js/layui/css/layui.css" rel="stylesheet" />
    <script src="../Web/js/layui/layui.js"></script>
    <script src="../Web/js/lq.datetimepick.js"></script>
    <script src="../Web/js/selectUi.js"></script>
    <title></title>
    <style>
        .table1{
            margin-left:40px;
            margin-top:20px;
        }
        .btn{
            margin-top:200px;
            float:left;
        }
    </style>
</head>
<body>
    <div class="content" style="min-height:500px;">
        <form id="form1" runat="server">
            <table class="table1" style="float: left;" width="600px" height="100%" border="1">
                <tr>
                    <td width="30%" rowspan="2" align="center">申请时间</td>
                </tr>
                <tr>
                    <td width="75%" colspan="3">
                        <div class="table-form service-form">
                            <table width="100%" border="0" cellpadding="0" cellspacing="10" class="table table-cell">
                                <tbody>
                                    <tr>
                                        <th><span></span></th>
                                        <td width="100px">
                                            <div class="form-group float-left w140" style="width: 100px;">
                                                <input type="text" name="date" id="datetimepicker3" class="form-control" value="<%=((DateTime)dt.Rows[0]["use_time_start"]).ToString("yyyy-MM-dd")%>" autocomplete="off"/>
                                            </div>
                                        </td>
                                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                        <td>
                                            <div class="form-group float-left w140" style="width: 100px;">
                                                <input type="text" name="use_start_time" id="datetimepicker1" class="form-control" value="<%=((DateTime)dt.Rows[0]["use_time_start"]).ToString("HH:mm")%>" />
                                            </div>
                                            <div class="float-left form-group-txt">至 </div>
                                            <div class="form-group float-left w140" style="width: 100px;">
                                                <input type="text" name="use_end_time" id="datetimepicker2" class="form-control" value="<%=((DateTime)dt.Rows[0]["use_time_end"]).ToString("HH:mm")%>" />
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
                                        <th><span></span></th>
                                        <td>
                                            <div class="form-group float-left w140" style="width: 100px;">
                                                <input type="text" name="ac_start_time" id="ac_start_time" class="form-control" value="<%=dt.Rows[0]["ac_start_time"]%>" autocomplete="off" />
                                            </div>
                                            <div class="float-left form-group-txt">至</div>
                                            <div class="form-group float-left w140" style="width: 100px;">
                                                <input type="text" name="ac_end_time" id="ac_end_time" class="form-control" value="<%=dt.Rows[0]["ac_end_time"]%>" autocomplete="off" />
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="btn">
                <button >aaa</button>
            </div>
        </form>
    </div>
</body>
</html>
<script>
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
                    $("#ac_start_time").val($("#datetimepicker1").val());
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
                        $("#ac_end_time").val($("#datetimepicker2").val());
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
                        $("#ac_end_time").val($("#datetimepicker2").val());
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