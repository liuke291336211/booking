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

    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?aefe0d6eab7010b070eb6b34b009c7c1";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>


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
                <ul>
                    <li>
                        <a class="active _illness"><img class="header_icon_style" src="${pageContext.request.contextPath}/img/icon01.png">按科室挂号预约</a>
                        <div class="header_navbar_list">
                            <ul class="header_ill_list">
                                <div class="header_ul_p">
                                    <li class="header_li_list" value="4">
                                    <p class="font18"><img class="header_icon_style" src="${pageContext.request.contextPath}/img/header_icon1.png">内科</p>
                                        <p class="font14">
                                            <label style="display: inline-block;cursor: pointer;" id="a814bba5-b337-42d7-9cdb-91d268773d0a" class="searchByDisease"></label>
                                        </p>
                                        <div id="header_tab" class="header_navbar_right">
                                            <ul id="item1" class="header_tab_lists" style="display: none;">
                                                <div class="header_illness">
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">内科</p>
                                                    </div>
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">内科常见病</p>
                                                        <span class="searchByDisease" id="a814bba5-b337-42d7-9cdb-91d268773d0a">肺水肿</span>
                                                        <span class="searchByDisease" id="1b08847f-dd33-4bde-b7c5-13518bb410c7">感冒</span>
                                                        <span class="searchByDisease" id="ac04a3d2-7846-4a66-a312-c3eecd0d9f01">焦虑症</span>
                                                        <span class="searchByDisease" id="1b681b10-da33-4428-94b7-8e99437cf07a">抑郁症</span>
                                                        <span class="searchByDisease" id="e175f6de-0eaa-48d0-a5c8-10e30c389939">神经性厌食</span>
                                                        <span class="searchByDisease" id="f9f86568-8570-4135-883d-0e981ed39a1f">痛风</span>
                                                        <span class="searchByDisease" id="666d57be-1ab8-44c2-8b36-f7e389555fa7">脑水肿</span>
                                                        <span class="searchByDisease" id="1bad520a-3f8d-4217-9773-c45bef793d83">偏头痛</span>
                                                        <span class="searchByDisease" id="24684159-f42c-4948-9f0b-3b4da7e72554">巨人症</span>
                                                        <span class="searchByDisease" id="39902d37-8207-4d90-9974-b49a78b122b6">急性甲状腺炎</span>
                                                        <span class="searchByDisease" id="9f486f36-8459-491d-8dad-02f6d4b30590">尿道炎</span>
                                                        <span class="searchByDisease" id="508749fb-2b9f-4ca9-8070-5f63857649b5">慢性肾盂肾炎</span>
                                                        <span class="searchByDisease" id="cbf30a92-7f24-48be-91d6-8c319830ae8b">胃溃疡</span>
                                                        <span class="searchByDisease" id="ce5d0716-5c73-49d0-aacd-13997f324833">便秘</span>
                                                        <span class="searchByDisease" id="3d7ddef0-505c-4c24-955c-3398d421cd96">急性胃炎</span>
                                                        <span class="searchByDisease" id="114933dd-65b3-409a-a378-7cb15c3a55d3">心绞痛</span>
                                                        <span class="searchByDisease" id="3e0483e2-ce01-4706-a462-d4383d2f5ce2">急性心肌梗死</span>
                                                        <span class="searchByDisease" id="aebccc22-0574-46c4-a81e-c7ddcde45e87">贫血</span>
                                                        <span class="searchByDisease" id="fded07c8-f3d8-4dc0-864b-b1a964805634">血友病</span>
                                                        <span class="searchByDisease" id="b0328a13-ef06-485a-b1ce-f3c8c10df8ee">急性淋巴细胞白血病</span>
                                                        <span class="searchByDisease" id="41187182-81d6-4932-8da4-14d6a984abfb">生长激素瘤</span>
                                                        <span class="searchByDisease" id="3520e02c-1754-4f8d-b53e-a37bf14b0bf2">胃癌</span>

                                                    </div>

                                                </div>

                                            </ul>
                                        </div>
                                    </li>
                                    <li class="header_li_list" value="5">

                                        <p class="font18" href="#"><img class="header_icon_style" src="${pageContext.request.contextPath}/img/header_icon2.png">外科</p>
                                            <p class="font14">
                                                <label style="display: inline-block;cursor: pointer;" id="62176b79-8b7b-4893-bead-8ee997f9ef8b" class="searchByDisease"></label>
                                            </p>

                                        <div id="header_tab" class="header_navbar_right">
                                            <ul id="item2" class="header_tab_lists" style="display: none;">
                                                <div class="header_illness">
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">外科</p>
                                                    </div>
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">外科常见病</p>
                                                        <span class="searchByDisease" id="62176b79-8b7b-4893-bead-8ee997f9ef8b">脑震荡</span>
                                                        <span class="searchByDisease" id="850e8261-871c-4b1e-bdeb-c1e66a6cfd9c">脑梗死</span>
                                                        <span class="searchByDisease" id="ee4fb9ce-d598-4fc5-8dfb-ede97018d1a5">肛瘘</span>

                                                    </div>

                                                </div>

                                            </ul>
                                        </div>
                                    </li>
                                    <li class="header_li_list" value="13">
                                        <p class="font18"><img class="header_icon_style" src="${pageContext.request.contextPath}/img/header_icon3.png">妇产科</p>
                                        <p class="font14">
                                            <label style="display: inline-block;cursor: pointer;" id="7336e201-9e62-404b-b055-c3e8d2ea8e8b" class="searchByDisease"></label>
                                        </p>
                                        <div id="header_tab" class="header_navbar_right">
                                            <ul id="item3" class="header_tab_lists" style="display: none;">
                                                <div class="header_illness">
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">妇产科</p>
                                                    </div>
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">妇产科常见病</p>
                                                        <span class="searchByDisease" id="9e9283d1-653c-4d33-b996-43ee095c0bab">宫颈癌</span>
                                                        <span class="searchByDisease" id="f575a8d6-3d0f-4a4c-80f4-dc88f142d594">痛经</span>
                                                        <span class="searchByDisease" id="f72f31c6-5dec-4060-9be9-6c5e7cbd4da7">幼稚病</span>
                                                        <span class="searchByDisease" id="747439a1-4908-4c0f-8698-3ff18e72f88d">白化病</span>
                                                        <span class="searchByDisease" id="23d1270f-5f5b-4ef0-b70b-291d93087fc4">21三体综合征</span>
                                                    </div>

                                                </div>

                                            </ul>
                                        </div>
                                    </li>
                                    <li class="header_li_list" value="3">
                                        <p class="font18"><img class="header_icon_style" src="${pageContext.request.contextPath}/img/header_icon4.png">皮肤性病科</p>
                                        <p class="font14">
                                            <label style="display: inline-block;cursor: pointer;" id="e0e67c16-978a-420b-808a-0079dd8c003e" class="searchByDisease"></label>
                                        </p>
                                        <div id="header_tab" class="header_navbar_right">
                                            <ul id="item4" class="header_tab_lists" style="display: none;">
                                                <div class="header_illness">
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">皮肤性病科</p>
                                                    </div>
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">皮肤性病科常见病</p>
                                                        <span class="searchByDisease" id="e0e67c16-978a-420b-808a-0079dd8c003e">雀斑</span>
                                                        <span class="searchByDisease" id="b5f1feeb-3ea3-4d8b-b8ca-241f289e8080">体癣</span>
                                                        <span class="searchByDisease" id="8b6a8612-565a-4942-8620-d0e27278ac79">斑秃</span>
                                                        <span class="searchByDisease" id="04c1f993-8413-4950-8511-481df477e685">白癜风</span>
                                                        <span class="searchByDisease" id="f699a423-fc2e-4249-ae05-a085bc26141a">荨麻疹</span>
                                                        <span class="searchByDisease" id="251b9545-b747-43f8-bbe3-edbfd8b5517a">扁平疣</span>
                                                        <span class="searchByDisease" id="c48f1ecd-5600-4cc9-b639-925b61ec0fde">黄褐斑</span>
                                                        <span class="searchByDisease" id="34822403-5ba8-4cd8-92a2-a0507e3e799f">毛囊炎</span>
                                                        <span class="searchByDisease" id="33c189cd-740a-46cf-96eb-245a1f95d955">股癣</span>
                                                        <span class="searchByDisease" id="f092a793-ab3a-4a95-9ef8-c0f5826ae5b3">阳痿</span>
                                                        <span class="searchByDisease" id="bb4043f1-6437-469c-870d-67160110c17a">阴囊癌</span>
                                                        <span class="searchByDisease" id="c39bd244-aa87-4a89-af3f-2fad7d876ce5">艾滋病</span>
                                                        <span class="searchByDisease" id="4d8321d0-4ebb-457e-9504-3fd4013dc9f6">梅毒</span>
                                                        <span class="searchByDisease" id="e13a8739-0cd7-4d64-9e7b-875c0f5ce14d">早泄</span>
                                                        <span class="searchByDisease" id="ee68aff2-abb7-4e72-a7f5-64bd93aa9462">生殖器疱疹</span>

                                                    </div>

                                                </div>

                                            </ul>
                                        </div>
                                    </li>
                                    <li class="header_li_list" value="14">
                                        <p class="font18"><img class="header_icon_style" src="${pageContext.request.contextPath}/img/header_icon5.png">骨科</p>
                                        <p class="font14">
                                            <label style="display: inline-block;cursor: pointer;" id="6bcfc8c5-0db6-4d68-8094-646fdaa57c67" class="searchByDisease"></label>
                                        </p>
                                        <div id="header_tab" class="header_navbar_right">
                                            <ul id="item5" class="header_tab_lists" style="display: none;">
                                                <div class="header_illness">
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">骨科</p>
                                                    </div>
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">骨科常见病</p>
                                                        <span class="searchByDisease" id="6bcfc8c5-0db6-4d68-8094-646fdaa57c67">氟骨症</span>
                                                        <span class="searchByDisease" id="689f8b30-550a-4d00-8fa6-bdbf06eb3bda">脊柱骨折</span>
                                                    </div>
                                                </div>

                                            </ul>
                                        </div>
                                    </li>
                                    <li class="header_li_list" value="7">
                                        <p class="font18"><img class="header_icon_style" src="${pageContext.request.contextPath}/img/header_icon6.png">五官科</p>
                                        <p class="font14">
                                            <label style="display: inline-block;cursor: pointer;" id="c57a741d-e92c-4f5a-b5db-3a5d1baee794" class="searchByDisease"></label>
                                        </p>
                                        <div id="header_tab" class="header_navbar_right">
                                            <ul id="item6" class="header_tab_lists" style="display: none;">
                                                <div class="header_illness">
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">五官科</p>
                                                    </div>
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">五官科常见病</p>
                                                        <span class="searchByDisease" id="c57a741d-e92c-4f5a-b5db-3a5d1baee794">耳聋</span>
                                                        <span class="searchByDisease" id="85be9ae6-02bf-452d-bbd7-bb3c1e8a7a17">喉痉挛</span>
                                                        <span class="searchByDisease" id="971f0ff3-6250-438a-9d2e-f0eef73a80fc">鼻息肉</span>
                                                        <span class="searchByDisease" id="a353fd28-a87d-46a4-bc90-19c8d67cf059">慢性咽炎</span>
                                                        <span class="searchByDisease" id="04694eaf-d9d1-4fdd-a1c6-3f8882b10c65">急性鼻炎</span>
                                                        <span class="searchByDisease" id="5bc5d3da-002d-4937-adc9-2ec5461b66c0">沙眼</span>
                                                        <span class="searchByDisease" id="5d02b334-cf56-488b-a91c-d13398e15a5c">视疲劳</span>
                                                        <span class="searchByDisease" id="0e7001ca-d57a-4fc2-9db3-2f87cb3c1003">散光</span>
                                                        <span class="searchByDisease" id="e36a1e10-b20c-44db-bab7-57c4297ca8e0">弱视</span>
                                                        <span class="searchByDisease" id="a42a47ae-6ea8-4bb0-acff-72df66b460ce">远视</span>

                                                    </div>

                                                </div>

                                            </ul>
                                        </div>
                                    </li>
                                    <li class="header_li_list" value="0">
                                        <p class="font18"><span class="header_plus font30">+</span>所有科室</p>
                                        <div id="header_tab" class="header_navbar_right">
                                            <ul id="item7" class="header_tab_lists" style="display:none">
                                                <div class="header_illness">
                                                    <div class="header_navbar_lists">
                                                        <p class="font18 header_font_weight">查看所有科室</p>
                                                        <span class="searchByDept" id="324369cb-de02-4600-aa47-42d3c1b28a10">小儿新生儿科</span>
                                                        <span class="searchByDept" id="7056a122-41eb-4bae-afa8-82ada46c95b4">小儿感染内科</span>
                                                        <span class="searchByDept" id="81ce7ebc-dce6-4cd1-9915-386b28519121">口腔科</span>
                                                        <span class="searchByDept" id="500da288-53b9-4e27-8b3a-c5b6e96d8861">感染科</span>
                                                    </div>
                                                    <div class="header_navbar_lists">
                                                    </div>
                                                </div>

                                            </ul>
                                        </div>
                                    </li>
                                </div>

                            </ul>
                        </div>
                        <div id="header_tab" class="header_navbar_right">

                        </div>
                    </li>


                    <li class="show-down">
                        <a href="/HospitalNav/Index?type=book">按疾病挂号预约</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- container  End -->
