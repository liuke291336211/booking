$(".header_li_list").on("mouseenter", function () {
    var $this = $(this);
    $this.find("img").attr("src",rootUrl() + "/img/header_icon0"+($(".header_li_list").index(this)+1)+".png");
    $this.addClass('header_li_active');
    $("#item"+($(".header_li_list").index(this)+1)).show();
    $this.css("cursor", "pointer");
}).on("mouseleave",function () {
    var $this = $(this);
    $this.find("img").attr("src", rootUrl() + "/img/header_icon" + ($(".header_li_list").index(this) + 1) + ".png");
    $this.removeClass('header_li_active');
    $("#item"+($(".header_li_list").index(this)+1)).hide();
    $this.css("cursor", "default");
});
var rootUrl = function () {
    var a = window.document.location.href;//
    var b = window.document.location.pathname;
    var pos = a.indexOf(b);
    var path = a.substring(0, pos);
    a = a.substring(a.indexOf("/") + 2, a.length);
    a = a.substring(a.indexOf("/") + 1, a.length);
    var pathName = a.substring(0, a.indexOf("/"));
    return path + "/" + pathName;
}

var headerNavbarRight = document.getElementsByClassName("header_navbar_right");
for(var i=0;i<headerNavbarRight.length;i++){
    headerNavbarRight[i].style.top=-i*63+'px';
}
$(".FixTowO").on("mouseenter", function () {
    var $this = $(this);
    $this.find(".FixTowO_img").attr('src', rootUrl() + '/img/images/1' + $this.find("img")[0].src.substr($this.find("img")[0].src.lastIndexOf("/") + 1));
    $this.find(".online_custom").css("color","white");
    $this.find(".feekback").css("color","white");
}).on("mouseleave",function () {
    var $this = $(this);
    $this.find(".FixTowO_img").attr('src', rootUrl() + '/img/images/' + $this.find("img")[0].src.substr($this.find("img")[0].src.lastIndexOf("/") + 2));
    $this.find(".online_custom").css("color","#0092d4");
    $this.find(".feekback").css("color","#999999");
})

