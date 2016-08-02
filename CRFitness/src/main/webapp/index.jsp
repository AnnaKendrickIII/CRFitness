<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CRFitness</title>
<style type="text/css">
/*  
body {
	margin: 0;
	background-color: #333;
	color: #fff;
	font-family: 'Quicksand';
} 
*/


.content {
/* 	height: auto; */
 	height:200px; 
/* 	width:100%; */
	text-align: center;
	line-height: 200px;
 	font-size: 24px;  /*字型大小*/
}
/* .content>img{ */
/* position: absolute; */
/* top: 0%; */
/* left: 35%; */
/* } */
._fancybar{margin-top:50px !important;z-index: 5}

</style>
</head>
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/css/3dcss.css" rel="stylesheet" />
<link href="${this_contextPath}/css/index_video.css" rel="stylesheet" />
<link href="${this_contextPath}/css/index_box.css" rel="stylesheet" />
<link href="${this_contextPath}/css/index_underbox.css" rel="stylesheet" />

<body >
	<!-- 頁面部分 開始-->
<aside>

		<div class="row" >
<!-- 			<div class="content"> -->
<!-- 				<p></p> -->
<!-- 			</div> -->
			<div class="parallaxer">
				<section class="content-section video-section">
					<div class="pattern-overlay">
						<a id="bgndVideo" class="player" data-property="{videoURL:'https://www.youtube.com/watch?v=2Vhlzdj6Csw',containment:'.video-section', quality:'large', autoPlay:true, mute:true, opacity:1}">bg</a>
<!-- 						https://www.youtube.com/watch?v=TJOdPEYs6WU -->
<!-- 						www.youtube.com/watch?v=2Vhlzdj6Csw -->
						<div class="video_play">
							<div class="row">
								<div class="col-lg-12">
									<h1 class="resizable">C.R.F<small class="resizable" style="color:#fff;">itness</small></h1>
									<h3 class="resizable">Enjoy motion to change your life</h3>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		<div class="index_body mt40">
			<section id="inf_box">
			
			</section>
		</div>
		<div class="row">
	
		</div>
		<div class="parallaxer">
				<div class="productbox dynamicTile">
<div class="row ">

	<div class="content col-md-12 col-sm-12">
