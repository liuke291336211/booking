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
</head>

<body class="hold-transition login-page">
<div class="wrapper loginpanel">
    <div class="login-box">
        <div class="login-logo">
            <a href="all-admin-index.html"><b>挂号</b>预约登录</a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">患者登录</p>

            <form action="${pageContext.request.contextPath}/patientLogin/PatientLogin.do" method="post">
                <div class="form-group has-feedback">
                    <input type="text" name="phonenum" class="form-control"
                           placeholder="账号"> <span
                        class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" name="password" class="form-control"
                           placeholder="密码"> <span
                        class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label><input type="checkbox"> 记住 下次自动登录</label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <a href="#">忘记密码</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/patientLogup.jsp">注册账户</a><br>
        </div>
        <!-- /.login-box-body -->
    </div>
</div>
<footer style="background-color: white; height: 100px; height: 41px; line-height: 41px;">
    <div class="pull-right hidden-xs">
        <b>Version</b> 1.0.8
    </div>
    <a href="http://www.beian.miit.gov.cn/" ><img src="${pageContext.request.contextPath}/img/beian.png">陕ICP备20006663号</a>
    <strong>LKer &copy; 2020-2020 <a href="">web大作业</a>.</strong> All rights reserved.
</footer>

<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script
        src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function() {
        $('input').iCheck({
            checkboxClass : 'icheckbox_square-blue',
            radioClass : 'iradio_square-blue',
            increaseArea : '20%' // optional
        });
    });
</script>
</body>

</html>
