<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>

<!-- 导航侧栏 -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/img/01user.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p></p>
            </div>
        </div>

        <ul class="sidebar-menu">
            <li class="header">菜单</li>
            <li id="admin-index"><a href="${pageContext.request.contextPath}/main/index.do"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

            <!-- 菜单 -->

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>系统管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="admin-login">
                        <a href="${pageContext.request.contextPath}/office/findAll.do?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 科室管理
                        </a>
                    </li>

                    <li id="admin-register">
                        <a href="${pageContext.request.contextPath}/doctor/findAll.do?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 医生管理
                        </a>
                    </li>
                    <li id="admin-register">
                        <a href="${pageContext.request.contextPath}/illness/findAll.do?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 疾病管理
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i> <span>统计信息</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="charts-chartjs">
                        <a href="${pageContext.request.contextPath}/countDoctor/showDoctor.do">
                            <i class="fa fa-circle-o"></i> 医生评价统计
                        </a>
                    </li>

                    <li id="charts-morris">
                        <a href="${pageContext.request.contextPath}/countDoctor/countOffice.do">
                            <i class="fa fa-circle-o"></i> 科室预约情况
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /--></body>
</html>
