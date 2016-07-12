<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="title" value="" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">

<jsp:include page="/CRFitness.jsp" />
<title>${LoginOK.nickname}的個人日誌</title>

<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/personal_journal.css" />


</head>

<body >

<!-- 	判斷登入者和 queryString 是否相同, 若相同才可修改  -->
<!-- 將顯示內容放置到aside -->
<aside> 
<c:if test="${! empty LoginOK}">
<div class="row">
			<div class="col-md-2 col-xs-1"></div>
		<div class="col-md-6 col-xs-10">
			<div class="page-header text-center">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" >新增個人日誌</button>
				<button onclick="showJournal()">編輯</button>
			</div>
			<ul class="timeline" id="grid">
			
			</ul>
		</div>
		<div class="col-md-4 col-xs-2">
		<h3>揪團要塞這邊</h3>
		<div id="myactivity_create_tbody"></div>
		</div>
		
		<!-- 抓取使用者建立的揪團  開始-->
                 <script type="text/javascript">
                     $(function () {
                         $.ajax({
                             url:"${this_contextPath}/CRFSERVICE/activitysController/${LoginOK.member_Id}",
                             type:'get',  //get post put delete
                             data:{},
                             success:function(data){
                                 $.each(data,function(){
                                     $('#myactivity_create_tbody').append(
                                    	'<tr><td><a href="${this_contextPath}/activitydetail.jsp?'
                                    	+this.member_Id+'" >'
                                    	+'<img src="data:image/png;base64,'
                                    	+this[0].photo1+'" class="" alt="Responsive image" /></a>'
                                    	+'<td class="">'
                                    	+this[0].activity_Class +'</td><td>'
                                    	+this[0].activity_Area +'</td>')  
                                 })
                             }          	 
                         })
                     })
                 </script > 
		<!-- 抓取使用者建立的揪團  結束-->
                             
		
	<div class="col-md-4 col-xs-1"></div>	
	<%-- 	<img  id="imgloading" src="${this_contextPath}/images/cube.gif" style="display: none"> --%>
</div>
	<!-- 頁面部分 開始-->
	
	<!-- 	新增個人日誌開始       -->
<c:if test="${LoginOK.member_Id == pageContext.request.queryString or pageContext.request.queryString == null}">

<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" >新增個人日誌</button> -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="exampleModalLabel">新增個人日誌</h4>
      </div>
      <div class="modal-body">
          
		<form role="form" action="" method="post" >
<!-- 		  <div class="form-group"> -->
<!-- 		    <label for="category">類別</label> -->
<!-- 		    <input type="text" class="form-control" id="category" placeholder="類別"> -->
<!-- 		  </div> -->
		  <div class="form-group">
		    <label for="content">內容</label>
		    <input type="text" class="form-control" id="content" placeholder="內容輸入在此">
		  </div>

		  <div class="form-group">
		    <label for="openStatus">公開狀態</label>
		    <select id="openStatus">
			    <option value="1" >公開</option>
			    <option value="2" >朋友</option>
			    <option value="0" >限本人</option>
		    </select>
		  </div>
		  <div class="form-group">
		    <label for="uploadfile">檔案上傳</label>
		    <input id="uploadfile" type="file" multiple="multiple" >
		    <p class="help-block">在此示範區塊層級輔助說明文字。</p>
		  </div>
		<div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button id="sendBtn" type="button" class="btn btn-primary">送出</button>
	    </div>
		</form>
<!--         form over -->
      </div>
    </div>
  </div>
</div>

