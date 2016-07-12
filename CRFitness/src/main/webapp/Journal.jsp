<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<title>健康日誌</title>

<!-- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css"> -->
<jsp:include page="/CRFitness.jsp" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/blueimp-gallery.css" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/blueimp-gallery-indicator.css" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/Journal_component.css" />
<script src="${this_contextPath}/js/modernizr.custom.js"></script>

<!-- 新增CSS -->

<link rel="stylesheet" href="${this_contextPath}/css/bootstrap-image-gallery.min.css">
<!-- 新增CSS結束 -->

</head>

<body >
<aside>

	  <ul class="grid effect-7" id="grid"  ></ul>

<%-- 	<img  id="imgloading" src="${this_contextPath}/images/cube.gif" style="display: none"> --%>
	<script src="${this_contextPath}/js/masonry.pkgd.mis.js"></script>    
	<script src="${this_contextPath}/js/classie.js"></script>
	<script src="${this_contextPath}/js/imagesloaded.js"></script>
	<script src="${this_contextPath}/js/AnimOnScroll.js"></script>	
	<!-- 頁面部分 開始-->
	<!-- 	新增留言開始       -->
<c:if test="${!empty LoginOK.member_Id}">
<div class="modal fade" id="insertMessageDetailDiv"  tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="insertMessageModalLabel">新增留言</h4>
      </div>
      <div class="modal-body">
		<form role="form" action="" method="post" >
		  <div class="form-group">
		    <label for="content">留言內容</label>
		    <textarea class="form-control" id="insertMessageDetail" placeholder="留言內容輸入在此"></textarea>
		  </div>
		<div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button id="sendEditBtn" type="button" class="btn btn-primary">送出留言</button>
	    </div>
		</form>
      </div>
    </div>
  </div>
</div>

</c:if>
<!-- 	新增留言結束 -->
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
		var theMessageDetailObj;
		
	        $.ajax({
	            url:"${this_contextPath}/CRFSERVICE/commonJournalController/commonJournalOne",
	            type:'get',  //get post put delete
	            data:{},
	            success:function(data){
//	             		console.log(data);
	            	$.each(data,function(){
		        		  var jdate_int = parseInt(this.publishTime);                          //轉換成數字
							var jdate_value = new Date(jdate_int); 
		        		 $('#grid').append('<li value="'+this.journal_Id+'"><a href="data:image/png;base64,'
		        		 +this.archives+'" title="1321564" data-gallery><img src="data:image/png;base64,'
		        		 +this.archives+'" /></a>發起人：'+this.memberVO.nickname+'<br />類別：'
		        		 +this.contents+'<br />內容：'+this.contents+'<br />日期：'
		        		 +jdate_value.Format("yyyy-MM-dd hh:mm:ss")
		        		 +'</li>')	     
	                })
	                // each end
	                new AnimOnScroll(document.getElementById('grid'), {
	                    minDuration: 0.4,
	                    maxDuration: 0.6,
	                    viewportFactor: 0.2
	                });
	            	
	            	$.ajax({
	    	            url:"${this_contextPath}/CRFSERVICE/commonJournalController/commonJournalTwo",
	    	            type:'get',  //get post put delete
	    	            data:{},
	    	            success:function(data){
//	    	             		console.log(data);
	    	            	$.each(data,function(){
	    		        		  var jdate_int = parseInt(this.publishTime);                          //轉換成數字
	    							var jdate_value = new Date(jdate_int); 
	    		        		 $('#grid').append('<li value="'+this.journal_Id+'"><a href="data:image/png;base64,'
	    		        		 +this.archives+'" title="1321564" data-gallery><img src="data:image/png;base64,'
	    		        		 +this.archives+'" /></a>發起人：'+this.memberVO.nickname+'<br />類別：'
	    		        		 +this.contents+'<br />內容：'+this.contents+'<br />日期：'
	    		        		 +jdate_value.Format("yyyy-MM-dd hh:mm:ss")
	    		        		 +'</li>')	        
	    	                })
	    	                // each end
	    	                new AnimOnScroll(document.getElementById('grid'), {
	    	                    minDuration: 0.4,
	    	                    maxDuration: 0.6,
	    	                    viewportFactor: 0.2
	    	                });
    	
	    	 	          }
         	 
	    	        })
	 	          }
   	
	                  	 
	        })
	        
	      //新增留言按鈕
     		if("${LoginOK}"!=""){
				var eleBtn = $('<button />',{'text':'留言'}).on('click',this,function(){
//						console.log(arguments[0].data);
					$('#insertMessageDetailDiv').modal('toggle');
					theMessageDetailObj = arguments[0].data;
				});
    		 $('#grid>li:last').append(eleBtn);
     		}		 
    		 //  顯示留言
    		 $.each(this.messageDetailVOs, function(index){
    					 $('#grid>li:last').append(
    					 '<hr/>#'+(index+1)
    					 +'<br>留言人:'+this.member_Id
    					 +'<br>留言內容:'+this.content
    					 +'<br>時間:'+new Date(this.messageTime).Format('yyyy-MM-dd hh:mm:ss')		 
    						 );
    			
    					 })
    		
	        
//	   	 新增留言送出的click事件==================================
			$('#sendEditBtn').on('click', function(){
				$('#insertMessageDetailDiv').modal('toggle');
				var formData = new FormData();
//	 			var category = $('#category').val();  // 類別是??
				console.log(theMessageDetailObj);
				var member_Id = "${LoginOK.member_Id}";
				var journal_Id = theMessageDetailObj.journal_Id;
				var content = $('#insertMessageDetail').val();
//					var publishTime = new Date().Format('yyyy-MM-dd hh:mm:ss');
				formData.append('journal_Id', journal_Id);
				formData.append('member_Id', member_Id);
				formData.append('content', content);
				
				if(content === undefined || content.trim().length == 0){
					alert('請輸入留言內容');
				}else{
					$.ajax({
						url: "${this_contextPath}/CRFSERVICE/messageDetailController/addMessageDetail",
						type: 'post',
						data: formData,
						processData: false,
						contentType: false,
						success: function(data){
//								console.log(data);
							if(data){
								// 重新載入??
//									console.log($('#grid>li[value='+journal_Id+']').attr('value'));
//									$('#grid>li[value='+journal_Id+']').remove();
								$('#insertMessageDetailDiv').modal('toggle');
								$('#insertMessageDetail').val('');
								
							}else{
								alert('留言失敗，請重新嘗試或電洽客服');
							}
							/*
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
   								+ '<br/><button>編輯</button>'
   								+ '</li>')
   								
    							$('#grid>li:nth-child(1)').on('click',' :button',data,function(){
   									console.log(arguments.length);
   									console.log(arguments[0].data);
   								});	
	    						*/							
						}						
					})
				}		
			});
	    })
	</script>
</aside>
	<!--  頁面部分 結束 -->
	
	<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
<div id="blueimp-gallery" class="blueimp-gallery " data-use-bootstrap-modal="false">
    <!-- The container for the modal slides -->
    <div class="slides"><div class="slide-content">asa</div></div>

    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
 
    <h1 class="title"> </h1>
    <ol class="indicator"></ol>
</div>



<!-- 新增JS -->

<script src="${this_contextPath}/js/blueimp-gallery.js"></script>
<script src="${this_contextPath}/js/blueimp-helper.js"></script>
<script src="${this_contextPath}/js/blueimp-gallery-indicator.js"></script>
<script src="${this_contextPath}/js/jquery.blueimp-gallery.js"></script>

<!-- <script src="js/bootstrap-image-gallery.min.js"></script> -->

<!-- 新增JS結束 -->

</body>
</html>