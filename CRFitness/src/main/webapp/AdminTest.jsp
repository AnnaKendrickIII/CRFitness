<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%-- <link href="${this_contextPath}/css/3dcss.css" rel="stylesheet" /> --%>
    <link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">

    <!-- The styles -->
    <link id="bs-css" href="${this_contextPath}/admin/css/bootstrap-cerulean.min.css" rel="stylesheet">

    <link href="${this_contextPath}/admin/css/charisma-app.css" rel="stylesheet">
    <link href='${this_contextPath}/admin/bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='${this_contextPath}/admin/bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='${this_contextPath}/admin/bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='${this_contextPath}/admin/bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='${this_contextPath}/admin/bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='${this_contextPath}/admin/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='${this_contextPath}/admin/css/jquery.noty.css' rel='stylesheet'>
    <link href='${this_contextPath}/admin/css/noty_theme_default.css' rel='stylesheet'>
    <link href='${this_contextPath}/admin/css/elfinder.min.css' rel='stylesheet'>
    <link href='${this_contextPath}/admin/css/elfinder.theme.css' rel='stylesheet'>
    <link href='${this_contextPath}/admin/css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='${this_contextPath}/admin/css/uploadify.css' rel='stylesheet'>
    <link href='${this_contextPath}/admin/css/animate.min.css' rel='stylesheet'>

    <!-- jQuery -->
    <script src="${this_contextPath}/admin/bower_components/jquery/jquery.min.js"></script>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	
	<link href="${this_contextPath}/font-awesome/css/font-awesome.css" rel="stylesheet" />
	
<title>Administration</title>                                              <!-- 這裡要改 -->
</head>
<%-- <jsp:include page="/AdminFrame.jsp" />                                <!-- 這裡要改 --> --%>

<body >
	<!-- 頁面部分 開始 <aside> -->
<!-- topbar starts -->
    <div class="navbar navbar-default" role="navigation">

        <div class="navbar-inner">
            <button type="button" class="navbar-toggle pull-left animated flip">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html"> 
                <span>C.R.Fitness Administration</span></a>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> admin</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">Profile</a></li>
                    <li class="divider"></li>
                    <li><a href="login.html">Logout</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->

            <!-- theme selector starts -->
            <div class="btn-group pull-right theme-container animated tada">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-tint"></i><span
                        class="hidden-sm hidden-xs"> Change Theme / Skin</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" id="themes">
                    <li><a data-value="classic" href="#"><i class="whitespace"></i> Classic</a></li>
                    <li><a data-value="cerulean" href="#"><i class="whitespace"></i> Cerulean</a></li>
                    <li><a data-value="cyborg" href="#"><i class="whitespace"></i> Cyborg</a></li>
                    <li><a data-value="simplex" href="#"><i class="whitespace"></i> Simplex</a></li>
                    <li><a data-value="darkly" href="#"><i class="whitespace"></i> Darkly</a></li>
                    <li><a data-value="lumen" href="#"><i class="whitespace"></i> Lumen</a></li>
                    <li><a data-value="slate" href="#"><i class="whitespace"></i> Slate</a></li>
                    <li><a data-value="spacelab" href="#"><i class="whitespace"></i> Spacelab</a></li>
                    <li><a data-value="united" href="#"><i class="whitespace"></i> United</a></li>
                </ul>
            </div>
            <!-- theme selector ends -->

        </div>
    </div>
<!-- topbar ends -->

<div class="ch-container">
    <div class="row">
    
<!-- left menu starts -->
        <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">選單列表</li>
                        <li><a class="ajax-link" href="${this_contextPath}/AdminTest.jsp"><i class="glyphicon glyphicon-home"></i><span> 主控台</span></a>
                        </li>
                        <li><a class="ajax-link" href="${this_contextPath}/Maintenance/MaintainJournals.jsp"><i class="fa fa-book"></i><span> 維護健康日誌</span></a>
                        </li>
                        <li class="accordion">
                            <a href="#"><i class="glyphicon glyphicon-plus"></i><span> 維護商品</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="${this_contextPath}/Maintenance/MaintainProducts.jsp?category=cmens-tops&page=1">上裝</a></li>
                                <li><a href="${this_contextPath}/Maintenance/MaintainProducts.jsp?category=cmens-bottoms&page=1">下裝</a></li>
                                <li><a href="${this_contextPath}/Maintenance/MaintainProducts.jsp?category=cmens-accessories&page=1">配件</a></li>
                                <li><a href="${this_contextPath}/Maintenance/MaintainProducts.jsp?category=cmens-footwear&page=1">鞋類</a></li>
                            </ul>
                        </li>
                        <li><a class="ajax-link" href="${this_contextPath}/Maintenance/MaintainActivities.jsp"><i class="fa fa-users"></i><span> 維護揪團專區</span></a>
                        </li>
                        <li><a class="ajax-link" href="${this_contextPath}/Maintenance/MaintainMembers.jsp"><i class="fa fa-smile-o"></i><span> 維護會員資訊</span></a>
                        </li>
                        <li><a class="ajax-link" href="${this_contextPath}/Maintenance/MaintainProducts.jsp"><i class="fa fa-user-secret"></i><span> 維護管理員資訊</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
