<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>登录失败</title>


<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

</head>

<body class="hold-transition skin-purple sidebar-mini">

	<div class="wrapper">

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- Main content -->
			<section class="content">
				<div class="error-page">


					<div class="error-content">

						<p>
							登录失败 , 你可以 <a href="${pageContext.request.contextPath}/patientLogin.jsp">返回到登录页面</a>
							重新登录
						</p>


					</div>
					<!-- /.error-content -->
				</div>
				<!-- /.error-page -->
			</section>
			<!-- /.content -->
		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<jsp:include page="/pages/footer.jsp"/>
		<!-- 底部导航 /-->

		</div>

</body>

</html>