<!-- -------------------------------- -->
</c:if>
</aside>
<!-- 	新增個人日誌結束 -->
	<script type="text/javascript">
	function updateJournal(var1){console.log('updateJournal '+var1)};
	var member_Id = "${LoginOK.member_Id}";
	
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
    	var theMemberId = "${LoginOK.member_Id}";
        var friendId = "${pageContext.request.queryString}";
        var titleNickName;
        //	標記本頁日誌是否會員自己
        var mySelf = true;
        // 	先查詢自己所有好友名單
    	$.ajax({
            url:"${this_contextPath}/CRFSERVICE/friendships/${LoginOK.member_Id}",
            type:'get',  //get post put delete
            data:{},
            success:function(data){
				//------------------------- 判斷是否好友-------------------------
            	$.each(data,function(){
						// console.log(data);
            		if(this.member_Id === friendId){
            			theMemberId = this.member_Id;
            			titleNickName = this.nickname;
            			mySelf = false;
            			return false;
            		}else{
            			titleNickName = "${LoginOK.nickname}";
            		}
				})
				

				// 日誌titleNickName
				$('#titleNickName').text(titleNickName+'的日誌');
				// 查詢日誌開始-------------------------
   				$.ajax({
				url : "${this_contextPath}/CRFSERVICE/personalJournalController/showJournal",
				type : 'get', //get post put delete
				data : {member_Id : theMemberId},
				success : function(data) {
// 					var x=0;
// 					console.log(data);
					
					$.each(data,function(index) {
						var jdate_int = parseInt(this.publishTime); //轉換成數字
						var jdate_value = new Date(jdate_int);
				    	var  invert; 
				    	var li_direction;

				    	if(index%2==0){
				    		li_direction='<li value="'+ this.journal_Id +'">';
				    		invert='<i class="glyphicon glyphicon-record " '
				    	}else{
				    		li_direction='<li value="'+ this.journal_Id +'" class="timeline-inverted" >';
				    		invert='<i class="glyphicon glyphicon-record invert" '	
				    	}
						

							//顯示查詢日誌
						$('#grid').append(
					    	li_direction
					    	+ '<div class="timeline-badge primary"><a>'
					    	+ invert 	
		// 			    	↓title塞入時間日期
					    	+ 'rel="tooltip" title="於 '+jdate_value.Format("yyyy-MM-dd hh:mm")+' 建立" id="I5"></i></a></div><div class="timeline-panel">'
					    	+ '<div class="timeline-heading"><a href=""><img class="img-responsive" src="data:image/png;base64,'
					    	+ this.archives+'" /></a></div>'
					    	+ '<div class="timeline-body">'
					    	+ 'id:'+this.memberVO.member_Id  // 上線前要拿掉或改暱稱
					    	+ '<br />類別：'
				   			+ this.contents
				   			+ '<br />內容：'
				   			+ this.contents
				   			+ '<br />日期：'
				   			+ jdate_value.Format("yyyy-MM-dd hh:mm:ss")
				   			+ '</div>'
				   			+ '<div class="timeline-footer">塞留言的地方</div>'
				   			+ '</div>'
				   			+ '</li>'
// 						 	+ '<li class="clearfix" style="float: none;">'
				   			)

	    			


						
						// 增加個人日誌狀態編輯按鈕  1:公開  0:限本人  2:朋友
						if(mySelf){
							var eleS = $('<br/><select />').bind('change',this,function(){
								$.ajax({
									url: "${this_contextPath}/CRFSERVICE/personalJournalController/updateJournal",
									type: 'POST',
									data: {'journal_Id':arguments[0].data.journal_Id,'member_Id':theMemberId,'contents':arguments[0].data.contents,'publicStatus':$(this).val()},
									success: function(data){
										console.log(data);
									}
								})
							});
							var publicStatus = ['限本人','公開','朋友'];
							for(var i =0;i<3;i++){
								if(parseInt(this.publicStatus) === i){
									$('<option />',{value:i,text:publicStatus[i],selected:true}).appendTo(eleS);
								}else{
									$('<option />',{value:i,text:publicStatus[i]}).appendTo(eleS);
								}
							}
    						$('#grid>li div[class="timeline-body"]:last').append(eleS);
// 							var y=x;
// 							$('#datass'+x).click(function(){   									
// 								console.log(data[y])
// 							})
// 							x++;
 						}
						
						// 留言功能-------------------------------------------------------
// 						if(this.messageDetailVOs.length != 0){
							var eleMessageA = $('<a></a>',{text:'查看更多留言'}).bind('click',this, function(){	
								var thisData = arguments[0].data;
							
								// 顯示留言
								$.each(thisData.messageDetailVOs, function(index,ele){
				        			 $('#grid>li[value="'+thisData.journal_Id+'"]').append(
				        					 '<div class="col-md-6"><hr/>#'+(index+1)
				        					 +'<br>留言人:'+this.member_Id
				        					 +'<br>留言內容:'+this.content
				        					 +'<br>時間:'+new Date(this.messageTime).Format('yyyy-MM-dd hh:mm:ss')	
				        					 +'</div>'
				        			 );
								})
							})
							$('#grid>li div[class="timeline-footer"]:last').append(eleMessageA);
							
// 						}
  					})
  					
  					$('#grid').append('<li class="clearfix" style="float: none;">');
	    						}


	    					//	                       ,beforeSend:function(){
	    					//	                             $('#imgloading').show();
	    					//	                           },
	    					//	                           complete:function(){
	    					//	                         	 $('#imgloading').hide();
	    					//	                           }        	

	    					})
						}
					})
					

					// 新增個人日誌送出的click事件==================================
					$('#sendBtn').click(function(){
						var formData = new FormData();
						var file = $('#uploadfile').prop("files")[0];
					//	var category = $('#category').val();  // 類別是??
					
						var contents = $('#content').val();
						var publishTime = new Date().Format('yyyy-MM-dd hh:mm:ss');
						var publicStatus = $('#openStatus').val();
						formData.append('archives', file);
						formData.append('member_Id', member_Id);
						formData.append('contents', contents);
						formData.append('publishTime', publishTime);
						formData.append('publicStatus', publicStatus);
						

						if(file === undefined){
							alert('請選擇一個檔案');
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
			    						var myNickName = "${LoginOK.nickname}";
			    						$('#grid>li:nth-child(1)').before(
			    						'<li value="'+ this.journal_Id +'"><a href=""><img src="data:image/png;base64,'
			    						+data.archives+'" /></a>'
				    						+'id:'+ myNickName // 上線前要拿掉或改暱稱
			    						+ '<br />類別：'
		   								+ data.contents
		   								+ '<br />內容：'
		   								+ data.contents
		   								+ '<br />日期：'
		   								+ jdate_value.Format("yyyy-MM-dd hh:mm:ss")
// 		   								+ '<br/><button>編輯</button>'
		   								+ '</li>')
		   								

		   								// 新增的日誌公開狀態change功能
		   								var eleS = $('<br/><select />').bind('change',data,function(){
// 		   									console.log(arguments[0].data)
		   									$.ajax({
		   										url: "${this_contextPath}/CRFSERVICE/personalJournalController/updateJournal",
		   										type: 'POST',
		   										data: {'journal_Id':arguments[0].data.journal_Id,'member_Id':theMemberId,'contents':arguments[0].data.contents,'publicStatus':$(this).val()},
		   										success: function(data){
		   											console.log(data);
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
		   	    						$('#grid>li:nth-child(1)').append(eleS);
		   	    						
// 		    							$('#grid>li:nth-child(1)').on('click',' :button',data,function(){
// 		   									console.log(arguments.length);
// 		   									console.log(arguments[0].data);
// 		   								});	
							

								}
								
							})
	
						}

						
					});
        			/*
					 * 	private String journal_Id;				//日誌編號
					 
						private String member_Id;				//會員編號
						private byte[] archives;				//影音圖檔
						private String contents;				//日誌內容
						private Timestamp publishTime;		//發表日誌時間
						private Integer publicStatus;			//是否公開(狀態)
					 */
				})
				
				

	</script>
	

</c:if>
	<!--  頁面部分 結束 -->
	
	<script src="${this_contextPath}/js/personal_journal.js"></script>	
	
</body>
</html>