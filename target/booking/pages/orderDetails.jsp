<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>网上预约挂号平台</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/v4.3.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css">
    <style>
        .nav-tabs-top .active a {
            color: #0887d4;
        }

        .top_bg .btn:focus {
            color: #333333;
            background-color: #ffffff;
        }

        .base_text_center p {
            margin: 0px;
        }

        .base_mar .marR13 {
            margin-right: 10px;
        }

        .top_bgg {
            padding: 20px 0;
        }

        .base_text_center .down-sj {
            margin-top: 0px;
        }

        .top_bgg .btn {
            text-align: left;
        }

        .FixTowO p {
            margin: 0 0 -3px;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script>
        $(function () {
            $("#test>a").attr("style", "color:#ff6c00");

        })

        $(function () {
            //医生默认图片
            $(".docotor-defaultimg").error(function () {
                this.src = "/Content/images/sub/defaultdoctorhead.jpg";
            });
        });


    </script>


    <style type='text/css'>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            background: #eff4f7;
        }

        #containerAll {
            min-height: 100%;
            height: auto !important;
            height: 100%; /*IE6不识别min-height*/
            position: relative;
        }

        #page {
            width: 100%;
            margin: 0 auto;
            /*background: #ffff66;*/
            padding-bottom: 40px; /*等于footer的高度*/
        }

        #footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 40px; /*脚部的高度*/
            /*background: #6cf;*/
        }

        .modal-body {
            margin-left: 25px;
        }

        #TopSearchForm {
            margin: 0;
        }

        #dropSearch .caret {
            margin-left: 4px;
        }

        #containerAll {
            background: #fff;
        }

        .footerr {
            text-align: center;
            margin-top: 35px;
        }

        .navbar .nav > li > a {
            padding: 8px 9px 2px 9px;
        }

        .top_bgg {
            height: 58px !important;
            background-color: #ffffff;
        }

        .top_bgg .input-prepend {
            margin-top: 13px;
        }
    </style>

</head>
<body>



<style>
    .messagecenter_mes_img {
        margin-top: -5px !important;
        margin-left: 0px !important;
    }

    .messagecenter_mes_img_img {
        margin-top: -2px !important;
        margin-left: 0px !important;
    }

    .btn-blue:hover {
        color: white;
        background-color: #32A7DC;
    }

    .cms-img {
        width: 370px;
        height: 204.328px;
    }

    .doctor-line td {
        border-bottom: 0px dotted #DDDDDD;
        padding-top: 13px;
        padding-left: 20px;
        padding-right: 20px;
        padding-bottom: 5px;
        white-space: normal;
    }

    .QR-Code a {
        color: #000000;
        text-decoration: none;
    }

    .QR-Code a:hover {
        color: #ff9000;
        text-decoration: none;
    }

    .QR-Code .down-ewm > table {
        height: 100px;
        margin: auto;
    }

    .down-ewm .base_index_td {
        line-height: 36px;
    }

    .text-center span {
        margin-right: 0px;
        padding-left: 3px;
    }

    .FixTowO p {
        margin: 0 0 -3px;
    }

    .base_youhua {
        padding-top: 28px !important;
        position: relative;
    }

    .base_shuangyin {
        position: absolute;
        top: 0px;
        left: -2px;
        z-index: 1000000;
    }

    .base_escort-s2 {
        cursor: pointer;
    }

    .base_escort-s3 {
        cursor: pointer;
    }

    .by_inline li a:hover {
        color: #fe6928;
    }

    .close_img_index {
        z-index: 9;
        position: relative;
        float: right;
        left: -20px;
        top: 5px;
        color: #fff;
        cursor: pointer;
    }
</style>

