
function DoAjax(mess, url, id, status) {
    var r = confirm(mess);
    if (r == true) {
        $.ajax({
            url: url,
            type: "POST",
            data: {
                id: id,
                status: status
            },
            success: function (re) {
                if (re == "OK") {
                    alert("操作成功！");
                    window.location.reload();
                    return;
                }
                alert(re);
            },
            error: function (re) {
                alert("服务器错误：\n" + re.status + " 操作失败！");
            }
        });
    }
}