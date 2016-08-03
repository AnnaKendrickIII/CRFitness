<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${ empty LoginOK}">
<c:redirect url="/index.jsp?NoLogin"></c:redirect>
</c:if>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="title" value="" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">

<jsp:include page="/CRFitness.jsp" />
<title>${LoginOK.nickname}的個人日誌</title>

<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/personal_journal.css" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/personal_activity.css" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/personal_profile.css" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/personal_head.css" />

<link rel="stylesheet" href="${this_contextPath}/css/bootstrap-editable.css"> <!-- 檔案上傳 -->
<link rel="stylesheet" href="${this_contextPath}/css/jquery.fs.boxer.css">
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jquery.alertable.css">  
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jAlert-v4.css"> 
<link href="${this_contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<style>
 body   {    
    background-color: #f5f5f5;  
}  
textarea{
	resize: none;
}
.message_div {
	margin-top: 3px;
}
/* 案讚的愛心 */
._soakw{
display:block;
overflow:hidden;
text-indent:25%;
white-space:nowrap;
}

.coreSpriteHeartOpen{
background-image:url(${this_contextPath}/images/c97b56.png);
background-repeat:no-repeat;
background-position:-579px -321px;
height:24px;
width:24px;
}

.coreSpriteHeartFull{
background-image:url(${this_contextPath}/images/c97b56.png);
background-repeat:no-repeat;
background-position:-93px -582px;
height:24px;
width:24px;
}

/* 防止script語法 */
#grid li p{
	margin:0px ;
 	padding:0px; 
}

div.timeline-body{
	padding:0 20px 0 20px;
}
.msgPhoto{
	width: 32px;
    height: 32px;
    margin-right: 5px;
}
#grid a{ 
	cursor: pointer;
}

div.statusSelect a{
	cursor: pointer;
}

.timeline-footer>div>div{
	padding-bottom: 5px;
}

.msgTime {
	color:#7E7E7E;
	font-size: 10px;
}

/* 為了非本人顯示揪團創建的 */
.jouranl_activity{
display:block;
max-width:100%;
width: 60px;
height: 60px;
padding: 0px;
margin-right : 20%;

display:inline-block;
}
.friend_joinactivity{
text-align : center;
display : inline;
}

.divideline{
margin: 5px;
}

.selfchance{
margin-top : 50%;
}

.name_p{
font-size: 18px;
color:#0000C6;
}

#clickchangehead:focus{
	outline: none !important;
	border: none !important;
}

.journal-memberphoto{
	height: 32px;
    width: 32px;
	display:inline;
	margin-right: 5%
}

.journaltime{
	color:#BEBEBE;
	font-size: 10px;
}
.statusSelect{
	float: right;
}
.faspan{
	position:absolute;
	left: 30%;
}

.bth-insert{
	color:#5599FF;
	background-color: white;
	border-color: #5599FF;
}

.bth-insert:FOCUS{
color:#5599FF !important;
background-color: white !important;
outline:none !important; 
}
.bth-insert:hover{
	color:#777 !important;
	background-color: white;
	border-color: #777 !important;
}
.gg{
	margin-right: 5%;
}
i.fa-user-plus{
	margin-right: 5%;
}
.new_j_css{
background-color: #337ab7;
text-align: center;
color:white;
}
.booknew_css{
padding-right: 5%;
}
.uploadfile_div_css{
margin-bottom: 5%;
}
.userContents{
font-size: 20px;
}
.img_headers{
  background-color: #337ab7;
  text-align: center;
  color: white;
  }
.camera_icon{
padding-right: 2%;
  }
</style>
<script type="text/javascript">
jQuery(function($){
$('.logo_here').append('<img  class=" logo_css" src="${this_contextPath}/images/logo/PersonalJournal.png">')
})
</script>

</head>

<body >



<!-- 將顯示內容放置到aside -->
<c:if test="${! empty LoginOK}">
<aside> 


<div class="row">
				<div class="col-md-2 "></div>
				<div class="col-md-8 col-xs-12">
					<div class="col-md-8 col-xs-8">

						<div class="media" id="personal_profile"></div>

						<ul class="timeline" id="grid">

						</ul>
					</div>
					<div class="col-md-4 col-xs-4" id="personal_activity"></div>
				</div>
				<div class="col-md-2"></div>
	<%-- 	<img  id="imgloading" src="${this_contextPath}/images/cube.gif" style="display: none"> --%>
</div>
	<!-- 頁面部分 開始--><!--   ├─判斷是是個人日誌頁面還是好友開始─┤  --><!-- 	判斷登入者和 queryString 是否相同, 若相同才可修改  -->
<c:if test="${LoginOK.member_Id == pageContext.request.queryString or pageContext.request.queryString == null}">
<script type="text/javascript">
 					$('#personal_profile').append( 							
// 	個人頭像				'<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">'+"新增個人日誌"+'</button>'
				           ' <a class="pull-left" id="clickchangehead" data-toggle="modal" data-target="#changhead" href="#">'
			             +'<img class="media-object dp img-circle" src="${this_contextPath}/CRFSERVICE/memberController/photo/${LoginOK.member_Id}" >'
			             +'</a>'
			             +'<div class="media-body">'
			             +'<h4 class="profile-heading">${LoginOK.nickname} <small>${LoginOK.e_mail}</small></h4>'
			             +'<hr style="margin:8px auto">'		             
			             +'<button type="button" class="profile-btn btn bth-insert" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-qq gg" aria-hidden="true"></i>新增個人日誌</button>'
			             +'</div>'
 					);
 					
 					$('#personal_activity').append(
 							'<ul class="nav nav-tabs" role="tablist" id="myTab">'
							+'<li role="presentation" class="active"><a class="selfchance" href="#home" aria-controls="home" role="tab" data-toggle="tab">'+"建立的揪團"+'</a></li>'
							+'<li role="presentation"><a class="selfchance" href="#profile" aria-controls="profile" role="tab" data-toggle="tab">'+"參加的揪團"+'</a></li>'
						+'</ul>'
						+'<div class="tab-content">'
							 +'<div role="tabpanel" class="tab-pane active" id="home">'
								+'<ul class="event-list" id="myactivity_personal">'
								+'</ul>'
							+'</div>'	
							+'<div role="tabpanel" class="tab-pane" id="profile">'
								+'<ul class="event-list" id="myactivity_join">'
								+'</ul>'
							+'</div>'
						+'</div>'
 						);
 					
