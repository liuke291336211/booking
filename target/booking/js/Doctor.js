// JavaScript Document
var temp = true;

var left = 0;
function minuted() {
    if (temp) {
        $("#skill").addClass("skill1");
        $("#skill").removeClass("skill");
        $("#thin").html("[鏀惰捣]");
        temp = false;
    } else {
        $("#skill").addClass("skill");
        $("#skill").removeClass("skill1");
        $("#thin").html("[璇︽儏]");
        temp = true;

    }
}
var hospital = document.getElementById("hospital");
var offices = document.getElementById("offices");
function test1() {
    hospital.style.display = "block";
    offices.style.display = "none";
}
function test2() {
    hospital.style.display = "none";
    offices.style.display = "block";
}
function slide() {

    left -= 146;
    var imgbor = document.getElementsByClassName("hides");
    var img = imgbor[0].getElementsByTagName("img");
    if (Math.abs(left) > (img.length - 1) * 146) {
        left = 0;
    }
    imgbor[0].style.marginLeft = left + "px";
    imgbor[0].style.transition = "all 0.5s";

}
function slide2() {

    left += 146;
    var imgbor = document.getElementsByClassName("hides");
    var img = imgbor[0].getElementsByTagName("img");
    if (left > 0) {
        left = -(img.length - 1) * 146;
    }
    imgbor[0].style.marginLeft = left + "px";
    imgbor[0].style.transition = "all 0.5s";

}
window.onload = function () {
    var tab = document.getElementsByClassName("content");
    var spe = document.getElementsByClassName("date-spe");
    for (var i = 0; i < tab.length; i++) {
        spe[i].index = i;
        spe[i].onclick = function () {

            $(".content").hide();
            $(".date-spe").css("cursor", "pointer");

            $(this).parent().find(".content").show();
            $(this).css("cursor", "auto");

        }
    }


}

function show_left(contentId, tableValue) {

    $("#" + contentId + " table").hide();
    if ($("#" + contentId + " table[value='" + tableValue + "']").prev().length == 0) {
        $("#" + contentId + " table:last").show();
    } else {
        $("#" + contentId + " table[value='" + tableValue + "']").prev().show();
    }
}

function show_right(contentId, tableValue) {
    $("#" + contentId + " table").hide();
    if ($("#" + contentId + " table[value='" + tableValue + "']").next().length == 0) {
        $("#" + contentId + " table:first").show();
    } else {
        $("#" + contentId + " table[value='" + tableValue + "']").next().show();
    }
}
