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
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/alertify.css"  />
<link rel="stylesheet" href="${this_contextPath}/css/bootstrap-editable.css"> <!-- 檔案上傳 -->
<link rel="stylesheet" href="${this_contextPath}/css/jquery.fs.boxer.css">
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jquery.alertable.css">  
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jAlert-v4.css">  

<style>
/* aside 
 {  
  	background-color: #F5F5F5; 
 } */
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
	width: 12px;
    height: 12px;
    margin-right: 5px;
}
#grid a{ 
	cursor: pointer;
}

.timeline-footer>div>div{
	padding-bottom: 5px;
}

.msgTime {
	color:#BEBEBE;
	font-size: 10px;
}

/* 為了非本人顯示揪團創建的 */
.jouranl_activity{
display:block;
max-width:100%;

width: 60px;
height: 60px;
padding: 0px;
margin: 0px;

display:inline-block;
}

.divideline{
margin: 5px;
}
.jouranl_activity_div{

}

</style>

</head>

<body >

<!-- 將顯示內容放置到aside -->
<c:if test="${! empty LoginOK}">
<aside> 
<div class="row">
			<div class="col-md-2 "></div>
				<div class="col-md-8 col-xs-12" >
					<div class="col-md-8 col-xs-8">
						<div class="page-header text-center" id="inster_journal">
						<!-- 新增日誌按鈕位置 -->
						</div>
						<ul class="timeline" id="grid">

						</ul>
					</div>
					<div class="col-md-4 col-xs-4" id="personal_activity">

					</div>
				</div>
				<div class="col-md-2"></div>
	<%-- 	<img  id="imgloading" src="${this_contextPath}/images/cube.gif" style="display: none"> --%>
</div>
	<!-- 頁面部分 開始-->
<c:if test="${LoginOK.member_Id != pageContext.request.queryString}">
<script>