//  				<!-- 抓取使用者建立的揪團  開始-->		             
                     jQuery(function($){
                    	 
                         $.ajax({
                             url:"${this_contextPath}/CRFSERVICE/activitysController/${LoginOK.member_Id}",
                             type:'get',  //get post put delete
                             data:{},
                             success:function(data){                            	                            	
                                 $.each(data,function(){
             						var jdate_int = parseInt(this[0].activity_Day); //轉換成數字
            						var jdate_value = new Date(jdate_int);
                                     $('#myactivity_personal').append(
                                    	 '<li>'	 
                                    	+'<time datetime="2014-07-20">'
            							+'<span class="month">'+jdate_value.Format("MM")+'</span>'
             							+'<span class="day">'+jdate_value.Format("dd")+'</span>'
            							+'<span class="year">'+jdate_value.Format("yyyy")+'</span>'
            							+'<span class="time">'+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</span>'
            							+'</time>'
                                    	+'<a href="${this_contextPath}/activitydetail.jsp?'+this.member_Id+'" >'
                                    	+'<img src="${this_contextPath}/images/activitys/'
                                    	+this[0].activity_Id+'.jpg" class="img-responsive" alt="Independence Day" /></a>'
                                    	+'<div style="text-align : center">'+"類別："+this[0].activity_Class+'<hr class="divideline"/>'+"地區："+this[0].activity_Area 
                                    	+'</div>'
                                    	+'</li>')                
                                 }) //each                         
                             }          	 
                         }) //ajax

                         $.ajax({
                        	 url:"${this_contextPath}/CRFSERVICE/activitysController/myActivitys/${LoginOK.member_Id}",
                             type:'get',  //get post put delete
                             data:{},
                             success:function(data){                           	                             	
                                 $.each(data,function(){
             						var jdate_int = parseInt(this[0].activity_Day); //轉換成數字
            						var jdate_value = new Date(jdate_int);
                                     $('#myactivity_join').append(
                                    	 '<li>'	 
                                    	+'<time datetime="2014-07-20">'
            							+'<span class="month">'+jdate_value.Format("MM")+'</span>'
             							+'<span class="day">'+jdate_value.Format("dd")+'</span>'
            							+'<span class="year">'+jdate_value.Format("yyyy")+'</span>'
            							+'<span class="time">'+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</span>'
            							+'</time>'
                                    	+'<a href="${this_contextPath}/activitydetail.jsp?'+this.member_Id+'" >'
                                    	+'<img src="${this_contextPath}/images/activitys/'
                                    	+this[0].activity_Id+'.jpg" class="img-responsive" alt="Independence Day" /></a>'
                                    	+'<div style="text-align : center">'+"類別："+this[0].activity_Class+'<hr class="divideline"/>'+"地區："+this[0].activity_Area 
                                    	+'</div>'
                                    	+'</li>')                
                                 }) //each
                          
                             }          	 
                         }) //ajax

                     })                     
//                      /friendActivitys/{member_Id}                     
</script > 


</c:if> 
<!-- ├─判斷是是個人日誌頁面還是好友結束─┤ -->

			<!-- 新增個人日誌頁面開始 -->
				<div class="modal fade insertjournal" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header new_j_css">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h3 class="modal-title" id="exampleModalLabel"><i class="fa fa-book booknew_css"></i><strong>新增個人日誌</strong></h3>
							</div>
							<div class="modal-body">

								<form role="form" action="" method="post">
									<div class="form-group">
										<label for="content">內容</label> <textarea  class="form-control" id="content" placeholder="內容輸入在此"></textarea>
									</div>

								<div class="btn-group statusSelect">
							       <a  class="btn dropdown-toggle " data-toggle="dropdown" aria-expanded="false" hidden="hidden"><i id="openStatus" data-val="1" class="fa fa-share-alt" aria-hidden="true"></i><span class="aaaa"> 公開</span><span class="caret"></span></a>
							       <ul class="dropdown-menu" role="menu">
							       <li><a class="selectOpenValue" data-val="1"><i class="fa fa-share-alt" aria-hidden="true"></i> <span  class="faspan"> 公開</span></a></li>
							       <li><a class="selectOpenValue" data-val="2"><i class="fa fa-users" aria-hidden="true"></i> <span class="faspan"> 朋友</span></a></li>
							       <li><a class="selectOpenValue" data-val="0"><i class="fa fa-lock" aria-hidden="true"></i> <span class="faspan"> 限本人</span></a></li></ul>
								</div>

									<div class="form-group">
										<div class="uploadfile_div_css">
										<label for="uploadfile" class="btn btn-primary btn-file">選擇圖檔<input id="uploadfile"   style="display: none;"
											type="file" multiple="multiple">
											</label> 
										</div>
										<div>
									        <img class="preview" style="max-width: 150px; max-height: 150px;">
									        <div class="size"></div>
									    </div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button id="sendBtn" type="button" class="btn btn-primary">送出</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
		<!-- 新增個人日誌頁面結束  -->
		
		<!-- 修改個人頭像 -->
			<div class="modal fade" id="changhead" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header img_headers">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="exampleModalLabel">
							<i class="fa fa-camera camera_icon" aria-hidden="true"></i>
							<strong>修改個人頭像</strong></h4>
						</div>
						<div class="modal-body">
							<div class="imageBox">
								<div class="thumbBox"></div>
								<div class="spinner" style="display: none">Loading...</div>
							</div>
							<div class="head_action">
							<div class="uploadfile_div_css" style="float: left">
										<label for="file" class="btn btn-primary btn-file">選擇圖檔<input id="file"   style="display: none;"
											type="file" multiple="multiple">
											</label> 
							</div>
								<input type="button" id="btnCrop" class="btn btn-primary btn-xs" value="確定選取"> 
								<input type="button" id="btnZoomIn" class="btn btn-primary btn-xs" value="+"> 
								<input type="button" id="btnZoomOut" class="btn btn-primary btn-xs" value="-">
							</div>
							<div class="cropped"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- 修改個人頭像結束 -->
</aside>

<script type="text/javascript">

