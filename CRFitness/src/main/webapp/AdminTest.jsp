<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Administration</title>                                         <!-- 這裡要改 -->
</head>
<jsp:include page="/AdminFrame.jsp" />                                <!-- 這裡要改 -->
<link href="${this_contextPath}/css/3dcss.css" rel="stylesheet" />
<body >
	<!-- 頁面部分 開始 <aside> -->
	
	
	<!-- 輪撥   開始 -->
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel" data-interval="2000">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
 			<!-- Wrapper for slides --> 
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src='${this_contextPath}/images/ph1.jpg' />
					<div class="carousel-caption"></div>
				</div>
				<div class="item">
					<img src='${this_contextPath}/images/ph2.jpg' />
					<div class="carousel-caption"></div>
				</div>
				<div class="item">
					<img src='${this_contextPath}/images/ph4.jpg' />
					<div class="carousel-caption"></div>
				</div>
			</div>

			<!-- Controls --> 
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		
	<!-- 輪撥   結束 -->	

	<!--  頁面部分 結束	</aside> -->
</body>
</html>