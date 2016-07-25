<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CRFitness</title>
</head>
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/css/3dcss.css" rel="stylesheet" />
<body >
	<!-- 頁面部分 開始-->
	<aside>

	<div class="row">
  <div class="col-md-4 "></div>
  <div class="col-md-4  ">
	<div class="container2 ">
    	<div id="carousel">
			<figure><img  src="${this_contextPath}/images/AD1.jpg" alt=""></figure>
			<figure><img   src="${this_contextPath}/images/AD2.jpg" alt=""></figure>
			<figure><img   src="${this_contextPath}/images/AD3.jpg" alt=""></figure>
			<figure><img  src="${this_contextPath}/images/AD7.jpg" alt=""></figure>
			<figure><img  src="${this_contextPath}/images/AD9.jpg" alt=""></figure>
		</div>
	</div>
	</div>
	  <div class="col-md-4 "></div>
	</div>
	
	
<!-- 		<div id="carousel-example-generic" class="carousel slide" -->
<!-- 			data-ride="carousel" data-interval="2000"> -->
<!-- 			<!-- Indicators --> 
<!-- 			<ol class="carousel-indicators"> -->
<!-- 				<li data-target="#carousel-example-generic" data-slide-to="0" -->
<!-- 					class="active"></li> -->
<!-- 				<li data-target="#carousel-example-generic" data-slide-to="1"></li> -->
<!-- 				<li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
<!-- 			</ol> -->
<!-- 			<!-- Wrapper for slides --> 
<!-- 			<div class="carousel-inner" role="listbox"> -->
<!-- 				<div class="item active"> -->
<%-- 					<img src='${this_contextPath}/images/ph1.jpg' /> --%>
<!-- 					<div class="carousel-caption"></div> -->
<!-- 				</div> -->
<!-- 				<div class="item"> 
<%-- 					<img src='${this_contextPath}/images/ph2.jpg' /> --%>
<!-- 					<div class="carousel-caption"></div> -->
<!-- 				</div> -->
<!-- 				<div class="item"> -->
<%-- 					<img src='${this_contextPath}/images/ph4.jpg' /> --%>
<!-- 					<div class="carousel-caption"></div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<!-- Controls --> 
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
	</aside>
	<script type="text/javascript">
	jQuery(function($){
	$('.logo_here').append('<img  class="img-responsive logo_css" src="${this_contextPath}/images/logo/logo.png">')
	var Islogin='${pageContext.request.queryString}'
		if(Islogin=='NoLogin'){
			Custombox.open({
                target: '#login-box',
                effect: 'rotate'
            });
	      	 //google 開始
	      	 
            gapi.load('auth2', function () {
                auth2 = gapi.auth2.init({
                    client_id: '826213451911-6rpb37oapsg46p3ao0mhv6ks9orcja5h.apps.googleusercontent.com',
                    cookiepolicy: 'single_host_origin',
                    scope: 'profile'
                });

                auth2.attachClickHandler( document.getElementById('googleSignIn'), {},
                  function (googleUser) {
//                 	console.log('Signed in: ' + googleUser.getBasicProfile().getName());
//                     console.log('Signed in: ' + googleUser.getBasicProfile().getEmail());
//                     console.log('Signed in: ' + googleUser.getBasicProfile().getImageUrl());        	
                	 var ImageUrl;
                     if (googleUser.getBasicProfile().getImageUrl() == undefined) {
                         ImageUrl = null;
                     } else {
                         ImageUrl = googleUser.getBasicProfile().getImageUrl()
                     }
                      $.ajax({
           		          url:"${this_contextPath}/CRFSERVICE/memberController/Login",
           		          type:'post',  //get post put delete
           		          data:{nickname:googleUser.getBasicProfile().getName(),
           		        	  	e_mail:googleUser.getBasicProfile().getEmail(),
           		        	  	photoUrl:ImageUrl 
           		          },
           		          success:function(){
           		        	  location.href ='${pageContext.request.requestURI}';
           		          }          	 
           		      })
           		  
                  }, function (error) {       	  
                      console.log('Sign-in error', error);
                  }                    
                   );
            });     
      	 $("#googleSignIna").click(function(e){
    		 e.preventDefault(); 
    	 })  
    	 //google 結束
		}
	})
	</script>
	<!--  頁面部分 結束 -->
</body>
</html>