//功成身退
// 	function diffTime(beforeTime){
// 		var diffTime1 = new Date().getTime() - beforeTime;
// 		var s = 1000;
// 		var m = 60*s;
// 		var h = 60*m;
// 		var day = 24*h;
// 		var theday = Math.floor(diffTime1/day)
// 		var theH = Math.floor(diffTime1%day/h)
// 		diffTime1 %= h;
// 		var theM = Math.floor(diffTime1/m)
// 		var theS = diffTime1%60;
// 		if(theday > 0)
// 			beforeTime2 = theday + '天前'
// 		else if(theH > 0)
// 			beforeTime2 = theH + '小時前'
// 		else if(theM > 0)
// 			beforeTime2 = theM + '分鐘前'
// 		else if(theM < 1)
// 			beforeTime2 = '剛剛'
// 		return beforeTime2
// 	};
		
	function activitys(nickname){
		$.ajax({
				 url:"${this_contextPath}/CRFSERVICE/activitysController/${pageContext.request.queryString}",
			     type:'get',  //get post put delete
			     data:{},
			     success:function(data){ 
			    	 $('#personal_activity').append(
							 '<ul class="nav nav-tabs" role="tablist" id="myTab">'
							+'<li role="presentation" class="active"><a class="selfchance" href="#home" aria-controls="home" role="tab" data-toggle="tab">'+nickname+"的揪團"+'</a></li>'
							+'</ul>'
							+'<div class="tab-content">'
							+'<div role="tabpanel" class="tab-pane active" id="home">'
							+'<ul class="event-list" id="myactivity_personal">'
							+'</ul>'
							+'</div>'	
							+'</div>'
								);   	                            	
			         $.each(data,function(){
							var jdate_int = parseInt(this[0].activity_Day); //轉換成數字
							var jdate_value = new Date(jdate_int);
							var jdate_int2 = parseInt(this[0].deadline);                          //轉換成數字
							var jdate_value_deadline = new Date(jdate_int2);
			            $('#myactivity_personal').append(
			            	 '<li>'	 
			            	+'<time datetime="2014-07-20">'
							+'<span class="month">'+jdate_value.Format("MM")+'</span>'
							+'<span class="day">'+jdate_value.Format("dd")+'</span>'
							+'<span class="year">'+jdate_value.Format("yyyy")+'</span>'
							+'<span class="time">'+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</span>'
							+'<span class="time">'+jdate_value_deadline.Format("yyyy-MM-dd hh:mm:ss")+'</span>'
							+'</time>'
						+'<a href="${this_contextPath}/images/activitys/'
						+this[0].activity_Id+'.jpg" class="lightbox_image boxer" data-lightbox-gallery="image_gallery" rel="gallery" title="發起人：'
						+this[2]+"<i class='fa fa-commenting-o img-responsive' aria-hidden='true'></i>"
						+'<br />類別：'+this[0].activity_Class+'<br />地區：'
						+this[0].activity_Area+'<br />內容：'
						+this[0].activity_Info+'<br />活動時間：'
						+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />報名截止日：'
						+jdate_value_deadline.Format("yyyy-MM-dd hh:mm:ss")
						+"<button class='alert-vel btn btn-theme submit_x' style='float:right' type='submit' value='INSERT_MEMBER'>參加活動</button>" 
						+"<div hidden='hidden'>"+this[0].activity_Id
						+'</div>"><span title=""><img src="${this_contextPath}/images/activitys/'
						+this[0].activity_Id+'.jpg" class="jouranl_activity" alt="Independence Day" /></span></a>'			
						+'<div class="friend_joinactivity">'+this[0].activity_Class+" "+this[0].activity_Area+'</div>'
						+'</li>')         	
			         }) //each
			         
			         $(".boxer").boxer({
							top: 50,
							fixed:true
							});
			         
				      $("body").on("click", '.submit_x', function(){
			    	  var whatActivityID=$(this).parent().siblings("div").text()
			    	   $.ajax({
			    		   url:"${this_contextPath}/CRFSERVICE/activityDetailController/addActivityDetail",
			    		   type:'post',
			    		   data:{
			    			   activity_Id:$('.boxer-caption').find('div').text(),
			    			   member_Id:'${LoginOK.member_Id}'
			    		   },
			    		   success:function(data){
			    			  if(data[0]=='參加過'){
			    				   $("#boxer-overlay").remove();
			    				   $("#boxer").remove();
			    				   $('body').toggleClass();		
			    				     		
			    				   errorAlert('北七膩', '你已經參加過了');

			    			   }else if(data[0]=='已額滿'){
			    				   $("#boxer-overlay").remove();
			    				   $("#boxer").remove();
			    				   $('body').toggleClass();		
			    				     			
			    				   errorAlert('殘念', '已額滿');
			    			   }else{
			    				var members="";
			    				var sum =0;
			    				var whoButton=$('#button'+whatActivityID);
			    				   $.each(data,function(index){          
			    					   members+=this+" ";
			    					   sum+=1;
			    				   })   
			    				   whoButton.text(sum)
			    				   whoButton.attr("data-original-title",members)
			      				   
			    				   $("#boxer-overlay").remove();
			    				   $("#boxer").remove();
			    				   $('body').toggleClass();		
			    				
			    				   $.alertable.alert('參加成功', {
			    					   show: function() {
			    					     $(this.overlay).velocity('transition.fadeIn');        
			    					     $(this.modal).velocity('transition.flipBounceYIn');
			    					   },
			    					   hide: function() {
			    					     $(this.overlay).velocity('transition.fadeOut');
			    					     $(this.modal).velocity('transition.perspectiveUpOut');
			    					  	 } 
			    						 });
			    			  		 }			   
			    		  		 }
			    	   		})
						}); //on結束

					 }
				 }) //ajax
		
		
	}
	
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

	jQuery(function ($) {

		var myNickname = "${LoginOK.nickname}";
    	var theMemberId = "${LoginOK.member_Id}";
        var divGrid = $('#grid');
		var visitorStatus;  // 記錄目前登入者狀態  1:自己  2:朋友 3:非好友
		var titleNickName;
		var usernickname;
		
		
    //  ------------------ 判斷是否本人, 好友 , 非好友------------------
		if("${LoginOK.member_Id}" == "${pageContext.request.queryString}"){
			visitorStatus = 1;
			callShowJournal(visitorStatus)
		} else {
			// 先查詢自己所有好友名單
	    	$.ajax({
	            url:"${this_contextPath}/CRFSERVICE/friendships/${LoginOK.member_Id}",
	            type:'get',  //get post put delete
	            data:{},
	            success:function(data){
		            $.each(data,function(){
	            		if(this[0] === "${pageContext.request.queryString}"){
	            			theMemberId = this[0];
	            			titleNickName = this[2];
	            			visitorStatus = 2;
	            			callShowJournal(visitorStatus,this[0],this[2])//0好友id 2好友名字
	            			return false;
	            		}
					// 日誌titleNickName
		            })
		            if(visitorStatus != 2){
            			visitorStatus = 3;
            			callShowJournal(visitorStatus)       			
	            	}
				}
		            
			})
		}
				
		function callShowJournal(visitorStatus,friendId,nickname){
   			if(visitorStatus == 2){ 
//好友頁面頭像		 		
			$('#personal_profile').append(
		          ' <a class="pull-left" href="#">'
	             +'<img class="media-object dp img-circle" src="${this_contextPath}/CRFSERVICE/memberController/photo/${pageContext.request.queryString}" >'
	             +'</a>'
	             +'<div class="media-body">'
	             +'<h4 id="usernickanme" class="media-heading "></h4>'
	             +'<hr style="margin:8px auto">'		             
	             +'<button type="button" class="profile-btn btn btn-primary chat_for_friend">傳送訊息給他</button>'
	             +'</div>'
				);	
			
				
			}else if(visitorStatus == 3){
				$('#personal_profile').append(
		           ' <a class="pull-left" href="#">'
	             +'<img class="media-object dp img-circle" src="${this_contextPath}/CRFSERVICE/memberController/photo/${pageContext.request.queryString}" >'
	             +'</a>'
	             +'<div class="media-body">'
	             +'<h4 class="media-heading" id="usernickanme"></h4>'
	             +'<hr style="margin:8px auto">'		             
	             +'</div>'
				);
				
				$.ajax({
					url:"${this_contextPath}/CRFSERVICE/friendships/findFriendFlag",
					type:'get',
					data:{'member_Id': "${LoginOK.member_Id}",
						'friend_Id': "${pageContext.request.queryString}"},
					success: function(data){
						if(data == 2){   //申請人
							
							$('#personal_profile').append('<button type="button" class="profile-btn btn btn-info canceladdfriend" >不等了，取消申請</button>')
							
						}else if(data == 3){  // 被害人
							
// 							$('#personal_profile').append('<button type="button" class="profile-btn btn btn-info acceptfriend" >接受申請成為好友</button>')
						}else{
							$('#personal_profile').append('<button type="button" class="profile-btn btn btn-info addfriend" ><i class="fa fa-user-plus" aria-hidden="true"></i>加為好友</button>')
							
						}
					}
				})
			
			}
   			
			// 查詢日誌開始-------------------------
				$.ajax({
			    
				url : "${this_contextPath}/CRFSERVICE/personalJournalController/showJournal",
				type : 'get', //get post put delete
				data : {'member_Id' : "${pageContext.request.queryString}" ,
					'visitorStatus' : visitorStatus},
				success : function(data) {
					if("${LoginOK.member_Id}" != "${pageContext.request.queryString}"){
						if(data.length != 0){
							$('#usernickanme').append(data[0][1])
							activitys(data[0][1]);
						}else{
							$('#usernickanme').append(titleNickName)
							activitys(titleNickName);
						}
					}
					
					$.each(data,function(index) {
						var jdate_int = parseInt(this[0].publishTime); //轉換成數字
						var jdate_value = new Date(jdate_int);
				    	var invert; 
				    	var li_direction;
				    	var thejournal_Id=this[0].journal_Id;

				    	if(index%2==0){
				    		li_direction='<li id="'+ this[0].journal_Id +'">';
				    		invert='<i class="glyphicon glyphicon-record " '
				    	}else{
				    		li_direction='<li id="'+ this[0].journal_Id +'" class="timeline-inverted" >';
				    		invert='<i class="glyphicon glyphicon-record invert" '
				    	}
					//顯示查詢日誌
					$('#grid').append(
				    	li_direction
				    	+ '<div class="timeline-badge primary"><a>'
				    	+ invert 	
				    	+ 'rel="tooltip" title="於 '+jdate_value.Format("yyyy-MM-dd hh:mm")+' 建立" id="I5"></i></a></div><div class="timeline-panel" id="remove_journal">'
				    	+ '<div class="timeline-heading"><a href=""><img class="img-journal" src="${this_contextPath}/CRFSERVICE/commonJournalController/photo/'
				    	+ this[0].journal_Id+'" /></a></div>'
				    	+ '<div class="timeline-body">'

				        + '<div class="btn-group statusSelect">'
				        + '<a  class="btn dropdown-toggle " data-toggle="dropdown" aria-expanded="false" hidden="hidden"><i class="fa fa-share-alt" aria-hidden="true"></i><span class="aaaa"> 公開</span><span class="caret"></span></a>'
				        + '<ul class="dropdown-menu" role="menu">'
				        + '<li><a class="selectOpenValue" data-val="1"><i class="fa fa-share-alt" aria-hidden="true"></i> <span class="faspan"> 公開</span></a></li>'
				        + '<li><a class="selectOpenValue" data-val="2"><i class="fa fa-users" aria-hidden="true"></i> <span class="faspan"> 朋友</span></a></li>'
				        + '<li><a class="selectOpenValue" data-val="0"><i class="fa fa-lock" aria-hidden="true"></i> <span class="faspan"> 限本人</span></a></li></ul></div>'

				        +'<p class="name_p"><img class="img-responsive journal-memberphoto" src="${this_contextPath}/CRFSERVICE/memberController/photo/${pageContext.request.queryString}" />'+this[1]+'</p>'  // 上線前要拿掉或改暱稱
				    	
			   			+ jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</p>'
				    	+ '<p class="userContents"></p>'
			   			+'</div>'
			   			+ '<div class="timeline-footer">'
			   			  //'留言塞這裡'
			   			+ '<div></div><div></div></div>'
			   			+ '<div  class="col-md-12 viewmessages"></div>'
			   			+ '<div class="message_div function_list">'	

			   			+ '<textarea maxlength="30" class="form-control message-textarea" rows="1" onkeyup="autogrow(this)" placeholder="留言最大30字數....."></textarea>'

						+ '<a class="btn btn-link"><i class="fa fa-tag fa-2x" aria-hidden="true"></i></a>'
				   		+ '<a class="btn btn-link likethis"><span class="_soakw coreSpriteHeartOpen" ></span></a>'
				   		+ '<a><span class="badge countLike" ></span></a>'
			   			+ '<button type="button" class="btn song btn-primary pull-right" >送出留言 </button>'
			   			+ '</div>'
			   			+ '</div>'
			   			+ '</li>')
			   			
   			
			   			//顯示按讚數		
					   	$.ajax({
							url:"${this_contextPath}/CRFSERVICE/laudationcontroller/countlike",
							type:"get",
							data:{journal_Id:this[0].journal_Id},
							success:function(data){
	 				 			$('#'+thejournal_Id).find(".countLike").append(data)						
							}					
						})

						
            		// 判斷queryString 和 LoginOK.member_Id 是否一樣
					if("${LoginOK.member_Id}" == "${pageContext.request.queryString}"){
						// 增加個人日誌狀態編輯按鈕  1:公開  0:限本人  2:朋友  4:刪除 5:停權
						var theLi = $('#'+ this[0].journal_Id);
						var selectA = theLi.find('div.statusSelect>a');
						if(this[0].publicStatus == 2){
							selectA.find('span:first').text(' 朋友');
							selectA.find('i').removeClass().addClass('fa fa-users');
						}else if(this[0].publicStatus == 0){
							selectA.find('span:first').text(' 限本人');
							selectA.find('i').removeClass().addClass('fa fa-lock');
						}
						
						// 移除個人日誌按鈕
						divGrid.find('div.timeline-panel:last')
						.prepend('<button type="button" title="移除此篇日誌" class="close fa-2x removeJournal" aria-label="Close"><span aria-hidden="true">&times;</span></button>')
						
						divGrid.find('p.userContents:last').text(this[0].contents).wrap('<a href="#" class="username" data-type="textarea" data-placement="right" ></a>')
						
						}else{
							$('div.statusSelect').hide()
							divGrid.find('p.userContents:last').text(this[0].contents);
						}
								
					// 第一次載入日誌先撈三筆留言
					loadMessageOne(this[0].journal_Id, 0);
					}) 	//each
									
					// 查看留言功能按鈕
				var eleMessageA1 = $('<a>').text('查看更多留言').on('click', function(){
					var theLi = $(this).parents('li');
					var theMessage_Id = theLi.find('div.timeline-footer>div:first>div:first').val();
					var theJournal_Id = theLi.attr('id');
					if(theMessage_Id)
						loadMessageOne(theJournal_Id, theMessage_Id);
					else{
						theLi.find('div.timeline-footer').slideDown();
						theLi.find('div.viewmessages').slideUp();


					}
				})

				$.ajax({
					url:"${this_contextPath}/CRFSERVICE/laudationcontroller/laudationjournalnumber",
					type:"get",
					data:{lauded_Id:'${LoginOK.member_Id}'},
	   					success:function(data){
	   						$.each(data,function(){
	   							$('#'+this.journal_Id).find('Span._soakw').toggleClass("coreSpriteHeartFull")
	   						})
	   					}
	   				})
				
				
				divGrid.find('div.viewmessages').append(eleMessageA1);
					
				//隱藏留言按鈕
				var eleMessageA2 = $('<a>').text('隱藏留言').on('click', function(){
					var theLi = $(this).parents('li');
					theLi.find('div.timeline-footer').slideUp();
					theLi.find('div.viewmessages').slideDown();
				})
				
				// 編輯個人日誌的內容
				$('.username').editable({
				     rows:3
				});
				
				
				$('#grid').append('<li class="clearfix" style="float: none;">'); // 顯示中間時間軸的線
					
    			}
    		})
    		//ajax 查詢日誌結束
        }
        
		// insert journal OpenStatus
		$('div.insertjournal').on('click', 'div.statusSelect>ul>li>a' , function(){
			var openValue = $(this).attr('data-val')
			var selectA = $('div.insertjournal').find('div.statusSelect>a');
			if(openValue == 2){
				selectA.find('span:first').text(' 朋友');
				selectA.find('i').removeClass().addClass('fa fa-users');
				$('#openStatus').attr('data-val','2')
			}else if(openValue == 0){
				selectA.find('span:first').text(' 限本人');
				selectA.find('i').removeClass().addClass('fa fa-lock');
				$('#openStatus').attr('data-val','0')
			}else{
				selectA.find('span:first').text(' 公開');
				selectA.find('i').removeClass().addClass('fa fa-share-alt');
				$('#openStatus').attr('data-val','1')
			}
		})
		
		
					// 新增個人日誌送出的click事件==================================
					$('#sendBtn').click(function(){
						var formData = new FormData();
						var file = $('#uploadfile').prop("files")[0];	
						var contents = $('#content').val();
						var publishTime = new Date().Format('yyyy-MM-dd hh:mm:ss');
						var publicStatus = $('#openStatus').attr('data-val');
						formData.append('archives', file);
						formData.append('member_Id', "${LoginOK.member_Id}");
						formData.append('contents', contents);
						formData.append('publishTime', publishTime);
						formData.append('publicStatus', publicStatus);
						if(file === undefined){
							alertify.alert('請選擇一個檔案').set('title', '警告');
						}else{
							$.ajax({
								url: "${this_contextPath}/CRFSERVICE/personalJournalController/insertJournal",
								type: 'post',
								data: formData,
								processData: false,
								contentType: false,
								success: function(data){
									$('#exampleModal').modal('hide');
			    						var jdate_int = parseInt(data.publishTime); //轉換成數字
			    						var jdate_value = new Date(jdate_int);
			    						var invert; 
			    				    	var li_direction;
			    						if($('#grid>li:nth-child(1) div>a>i').hasClass('glyphicon glyphicon-record invert')){
			    							li_direction='<li id="'+ data.journal_Id +'">';
			    				    		invert='<i class="glyphicon glyphicon-record " '
			    						}else{
			    				    		invert='<i class="glyphicon glyphicon-record invert" '
			    							li_direction='<li id="'+ data.journal_Id +'" class="timeline-inverted" >';
			    						}
			    						var iClass;
			    						var spanText;
			    						if(data.publicStatus == 2){
											spanText = '朋友';
											iClass = 'fa-users';
			    						}else if(data.publicStatus == 0){
			    							spanText ='限本人';
			    							iClass = 'fa-lock';
			    						}else{
			    							spanText = '公開';
			    							iClass = 'fa fa-share-alt';
			    						}
			    						
			    						// 顯示新增
										$('#grid>li:nth-child(1)').before(
									    	li_direction
									    	+ '<div class="timeline-badge primary"><a>'
									    	+ invert 	
									    	+ 'rel="tooltip" title="於 '+jdate_value.Format("yyyy-MM-dd hh:mm")+' 建立" id="I5"></i></a></div><div hidden="hidden" class="timeline-panel" id="remove_journal">'
									    	+ '<button type="button" title="移除此篇日誌" class="close fa-2x removeJournal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
									    	+ '<div class="timeline-heading"><a href=""><img class="img-journal" src="${this_contextPath}/CRFSERVICE/commonJournalController/photo/'
									    	+ data.journal_Id+'" /></a></div>'
									    	+ '<div class="timeline-body">'
									    	+ '<div class="btn-group statusSelect">'
										    + '<a  class="btn dropdown-toggle " data-toggle="dropdown" aria-expanded="false" hidden="hidden">'
										    +'<i class="fa '+ iClass +'" aria-hidden="true"></i><span class="aaaa"> '+ spanText +'</span><span class="caret"></span></a>'
										   	+ '<ul class="dropdown-menu" role="menu">'
										    + '<li><a class="" data-val="1"><i class="fa fa-share-alt" aria-hidden="true"></i> <span class="faspan"> 公開</span></a></li>'
										    + '<li><a class="" data-val="2"><i class="fa fa-users" aria-hidden="true"></i> <span class="faspan"> 朋友</span></a></li>'
										    + '<li><a class="" data-val="0"><i class="fa fa-lock" aria-hidden="true"></i> <span class="faspan"> 限本人</span></a></li></ul></div>'
										           
								   			+ '<p class="name_p"><img class="img-responsive journal-memberphoto" src="${this_contextPath}/CRFSERVICE/memberController/photo/${pageContext.request.queryString}" />'+"${LoginOK.nickname}"+'</p>'  // 上線前要拿掉或改暱稱
									    	+ '<p class="journaltime">'
								   			+ jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</p>'
								   			+ '<a href="#" class="username" data-type="textarea" data-placement="right" ><p>'+ data.contents +'</p></a>'

								   			+ '</div>'
								   			+ '<div hidden="hidden" class="timeline-footer">'
											// 	'留言塞這裡'
								   			+ '<div></div><div></div></div>'
								   			+ '<div  class="col-md-12 viewmessages"></div>'
								   			+ '<div class="message_div function_list">'	
								   			+ '<textarea maxlength="30" class="form-control message-textarea" rows="1" onkeyup="autogrow(this)" placeholder="留言最大30字數....."></textarea>'
											+ '<a type="button" class="btn btn-link"><i class="fa fa-tag fa-2x" aria-hidden="true"></i></a>'
								   			+ '<a type="button" class="btn btn-link likethis"><span class="_soakw coreSpriteHeartOpen"></span></a>'
									   		+ '<a><span class="badge countLike">0</span></a>'
								   			+ '<button type="button" class="btn song btn-primary pull-right" >送出留言</button>'
								   			+ '</div>'
								   			+ '</div>'
								   			+ '</li>')

		   								//新增日誌後清除內容
										$('.timeline-panel').fadeIn(2200);
			    						$('#content').val('');
										$('#uploadfile').val('');
										$('img.preview').attr('src','');
										
										// 公開狀態改回預設
										var selectA = $('div.insertjournal').find('div.statusSelect>a');
										$('#openStatus').attr('data-val','1')
		   								selectA.find('span:first').text(' 公開');
										selectA.find('i').removeClass().addClass('fa fa-share-alt');
											
										
		   								$('.username').editable({
		   							     rows:3
		   								});  // 編輯個人日誌的內容
		   	    												
								},error: function(){
									alertify.alert('檔案格式異常').set('title', '警告');
								}
							})	
						}
					})
					
		
		// 更新公開狀態
		divGrid.on('click', 'div.statusSelect>ul>li>a', function(){
    		var theLi = $(this).parents('li[id]');
    		var openValue = $(this).attr('data-val');
			$.ajax({
				url: "${this_contextPath}/CRFSERVICE/commonJournalControllerBE/updateFlagJournal",
				type: 'POST',
				data: {'journal_Id': theLi.attr('id'),
					'publicStatus':openValue},
				success: function(data){
					if(data){
						// 增加個人日誌狀態編輯按鈕  1:公開  0:限本人  2:朋友  4:刪除 5:停權
						var selectA = theLi.find('div.statusSelect>a');
						if(openValue == 2){
							selectA.find('span:first').text(' 朋友');
							selectA.find('i').removeClass().addClass('fa fa-users');
						}else if(openValue == 0){
							selectA.find('span:first').text(' 限本人');
							selectA.find('i').removeClass().addClass('fa fa-lock');
						}else{
							selectA.find('span:first').text(' 公開');
							selectA.find('i').removeClass().addClass('fa fa-share-alt');
						}
					}else{
						alertify.alert('異常，請洽客服人員').set('title', '警告');
					}
				}
			})
		})

    	// 更新日誌內容
    	function updateJournal(journal_Id, theMemberId, contents, val, theLi){
			$.ajax({
				url: "${this_contextPath}/CRFSERVICE/personalJournalController/updateJournal",
				type: 'POST',
				data: {'journal_Id':journal_Id,
					'member_Id':theMemberId,
					'contents':contents,
					'publicStatus':val},
				success: function(data){
					if(data && val == 4)
						theLi.hide('explode', 1000, function(){theLi.remove()})
						
				}
			})
    	}   	
    	// 移除篇此日誌
    	divGrid.on('click','button.removeJournal',function(){
    		var theLi = $(this).parents('li');
    		var journal_Id = $(this).parents('li').attr('id');
    		var theContents = $(this).nextAll('div.timeline-body').find('p:nth-child(2)').text();
    		alertify.confirm().set('title', '警告');
    		alertify.confirm('確認刪除此日誌',function(e){
    			if(e){
		    		updateJournal(journal_Id, "${LoginOK.member_Id}", theContents, 4, theLi);
    			}else{
//     				console.log(e)
    			} 
    		});
    	})
    	
    	//edit Contents
		divGrid.on('click','a.username',function(){
			var theLi = $(this).parents('li');
			var contexts = $(this);
			var journal_Id = theLi.attr('id');
			var openStatus = theLi.find('select.statusSelect');
			$('.form-inline').submit(function(){
				$.ajax({
					url: "${this_contextPath}/CRFSERVICE/personalJournalController/updateJournalcontents",
					type: 'POST',
					data: {'journal_Id':theLi.attr('id'),
						'member_Id':"${LoginOK.member_Id}",
						'contents':contexts.text()},
					success: function(data){
						console.log(data)
					}
				})
			})
		})   	
		//send MessageDetail from enter -------------------------------------
		divGrid.on('keydown', 'textarea.message-textarea', function (event) {
			if (event.keyCode == 13 && !event.shiftKey) {
				var theJournal_Id = $(this).parents('li').attr('id');
				var val = $(this).val();
				if(val.trim().length != 0){
					val = val.replace(/\r?\n/g, '</br> ');
					addMessageDetail($(this), theJournal_Id, "${LoginOK.member_Id}", "${LoginOK.nickname}", val, new Date().getTime());
					$(this).css('height','31');
					$(this).val('')
				}
				return false;
			}
		})
        //send MessageDetail from button
		divGrid.on('click', 'li button[class="btn song btn-primary pull-right"]', function (event) {
		
			var theJournal_Id = $(this).parents('li').attr('id');
			var val = $(this).prevAll('textarea.message-textarea').val()
			if(val.trim().length != 0){
				val = val.replace(/\r?\n/g, '</br> ')
				addMessageDetail($(this), theJournal_Id, "${LoginOK.member_Id}", "${LoginOK.nickname}", val, new Date().getTime());
				$(this).prevAll('textarea.message-textarea').css('height','31');
				$(this).prevAll('textarea.message-textarea').val('');
			}
		})		
		// addMessageDetail ajax -> server 新增留言從最下方開始顯示
    	var addMessageDetail = function(theObj, theJournal_Id, theMember_Id, theNickname, theContent, theMessageTime){
			var messageDiv =  theObj.parents('li').find('div.timeline-footer>div:first');
			$.ajax({
            	url : "${this_contextPath}/CRFSERVICE/messageDetailController/addMessageDetail",
				type : 'post', //get post put delete
				data : {'journal_Id':theJournal_Id,
						'member_Id':theMember_Id,
						'content':theContent},
				success : function(data) {
					if(data){
						var theContentArray=theContent.split("</br>")
						$.each(theContentArray,function(index){
							if(index==0){
								messageDiv.append('<p/>').find('p:last').text(theNickname+": "+ this)
								$('<img  />')
								.attr('src',"${this_contextPath}/CRFSERVICE/memberController/photo/${LoginOK.member_Id}")
								.addClass('img-circle msgPhoto .img-responsive')
								.prependTo(messageDiv.find('p:last'))
							}else{
								messageDiv.append('<p/>').find('p:last').text(this)						
							}
						})
						if(messageDiv.find('p:first').text()=='尚無新留言'){
							messageDiv.find('p:first').text('');
						}
						messageDiv.append('<p/>').find('p:last').text(jQuery.timeago(theMessageTime)).addClass('msgTime')
						messageDiv.next().show().parent().slideDown()
					}
				}
            })
		}
      	//--------------------------------------------------------
            
		// 載入頁面時先顯示3筆留言 thisData[0].journal_Id 最新的留言在最下方
		var loadMessageOne = function(theJournal_Id, theMessage_Id){
    		$.ajax({
    			url: "${this_contextPath}/CRFSERVICE/messageDetailController/getMessageDetail",
				type: 'GET',
				data: {'journal_Id':theJournal_Id,
					'message_Id':theMessage_Id},
				success: function(data){
					var messageDiv = $('#'+theJournal_Id).find('div.timeline-footer>div:first');
					if(0 != data.length){
						$.each(data, function(idx,Obj){
							var theNickname = this[1];
							var theContentArray = this[0].content.split("</br>")
							var theDiv = $('<div>').val(this[0].message_Id)
							$.each(theContentArray,function(index){
								var thP1 = $('<p>')
								if(index==0){
									thP1.text(theNickname+": "+ this);
									$('<img src="${this_contextPath}/CRFSERVICE/memberController/photo/'+Obj[0].member_Id+'" />')
									.addClass('img-circle msgPhoto .img-responsive')
									.prependTo(thP1)
								}else{
									thP1.text(this)
								}
								theDiv.append(thP1)
							})
							var thP2 = $('<p>')
							thP2.text(jQuery.timeago(this[0].messageTime)).addClass('msgTime')
							theDiv.append(thP2)
							messageDiv.prepend(theDiv)
						})
					}
					// 尚無留言 或留言數 不滿三則
					var theLi = $('#'+theJournal_Id);
					if(data.length == 0 && theMessage_Id == 0){
						theLi.find('div.timeline-footer').hide();
						theLi.find('div.viewmessages').hide();
					}else if(data.length < 3 && theLi.find('div.timeline-footer').is(':visible')){
						theLi.find('div.viewmessages').hide();
					}else if(data.length < 3 && theLi.find('div.timeline-footer').is(':hidden')){
						messageDiv.next().show().parent().slideDown()
						theLi.find('div.viewmessages').slideUp()
					}else{
						messageDiv.next().show().parent().slideDown()
					}
				}
			}) // ajax 顯示留言
    	}
      	
      	// 加好友
      	$('body').on('click','button.addfriend', function(){
			alertify.confirm('確認加此好友', function(e) {				$.ajax({
					url:"${this_contextPath}/CRFSERVICE/friendships/addFriends",
					type:'post',
					data:{'member_Id': "${LoginOK.member_Id}",
						'friend_Id': "${pageContext.request.queryString}"},
					success:function(data){
						if(data){
// 							alertify.alert('已申請').set('title', '訊息');
							$('#personal_profile').find('button.addfriend').text('不等了，取消申請')
							.removeClass('addfriend').addClass('canceladdfriend');
							
							 var msg = JSON.stringify({'userID':"${LoginOK.member_Id}",'friendId':"${pageContext.request.queryString}", 'type':'4','myName':"${LoginOK.nickname}"});  
					         ws.send(msg);
						}else{
							alertify.alert('異常，請洽客服人員').set('title', '警告');
						}
					}				})			}).set('title', '想加好友嗎');
		})
		
        // acceptfriend 接受成為好友
        $('body').on('click','button.acceptfriend', 
        function (){
      		$.ajax({
      			url:"${this_contextPath}/CRFSERVICE/friendships/acceptFriend",
      			type:'post',
      			data:{'member_Id': "${LoginOK.member_Id}",
					'friend_Id': "${pageContext.request.queryString}"},
				success:function(data){
					if(data){
						$('#personal_profile').find('button.acceptfriend').text('傳送訊息給他')
						.removeClass('btn-info acceptfriend').addClass('btn-primary')
					}else{
						alertify.alert('異常，請洽客服人員').set('title', '警告');
					}
				}
      		})
      	})
      	
      	// 取消申請，或刪除好友
      	$('body').on('click', 'button.canceladdfriend', function(){
      		$.ajax({
      			url:"${this_contextPath}/CRFSERVICE/friendships/deleteFriend",
      			type:'post',
      			data:{'member_Id': "${LoginOK.member_Id}",
					'friend_Id': "${pageContext.request.queryString}"},
      			success:function(data){
      				if(data){
      					alertify.alert('取消成功').set('title', '訊息');
      					$('#personal_profile').find('button.canceladdfriend').text('加為好友')
      					.removeClass('canceladdfriend').addClass('addfriend');
      				}else{
      					alertify.alert('異常，請洽客服人員').set('title', '警告');
      				}
      			}
      		})
      	})
      	
		// 上傳日誌時預覽圖片
      	$('#uploadfile').on('change', function(){
      		if(this.files && this.files[0]){
      			var reader = new FileReader();
      			reader.onload = function(e){
      				$('img.preview').attr('src',e.target.result)
      			}
      			reader.readAsDataURL(this.files[0]);
      		}
      	})
      	
			//傳訊息給好友
			$('body').on('click','.chat_for_friend',function(){	
				if(!($('#${pageContext.request.queryString}').html())){	
					bodyappend("${pageContext.request.queryString}",$('#usernickanme').text());//用框架裡bodyappend 增加聊天室
					IsReadThree("${pageContext.request.queryString}")//用框架裡IsReadThree 增加已讀三則	
				}
				
			})
      	
//       	//查詢好友狀態
//     function thedata(xxxx){
//       		var thedata= $.ajax({
// 				url:"${this_contextPath}/CRFSERVICE/friendships/findFriendFlag",
// 				type:'get',
// 				data:{'member_Id': "${LoginOK.member_Id}",
// 					'friend_Id': "${pageContext.request.queryString}"},
// 				success: function(data){
// 					xxxx(data)
// // 					console.log("a:"+data)
// // 					return data;
// 				}
// 			})
//       	}
		
	});