<div class="navbar navbar-inverse hb-head-bar-border header_navbar_bg">
    <div class="container">
        <div class="row hb-head-bar">
            <div class="span12">
                <c:if test="${sessionScope.patient == null}">
                    <span class="hb-head-bar-left" id="idc_passportpanel">
                        您好，请
                        <a  href="${pageContext.request.contextPath}/patientLogin.jsp">登录</a>
                    </span>
                    <span class="hb-head-bar-right">
                            <a class="login register" name="mulu" href="${pageContext.request.contextPath}/adminLogin.jsp">管理员入口</a>
                         </span>
                </c:if>
                <c:if test="${sessionScope.patient != null}">
                    <span class="hb-head-bar-left" id="idc_passportpanel">
                        患者&nbsp;
                        <a href="${pageContext.request.contextPath}/book/showMyPatient.do?patientId=${sessionScope.patient.id}">${sessionScope.patient.nickname}</a>
                    </span>
                    <span class="hb-head-bar-right">
                            <a class="login register" name="mulu" href="${pageContext.request.contextPath}/patientLogin/patientLogout.do">退出登录</a>
                         </span>
                </c:if>
            </div>
        </div>
    </div>
</div>

<div class="">
    <div class="container">
        <div class="row hb-head-bar">
            <div class="span12 hb-head-bar-padding">
                <div class="row">
                    <div class="span3 text-left mgt10">
                        <a href="${pageContext.request.contextPath}/">首页</a>
                    </div>
                    <div class="span6 center-block header-search-box">
                        <div class="search-box">
                            <div class="pane">
                                <div class="search-input-box">
                                    <img class="header_search" src="${pageContext.request.contextPath}/img/search01.png">
                                    <input autocomplete="off" class="search-input" maxlength="100"  value="请输入科室、医生、疾病" onfocus="if (value == '请输入科室、医生、疾病') { value = '' }" onblur="    if (value == '') { value = '请输入医院、科室、医生、疾病' }" type="text" id="SearchWord" />
                                    <p class="heartword">
                                    </p>
                                </div>
                                <!-- ngIf: showHistoryBox -->
                                <div class="search-btn-box">
                                    <button class="search-btn" type="button" onclick="doSearch()">
                                        搜索
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header_nav_head">
        <div class="container">
            <div class="nav-bodyMneu">
            </div>
        </div>
    </div>
    <!-- container  End -->
</div>
<!-- navbar navbar-inverse -->
<!--  Top menu Start  ============================================= -->

<style>
    .inputer {
        margin-top: 4px;
        color: #c01f25;
        margin-left: 4px;
    }

    .inputer label {
        padding-right: 0 !important;
    }

    .modal-body {
        overflow-y: scroll !important;
    }

    .inputer label {
        display: inline;
    }

    .modal {
        width: 580px;
    }

    .time-input label {
        display: inline-block;
        margin-right: 12px;
        width: 110px;
        float: left;
    }

    .form-horizontal .control-label {
        float: left;
        width: 73px;
        padding-top: 5px;
        text-align: right;
        line-height: 28px;
    }

    .modal {
        width: 620px;
    }

    .add-patient {
        border: 1px solid #E0E0E0;
        width: 235px;
        height: 69px;
        padding: 0px 34px;
        border-radius: 6px;
        margin: 0 30px 30px 0;
        display: inline-block;
        cursor: pointer;
        float: left;
    }
    .add-patient p { font-size:12px; margin:2px 0; overflow:hidden;}
    .add-patient p b{ overflow:hidden;}
</style><!-- banner -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Doctor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Follow.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/doctorBook.js"></script>

<script type="text/javascript">

    $(".datetimeStart").datetimepicker({
        language: 'zh-CN',
        format: "yyyy-mm-dd",
        autoclose: true,
        minView: "month",
        maxView: "decade",
        todayBtn: true,
        pickerPosition: "bottom-right"
    }).on("click", function (ev) {
        $(".datetimeStart").datetimepicker("setEndDate", $(".datetimeEnd").val());
    });
    $(".datetimeEnd").datetimepicker({
        language: 'zh-CN',
        format: "yyyy-mm-dd",
        autoclose: true,
        minView: "month",
        maxView: "decade",
        todayBtn: true,
        pickerPosition: "bottom-right"
    }).on("click", function (ev) {
        $(".datetimeEnd").datetimepicker("setStartDate", $(".datetimeStart").val());
    });