jQuery(function($){
//進入好友頁面揪團活動
 $.ajax({
	 url:"${this_contextPath}/CRFSERVICE/activitysController/friendActivitys/${LoginOK.member_Id}",
     type:'get',  //get post put delete
     data:{},
     success:function(data){
    	 $('#personal_activity').append(
				 '<ul class="nav nav-tabs" role="tablist" id="myTab">'
				+'<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">'+"選取的會員"+"參加的揪團"+'</a></li>'
				+'</ul>'
				+'<div class="tab-content">'
				+'<div role="tabpanel" class="tab-pane active" id="home">'
				+'<ul class="event-list" id="myactivity_personal">'
				+'</ul>'
				+'</div>'	
				+'</div>'
					);   	 
    	 var c=1;                            	
         $.each(data,function(){
//          	 console.log(this[1].activity_Id)
				var jdate_int = parseInt(this[1].activity_Day); //轉換成數字
				var jdate_value = new Date(jdate_int);
				var jdate_int2 = parseInt(this[1].deadline);                          //轉換成數字
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
			+this[1].activity_Id+'.jpg" class="lightbox_image boxer" data-lightbox-gallery="image_gallery" rel="gallery" title="發起人：'
			+this[2]+"<i class='fa fa-commenting-o img-responsive' aria-hidden='true'></i>"
			+'<br />類別：'+this[1].activity_Class+'<br />地區：'
			+this[1].activity_Area+'<br />內容：'
			+this[1].activity_Info+'<br />活動時間：'
			+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />報名截止日：'
			+jdate_value_deadline.Format("yyyy-MM-dd hh:mm:ss")
			+"<button class='alert-vel btn btn-theme submit_x' style='float:right' type='submit' value='INSERT_MEMBER'>參加活動</button>" 
			+"<div hidden='hidden'>"+this[1].activity_Id
			+'</div>"><span title=""><img src="${this_contextPath}/images/activitys/'
			+this[1].activity_Id+'.jpg" class="jouranl_activity" alt="Independence Day" /></span></a>'
			
			+'<div style="text-align : center;">'+this[1].activity_Class+this[1].activity_Area+'</div>'
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
//	    				   alert('已額滿')
    				   $("#boxer-overlay").remove();
    				   $("#boxer").remove();
    				   $('body').toggleClass();		
    				     			
    				   errorAlert('殘念', '已額滿');
    				   
//	    				   $.alertable.alert(data[0]);
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
})
</script>
</c:if>
	<!--   ├─判斷是是個人日誌頁面還是好友開始─┤    --><!-- 	判斷登入者和 queryString 是否相同, 若相同才可修改  -->
<c:if test="${LoginOK.member_Id == pageContext.request.queryString or pageContext.request.queryString == null}">
<script type="text/javascript">

 					
 					
 					$('#inster_journal').append(
							'<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">'+"新增個人日誌"+'</button>'
 							);
 					
 					$('#personal_activity').append(
 							'<ul class="nav nav-tabs" role="tablist" id="myTab">'
							+'<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">'+"建立的揪團"+'</a></li>'
							+'<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">'+"參加的揪團"+'</a></li>'
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
                            	 var c=1;                            	
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
                                    	+'<div style="text-align : center">'+this[0].activity_Class+'<hr class="divideline"/>'+this[0].activity_Area 
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
                            	 var c=1;                            	
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
                                    	+'<div style="text-align : center">'+this[0].activity_Class+this[0].activity_Area 
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
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="exampleModalLabel">新增個人日誌</h4>
							</div>
							<div class="modal-body">

								<form role="form" action="" method="post">
<!-- 									<div class="form-group"> -->
<!-- 										<label for="category">類別</label> <input type="text" -->
<!-- 											class="form-control" id="category" placeholder="類別"> -->
<!-- 									</div> -->
									<div class="form-group">
										<label for="content">內容</label> <textarea  class="form-control" id="content" placeholder="內容輸入在此"></textarea>
									</div>

									<div class="form-group">
										<label for="openStatus">公開狀態</label> <select id="openStatus">
											<option value="1">公開</option>
											<option value="2">朋友</option>
											<option value="0">限本人</option>
										</select>
									</div>
									<div class="form-group">
										<label for="uploadfile">檔案上傳</label> <input id="uploadfile"
											type="file" multiple="multiple">
										<p class="help-block">在此示範區塊層級輔助說明文字。</p>
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

</aside>

<!-- 	新增個人日誌結束 -->

<script type="text/javascript">
	function diffTime(beforeTime){
		var diffTime1 = new Date().getTime() - beforeTime;
		var s = 1000;
		var m = 60*s;
		var h = 60*m;
		var day = 24*h;
		var theday = Math.floor(diffTime1/day)
		var theH = Math.floor(diffTime1%day/h)
		diffTime1 %= h;
		var theM = Math.floor(diffTime1/m)
// 		console.log(diffTime1%m)
		var theS = diffTime1%60;
// 		console.log(theday+','+theH+','+theM +','+theS)
		if(theday > 0)
			beforeTime2 = theday + '天前'
		else if(theH > 0)
			beforeTime2 = theH + '小時前'
		else if(theM > 0)
			beforeTime2 = theM + '分鐘前'
		else if(theS > 0)
			beforeTime2 = '剛剛'
		
		return beforeTime2
		
	};
	
	
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
        var friendId = "${pageContext.request.queryString}";
        var divGrid = $('#grid');

        var mySelf = true;  //	標記本頁日誌是否會員自己
		// 先查詢自己所有好友名單
    	$.ajax({
            url:"${this_contextPath}/CRFSERVICE/friendships/${LoginOK.member_Id}",
            type:'get',  //get post put delete
            data:{},
            success:function(data){
//  ------------------ 判斷是否好友------------------
            	$.each(data,function(){
            		if(this.member_Id === friendId){
            			theMemberId = this.member_Id;
            			titleNickName = this.nickname;
            			mySelf = false;
            			return false;
            		}else{
            			titleNickName = "${LoginOK.nickname}";
            		}
				}) 
// 	----------------------------------------------
										
				// 日誌titleNickName
				$('#titleNickName').text(titleNickName+'的日誌');

				// 查詢日誌開始-------------------------
   				$.ajax({
					url : "${this_contextPath}/CRFSERVICE/personalJournalController/showJournal",
					type : 'get', //get post put delete
					data : {member_Id : theMemberId},
					success : function(data) {
						$.each(data,function(index) {
							var jdate_int = parseInt(this[0].publishTime); //轉換成數字
							var jdate_value = new Date(jdate_int);
					    	var invert; 
					    	var li_direction;
					    	var thejournal_Id=this[0].journal_Id
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
// 					    	+ '<button type="button" title="移除此篇日誌" class="close fa-2x" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
					    	+ '<div class="timeline-heading"><a href=""><img class="img-journal" src="data:image/png;base64,'
					    	+ this[0].archives+'" /></a></div>'
					    	+ '<div class="timeline-body">'
					    	+'<p>'+this[1]+'</p><br />'  // 上線前要拿掉或改暱稱
				   			+ '<p class="userContents"></p>'
				   			+ '<p >日期：'
				   			+ jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</p>'
				   			+ '<br /><select class="statusSelect" hidden="hidden" /></div>'
				   			+ '<div class="timeline-footer">'
// 				   			  '留言塞這裡'
				   			+ '<div></div><div></div></div>'
				   			+ '<div  class="col-md-12 viewmessages"></div>'
				   			+ '<div class="message_div function_list">'	
// 				   			class="form-control"
				   			+ '<textarea maxlength="30" class="form-control message-textarea" rows="1" onkeyup="autogrow(this)" placeholder="留言最大30字數....."></textarea>'
// 				   			class="btn btn-primary pull-right"

							+ '<a class="btn btn-link"><i class="fa fa-tag fa-2x" aria-hidden="true"></i></a>'
				   			+ '<a class="btn btn-link likethis"><span class="_soakw coreSpriteHeartOpen" ></span></a>'
				   			+ '<a><span class="badge countLike" ></span></a>'
				   			+ '<button type="button" class="btn btn-info pull-right" >送出留言 </button>'

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
							// 增加個人日誌狀態編輯按鈕  1:公開  0:限本人  2:朋友  4:刪除
							var eleS = $('select.statusSelect:last').bind('change',this,function(){
								updateJournal(arguments[0].data[0].journal_Id, "${LoginOK.member_Id}",arguments[0].data[0].contents,$(this).val())
							})
							var publicStatus = ['限本人','公開','朋友'];
							for(var i =0;i<3;i++){
								if(parseInt(this[0].publicStatus) === i){
									$('<option />',{'value':i,'text':publicStatus[i],'selected':true}).appendTo(eleS);
								}else{
									$('<option />',{'value':i,'text':publicStatus[i]}).appendTo(eleS);
								}
							}
							eleS.show();
							
							// 移除個人日誌按鈕
							divGrid.find('div.timeline-panel:last')
							.prepend('<button type="button" title="移除此篇日誌" class="close fa-2x" aria-label="Close"><span aria-hidden="true">&times;</span></button>')							
							divGrid.find('p.userContents:last').text(this[0].contents).wrap('<a href="#" class="username" data-type="textarea" data-placement="right" ></a>')
 						}else{
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
// 					divGrid.find('div.timeline-footer>div:nth-child(2)').append(eleMessageA2);

					$('.username').editable({
					     rows:3
					});  // 編輯個人日誌的內容
  					$('#grid').append('<li class="clearfix" style="float: none;">'); // 顯示中間時間軸的線
	    			}
	    		})
	    		//ajax 查詢日誌結束
			}
		})
					// 新增個人日誌送出的click事件==================================
					$('#sendBtn').click(function(){
						var formData = new FormData();
						var file = $('#uploadfile').prop("files")[0];
					//	var category = $('#category').val();  // 類別是??	 好像沒有設定類別欄位 			
						var contents = $('#content').val();
						var publishTime = new Date().Format('yyyy-MM-dd hh:mm:ss');
						var publicStatus = $('#openStatus').val();
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
									$('#exampleModal').modal('toggle');
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
			    						
			    						// 顯示新增
										$('#grid>li:nth-child(1)').before(
									    	li_direction
									    	+ '<div class="timeline-badge primary"><a>'
									    	+ invert 	
									    	+ 'rel="tooltip" title="於 '+jdate_value.Format("yyyy-MM-dd hh:mm")+' 建立" id="I5"></i></a></div><div hidden="hidden" class="timeline-panel" id="remove_journal">'
									    	+ '<button type="button" title="移除此篇日誌" class="close fa-2x" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
									    	+ '<div class="timeline-heading"><a href=""><img class="img-journal" src="data:image/png;base64,'
									    	+ data.archives+'" /></a></div>'
									    	+ '<div class="timeline-body">'
									    	+'<p>'+ "${LoginOK.nickname}" +'</p>'  // 上線前要拿掉或改暱稱
								   			+ '<p>內容：'+ data.contents +'</p>'
								   			+ '<p >日期：'
								   			+ jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</p>'
								   			+ '<br/><select class="statusSelect" /></div>'
								   			+ '<div hidden="hidden" class="timeline-footer">'
											// 	'留言塞這裡'
								   			+ '<div></div><div></div></div>'
								   			+ '<div  class="col-md-12 viewmessages"></div>'
								   			+ '<div class="message_div function_list">'	
								   			+ '<textarea maxlength="30" class="form-control message-textarea" rows="1" onkeyup="autogrow(this)" placeholder="留言最大30字數....."></textarea>'
											+ '<a type="button" class="btn btn-link"><i class="fa fa-tag fa-2x" aria-hidden="true"></i></a>'
								   			+ '<a type="button" class="btn btn-link likethis"><span class="_soakw coreSpriteHeartOpen"></span></a>'
								   			+ '<button type="button" class="btn btn-info pull-right" >送出留言</button>'
								   			+ '</div>'
								   			+ '</div>'
								   			+ '</li>')

		   								//新增日誌後清除內容
										$('.timeline-panel').fadeIn(2200);
			    						$('#content').val('')
										$('#uploadfile').val('')
										$('#openStatus').find('option:selected').prop('selected',false)
										
		   								// 新增的日誌公開狀態change功能
		   								var eleS = $('#grid>li:nth-child(1)').find('select.statusSelect').bind('change',data,function(){
		   									$.ajax({
		   										url: "${this_contextPath}/CRFSERVICE/personalJournalController/updateJournal",
		   										type: 'POST',
		   										data: {'journal_Id':arguments[0].data.journal_Id,'member_Id':theMemberId,'contents':arguments[0].data.contents,'publicStatus':$(this).val()},
		   										success: function(data){
		   										}
		   									})
		   								});
		   								var publicStatusArray = ['限本人','公開','朋友'];
		   								for(var i =0;i<3;i++){
		   									if(parseInt(publicStatus) === i){
		   										$('<option />',{value:i,text:publicStatusArray[i],selected:true}).appendTo(eleS);
		   									}else{
		   										$('<option />',{value:i,text:publicStatusArray[i]}).appendTo(eleS);
		   									}
		   								}
		   	    						$('#grid>li:nth-child(1) div[class="timeline-body"]:last').append(eleS);						
								}
							})	
						}
					})					 		
    	// 更新日誌狀態
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
						theLi.hide('explode', 2200, function(){theLi.remove()})
						
				}
			})
    	}   	
    	// 移除篇此日誌
    	divGrid.on('click','button[title="移除此篇日誌"]',function(){
    		var journal_Id = $(this).parents('li').attr('id');
    		var theContents = $(this).nextAll('div.timeline-body').find('p:nth-child(2)').text();
    		var theLi = $(this).parents('li');
    		alertify.confirm().set('title', '警告');
    		alertify.confirm('確認刪除此日誌',function(e){
    			if(e){
		    		updateJournal(journal_Id, "${LoginOK.member_Id}", theContents, 4, theLi);
    				}
    			else{console.log(e)} 
    		});
    	})		
    	//edit Contents
		divGrid.on('click','a.username',function(){
			var theLi = $(this).parents('li');
			var contexts = $(this);
			var journal_Id = theLi.attr('id');
			var openStatus = theLi.find('select.statusSelect');
			$('.form-inline').submit(function(){
				updateJournal(theLi.attr('id'), "${LoginOK.member_Id}", contexts.text(), openStatus.val())
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
		divGrid.on('click', 'li button[class="btn btn-info pull-right"]', function (event) {
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
								.attr('src',"${this_contextPath}/images/members/${LoginOK.member_Id}.jpg")
								.addClass('img-circle msgPhoto .img-responsive')
								.prependTo(messageDiv.find('p:last'))
							}else{
								messageDiv.append('<p/>').find('p:last').text(this)						
							}
						})
						if(messageDiv.find('p:first').text()=='尚無新留言'){
							messageDiv.find('p:first').text('');
						}
// 						messageDiv.append('<p/>').find('p:last').text('留言時間: ' + new Date(theMessageTime).Format('yyyy-MM-dd hh:mm:ss'))
						messageDiv.append('<p/>').find('p:last').text('留言時間: ' + diffTime(theMessageTime)).addClass('msgTime')
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
									$('<img src="${this_contextPath}/images/members/'+Obj[0].member_Id+'.jpg" />')
									.addClass('img-circle msgPhoto .img-responsive')
									.prependTo(thP1)
								}else{
									thP1.text(this)
								}
								theDiv.append(thP1)
							})

							var thP2 = $('<p>')

