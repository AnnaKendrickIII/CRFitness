<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CRFitness</title>

<style type="text/css">
/*  body {
	margin: 0;
	background-color: #333;
	color: #fff;
	font-family: 'Quicksand';
}  */

/**/ 
.content { 
 	height: auto; 
 	text-align: center; 
 	line-height: 200px; 
 	font-size: 24px; 
 }
 
 .row_box ul li{
 display:inline;
}} 
</style>
</head>
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/css/3dcss.css" rel="stylesheet" />
<link href="${this_contextPath}/css/index_video.css" rel="stylesheet" />
<link href="${this_contextPath}/css/index_box.css" rel="stylesheet" />

<body >
	<!-- 頁面部分 開始-->
<aside>

			<div class="index_body mt40">
    <section class="row">

        <article class="col-xs-12 col-sm-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body">
                        <img src="http://lorempixel.com/350/350/nature/4" alt="Nature Portfolio" />
                    
                </div>
                <div class="panel-footer">
                    <h4><a href="#" title="Nature Portfolio">Nature</a></h4>
                    <span class="pull-right">
                        <i id="like1" class="glyphicon glyphicon-thumbs-up"></i> <div id="like1-bs3"></div>
                        <i id="dislike1" class="glyphicon glyphicon-thumbs-down"></i> <div id="dislike1-bs3"></div>
                    </span>
                </div>
            </div>
        </article>

        <article class="col-xs-12 col-sm-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <a href="http://lorempixel.com/350/350/food/2" title="Food Portfolio" class="zoom" data-title="Delicious Food" data-footer="Whatever your desire" data-type="image" data-toggle="lightbox">
                        <img src="http://lorempixel.com/350/350/food/2" alt="Food Portfolio" />
                        <span class="overlay"><i class="glyphicon glyphicon-fullscreen"></i></span>
                    </a>
                </div>
                <div class="panel-footer">
                    <h4><a href="#" title="Food Portfolio">Food</a></h4>
                    <span class="pull-right">
                        <i id="like2" class="glyphicon glyphicon-thumbs-up"></i> <div id="like2-bs3"></div>
                        <i id="dislike2" class="glyphicon glyphicon-thumbs-down"></i> <div id="dislike2-bs3"></div>
                    </span>
                </div>
            </div>
        </article>

        <article class="col-xs-12 col-sm-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <a href="http://lorempixel.com/350/350/sports/3" title="Sports Portfolio" class="zoom" data-title="Radical Sports" data-footer="This are the best moments" data-type="image" data-toggle="lightbox">
                        <img src="http://lorempixel.com/350/350/sports/3" alt="Sports Portfolio" />
                        <span class="overlay"><i class="glyphicon glyphicon-fullscreen"></i></span>
                    </a>
                </div>
                <div class="panel-footer">
                    <h4><a href="#" title="Sports Portfolio" title="Sports">Sports</a></h4>  
                    <span class="pull-right">
                        <i id="like3" class="glyphicon glyphicon-thumbs-up"></i> <div id="like3-bs3"></div>
                        <i id="dislike3" class="glyphicon glyphicon-thumbs-down"></i> <div id="dislike3-bs3"></div>
                    </span>
                </div>
            </div>
        </article>

        <article class="col-xs-12 col-sm-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <a href="http://lorempixel.com/350/350/people/1" title="People Portfolio" class="zoom" data-title="Beautiful People" data-footer="We create relationships" data-type="image" data-toggle="lightbox">
                        <img src="http://lorempixel.com/350/350/people/1" alt="People Portfolio" />
                        <span class="overlay"><i class="glyphicon glyphicon-fullscreen"></i></span>
                    </a>
                </div>
                <div class="panel-footer">
                    <h4><a href="#" title="People Portfolio">People</a></h4>  
                    <span class="pull-right">
                        <i id="like4" class="glyphicon glyphicon-thumbs-up"></i> <div id="like4-bs3"></div>
                        <i id="dislike4" class="glyphicon glyphicon-thumbs-down"></i> <div id="dislike4-bs3"></div>
                    </span>
                </div>
            </div>
        </article>                                              

</section>
</div>
		<div class="row" >
			<div class="content">
			</div>
			<div class="parallaxer">
				<section class="content-section video-section">
					<div class="pattern-overlay">
						<a id="bgndVideo" class="player" data-property="{videoURL:'https://www.youtube.com/watch?v=2Vhlzdj6Csw',containment:'.video-section', quality:'large', autoPlay:true, mute:true, opacity:1}">bg</a>
<!-- 						https://www.youtube.com/watch?v=TJOdPEYs6WU -->
<!-- 						www.youtube.com/watch?v=2Vhlzdj6Csw -->
						<div class="video_play">
							<div class="row">
								<div class="col-lg-12">
									<h1>C.R.F<small style="color:#fff;">itness</small></h1>
									<h3>Enjoy motion to change your life</h3>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		<div class="content">Content Goes Here</div>
		<div class="parallaxer">
				
			</div>
		<div class="content"></div>
	</div>
	
	<div class="row">
    <!-- 3D Css -->
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
	
	<!--  頁面部分 結束 -->

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
		$(document).ready(function() {

				$(".player").mb_YTPlayer();

			});
		
         //  搜尋六筆健康日誌
// 		 $.ajax({
// 	            url:"${this_contextPath}/CRFSERVICE/commonJournalController/commonJournalOne",
// 	            type:'get',  //get post put delete
// 	            data:{},
// 	            success:function(data){          	
// 	            	$.each(data,function(){
// 	            		var likenum = this[3];
// 	            		var jdate_int = parseInt(this[0].publishTime);                          //轉換成數字
// 						var jdate_value = new Date(jdate_int); 
// 		        		var journalId=this[0].journal_Id
// 		        		var contet='<a class="a_img_p" href="${this_contextPath}/PersonalJournal.jsp?'+this[0].member_Id+'">'
// 			        		 +'<img class="Emoticons" src="${this_contextPath}/CRFSERVICE/memberController/photo/'+this[2]+'" /><p class="name_p">'
// 			        		 +this[1]+'</p></a><p class="time_p">'
// 			        		 +jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</p>'
// 							console.log(this) 
// 		        		 $('#inf_box').append(
// 		        		 '<li  id="'+this[0].journal_Id+'" class="gallery-img boximg">'
// 						 +contet
// 		        		 +'<img class="img-thumbnail" src="${this_contextPath}/CRFSERVICE/commonJournalController/photo/'+this[0].journal_Id+'" />'	 
// 		        		 +'<div data-desc=""></div>'
// 		        		 +'</li>') 
// 		        		 })
// 	           		 }	
// 		 		})
		        		 
		})
	</script>
<script src="http://pupunzi.com/mb.components/mb.YTPlayer/demo/inc/jquery.mb.YTPlayer.js"></script>
</body>
</html>