</script>
<div class="container">
    <div class="row-fluid">
        <div class="span12 bgc">
            <p>
                <span class="message-title">就诊人：${sessionScope.get("patient").nickname}</span>
                <span class="beizhu"> 注：支持无卡预约，到院就诊前需先办理就诊卡。</span>

            </p>
            <p class="way-title" style="background-color: white;">确认预约信息 </p>
            <div class="clear"></div>
            <div class="yuyue-message">
                <div class="yuyue-message-2 yuyue">
                    <span>预约科室：<b>${sessionScope.get("doctor").office.officename}</b></span>
                </div>
                <div class="yuyue-message-3 yuyue">
                    <span>医生姓名：<b>${sessionScope.get("doctor").doctorname}</b></span>
                </div>
                <div class="yuyue-message-4 yuyue">
                    <span >就诊时间：<b id = "time"></b></span>
                </div>
                <div class="clear"></div>
                <div class="makesure-time">

                    <p>诊疗类型：</p>
                    <span class="ClinicType bg-a backimg">初 诊</span>
                    <span class="ClinicType bg-a" value="fuzhen">复 诊</span>

                </div>

            </div>
            <div id="online-pay">
                <p>付款方式：</p>
                <span class="bg-a backimg " value="OfflinePay">到院支付</span>
            </div>
            <div class="to-pay text-center">



                <a href="${pageContext.request.contextPath}/book/order.do">确认预约</a>
                <p id="submit_error_msg" style="
    float: left;
    color: red;
    margin-top: 10px; display: none;
">错误信息</p>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        var timeStr = '${sessionScope.get("orderTime")}';
        var time = timeStr.split('_');
        var year, month, day;
        year = time[0].substr(0, 4);
        month = time[0].substr(4, 2);
        day = time[0].substr(6, 8);
        if(time[2] == "morning") {
            $("#time").text(year + "年 " + month + " 月 " + day + " 日 " + "09:00:00~12:00:00");
        } else {
            $("#time").text(year + "年 " + month + " 月 " + day + " 日 " + "14:00:00~17:00:00");

        }
    })
</script>
<input type="hidden" id="hidCanAddPersonCount" value="20" />
<script src="${pageContext.request.contextPath}/js/idCardNoUtil.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(".datetimeStart").focus(function () {
        this.style.outline = "none";
    });
    $(".datetimeStart").datetimepicker({
        language: 'zh-CN',
        format: "yyyy-mm-dd",
        autoclose: true,
        minView: "month",
        maxView: "decade",
        todayBtn: true,
        pickerPosition: "bottom-right"
    }).on("click", function (ev) {
        // $(".datetimeStart").datetimepicker("setEndDate", $(".datetimeEnd").val());
    });