<!-- 			<p>你還有更多的選擇</p> -->
			<img src="${this_contextPath}/images/sport_sohpping.png"  />
		</div>

    <div class="col-sm-2 col-xs-4">
    	<div id="tile1" class="tile">
        
         <div class="carousel slide" data-ride="carousel">
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
               <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5006"><img src="${this_contextPath}/images/products/prodDetail5006_1.png" class="img-responsive"/></a>
            </div>
            <div class="item">
               <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5009"><img src="${this_contextPath}/images/products/prodDetail5009_3.png" class="img-responsive"/></a>
            </div>
          </div>
        </div>
         
    	</div>
	</div>
	<div class="col-sm-2 col-xs-4">
		<div id="tile2" class="tile">
    	 
         <div class="carousel slide" data-ride="carousel">
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
              <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5406"><img src="${this_contextPath}/images/products/prodDetail5406_1.png" class="img-responsive"/></a>
            </div>
            <div class="item">
              <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5425"><img src="${this_contextPath}/images/products/prodDetail5425_1.png" class="img-responsive"/></a>
            </div>
            <div class="item">
              <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5399"><img src="${this_contextPath}/images/products/prodDetail5399_1.png" class="img-responsive"/></a>
            </div>
          </div>
        </div>
         
		</div>
	</div>
	<div class="col-sm-2 col-xs-4">
		<div id="tile3" class="tile">
    	 
        <div class="carousel slide" data-ride="carousel">
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
               <img src="http://handsontek.net/demoimages/tiles/weather2.png" class="img-responsive"/>
            </div>
            <div class="item">
               <img src="http://handsontek.net/demoimages/tiles/weather.png" class="img-responsive"/>
            </div>
            </div>
         </div>
		</div>
	</div>
	<div class="col-sm-2 col-xs-4">
		<div id="tile4" class="tile">
    	 
        <div class="carousel slide" data-ride="carousel">
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
              <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5418"><img src="${this_contextPath}/images/products/prodDetail5418_1.png" class="img-responsive"/></a>
            </div>
            <div class="item">
              <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5419"><img src="${this_contextPath}/images/products/prodDetail5419_1.png" class="img-responsive"/></a>
            </div>
          </div>
        </div>
         
		</div>
	</div>
    <div class="col-sm-2 col-xs-4">
		<div id="tile5" class="tile">
    	 
         <div class="carousel slide" data-ride="carousel">
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
              <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5410"><img src="${this_contextPath}/images/products/prodDetail5410_1.png" class="img-responsive"/></a>
            </div>
            <div class="item">
              <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5470"><img src="${this_contextPath}/images/products/prodDetail5470_1.png" class="img-responsive"/></a>
            </div>
          </div>
        </div>
         
		</div>
	</div>
	<div class="col-sm-2 col-xs-4">
		<div id="tile6" class="tile">
    	 
         <div class="carousel slide" data-ride="carousel">
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
              <img src="http://handsontek.net/demoimages/tiles/calendar.png" class="img-responsive"/>
            </div>
            <div class="item">
             <img src="http://handsontek.net/demoimages/tiles/calendar2.png" class="img-responsive"/>
            </div>
          </div>
        </div>
         
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-4 col-xs-8">
		<div id="tile7" class="tile">
    	 
        <div class="carousel slide" data-ride="carousel">
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
              <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5270"><img src="${this_contextPath}/images/products/prodDetail5270_5.png" class="img-responsive"/></a>
            </div>
            <div class="item">
              <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5270"><img src="${this_contextPath}/images/products/prodDetail5270_3.png" class="img-responsive"/></a>
            </div>
            <div class="item">
              <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5270"><img src="${this_contextPath}/images/products/prodDetail5270_1.png" class="img-responsive"/></a>
            </div>
          </div>
        </div>
         
		</div>
	</div>
	<div class="col-sm-2 col-xs-4">
		<div id="tile8" class="tile">
    	 
         <div class="carousel slide" data-ride="carousel">
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
                <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5094"><img src="${this_contextPath}/images/products/prodDetail5094_1.png" class="img-responsive"/></a>
            </div>
            <div class="item">
                <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5094"><img src="${this_contextPath}/images/products/prodDetail5094_3.png" class="img-responsive"/></a>
            </div>
            </div>
         </div>
         
		</div>
	</div>
	<div class="col-sm-2 col-xs-4">
		<div id="tile9" class="tile">
    	 
          <div class="carousel slide" data-ride="carousel">
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
             <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5456"><img src="${this_contextPath}/images/products/prodDetail5456_1.png" class="img-responsive"/></a>
            </div>
            <div class="item">
             <a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id=prodDetail5499"><img src="${this_contextPath}/images/products/prodDetail5499_1.png" class="img-responsive"/></a>
            </div>
          </div>
        </div>
         
		</div>
	</div>
	<div class="col-sm-4 col-xs-8">
		<div id="tile10" class="tile" style="background-image: url(${this_contextPath}/images/sport_news1.png); background-size: cover;">
    	 
           <div class="carousel slide" data-ride="carousel">
          <!-- Wrapper for slides -->
          <div class="carousel-inner" id="rss-in">
            <div class="item active">
           		   <img src="${this_contextPath}/images/sport_news.jpg" class="img-responsive" />             
            </div>          
          </div>
        </div>
         
		</div>
	</div>
  
</div>
			</div>
<!-- 		<div class="content"></div> -->
	</div>

	</div>
	</aside>



	<footer class="bs-footer" role="contentinfo">
		<div class="container">
			<div class="bs-social">
				<ul class="bs-social-buttons" style="list-style: none;">
					<!--         <li class="follow-btn" style="display:inline;"> -->
					<!--           <iframe id="twitter-widget-0" scrolling="no" frameborder="0" allowtransparency="true" class="twitter-follow-button twitter-follow-button-rendered" title="Twitter Follow Button" src="http://platform.twitter.com/widgets/follow_button.a9003d9964444592507bbb36b98c709b.en.html#dnt=false&amp;id=twitter-widget-0&amp;lang=en&amp;screen_name=bootsnipp&amp;show_count=false&amp;show_screen_name=true&amp;size=m&amp;time=1469761594455" style="position: static; visibility: visible; width: 136px; height: 20px;" data-screen-name="bootsnipp"></iframe> -->
					<!--         </li> -->
					<!--         <li class="tweet-btn" style="display:inline;"> -->
					<!--           <iframe id="twitter-widget-1" scrolling="no" frameborder="0" allowtransparency="true" class="twitter-share-button twitter-share-button-rendered twitter-tweet-button" title="Twitter Tweet Button" src="http://platform.twitter.com/widgets/tweet_button.a9003d9964444592507bbb36b98c709b.en.html#dnt=false&amp;id=twitter-widget-1&amp;lang=en&amp;original_referer=http%3A%2F%2Fbootsnipp.com%2F%3Fpage%3D15&amp;related=bootsnipp&amp;size=m&amp;text=RT%20Design%20elements%20and%20code%20snippets%20for%20%23twbootstrap%20HTML%2FCSS%2FJS%20framework&amp;time=1469761594456&amp;type=share&amp;url=http%3A%2F%2Fbootsnipp.com&amp;via=bootsnipp" style="position: static; visibility: visible; width: 63px; height: 20px;" data-url="http://bootsnipp.com"></iframe> -->
					<!--         </li> -->
				</ul>
			</div>
			<p>
				CRFitness.com © 2016 <a href="" target="_blank">Dan's Tools</a> | <a href="" target="_blank">Site Privacy policy</a> | <a href="" rel="nofollow">Advertise</a> | Featured snippets are <a href="http://bootsnipp.com/license">MIT license.</a>
			</p>
		</div>

		<script type="text/javascript"
			src="//cdn.fancybar.net/ac/fancybar.js?zoneid=1502&amp;serve=C6ADVKE&amp;placement=danstools"
			id="_fancybar_js"></script>

	</footer>
	<!-- footer end -->
	<!--  頁面部分 結束 -->

      

    <!-- 3D Css -->
