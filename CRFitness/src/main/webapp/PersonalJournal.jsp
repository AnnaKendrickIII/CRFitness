<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="title" value="" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">

<title>${LoginOK.nickname}的個人日誌</title>

<jsp:include page="/CRFitness.jsp" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/component.css" />
<script src="${this_contextPath}/js/modernizr.custom.js"></script>

</head>

<body >

<!-- 	判斷登入者和 queryString 是否相同, 若相同才可修改  -->
	<c:if test="${! empty LoginOK}">
	
	  <ul class="grid effect-7" id="grid"  >
              
	 </ul>
<%-- 	<img  id="imgloading" src="${this_contextPath}/images/cube.gif" style="display: none"> --%>
	<script src="${this_contextPath}/js/masonry.pkgd.mis.js"></script>    
	<script src="${this_contextPath}/js/classie.js"></script>
	<script src="${this_contextPath}/js/imagesloaded.js"></script>
	<script src="${this_contextPath}/js/AnimOnScroll.js"></script>	
	<!-- 頁面部分 開始-->
	
	<!-- 	新增個人日誌開始       -->
<c:if test="${LoginOK.member_Id == pageContext.request.queryString}">

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" >新增個人日誌</button>

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
<button onclick="showJournal()" >編輯</button>
<!-- -------------------------------- -->
	</c:if>
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

	$(function () {
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
				
				// 判斷是否好友開始-------------------------
				
	        			
	        				$.ajax({
	    					url : "${this_contextPath}/CRFSERVICE/personalJournalController/showJournal",
	    					type : 'get', //get post put delete
	    					data : {member_Id : theMemberId},
	    					success : function(data) {
	    						var x=0;
	    						$.each(data,function() {  
	    							
		    						var jdate_int = parseInt(this.publishTime); //轉換成數字
		    						var jdate_value = new Date(jdate_int);
		    						if(!friend){
			    						$('#grid').append(
			    						'<li ><a href=""><img src="data:image/png;base64,'
			    						+this.archives+'" /></a>'
			    						+'id:'+this.memberVO.member_Id  // 上線前要拿掉或改暱稱
			    						+ '<br />類別：'
		   								+ this.contents
		   								+ '<br />內容：'
		   								+ this.contents
		   								+ '<br />日期：'
		   								+ jdate_value.Format("yyyy-MM-dd hh:mm:ss")
		   								+ '<br /><button id="datass'+x+'" >編輯</button>'
		   								+ '</li>')
		   								var y=x;
		   								$('#datass'+x).click(function(){   									
		   									console.log(data[y])
		   								})
		   								x++;
		    						}else{
			    						$('#grid').append(
					    						'<li ><a href=""><img src="data:image/png;base64,'
					    						+this.archives+'" /></a>'
					    						+'id:'+this.memberVO.member_Id  // 上線前要拿掉或改暱稱
					    						+ '<br />類別：'
				   								+ this.contents
				   								+ '<br />內容：'
				   								+ this.contents
				   								+ '<br />日期：'
				   								+ jdate_value.Format("yyyy-MM-dd hh:mm:ss")
				   								+ '</li>')
		    						}
	    						
		    						
	    						})
	    							new AnimOnScroll(document.getElementById('grid'), {
	    								minDuration : 0.4,
	    								maxDuration : 0.6,
	    								viewportFactor : 0.2
	    							});
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
					
// 					新增好友 click==================================
					$('#sendBtn').click(function(){
						var formData = new FormData();

						
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
		   								+ '<br/><button onclick=updateJournal('+data.contents+') >編輯</button>'
		   								+ '</li>')
		    						
		    						new AnimOnScroll(document.getElementById('grid'), {
	    								minDuration : 0.4,
	    								maxDuration : 0.6,
	    								viewportFactor : 0.2
	    							});								
			    						
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
	
</body>
</html>