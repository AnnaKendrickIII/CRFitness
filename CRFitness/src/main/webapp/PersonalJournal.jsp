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

<style>
.timeline-footer {
	background-color: #FCFCFC;
}
textarea{
	resize: none;
	
}
.message_div {
	margin-top: 3px;
}

</style>
</head>

<body >

<!-- 	判斷登入者和 queryString 是否相同, 若相同才可修改  -->
<!-- 將顯示內容放置到aside -->
<c:if test="${! empty LoginOK}">
<aside> 
<div class="row">
	<div class="col-md-2 col-xs-1"></div>
		<div class="col-md-6 col-xs-10">
			<div class="page-header text-center">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" >新增個人日誌</button>
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
	// 
	function diffTime(beforeTime){
		var nowTime = new Date();
		var diffTime1 = nowTime.getTime() - beforeTime;
		var s = 1000;
		var m = 60*s;
		var h = 60*m;
		var day = 24*h;
		var theday = Math.floor(diffTime1/day)
		var theH = Math.floor(diffTime1%day/h)
		diffTime1 %= h;
		var theM = Math.floor(diffTime1/m)
		var theS = diffTime1%60;
// 		console.log(theM+','+theS+','+diffTime1)
// 		console.log(theday>0 ? theday+'天' :(theH > 0 ? theH+'小時'+(theM > 0 ? theM+'分':''):(theM > 0 ? theM+'分':'')))
		return theday>0 ? theday+' 天前' :(theH > 0 ? theH+' 小時'+(theM > 0 ? theM+' 分前':''):(theM > 0 ? theM+' 分前':(theS > 0 ? theS+' 秒前':'')))
	};
	
	
	var member_Id = "${LoginOK.member_Id}";
	var myNickname = "${LoginOK.nickname}"
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
				//----------------------------------------------

				// 日誌titleNickName
				$('#titleNickName').text(titleNickName+'的日誌');
				// 查詢日誌開始-------------------------
   				$.ajax({
				url : "${this_contextPath}/CRFSERVICE/personalJournalController/showJournal",
				type : 'get', //get post put delete
				data : {member_Id : theMemberId},
				success : function(data) {
// 					console.log(data);
					
					$.each(data,function(index) {
						var jdate_int = parseInt(this.publishTime); //轉換成數字
						var jdate_value = new Date(jdate_int);
				    	var  invert; 
				    	var li_direction;

				    	if(index%2==0){
				    		li_direction='<li id="'+ this.journal_Id +'">';
				    		invert='<i class="glyphicon glyphicon-record " '
				    	}else{
				    		li_direction='<li id="'+ this.journal_Id +'" class="timeline-inverted" >';
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
				   			
// 				   			+ '<div  class="well">'
				   			// 加入留言
				   			+ '<div class="timeline-footer">'
				   			+ '<div  class="form-group"></div>'
				   			+'</div>'
				   			+ '<div class="message_div form-group">'
				   			+ '<textarea class="form-control" rows="1" placeholder="留言....."></textarea>'
				   			+ '<button class="btn btn-primary pull-right" type="button">送出 </button>'
				   			+ '</div>'
				   			+ '</li>')

				
// 				$('#grid>li textarea[class="form-control"]').css({'resize':'none'})
				// 留言牆功能-------------------------------------
				$('#'+this.journal_Id+' textarea').on('keydown', this, function (event) {
                    if (event.keyCode == 13 && !event.shiftKey) {
                    	var theData = arguments[0].data;
//                     	console.log(theData);
                        var val= $(this).val()
                        
                        if(val.trim().length != 0){
// 	                        $('#'+theData.journal_Id+' textarea[class=form-control]').val('')
	                        val = val.replace(/\r?\n/g, '</br> ')
	                        addMessageDetail(theData.journal_Id, member_Id, val)
	                        writeMessageDetail(theData.journal_Id, myNickname, val, new Date().getTime());
	                        $(this).val('')
                        }
                        return false; 
                    }
                })
              //--------------------------------------------------------
              
                $('#'+this.journal_Id+' .btn.btn-primary.pull-right').on('click', this, function () {
//                 	console.log(arguments[0].data);
                	var theData = arguments[0].data;
                    var val = $('#'+theData.journal_Id+' textarea[class=form-control]').val()
                    if(val.trim().length != 0){
	                    val = val.replace(/\r?\n/g, '</br> ')
	                    addMessageDetail(theData.journal_Id, member_Id, val)
	                    writeMessageDetail(theData.journal_Id, myNickname, val, new Date().getTime());
	                    $('#'+theData.journal_Id+' textarea[class=form-control]').val('')
                    }
                })
                //------------------------------------------------------
						// 個人日誌狀態編輯按鈕  1:公開  0:限本人  2:朋友
						if(mySelf){
							var eleS = $('<br/><select />').bind('change',this,function(){
								$.ajax({
									url: "${this_contextPath}/CRFSERVICE/personalJournalController/updateJournal",
									type: 'PUT',
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
 						}
						
						// 查看留言功能-------------------------------------------------------
// 						if(this.messageDetailVOs.length != 0){
							var eleMessageA2 = $('<a></a>',{text:'隱藏留言'}).on('click',this, function(){
								$('#grid>li[id="'+thisData.journal_Id+'"] div[class="form-group"]').slideUp();
							})
							
							var eleMessageA1 = $('<a></a>',{text:'查看更多留言'}).on('click',this, function(){	
								var thisData = arguments[0].data;
								
								$.ajax({
									url: "${this_contextPath}/CRFSERVICE/messageDetailController/getMessageDetail",
									type: 'GET',
									data: {'journal_Id':thisData.journal_Id},
									success: function(data){
										console.log(data)
										// 顯示留言
										$.each(data, function(index,ele){
		// 									console.log(diffTime(this.messageTime));
											writeMessageDetail(this.journal_Id, this.member_Id, this.content, this.messageTime)
										})
										// 
										
									}
								})
							})
							$('#grid>li div[class="timeline-footer"]:last').append(eleMessageA1);
							$('#grid>li div[class="timeline-footer"]:last').append(eleMessageA2);
  					})
  					
  					$('#grid').append('<li class="clearfix" style="float: none;">');
	    						}

	    					})
						}
					});
					

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
					 
					 
    	// 寫入留言牆
    	function writeMessageDetail(theJournal_Id, theMember_Id, theContent, theMessageTime){
    		var theBeforeTime = diffTime(theMessageTime)	
    		$('#grid>li[id="'+theJournal_Id+'"] div[class="timeline-footer"]>div:first').prepend(
    				 '<div class="col-md-12"><hr/>'
    				 +theMember_Id
    				 +': ' + theContent
//     				 +'<br>時間: '+ theBeforeTime
    				 +'<br>時間: '+ new Date(theMessageTime).Format('yyyy-MM-dd hh:mm:ss')
    				 +'</div>'
    			);
    	}
    	
    	// addMessageDetail ajax -> server 
    	function addMessageDetail(theJournal_Id, theMember_Id, theVal){
            $.ajax({
            	url : "${this_contextPath}/CRFSERVICE/messageDetailController/addMessageDetail",
				type : 'post', //get post put delete
				data : {'journal_Id':theJournal_Id,
						'member_Id':theMember_Id,
						'content':theVal},
				success : function(data) {
					console.log(data)
				}
            })
    	}
	})
	</script>
	
</c:if>
	<!--  頁面部分 結束 -->
	
	<script src="${this_contextPath}/js/personal_journal.js"></script>	
	
</body>
</html>