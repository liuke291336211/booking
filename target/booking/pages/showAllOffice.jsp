<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>网上预约挂号平台</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-responsive-portal.css" />
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
                <h3>所有科室显示</h3>
            </div>
        </div>
    </div>
    <!-- container  End -->
</div>
<!-- navbar navbar-inverse -->
<!--  Top menu Start  ============================================= -->

<style>
    .register{background-color: #f1f1f1;padding: 0;}
    .header-search-box{padding-top: 0px;}
    .top_bg {  margin-bottom:0px;}
    .relatedDeptName { margin-top: 30px;}
    .zhuanjialist .table_big tr td {line-height: 28px;}
    .media-body { margin-top:3px;}

</style>
<!-- banner -->
<div class="container">
    <div class="tab-content">
        <div class="tab-pane active" id="hospital">
            <div class="row-fluid">
                <div class="span9">
                    <div class="alert alert-info padTB20 relatedDept">
                        <h3 class="search_hospital relatedDept_right">共有 <span class="redTow">${officeList.size()}</span> 科室</h3>
                    </div>
                    <table class="table_big xijingtable xijingan relatedDept_list">
                        <c:forEach items="${officeList}" var="office">
                            <tr>
                                <td class="top wid25">
                                    <a>
                                        <img src="${pageContext.request.contextPath}/img/office.png"  style="width:190px; height:140px" class="bor6 hospital-default-image"   />
                                    </a>
                                </td>
                                <td class="top wid25">
                                    <ul class="unstyled hospitalShow">
                                        <li><span class="muted">${office.officename}</span>
                                            <span class="marL16 label label-important">先进科室</span></li>
                                    </ul>
                                </td>
                                <td class="wid10">
                                    <p><a href="${pageContext.request.contextPath}/office/showOffice.do?officeid=${office.id}" class="btn btn_red">预约科室医生</a></p>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <style>
                        .deptClass
                        {
                            color:#32A7DC;
                        }
                        .deptClass:hover
                        {
                            color:#01A7FD;
                            cursor:pointer;
                        }
                    </style>



                </div>
            </div>
        </div>
        <!-----hospital End------>
    </div>
</div>
<!-----container------>
<!-----cut_menu------>
<script type="text/javascript">
    function clickLevel(lId)
    {
        $("#hideLevel").val(lId);
        $(this).addClass("active");
        $("#SearchForm").submit();
    }
</script>

<script>

    function doSearch() {
        var kWord = $("#SearchWord").val();
        if (kWord != null && kWord != "") {
            window.location.href = "/Search/FullTextSearch/" + kWord;
        }
    }
    $("#SearchWord").keydown(function (e) {
        if (e.keyCode == 13) {
            var kWord = $("#SearchWord").val();
            if (kWord != null && kWord != "") {
                window.location.href = "/Search/FullTextSearch/" + kWord;
            }
        }
    });
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/header_tab.js"></script>
<script src="${pageContext.request.contextPath}/js/PassportToolkit.js"></script>


</body>

</html>