<!-- left menu ends -->


	<div id="content" class="col-lg-10 col-sm-10">
<!-- content starts -->

<!-- path starts -->
	<div>
    <ul class="breadcrumb">
        <li>
            <a href="#">Home</a>
        </li>
        <li>
            <a href="#">Dashboard</a>
        </li>
    </ul>
	</div>
<!-- path ends -->

<!-- notification starts -->
<div class="row">
    <div class="col-md-3 col-sm-3 col-xs-6">
        <a data-toggle="tooltip" title="6位新會員" class="well top-block" href="#">
            <i class="glyphicon glyphicon-user deep blue"></i>

            <div>會員總數</div>
            <div>17</div>
            <span class="notification">6</span>
        </a>
    </div>

    <div class="col-md-3 col-sm-3 col-xs-6">
        <a data-toggle="tooltip" title="4件新商品" class="well top-block" href="#">
            <i class="glyphicon glyphicon-shopping-cart green"></i>

            <div>商品總數</div>
            <div>549</div>
            <span class="notification green">4</span>
        </a>
    </div>

    <div class="col-md-3 col-sm-3 col-xs-6">
        <a data-toggle="tooltip" title="3篇新的日誌" class="well top-block" href="#">
            <i class="glyphicon glyphicon-book yellow"></i>

            <div>日誌總數</div>
            <div>50</div>
            <span class="notification yellow">3</span>
        </a>
    </div>

    <div class="col-md-3 col-sm-3 col-xs-6">
        <a data-toggle="tooltip" title="12個新的揪團活動." class="well top-block" href="#">
            <i class="glyphicon glyphicon-bullhorn red"></i>

            <div>揪團總數</div>
            <div>43</div>
            <span class="notification red">12</span>
        </a>
    </div>
</div> <!-- 153 <div class="row"> -->
<!-- notification ends -->





<!-- content ends -->
    </div><!-- 136 <div id="content" class="col-lg-10 col-sm-10"> -->
</div><!-- 121 <div class="row"> -->

    <hr>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>Settings</h3>
                </div>
                <div class="modal-body">
                    <p>Here settings can be configured...</p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <a href="#" class="btn btn-primary" data-dismiss="modal">Save changes</a>
                </div>
            </div>
        </div>
    </div>

    <footer class="row">
        <p class="col-md-9 col-sm-9 col-xs-12 copyright">&copy; <a href="http://usman.it" target="_blank">Muhammad
                Usman</a> 2012 - 2015</p>
        <p class="col-md-3 col-sm-3 col-xs-12 powered-by">Powered by: <a
                href="http://usman.it/free-responsive-admin-template">Charisma</a></p>
    </footer>

</div><!-- 99 <div class="ch-container"> -->



<!--  頁面部分 結束	</aside> -->
</body>
</html>
	<!-- 輪撥   開始 -->
<!-- 		<div id="carousel-example-generic" class="carousel slide" -->
<!-- 			data-ride="carousel" data-interval="2000"> -->
 			<!-- Indicators --> 
<!-- 			<ol class="carousel-indicators"> -->
<!-- 				<li data-target="#carousel-example-generic" data-slide-to="0" -->
<!-- 					class="active"></li> -->
<!-- 				<li data-target="#carousel-example-generic" data-slide-to="1"></li> -->
<!-- 				<li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
<!-- 			</ol> -->
			<!-- Wrapper for slides -->
<!-- 			<div class="carousel-inner" role="listbox"> -->
<!-- 				<div class="item active"> -->
<%-- 					<img src='${this_contextPath}/images/ph1.jpg' /> --%>
<!-- 					<div class="carousel-caption"></div> -->
<!-- 				</div> -->
<!-- 				<div class="item"> -->
<%-- 					<img src='${this_contextPath}/images/ph2.jpg' /> --%>
<!-- 					<div class="carousel-caption"></div> -->
<!-- 				</div> -->
<!-- 				<div class="item"> -->
<%-- 					<img src='${this_contextPath}/images/ph4.jpg' /> --%>
<!-- 					<div class="carousel-caption"></div> -->
<!-- 				</div> -->
<!-- 			</div> -->

 			<!-- Controls  -->
<!-- 			<a class="left carousel-control" href="#carousel-example-generic" -->
<!-- 				role="button" data-slide="prev"> <span -->
<!-- 				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
<!-- 				<span class="sr-only">Previous</span> -->
<!-- 			</a> <a class="right carousel-control" href="#carousel-example-generic" -->
<!-- 				role="button" data-slide="next"> <span -->
<!-- 				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
<!-- 				<span class="sr-only">Next</span> -->
<!-- 			</a> -->
<!-- 		</div> -->
		
	<!-- 輪撥   結束 -->	