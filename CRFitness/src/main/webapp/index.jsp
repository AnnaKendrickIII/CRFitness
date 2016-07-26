<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CRFitness</title>
<link href="${this_contextPath}/css/index_video.css" rel="stylesheet" />
</head>
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/css/3dcss.css" rel="stylesheet" />
<body >
	<!-- 頁面部分 開始-->
<aside>

<!-- Warming Up -->
<!-- <link href='http://fonts.googleapis.com/css?family=Buenard:700' rel='stylesheet' type='text/css'> -->
<script src="http://pupunzi.com/mb.components/mb.YTPlayer/demo/inc/jquery.mb.YTPlayer.js"></script>
<script src="js/index_video.js"></script>

<!--Video Section-->
		<section class="content-section video-section">
			<div class="pattern-overlay">
				<a id="bgndVideo" class="player"
					data-property="{videoURL:'https://www.youtube.com/watch?v=2Vhlzdj6Csw',containment:'.video-section', quality:'large', autoPlay:true, mute:true, opacity:1}">bg</a>
				<div class="up_video">
					<div class="row">
						<div class="col-lg-12 col-md-12">
							<h1>C.R.F<small style="color: #fff">itness</small></h1>
<!-- 							<h3>Enjoy Adding Full Screen Videos to your Page Sections</h3> -->
							<h3>Enjoy motion to change your life</h3>
						</div>
					</div>
				</div>
			</div>
		</section>


		<!-- 3D Css -->
		<div class="row">
			<div class="col-md-4 "></div>
			<div class="col-md-4  ">
				<div class="container2 ">
					<div id="carousel">
						<figure><img src="${this_contextPath}/images/AD1.jpg" alt=""></figure>
						<figure><img src="${this_contextPath}/images/AD2.jpg" alt=""></figure>
						<figure><img src="${this_contextPath}/images/AD3.jpg" alt=""></figure>
						<figure><img src="${this_contextPath}/images/AD7.jpg" alt=""></figure>
						<figure><img src="${this_contextPath}/images/AD9.jpg" alt=""></figure>
					</div>
				</div>
			</div>
			<div class="col-md-4 "></div>
		</div>



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