</script>
<script type="text/javascript">

    window.onload = function () {

        var p1 = document.getElementById("mes");//收起
        var p2 = document.getElementById("mes2");//选择其他

        if ($(".add-patient ").length <= 3) {
            $("#mes,#mes2").hide();
        }

        var addPa = document.getElementsByClassName("add-patient");

        p1.onclick = function () {
            for (var i = 0; i < addPa.length; i++) {
                if (i > 2) {
                    addPa[i].style.display = "none";
                }
            }
            p2.style.display = "block";
            p1.style.display = "none";
        }
        p2.onclick = function () {
            for (var i = 0; i < addPa.length; i++) {
                addPa[i].style.display = "inline-block";
            }
            p2.style.display = "none";
            p1.style.display = "block";
        }

    }

    //选择就诊人
    $("#add-patient .add-patient").click(function () {

        var accesskey = $(this).attr("accesskey");
        var id = $(this).attr("id");
        var itemtype = $(this).attr("itemtype");

    });

    $(window).load(function () {

        $(".ClinicType,#online-pay span,#add-patient .add-patient").click(function () {

            if ($(this).parent().attr("id") == "add-patient") {

                $("#add-patient .add-patient").removeClass("backimg2");
                $(this).addClass("backimg2");
            } else {
                $(this).parent().find("span").removeClass("backimg");
                $(this).addClass("backimg");
            }

        });

        var $hchildb = $(".add-patient-content .add-patient");
        $("#mes2").bind("click", function () {
            $hchildb.each(function (index, value) {
                $(value).show();
                $("#mes").show();
                $("#mes2").hide();
            });

        });

        $("#mod").click(function () {
            $(".add-patient-content .add-patient").show();
            $("#mes").show();
            $("#mes2").hide();
        });

        $("#mes").bind("click", function () {
            $hchildb.each(function (index, value) {
                if (index > 2) {
                    $(value).hide();
                    $("#mes2").show();
                }
                $("#mes2").show();
                $("#mes").hide();
            });

        });
        $hchildb.each(function (index, value) {
            $hchildb.each(function (index, value) {
                if (index > 2) {
                    $(value).hide();
                    $("#mes2").show();
                }
            });

        });

    });

    function myclick(o) {
        //获取子节点的第一个节点对象

        var rd = $(o).children().first();

        rd.checked = true;//让该单选按钮选中

    }

    function CheckInputNum() {
        var curLength = $("#txtDes").val().length;
        $("#divTextAreaMsg").html(curLength + "/200");
    }

    function Paymentfail() {
        history.go(-1);
    }

    function PaymentSuc() {
        location.href = "/Personal/P_registeredorder";
    }

    function addRule() {

        var canAddPersonCount = $("#hidCanAddPersonCount").val();
        //读取就诊人数量
        var addPersonCount = 0;

        canAddPersonCount = parseInt(canAddPersonCount) - parseInt(addPersonCount);

        if (canAddPersonCount <= 0) {
            $("#add_bnt_msg").show();
            $("#add_bnt_msg .error").html("已添加" + addPersonCount + "人，还能添加0人");
            return false;
        } else {
            $("#add_bnt_msg .error").html("");
        }


        //$("#myModal").modal("hide");
        $("#add_bnt_msg").hide();

        var userType = $("input[name='CurUserType']:checked").val();
        var IdType = $("#IdType").val();

        $("#txtBirthday").rules("add", { required: true, messages: { required: "请填写出生日期" } });

        if (IdType == "0") {
            $("#txtIdNumber").rules("add", { isIdCardNo: true });
        } else {
            $("#txtIdNumber").rules("remove", "isIdCardNo");
        }

        $("#myform").submit();
    }


    $().ready(function () {

        jQuery.validator.addMethod("isIdCardNo", function (value, element) {
            return this.optional(element) || isIdCardNo(value);
        }, "请正确输入您的身份证号码");

        var validate = $("#myform").validate({
            debug: true, //调试模式取消submit的默认提交功能
            //errorClass: "label.error", //默认为错误的样式类为：error
            focusInvalid: false, //当为false时，验证无效时，没有焦点响应
            onkeyup: false,
            submitHandler: function (form) {   //表单提交句柄,为一回调函数，带一个参数：form

                var userType = $("input[name='CurUserType']:checked").val();
                var name = $("#txtName").val();
                var sexId = $("input[name='CurSex']:checked").val();
                var IdTypeId = $("#IdType").val();
                var IdNumber = $("#txtIdNumber").val();
                var MPhone = $("#txtMobilePhone").val();
                var birthday = $("#txtBirthday").val();

                var param = { CurUserType: "" + userType + "", CurSex: "" + sexId + "", CurName: "" + name + "", CurPaperType: "" + IdTypeId + "", CurPaperNo: "" + IdNumber + "", CurMobile: "" + MPhone + "", CurBirthday: "" + birthday + "" };

                $.post(
                    "/doctor/AddPerson",
                    param,
                    function (data) {
                        console.log(data.Code);
                        console.log(data.Message);
                        if (data.Code == "0") {
                            $("#add_bnt_msg,#add_bnt_msg .error").show();
                            $("#add_bnt_msg .error").html(data.Message);

                        } else {

                            window.location.href = location.href.replace('#', '') + "&t=" + new Date().getTime();

                        }
                    },
                    "json"
                );

                return;
            },

            rules: {
                txtName: {
                    required: true,
                    maxlength: 20
                },
                txtIdNumber: {
                    required: true,
                    maxlength: 20
                    // isIdCardNo: true
                },
                txtMobilePhone: {
                    required: true,
                    rangelength: [11, 11]
                }

            },
            messages: {
                txtName: {
                    required: "必填",
                    maxlength: "用户姓名不能超过20个字符"
                },
                txtIdNumber: {
                    required: "必填",
                    maxlength: "证件号码不能超过20个字符"
                },
                txtMobilePhone: {
                    required: "不能为空",
                    rangelength: "手机号码格式有误"
                }
            },

            errorPlacement: function (error, element) {
                if (element.is("#txtBirthday")) {
                    $("#spBirthday_msg").html(error);
                }
                else {
                    element.parent().find("span").html(error);
                }
            }

        });

    });




    //IE不支持maxlength问题
    $(function () {
        //IE也能用textarea
        $("textarea[maxlength]").keyup(function () {
            var area = $(this);
            var max = 200; //获取maxlength的值
            if (max > 0) {
                if (area.val().length > max) { //textarea的文本长度大于maxlength
                    area.val(area.val().substr(0, max)); //截断textarea的文本重新赋值
                }
            }
        });
        //复制的字符处理问题
        $("textarea[maxlength]").blur(function () {
            var area = $(this);
            var max = 200; //获取maxlength的值
            if (max > 0) {
                if (area.val().length > max) { //textarea的文本长度大于maxlength
                    area.val(area.val().substr(0, max)); //截断textarea的文本重新赋值
                }
            }
        });
    });




    function Post(URL, PARAMTERS) {

        var temp_form = document.createElement("form");
        temp_form.action = URL;
        //如需打开新窗口，form的target属性要设置为'_blank'
        temp_form.target = "_blank";
        temp_form.method = "post";
        temp_form.style.display = "none";

        for (var item in PARAMTERS) {
            var opt = document.createElement("textarea");
            opt.name = PARAMTERS[item].name;
            opt.value = PARAMTERS[item].value;
            temp_form.appendChild(opt);
        }
        document.body.appendChild(temp_form);

        temp_form.submit();

        //location.href = "/Personal/P_registeredorder";

    }
    function PostSelf(URL, PARAMTERS) {

        var temp_form = document.createElement("form");
        temp_form.action = URL;
        //如需打开新窗口，form的target属性要设置为'_blank'
        temp_form.target = "_self";
        temp_form.method = "post";
        temp_form.style.display = "none";

        for (var item in PARAMTERS) {
            var opt = document.createElement("textarea");
            opt.name = PARAMTERS[item].name;
            opt.value = PARAMTERS[item].value;
            temp_form.appendChild(opt);
        }
        document.body.appendChild(temp_form);

        temp_form.submit();

    }

    function checkIDCard() {
        var paperType = $("#IdType").find("option:selected").text();
        var paperNo = $("#txtIdNumber").val();
        if (paperNo != "") {
            if (paperType == "身份证") {
                if (!idCardNoUtil.checkIdCardNo(paperNo)) {
                    $("#txtBirthday").val("");
                    //  $("#txtBirthday").removeAttr("style");
                    $("#txtIdNumber_msg .error").html("证件号码不正确");

                    return false;
                }
                else {
                    $("#txtIdNumber_msg .error").html("");
                    var birthday = "";
                    if (paperNo.length == 15) {
                        birthday = "19" + paperNo.substr(6, 6);
                    } else if (paperNo.length == 18) {
                        birthday = paperNo.substr(6, 8);
                    }
                    birthday = birthday.replace(/(.{4})(.{2})/, "$1-$2-");
                    $("#txtBirthday").val(birthday);
                    $("#txtBirthday_msg .error").html("");
                    // $("#txtBirthday").attr("style", "background-color:#dddddd");

                    return true;
                }
            }
            else if (paperType == "军官证") {
                if (paperNo.length > 32 || paperNo.length < 9) {

                    $("#txtIdNumber_msg .error").html("证件号码长度不正确");
                    return false;
                }
                $("#txtIdNumber_msg .error").html("");
                //  $("#txtBirthday").removeAttr("style");
                $("#paperNoMsg").html("");
                $("#txtBirthday_msg .error").html("");
                return true;
            }
            else if (paperType == "出生证") {
                var reg = /^[a-zA-Z]{1}\d{9}$/;
                if (paperNo.length > 25 || paperNo.length < 1) {
                    $("#txtIdNumber_msg .error").html("证件号码长度不正确");
                    return false;
                } else if (!reg.test(paperNo)) {
                    $("#txtIdNumber_msg .error").html("证件号码格式不正确");
                    return false;
                }
                //   $("#txtBirthday").removeAttr("style");
                $("#txtIdNumber_msg .error").html("");
                $("#txtBirthday_msg .error").html("");

                return true;
            }
            else if (paperType == "护照") {
                var reg = /[E|e|G|g]\d{8}/;
                if (paperNo.length > 10 || paperNo.length < 1) {
                    $("#txtIdNumber_msg .error").html("证件号码长度不正确");
                    return false;
                } else if (!reg.test(paperNo)) {
                    $("#txtIdNumber_msg .error").html("证件号码格式不正确");
                    return false;
                }
                //    $("#txtBirthday").removeAttr("style");
                $("#txtIdNumber_msg .error").html("");

                return true;
            }
            else {
                // $("#txtBirthday").removeAttr("style");
                $("#txtBirthday_msg .error").html("");

                return true;
            }
        }
        else {
            $("#txtIdNumber_msg .error").html("请输入证件号码");

            //$("#txtBirthday").removeAttr("style");

            return false;
        }
    }

    //增加身份证验证
    function isIdCardNo(num) {
        var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
        var parityBit = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2");
        var varArray = new Array();
        var intValue;
        var lngProduct = 0;
        var intCheckDigit;
        var intStrLen = num.length;
        var idNumber = num;
        // initialize
        if ((intStrLen != 15) && (intStrLen != 18)) {
            return false;
        }
        // check and set value
        for (i = 0; i < intStrLen; i++) {
            varArray[i] = idNumber.charAt(i);
            if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
                return false;
            } else if (i < 17) {
                varArray[i] = varArray[i] * factorArr[i];
            }
        }

        if (intStrLen == 18) {
            //check date
            var date8 = idNumber.substring(6, 14);
            if (isDate8(date8) == false) {
                return false;
            }
            // calculate the sum of the products
            for (i = 0; i < 17; i++) {
                lngProduct = lngProduct + varArray[i];
            }
            // calculate the check digit
            intCheckDigit = parityBit[lngProduct % 11];
            // check last digit
            if (varArray[17] != intCheckDigit) {
                return false;
            }
        }
        else {        //length is 15
            //check date
            var date6 = idNumber.substring(6, 12);
            if (isDate6(date6) == false) {
                return false;
            }
        }
        return true;
    }
    function isDate6(sDate) {
        if (!/^[0-9]{6}$/.test(sDate)) {
            return false;
        }
        var year, month, day;
        year = sDate.substring(0, 4);
        month = sDate.substring(4, 6);
        if (year < 1700 || year > 2500) return false;
        if (month < 1 || month > 12) return false;
        return true;
    }
    /**
     * 判断是否为“YYYYMMDD”式的时期
     *
     */
    function isDate8(sDate) {
        if (!/^[0-9]{8}$/.test(sDate)) {
            return false;
        }
        var year, month, day;
        year = sDate.substring(0, 4);
        month = sDate.substring(4, 6);
        day = sDate.substring(6, 8);
        var iaMonthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        if (year < 1700 || year > 2500) return false;
        if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1] = 29;
        if (month < 1 || month > 12) return false;
        if (day < 1 || day > iaMonthDays[month - 1]) return false;
        return true;
    }
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/header_tab.js"></script>


</body>

</html>
