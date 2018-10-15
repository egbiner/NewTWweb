$(document).ready(function () {
    $(".menu a").click(function () {
        $(".menu a").removeClass("active");
        $(this).addClass("active");
        document.getElementById("iframe1").src = $(this)[0].id + ".aspx?page_num=1";
    });
});