</script>
</c:if>
	<!--  頁面部分 結束 -->
	
<!-- 	TEXT自動擴行 -->
	<script>
		function autogrow(textarea) {
			var adjustedHeight = textarea.clientHeight;
			adjustedHeight = Math.max(textarea.scrollHeight, adjustedHeight);
			if (adjustedHeight > textarea.clientHeight) {
				textarea.style.height = adjustedHeight + 'px';
			}
		}
		
		jQuery(function($){ 
			var wimgSrc='${this_contextPath}/CRFSERVICE/memberController/photo/${LoginOK.member_Id}'
			
			$("body").on("click",'#clickchangehead',function(){
				$('#changehead').modal('toggle');				
				var options =
		        {
		            imageBox: '.imageBox',
		            thumbBox: '.thumbBox',
		            spinner: '.spinner',	    
		            imgSrc: wimgSrc
		        }
		        var cropper = new cropbox(options);
		        document.querySelector('#file').addEventListener('change', function(){
		            var reader = new FileReader();
		            reader.onload = function(e) {
		                options.imgSrc = e.target.result;
		                cropper = new cropbox(options);
		            }
		            reader.readAsDataURL(this.files[0]);
		            this.files = [];
		        })
		        document.querySelector('#btnCrop').addEventListener('click', function(){
		            var img = cropper.getDataURL(); 
		            //換大頭貼
		            changePhoto(img)
// 		            document.querySelector('.cropped').innerHTML += '<img src="'+image+'">';
		        })
		        //變大
		        document.querySelector('#btnZoomIn').addEventListener('click', function(){
		            cropper.zoomIn();
		        })
		        //變小
		        document.querySelector('#btnZoomOut').addEventListener('click', function(){
		            cropper.zoomOut();
		        })
			})
			//換大頭貼
			function changePhoto(img){
				$.ajax({
          			url:"${this_contextPath}/CRFSERVICE/memberController/insertphoto",
          			type:'post',
          			data:{'member_ID':'${LoginOK.member_Id}',
          				'photo1':img},
          			success:function(data){   
          				$('#file').val('').empty();
          				$('#changhead').modal('hide');
          				alertify.alert('大頭貼已更換').set('title','完成'); 
          				var  myimg= $('img[src="'+wimgSrc+'"]')	
          				for(var i=0;i<myimg.length;i++){	
          						myimg.attr('src',img)	
          					}
          				wimgSrc=img;
          		}
          		})	
			}			
			$("body").on("click",'.likethis',function(){
				var theclick = $(this);
				var likenum=theclick.next().find('.countLike');
				var count=parseInt(likenum.text());	
				
				var tset= theclick.find('span').hasClass("coreSpriteHeartFull");
				if(!tset){
					$.ajax({
						url:"${this_contextPath}/CRFSERVICE/laudationcontroller/laudationjournal",
						type: "post",
						data:{
							journal_Id:$(this).parents('li').attr('id'),
							lauded_Id:'${LoginOK.member_Id}'
						},
						success:function(data){
							theclick.find('span').toggleClass("coreSpriteHeartFull"),
							count+=1
							likenum.text(count)
						}							
					})	
					
				}else{
					$.ajax({
						url:"${this_contextPath}/CRFSERVICE/laudationcontroller/laudationjournalcancel",
						type: "post",
						data:{
							journal_Id:$(this).parents('li').attr('id'),
							lauded_Id:'${LoginOK.member_Id}'
						},
						success:function(data){
							theclick.find('span').toggleClass("coreSpriteHeartFull")
							count-=1
							likenum.text(count)
						}				
					})						
				}
			})

		})				
		
		
		
	</script>

	<script src="${this_contextPath}/js/personal_head.js"></script>
	<script src="${this_contextPath}/js/personal_journal.js"></script>
<%-- 	<script src="${this_contextPath}/js/alertify.js"></script> --%>
	<script src="${this_contextPath}/js/bootstrap-editable.js"  ></script>
	<script src="${this_contextPath}/js/jquery.fs.boxer.js"  ></script>
	<script src="${this_contextPath}/js/jquery.alertable.js" ></script>
	<script src="${this_contextPath}/js/jAlert-v4.js" ></script>
	<script src="${this_contextPath}/js/jAlert-functions.js"></script>
	<script src="${this_contextPath}/js/velocity.min.js" ></script>
	<script src="${this_contextPath}/js/velocity.ui.min.js" ></script>
	
</body>
</html>
