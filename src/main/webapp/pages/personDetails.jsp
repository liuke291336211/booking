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
        function CancelApoointment() {


    }

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
                        <a href="javascript:void(0);">${sessionScope.patient.nickname}</a>
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
    .font-co {
        color: #282828;
    }

    #page {
        background-color: #eff4f7;
        padding-top: 30px;
    }

    .top_bgg {
        margin-bottom: 0px;
    }
</style>
<!-- banner -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Doctor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Follow.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/doctorBook.js"></script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/comment.js"></script>

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
<style type="text/css">
    *{margin:0;padding:0;list-style-type:none;}
    a,img{border:0;}
    body{font:12px/180% Arial, Helvetica, sans-serif;}
    /*quiz style*/
    .quiz{border:solid 1px #ccc;height:270px;width:558px;}
    .quiz h3{font-size:14px;line-height:35px;height:35px;border-bottom:solid 1px #e8e8e8;padding-left:20px;background:#f8f8f8;color:#666;position:relative;}
    .quiz_content{padding-top:10px;padding-left:20px;position:relative;height:205px;}
    .quiz_content .btm{border:none;width:100px;height:33px;background:url(${pageContext.request.contextPath}/img/btn02.PNG) no-repeat;margin:10px 0 0 210px;display:inline;cursor:pointer;}
    .quiz_content li.full-comment{position:relative;z-index:99;height:41px;}
    .quiz_content li.cate_l{height:24px;line-height:24px;padding-bottom:10px;}
    .quiz_content li.cate_l dl dt{float:left;}
    .quiz_content li.cate_l dl dd{float:left;padding-right:15px;}
    .quiz_content li.cate_l dl dd label{cursor:pointer;}
    .quiz_content .l_text{height:120px;position:relative;padding-left:18px;}
    .quiz_content .l_text .m_flo{float:left;width:47px;}
    .quiz_content .l_text .text{width:634px;height:109px;border:solid 1px #ccc;}
    .quiz_content .l_text .tr{position:absolute;bottom:-18px;right:40px;}
    /*goods-comm-stars style*/
    .goods-comm{height:41px;position:relative;z-index:7;}
    .goods-comm-stars{line-height:25px;padding-left:12px;height:41px;position:absolute;top:0px;left:0;width:400px;}
    .goods-comm-stars .star_l{float:left;display:inline-block;margin-right:5px;display:inline;}
    .goods-comm-stars .star_choose{float:left;display:inline-block;}
    /* rater star */
    .rater-star{position:relative;list-style:none;margin:0;padding:0;background-repeat:repeat-x;background-position:left top;float:left;}
    .rater-star-item, .rater-star-item-current, .rater-star-item-hover{position:absolute;top:0;left:0;background-repeat:repeat-x;}
    .rater-star-item{background-position: -100% -100%;}
    .rater-star-item-hover{background-position:0 -48px;cursor:pointer;}
    .rater-star-item-current{background-position:0 -48px;cursor:pointer;}
    .rater-star-item-current.rater-star-happy{background-position:0 -25px;}
    .rater-star-item-hover.rater-star-happy{background-position:0 -25px;}
    .rater-star-item-current.rater-star-full{background-position:0 -72px;}
    /* popinfo */
    .popinfo{display:none;position:absolute;top:30px;background:url(images/comment/infobox-bg.gif) no-repeat;padding-top:8px;width:192px;margin-left:-14px;}
    .popinfo .info-box{border:1px solid #f00;border-top:0;padding:0 5px;color:#F60;background:#FFF;}
    .popinfo .info-box div{color:#333;}
    .rater-click-tips{font:12px/25px;color:#333;margin-left:10px;background:url(images/comment/infobox-bg-l.gif) no-repeat 0 0;width:125px;height:34px;padding-left:16px;overflow:hidden;}
    .rater-click-tips span{display:block;background:#FFF9DD url(images/comment/infobox-bg-l-r.gif) no-repeat 100% 0;height:34px;line-height:34px;padding-right:5px;}
    .rater-star-item-tips{background:url(images/comment/star-tips.gif) no-repeat 0 0;height:41px;overflow:hidden;}
    .cur.rater-star-item-tips{display:block;}
    .rater-star-result{color:#FF6600;font-weight:bold;padding-left:10px;float:left;}
</style>
<section>
    <div class="container">
        <div class="row-fluid">
            <!-- left_menu Start-->
            <div class="span3">
                <div class="left_menu">
                    <div class="user">
                        <p>
                                <img src="${pageContext.request.contextPath}/img/user.jpg" width="70" height="70" style="width: 70px; height: 70px;" />
                            </a>
                        </p>
                        <p>
                            ${sessionScope.patient.nickname}
                        </p>

                    </div>
                    <ul class="menu_tree">
                        <h3><i class="icon-chevron-down"></i> 订单中心</h3>
                        <li><a href="${pageContext.request.contextPath}/book/showMyPatient.do?patientId=${sessionScope.patient.id}">预约挂号</a></li>

                        <h3><i class="icon-chevron-down"></i> 设置</h3>
<%--                        剩余功能，未完成--%>
                        <li><a href="javascript:void(0);">账户资料</a></li>
                        <li><a href="javascript:void(0);">个人信息</a></li>

                    </ul>
                </div>
                <!-- left_menu End-->
            </div>
            <!-- span9 Start -->
            <div class="span9">
                <!-- centont_right Start-->
                <div class="centont_right">


                    <script type="text/javascript" src="/Scripts/jquery.unobtrusive-ajax.min.js"></script>
                    <script src="/Content/js/PersonalBookInfo.js"></script>

                    <div>
                        <div class="page-header">
                            <h1>预约挂号</h1>
                        </div>
                        <form action="/Personal/P_registeredorder" class="sea_timee mb16 pp20" data-ajax="true" data-ajax-mode="replace" data-ajax-update="#myTabContent" id="searchForm" method="post">        <ul id="myTab" class="nav nav-tabs bg_white navou tabfont14">
                            <li class="qb" onclick="CheckType(this, -1)"><a>全部</a></li>
                            <script>
                                $(document).ready(function () {

                                    $("#myTab li[onclick$='-1)']").addClass("active");
                                });

                            </script>

                        </ul>
                            <input id="CheckType" name="CheckType" type="hidden" value="-1"/>
                            <input id="PaymentStatus" name="PaymentStatus" type="hidden" value="-1"/>
                            <input id="SearchType" name="SearchType" type="hidden" value="CheckType" />
                        </form>        <input id="hideSerialNoCode" type="hidden" name="SerialNoCode" />
                        <!-- 全部  内容开始  =====================================-->
                        <div id="myTabContent" class="tab-content bg_white pad15  yong" style="height:100%">
                            <div class="tab-pane fade active in" id="home">
                                <!-- 全部tab标签下 列表 -->
                                <table id="tabContent" class="table order_tabletwo">
                                    <tbody>
                                    <tr>
                                        <th class="first_bg width55">详细</th>
                                        <th class="first_bg width11">订单金额</th>
                                        <th class="first_bg width12">预约状态</th>
                                        <th class="first_bg width11">交易状态</th>
                                        <th class="first_bg width12">操作</th>
                                    </tr>
                                    <c:forEach items="${orderDetails}" var="order">
                                        <tr>
                                            <td colspan="5" class="pad0">
                                                <table class="table table-bordered marT20">
                                                    <tbody>
                                                    <tr>
                                                        <td colspan="5" class="text-left tab-tit-indt">
                                                            <span>就诊时间：${order.starttimeStr}  </span>
                                                            <span>订单号：${order.id}</span>
                                                            <span>满意度：${order.degree}颗⭐</span>
                                                            <span>就诊人：${order.patient.nickname}</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="width55">
                                                            <ul class="inline">
                                                                <li class="txt-type"><a href="javascript:void(0);">${order.doctor.office.officename}</a></li>
                                                                <li class="txt-doc-name"><a href="javascript:void(0);">坐诊医生：${order.doctor.doctorname}</a></li>
                                                                <li class="txt-doc-name"></li>

                                                            </ul>
                                                        </td>
                                                        <td class="width11">&#165;0.00 </td>
                                                        <td class="width11">
                                                            <ul class="unstyled">
                                                                <li><span></span></li>
                                                            </ul>
                                                        </td>
                                                        <td class="width11">
                                                            <ul class="unstyled">
                                                                <c:if test="${order.status == 1}">
                                                                    <li><span>到院支付</span></li>
                                                                </c:if>
                                                                <c:if test="${order.status == 2}">
                                                                    <li><span>已看诊</span></li>
                                                                </c:if>
                                                                <c:if test="${order.status == 3}">
                                                                    <li><span>订单已取消</span></li>
                                                                </c:if>
                                                            </ul>
                                                        </td>
                                                        <td class="width12">
                                                            <ul class="unstyled">
                                                                <c:if test="${order.status == 1}">
                                                                    <li>
                                                                        <a id="61010300182020062564054198" href="${pageContext.request.contextPath}/book/cancelOrder.do?orderid=${order.id}&patientId=${order.patient.id}" role="button" data-toggle="modal">取消预约</a>
                                                                    </li>
                                                                    <c:if test="${order.comment == null}">
                                                                        <li>
                                                                            <a href="javascript:void(0);" class="commentDoctor" name="${order.id}">评论</a>

                                                                        </li>
                                                                    </c:if>
                                                                    <c:if test="${order.comment != null}">
                                                                        已评论
                                                                    </c:if>
                                                                </c:if>
                                                                <c:if test="${order.status == 2}">
                                                                    <c:if test="${order.comment == null}">
                                                                        <li>
                                                                            <a href="javascript:void(0);" class="commentDoctor" name="${order.id}">评论</a>
                                                                        </li>
                                                                    </c:if>
                                                                    <c:if test="${order.comment != null}">
                                                                        已评论
                                                                    </c:if>
                                                                </c:if>
                                                                <c:if test="${order.status == 3}">
                                                                    <li>
                                                                        已取消
                                                                    </li>
                                                                </c:if>

                                                            </ul>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>

                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>

                                <!-- 翻页 控制区 -->
                                <div class="pagination">

                                    <!--MvcPager v3.0.1 for ASP.NET MVC 4.0+ © 2009-2015 Webdiyer (http://en.webdiyer.com)-->
                                    <ul class="sj_tzlist col_sj_tzlist" data-ajax="true" data-ajax-dataformid="#searchForm" data-ajax-method="Post" data-ajax-update="#myTabContent" data-invalidpageerrmsg="Page index is invalid" data-outrangeerrmsg="Page index is out of range" data-pagecount="0" data-pageparameter="PageIndex" data-pagerid="Webdiyer.MvcPager" data-urlformat="/Personal/P_registeredorder?PageIndex=__PageIndex__"></ul>
                                    <!--MvcPager v3.0.1 for ASP.NET MVC 4.0+ © 2009-2015 Webdiyer (http://en.webdiyer.com)-->

                                </div>
                            </div>
                                <div id="myModal" class="modal hide fade marT5" style="top: 30%; display: none;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><br>
                                    <div class="quiz">
                                        <h3>我要评论</h3>
                                        <div class="quiz_content">
                                                <div class="goods-comm">
                                                    <div class="goods-comm-stars">
                                                        <span class="star_l">满意度：</span>
                                                        <div id="rate-comm-1" class="rate-comm"></div>
                                                    </div>
                                                </div>

                                                <div class="l_text">
                                                    <label class="m_flo">内  容：</label>
                                                    <textarea  id = "txt" name="txtarea"  class="text" style="margin: 0px 0px 10px; width: 474px; height: 78px;"></textarea>
                                                    <span class="tr">字数限制为5-200个</span>
                                                </div>
                                                    <button  name="${pageContext.request.getParameter("patientId")}" class="btm center-block" type="submit" id = "submit"></button>
                                        </div><!--quiz_content end-->
                                    </div><!--quiz end-->
                                </div>
                        </div>
                    </div>


                </div>
                <!-- centont_right End-->
            </div>
            <!-- span9 End-->
        </div>
    </div>
</section>

<script type="text/javascript">
    $(".commentDoctor").click(function () {
        var order = $(this).attr("name");
        console.log("order" + order);
        $('#myModal').modal('show');
        $("#rate-comm-1").attr("value", order);
    });
    $("#submit").on("mouseenter", function () {
        var $this = $(this);
        $this.css("cursor", "pointer");
    }).on("mouseleave", function () {
        var $this = $(this);
        $this.css("sursor", "default");
    });
    $("#submit").click(function () {
        $.ajax({
            url : '${pageContext.request.contextPath}'+ "/book/comment.do",
            data : {orderId : $("#rate-comm-1").attr("value"), degree : $(".rater-star-result").attr("value"), txtarea : $("#txt").val(), patientId : $("#submit").attr("name")},
            type : "post",
            success : function (data) {
                var url = '${pageContext.request.contextPath}/book/showMyPatient.do?patientId='+ data;
                window.location.href = url;
            },
            dataType : "text"
        });
    });
    $(function () {
        var curUrlAction = window.location.href;
        curUrlAction = curUrlAction.replace(/^http:\/\/[^/]+/, "");
        if (curUrlAction.indexOf("MoneyHistory") > 0 || curUrlAction.indexOf("Amoney") > 0) {
            curUrlAction = "/Personal/Amoney";
        }
        if (curUrlAction.indexOf("PatientVisitsEdit") > 0 || curUrlAction.indexOf("PatientVisitsAdd") > 0) {
            curUrlAction = "/Personal/PatientVisits";
        }
        if (curUrlAction.indexOf("CardCenterAdd") > 0) {
            curUrlAction = "/Personal/CardCenter";
        }
        if (curUrlAction.indexOf("Account") > 0 || curUrlAction.indexOf("PasswordEdit") > 0) {
            curUrlAction = "/Personal/Ameans";
        }
        if (curUrlAction.indexOf("MobileEdit") > 0) {
            curUrlAction = "/Personal/MyInformHou";
        }
        if (curUrlAction.indexOf("AddressAdd") > 0) {
            curUrlAction = "/Personal/AddressManage";
        }
        if (curUrlAction == "/Personal/HSReport" || curUrlAction == "/Personal/HSReportResult") {
            curUrlAction = "/Personal/HSReport";
        }
        if (curUrlAction.indexOf("HSReporttwo") > 0 || curUrlAction.indexOf("HSReporttwoResult") > 0) {
            curUrlAction = "/Personal/HSReporttwo";
        }
        if (curUrlAction.indexOf("HSRecord") > 0 || curUrlAction.indexOf("HSRecordResult") > 0) {
            curUrlAction = "/Personal/HSRecord";
        }
        if (curUrlAction.indexOf("HSclinic") > 0 || curUrlAction.indexOf("HSclinicResult") > 0) {
            curUrlAction = "/Personal/HSclinic";
        }
        if (curUrlAction.indexOf("InpatientCon") > 0 || curUrlAction.indexOf("InpatientConResult") > 0) {
            curUrlAction = "/Personal/InpatientCon";
        }
        $(".menu_tree").find("li>a").each(function (i) {
            var aAction = $(".menu_tree").find("li>a").eq(i).attr("href");
            if (aAction == curUrlAction) {
                $(".menu_tree").find("li>a").eq(i).addClass("active");
            }
        });

    });


</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/header_tab.js"></script>

</body>

</html>