</div>
<!-- navbar navbar-inverse -->
<!--  Top menu Start  ============================================= -->
<!-- banner -->
<div id="myCarousel" class="carousel slide newIndex">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- Carousel items -->
    <div class="carousel-inner" role="listbox" style="max-height: 457px;  margin: 0 auto;">

        <div class="item active " style="background-color:#596eff">

            <a href="http://weixin.hbjk114.com/Home/HospitalFunctionList2?key=BA_JUMP&amp;title=%E7%97%85%E6%A1%88%E9%A2%84%E7%BA%A6&amp;from=singlemessage&amp;isappinstalled=0" target="_blank"><img style="width:1170px; height: 457px;margin:0 auto;" class="ind-img" src="${pageContext.request.contextPath}/img/02.jpg" /></a>
        </div>
        <div class="item  " style="background-color:#59a7f5">

            <a href="http://weixin.hbjk114.com/Booking/FindHospital" target="_blank"><img style="width:1170px; height: 457px;margin:0 auto;" class="ind-img" src="${pageContext.request.contextPath}/img/03.jpg" /></a>
        </div>

    </div>
    <!-- Carousel nav -->
    <!--<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>-->
</div>
<!-- 插入轮播内容 -->
<div class="container">
</div>


<div class="foot_top">
    <div class="container">
        <div class="row-fluid">

        </div>
    </div>
</div>
<footer class="footer footer_bg">
    <jsp:include page="/pages/footer.jsp"></jsp:include>
</footer>






<!--  JS the introduction of the document as follows  ============================================= -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script>
    $('#myCarousel').carousel({
        interval: 3500
    })
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/header_tab.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/roundabout.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/gallery_init.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/myJs.js"></script>
<script>
    $(function () {
        $(".header_li_list").click(function () {
            var deptId = $(this).attr("value");
            if (deptId == 0) {
                window.location =rootUrl() + "/office/showAllOffice.do";

            } else {
                window.location =rootUrl() +  "/office/showOffice.do?officeid=" + deptId;
            }
        })
        if(window.sessionStorage.getItem("msg") != null){
            alert(sessionStorage.getItem("msg"));
            sessionStorage.removeItem("msg");
        }
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
        })
        })
</script>

</body>
</html>
