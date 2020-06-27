<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>登录</title>

    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/hblayout.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <style type="text/css">
        .panel-body {
            padding: 29px 202px;
        }
    </style>
</head>

<body class="hold-transition login-page">
<div class="wrapper loginpanel">
    <div class="panel-body loginpanel">
        <div class="login-logo">
            <a href="all-admin-index.html"><b>挂号</b>系统</a>
        </div>
        <!-- /.login-logo -->
        <div class="findpanel" style=" height: 584px;width: 610px;">
            <p class="login-box-msg">患者密码找回</p>

            <form id="idc_Form" action="${pageContext.request.contextPath}/patientLogin/passwordRecver.do" method="post">
                <div id="idc_findpwdpannel">
<%--                    手机框--%>
                    <div class="input-line margintop15">
                        <div class="input-icon">
                            <div class="icon" style="background-image:url(${pageContext.request.contextPath}/img/login-userid.png)"></div>
                        </div>
                        <div class="input-control" style="width:308px">
                            <input id="idc_userid" name="phonenum" maxlength="11" type="text" placeholder="手机号" data-toggle="tooltip" title="请输入手机号码" autocomplete="off" onblur="findphone();isNull()">
                        </div>
                        <div class="noborder" style="width:0; float:left;">
                            <img id="idc_phone_isnull" class="pull-left" title="手机号不能为空" style="width:32px;height:32px; margin-left:15px; display:none; position:absolute;" src="${pageContext.request.contextPath}/img/msg-warning.png">
                        </div>
                        <div class="clear"></div>
                    </div>
<%--                    电子邮箱框--%>
                    <div class="input-line margintop15">
                        <div class="input-icon">
                            <div class="icon" style="background-image:url(${pageContext.request.contextPath}/img/login-pwd.png)"></div>
                        </div>
                        <div class="input-control" style="width:308px">
                            <input id="idc_email" onblur="isNull()" name="email" maxlength="20" type="text" placeholder="电子邮箱" autocomplete="off">
                        </div>
                        <div class="noborder" style="width:0; float:left;">
                            <img id="idc_email_pass" class="pull-left" title="邮箱不能为空" style="width:32px;height:32px; margin-left:15px; display:none; position:absolute;" src="${pageContext.request.contextPath}/img/msg-warning.png">
                        </div>
                        <div class="clear"></div>
                    </div>
<%--                    密码输入--%>
                    <div class="input-line margintop15">
                        <div class="input-icon">
                            <div class="icon" style="background-image:url(${pageContext.request.contextPath}/img/login-pwd.png)"></div>
                        </div>
                        <div class="input-control" style="width:308px">
                            <input id="idc_userpwd" onblur="isNull()" name="password" maxlength="16" autocomplete="new-password" type="password" placeholder="请输入新密码" aria-autocomplete="list">
                        </div>
                        <div class="noborder" style="width:0; float:left;">
                            <img id="idc_pwd_pass" class="pull-left" title="密码不能为空" style="width:32px;height:32px; margin-left:15px; display:none; position:absolute;" src="${pageContext.request.contextPath}/img/msg-warning.png">
                        </div>
                        <div class="clear"></div>
                    </div>
<%--                    确认名密框--%>
                    <div class="input-line margintop15">
                        <div class="input-icon">
                            <div class="icon" style="background-image:url(${pageContext.request.contextPath}/img/login-pwd.png)"></div>
                        </div>
                        <div class="input-control" style="width:308px">
                            <input id="idc_userpwdcheck" maxlength="16" autocomplete="new-password" type="password" placeholder="请再次输入新密码" onblur="leaveBlur()">
                        </div>
                        <div class="noborder" style="width:0; float:left;">
                            <img id="idc_userinputchecker_pass" class="pull-left" title="两次密码输入不同" style="width:32px;height:32px; margin-left:15px; display:none; position:absolute;" src="${pageContext.request.contextPath}/img/msg-warning.png">
                        </div>
                        <div class="clear"></div>
                    </div>
<%--                    按钮--%>
                    <div class="input-line margintop15">
                        <div class="input-control input-control-full noborder">
                            <input id="idc_submit" type="submit" value="提 交" class="white noborder" disabled="disabled">
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.login-box-body -->
    </div>
</div>

<script type="text/javascript">
    function leaveBlur() {
        var passwrod = $("#idc_userpwd").val();
        var secendPassword = $("#idc_userpwdcheck").val();
        if(passwrod != secendPassword) {
            $("#idc_userinputchecker_pass").css("display" , "inline");
            $("#idc_submit").attr("disabled", "disabled");
        }else  {
            $("#idc_userinputchecker_pass").css("display" , "none");
            $("#idc_submit").removeAttr("disabled");
        }

    }
    function isNull() {
       var phonenum =  $("#idc_userid").val();
       var email = $("#idc_email").val();
       var password = $("#idc_userpwd").val();
       var isabled = false;
       if(phonenum != "" && email != "" && password != "") {
           isabled = true;
       };
       if(phonenum == "") {
           $("#idc_phone_isnull").css("display", "inline");
           isabled = false;
       } else {
           $("#idc_phone_isnull").css("display", "none");
       }
       if(email == "") {
           $("#idc_email_pass").css("display", "inline");
           isabled = false;
       } else {
           $("#idc_email_pass").css("display", "none");
       }
       if(password == "") {
           $("#idc_pwd_pass").css("display", "inline");
           isabled = false;
       } else {
           $("#idc_pwd_pass").css("display", "none");
       }
       if(isabled == true) {
           $("#idc_submit").removeAttr("disabled");
       } else {
           $("#idc_submit").attr("disabled", "disabled");
       }
    }
</script>

<script
        src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
</body>

</html>
