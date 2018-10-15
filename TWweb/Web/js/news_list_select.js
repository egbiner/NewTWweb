$(document).ready(function () {
    $(".menu a").click(function () {
        $(".menu a").removeClass("active");
        $(this).addClass("active");
        if ($(this)[0].id == 23 || $(this)[0].id == 24 || $(this)[0].id == 29 || $(this)[0].id == 34 || $(this)[0].id == 35 || $(this)[0].id == 36 || $(this)[0].id == 37 || $(this)[0].id == 39) {
            document.getElementById("iframe1").src = "introduction.aspx?type_id=" + $(this)[0].id;
            document.getElementById("a_pos").innerText = $(this)[0].innerText;
            return;
        }
        document.getElementById("a_pos").innerText = $(this)[0].innerText;
        document.getElementById("iframe1").src = "news_list_iframe.aspx?page_num=1&news_type=" + $(this)[0].id;
    });
});