// 							thP2.text('留言時間: ' + new Date(this[0].messageTime).Format('yyyy-MM-dd hh:mm:ss'))
							thP2.text('留言時間: ' + diffTime(this[0].messageTime)).addClass('msgTime')
							theDiv.append(thP2)
							messageDiv.prepend(theDiv)
						})
					}
					// 尚無留言 或留言數 不滿三則
					var theLi = $('#'+theJournal_Id);
					if(data.length == 0 && theMessage_Id == 0){
						theLi.find('div.timeline-footer').hide();
						theLi.find('div.viewmessages').hide();
// 						theLi.find('div.timeline-footer>div:first').append('<p>尚無新留言</p>')
					}else if(data.length < 3 && theLi.find('div.timeline-footer').is(':visible')){
// 						theLi.find('div.timeline-footer').slideUp();
						theLi.find('div.viewmessages').slideUp();
					}else if(data.length < 3 && theLi.find('div.timeline-footer').is(':hidden')){
						messageDiv.next().show().parent().slideDown()
						theLi.find('div.viewmessages').slideUp()
					}else{
						messageDiv.next().show().parent().slideDown()
					}
				}
			}) // ajax 顯示留言
    	}
      	
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
			
			$("body").on("click",'.likethis',function(){
				var theclick = $(this);
				var count=null;

	   	   		$.ajax({
					url:"${this_contextPath}/CRFSERVICE/laudationcontroller/countlike",
					type:"post",
					data:{journal_Id:$(this).parents('li').attr('id')},
					success:function(data){
			 			theclick.next().find('span.countLike').text(data)						
					}					
				})
	   	   			
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
// 							console.log(data)
							theclick.find('span').toggleClass("coreSpriteHeartFull")						
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
							
						}				
					})						
				}
			})
		})
		
		
		
	</script>

	<script src="${this_contextPath}/js/personal_journal.js"></script>
	<script src="${this_contextPath}/js/alertify.js"></script>
	<script src="${this_contextPath}/js/bootstrap-editable.js"  ></script>
	<script src="${this_contextPath}/js/jquery.fs.boxer.js"  ></script>
	<script src="${this_contextPath}/js/jquery.alertable.js" ></script>
	<script src="${this_contextPath}/js/jAlert-v4.js" ></script>
	<script src="${this_contextPath}/js/jAlert-functions.js"></script>
	<script src="${this_contextPath}/js/velocity.min.js" ></script>
	<script src="${this_contextPath}/js/velocity.ui.min.js" ></script>
</body>
</html>