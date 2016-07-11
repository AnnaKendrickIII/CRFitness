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
		<h3>揪團放置位置</h3>
		</div>
	<div class="col-md-4 col-xs-1"></div>	
	<%-- 	<img  id="imgloading" src="${this_contextPath}/images/cube.gif" style="display: none"> --%>
</div>
	<!-- 頁面部分 開始-->
	
	<!-- 	新增個人日誌開始       -->
<c:if test="${LoginOK.member_Id == pageContext.request.queryString}">

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
        var friend = false;
        // 先查詢自己所有好友名單
    	$.ajax({
            url:"${this_contextPath}/CRFSERVICE/friendships/${LoginOK.member_Id}",
            type:'get',  //get post put delete
            data:{},
            success:function(data){
				// 判斷是否好友開始-------------------------
            	$.each(data,function(){
            		if(this.member_Id === friendId){
            			friend = true;
            			theMemberId = this.member_Id;
            		}
				})
				
				
	// 查詢日誌---------------------------------------------------------------------------
	  $.ajax({
	  url : "${this_contextPath}/CRFSERVICE/personalJournalController/showJournal",
	  type : 'get', //get post put delete
	  data : {member_Id : theMemberId},
	  success : function(data) {
// 	  		var x=0;
	  		$.each(data,function(index) {  
		    	var jdate_int = parseInt(this.publishTime); //轉換成數字
		    	var jdate_value = new Date(jdate_int);
		    	var  invert; 
		    	var li_direction;
		    	
		    	console.log(index)
		    	if(index%2==0){
		    		li_direction='<li >';
		    		invert='<i class="glyphicon glyphicon-record " '
		    	}else{
		    		li_direction='<li class="timeline-inverted" >';
		    		invert='<i class="glyphicon glyphicon-record invert" '	
		    	}			
		    	//顯示查詢日誌
		    	if(!friend){
			    	$('#grid').append(
			    	li_direction
			    	+ '<div class="timeline-badge primary"><a>'
			    	+ invert 	
// 			    	↓title塞入時間日期
			    	+ 'rel="tooltip" title="" id="I5"></i></a></div><div class="timeline-panel">'
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
		   			+'<div class="timeline-footer">塞留言的地方</div>'
		   			+'</div>'
		   			+ '</li>')
		   			
		    	}else{
			    	$('#grid').append(
			    	li_direction
			    	+ '<div class="timeline-badge primary"><a>'
			    	+ invert 	
// 			    	↓title塞入時間日期
			    	+ 'rel="tooltip" title="" id="I5"></i></a></div><div class="timeline-panel">'
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
		   			+'<div class="timeline-footer">塞留言的地方</div>'
		   			+'</div>'
		   			+ '</li>')
		    		}
	    			})
	    			
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
					
					// 	綁定新增日誌 click事件==================================
					$('#sendBtn').click(function(){
						var formData = new FormData();
						var member_Id = "${LoginOK.member_Id}";
						
						var file = $('#uploadfile').prop("files")[0];
//			 			var category = $('#category').val();  // 類別是??
					
						var contents = $('#content').val();
						var publishTime = new Date().Format('yyyy-MM-dd hh:mm:ss');
						var publicStatus = $('#openStatus').val();
						formData.append('archives', file);
						formData.append('member_Id', member_Id);
						formData.append('contents', contents);
						formData.append('publishTime', publishTime);
						formData.append('publicStatus', publicStatus);
						
						$.ajax({
							url: "${this_contextPath}/CRFSERVICE/personalJournalController/insertJournal",
							type: 'post',
							data: formData,
							processData: false,
							contentType: false,
							success: function(data){
								// 顯示新增日誌
									$('#exampleModal').modal('toggle');									
			    						var jdate_int = parseInt(data.publishTime); //轉換成數字
			    						var jdate_value = new Date(jdate_int);
			    						$('#grid>li:nth-child(1)').before(
			    						'<li ><a href=""><img src="data:image/png;base64,'
			    						+data.archives+'" /></a>'
 			    						+'id:'+data.memberVO.member_Id  // 上線前要拿掉或改暱稱
			    						+ '<br />類別：'
		   								+ data.contents
		   								+ '<br />內容：'
		   								+ data.contents
		   								+ '<br />日期：'
		   								+ jdate_value.Format("yyyy-MM-dd hh:mm:ss")
		   								+ '<button onclick="updateJournal()">編輯</button>'
		   								+ '</li>')
		   								
		    						
		    												
							}
						})
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