<!-- 			<div class="col-md-4 "></div> -->
<!-- 			<div class="col-md-4  "> -->
<!-- 				<div class="container2 "> -->
<!-- 					<div id="carousel"> -->
<%-- 						<figure><img src="${this_contextPath}/images/AD1.jpg" alt=""></figure> --%>
<%-- 						<figure><img src="${this_contextPath}/images/AD2.jpg" alt=""></figure> --%>
<%-- 						<figure><img src="${this_contextPath}/images/AD3.jpg" alt=""></figure> --%>
<%-- 						<figure><img src="${this_contextPath}/images/AD7.jpg" alt=""></figure> --%>
<%-- 						<figure><img src="${this_contextPath}/images/AD9.jpg" alt=""></figure> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-md-4 "></div>	 -->

	<script type="text/javascript">
	Date.prototype.Format = function (fmt) {  
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, ( this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
	jQuery(function($){
	$('.logo_here').append('<img  class=" logo_css" src="${this_contextPath}/images/logo/logo.png">')
		$(document).ready(function() {

				$(".player").mb_YTPlayer();

			});

         //  搜尋六筆健康日誌
		 $.ajax({
	            url:"${this_contextPath}/CRFSERVICE/commonJournalController/commonJournalOne",
	            type:'get',  //get post put delete
	            data:{},
	            success:function(data){          	
	            	$.each(data,function(){
	            		var likenum = this[3];
	            		var jdate_int = parseInt(this[0].publishTime);                          //轉換成數字
						var jdate_value = new Date(jdate_int); 
		        		var journalId=this[0].journal_Id
		        		 
		        	$('#inf_box').append(
		        		'<article class="col-xs-12 col-sm-6 col-md-2">'
		        		+'<div class="indexbox indexbox-default">'
		        		+'<div class="indexbox-body">'
		        		+'<a href="" class="zoom">'
		        		+' <img src="${this_contextPath}/CRFSERVICE/commonJournalController/photo/'+this[0].journal_Id+'" alt="Loding Photo" />'
		        		+' <span class="overlay"><i class="glyphicon glyphicon-fullscreen"></i></span>'
		        		+'</a></div>'
		        		+'<div class="indexbox-footer">'
		        		+'<h4><img class="boxhead img-circle" src="${this_contextPath}/CRFSERVICE/memberController/photo/'+this[2]+'" /><a href="#">'+this[1]+'</a></h4>'
		        		+'<span class="pull-right">'
		        		+'<i id="like1" class="glyphicon">'+jdate_value.Format("yyyy-MM-dd hh:mm")+'</i> <div id="like1-bs3"></div>'
		        		+'</span></div></div></article>') 
		        		 })
	           		 }	
		 		})
		 		
		})
	</script>
	
<!-- RSS -->
	<script type="text/javascript">
	
	
	$.ajax({
		url:"${this_contextPath}/RSSreader",
        type:'get',
        dataType:'xml',
        success: function(data){
            $(data).find("item").each(function(){  //取得xml父節點       
//             var total = $(data).find("item").length;//xml的總筆數
      		var title = $(this).children("title").text(); //取得子節點中的資料
      		var pubDate = $(this).children("pubDate").text().substr(0,26);
      		var link = $(this).children("link").text();
      		
      		$('#rss-in').append('<div class="item">'      			
      				+'<h3 class="tilecaption">'
      				+'<a style="text-decoration: none;color: black;" href="'+link+'">'+title+''
      				+'<br/><br/>'+pubDate+'</a></h3>'
      				+'</div>')      		
			})
		}
	})

	</script>
	
<script src="http://pupunzi.com/mb.components/mb.YTPlayer/demo/inc/jquery.mb.YTPlayer.js"></script>
<script src="${this_contextPath}/js/index_underbox.js"></script>

</body>
</html>
