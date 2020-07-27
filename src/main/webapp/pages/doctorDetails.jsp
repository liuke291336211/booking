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
        <!-- 左边样式-->
        <div class="span3" id="span3-sty1">
            <div class="doc-info">
                <div class="marT52 text-center" style="padding-bottom: 30px;">


                    <c:if test="${docotrData.sex.equals('女')}">
                        <img src="${pageContext.request.contextPath}/img/0womandoctor.png" style="width: 118px; height: 152px" class="docotor-defaultimg" />
                    </c:if>
                    <c:if test="${docotrData.sex.equals('男')}">
                        <img src="${pageContext.request.contextPath}/img/0mandoctor.png" style="width: 118px; height: 152px" class="docotor-defaultimg" />
                    </c:if>
                    <p class="doc-name">${docotrData.doctorname}</p>
                    <p class="doc-post">${docotrData.academictitle}</p>
                    <p class="doc-sch">${docotrData.age} 岁</p>

                </div>



            </div>
        </div>
        <!--中间样式-->
        <script>
            $(function () {

                var nowDate = new Date();
                var year = nowDate.getFullYear(), month, date, day;
                var weeks = ["星期日","星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
                for(var i = 1; i <= 7; i++) {
                    day = nowDate.getDay();
                    $("#week" + i).html(weeks[day]);
                    $("#week" + i).attr("value", day);

                    month = (month =  nowDate.getMonth() + 1) < 10 ? ('0' + month) : month;
                    date = (date = nowDate.getDate()) < 10 ? ('0' + date) : date;
                    $("#day" + i).html(month + "月" + date + "日");
                    $("#day" + i).attr("value", month+date);
                    nowDate.setDate(nowDate.getDate() + 1);
                }
                //发送Ajax请求时间段
            })

        </script>
        <div class="span6">
            <div class="doc-date">
                <div class="date-header">
                    <p class="pull-left">选择就诊日期</p>
                </div>
                <div class="clear"></div>
                <div class="marT15">
                    <div class="date-spe" style="cursor: pointer;">
                        <p>${docotrData.doctorname} <span class="pull-right"><img src="${pageContext.request.contextPath}/img/icondown.png"></span></p>
                    </div>
                    <div class="marT20 content" id="content_0" style="">
                        <div class="tab-doc">

                            <table class="tab-table nor" value="1" style="">
                                <tbody>
                                <tr id="weeksVaule">
                                    <th class="headtd" style="border: 1px solid #E0E0E0">就诊时段</th>
                                    <th>
                                        <p id = "week1"></p>
                                        <p class="p-bg" id="day1"></p>
                                    </th>
                                    <th>
                                        <p id="week2"></p>
                                        <p class="p-bg" id="day2"></p>
                                    </th>
                                    <th>
                                        <p id="week3"></p>
                                        <p id="day3" class="p-bg"></p>
                                    </th>
                                    <th>
                                        <p id="week4"></p>
                                        <p id="day4" class="p-bg"></p>
                                    </th>
                                    <th>
                                        <p id="week5"></p>
                                        <p id="day5" class="p-bg"></p>
                                    </th>
                                    <th>
                                        <p id="week6"></p>
                                        <p id="day6" class="p-bg"></p>
                                    </th>
                                    <th>
                                        <p id="week7"></p>
                                        <p id="day7" class="p-bg"></p>
                                    </th>
                                </tr>
                                <tr id="morning">

                                    <td>上午</td>

                                    <td class="stop-doctor">一</td>
<%--                                    pay-moeny--%>
                                    <td class="stop-doctor">一
<%--                                        <a href="/doctor/Doc_book?param=81481b5f-2914-4fdb-b20e-0eff4eb9b62c|1|2020-06-26|False|2996171">6/20 </a>--%>
                                    </td>
                                    <td class="stop-doctor">一</td>
                                    <td class="stop-doctor">一</td>
                                    <td class="stop-doctor">一</td>
                                    <td class="stop-doctor">一</td>
                                    <td class="stop-doctor">一
<%--                                        <a href="/doctor/Doc_book?param=81481b5f-2914-4fdb-b20e-0eff4eb9b62c|1|2020-07-01|False|2977956">0/20 </a>--%>
                                    </td>
                                </tr>
                                <tr id="evening">

                                    <td>下午</td>

                                    <td class="stop-doctor">一</td>
                                    <td class="stop-doctor">
                                        一
<%--                                        <a href="/doctor/Doc_book?param=81481b5f-2914-4fdb-b20e-0eff4eb9b62c|2|2020-06-26|False|2996172">4/20 </a>--%>
                                    </td>
                                    <td class="stop-doctor">一</td>
                                    <td class="stop-doctor">一</td>
                                    <td class="stop-doctor">一</td>
                                    <td class="stop-doctor">一</td>
                                    <td class="stop-doctor">一
<%--    一  <a href="/doctor/Doc_book?param=81481b5f-2914-4fdb-b20e-0eff4eb9b62c|2|2020-07-01|False|2977957">0/20 </a>--%>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                        <p class="p-sty" style="margin-left: 1em; margin-top: 2em">[本网站提供的预约服务不收取任何费用，您只须支付医院规定的挂号费]</p>
                    </div>
                </div>
            </div>
            <div class="marT15">
                <div class="doc-about" style="height:705px">
                    <div class="about-header">
                        <p>医生评论信息</p>
                    </div>
                    <div class="about-content">
                        <c:forEach items="${docotrData.orders}" var="commen">
                            <div class="row-fluid">
                                <div class="span2">
                                    <p class="text-center">患者评论 ：</p>
                                </div>
                                <div class="span10">
                                    <p class="skill1">${commen.comment}</p><div class="clear"></div>
                                </div>
                            </div>

                        </c:forEach>
                    </div>
                </div>
            </div>
            <!--文章板块-->

            <!--评论-->

        </div>
    </div>
</div>


<script>

    $(function () {
        $.ajax({
            url : "${pageContext.request.contextPath}/doctor/TimeVisit.do" ,
            type : "GET",
            data : {"doctorid": '${docotrData.id}'},
            success : function (data) {
                /**
                 * data的数据格式，是实体类Doctor，将Doctor类所有的列表转成数组的形式
                 * @type {jQuery}
                 */
                var tdElemMorning = $("#morning").children();
                var tdElemEvening = $("#evening").children();
                if(data.length != 0){
                    var weekday =  $("#weeksVaule").children();
                    var nowYear = new Date();
                    console.log(data);
                    for(var j = 0; j < data.length; j++) {
                        for(var i = 1; i < weekday.length; i++) {
                            //判断哪个标签与当前查询的医生星期几的日期相同
                            if(weekday[i].firstElementChild.innerText == data[j].scheduleList[0].weekday) {
                                //判断是上午和下午是否有就诊时间
                                if(data[j].scheduleList[0].worktimeStr == "14:00:00"){
                                    if (data[j].ordernum < data[j].visitnum) {
                                        tdElemEvening[i].setAttribute("class","pay-money");
                                        tdElemEvening[i].innerHTML = "<a href="+'${pageContext.request.contextPath}/book/isLogin.do?doctorid=${docotrData.id}&orderTime='+nowYear.getFullYear()
                                            +$('#day'+i).attr('value')+'_'+$('#week' + i).attr('value')+'_evening&workTimeId='+data[j].id +">"+ data[j].ordernum + "/" + data[j].visitnum + "</a>";
                                    } else {
                                        tdElemEvening[i].innerText =  data[j].ordernum + "/" + data[j].visitnum;
                                    }
                                } else {
                                    if (data[j].ordernum < data[j].visitnum) {
                                        tdElemMorning[i].setAttribute("class","pay-money");
                                        tdElemMorning[i].innerHTML = "<a href="+'${pageContext.request.contextPath}/book/isLogin.do?doctorid=${docotrData.id}&orderTime='+nowYear.getFullYear()
                                            +$('#day'+i).attr('value')+'_'+$('#week' + i).attr('value')+'_morning&workTimeId=' +data[j].id +">"+ data[j].ordernum + "/" + data[j].visitnum + "</a>";
                                    } else {
                                        tdElemMorning[i].innerText =  data[j].ordernum + "/" + data[j].visitnum;
                                    }

                                }
                            }
                        }
                    }
                }
            }

        });

    });

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

</body>

</html>
