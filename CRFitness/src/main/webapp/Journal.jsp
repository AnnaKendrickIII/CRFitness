<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<jsp:include page="/CRFitness.jsp" />
<title>健康日誌</title>

<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/Journal_component.css" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/SimpleSlider.css" />
<script src="${this_contextPath}/js/modernizr.custom.js"></script>
<style type="text/css">
.Emoticons{
width: 40px;
height: 36px;
float:left;
}
.a_img_p{
text-decoration: none !important;
font-size: 24px;
color:blue;

}
.name_p:HOVER{
font-size: 24px;
color:#66B3FF;
}
.time_p{
margin: 0px;
}
.message_img{
width: 32px;
height: 32px;
}
</style>
</head>

<body >
<aside>

	  <ul class="grid effect-7 " id="grid"  ></ul>

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
	            	$.each(data,function(){
		        		  var jdate_int = parseInt(this[0].publishTime);                          //轉換成數字
						  var jdate_value = new Date(jdate_int); 
		        		  var journalId=this[0].journal_Id
		        		  var contet='<p hidden="hidden">'+this[0].journal_Id+'</p>'
			        		 +'<a class="a_img_p" href="${this_contextPath}/PersonalJournal.jsp?'+this[0].member_Id+'">'
			        		 +'<img class="Emoticons" src="data:image/png;base64,'+this[2]+'" /><p class="name_p">'
			        		 +this[1]+'</p></a><p class="time_p">'
			        		 +jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</p><p>'
							 +this[0].contents+'</p>'
							 
		        		 $('#grid').append(
		        		 '<li  id="'+this[0].journal_Id+'" class="gallery-img">'
		        		 +contet
		        		 +'<img class="img-thumbnail" src="data:image/png;base64,'+this[0].archives+'" />'	 
		        		 +'<div data-desc=""></div>'
		        		 +'</li>') 
		        		  $.ajax({
	           				 url:"${this_contextPath}/CRFSERVICE/messageDetailController/getMessageDetailAll",
	            			 type:'get',  //get post put delete
	          			     data:{journal_Id:journalId},
	            			 success:function(data){ 
	            				 var message="";
	            				 $.each(data,function(){
	            					 message+='<div><img class="message_img" src="data:image/png;base64,'+this[2]+'" />'
	            					 +this[1]+'</div>'
	            				 })//留言明細迴圈     	
	            				 $("#"+journalId+' div[data-desc]').attr('data-desc',
	            						 contet+message)
	            			 }//留言success結束
	           			 })//留言ajax結束	                
	            	})// each end
	                new AnimOnScroll(document.getElementById('grid'), {
	                    minDuration: 0.4,
	                    maxDuration: 0.6,
	                    viewportFactor: 0.2
	                });//瀑布流 new 
	                $('.gallery-img').Am2_SimpleSlider();    
	            	$.ajax({
	    	            url:"${this_contextPath}/CRFSERVICE/commonJournalController/commonJournalTwo",
	    	            type:'get',  //get post put delete
	    	            data:{},
	    	            success:function(data){
    	             		console.log(data);
	    	            	$.each(data,function(){
	    	            		var jdate_int = parseInt(this[0].publishTime);                          //轉換成數字
								var jdate_value = new Date(jdate_int); 
			        		  var journalId=this[0].journal_Id
			        		 $('#grid').append(
			        		 '<li  id="'+this[0].journal_Id+'" class="gallery-img"><p hidden="hidden">'+this[0].journal_Id+'</p>'
			        		 +'<a class="a_img_p" href="${this_contextPath}/PersonalJournal.jsp?'+this[0].member_Id+'">'
			        		 +'<img class="Emoticons" src="data:image/png;base64,'+this[2]+'" /><p class="name_p">'
			        		 +this[1]+'</p></a><p class="time_p">'
			        		 +jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</p><p>'
							 +this[0].contents+'</p>'
			        		 +'<img class="img-thumbnail" src="data:image/png;base64,'+this[0].archives+'" />'	 
			        		 +'<div data-desc=""></div>'
			        		 +'</li>') 
			        		  $.ajax({
		           				 url:"${this_contextPath}/CRFSERVICE/messageDetailController/getMessageDetailAll",
		            			 type:'get',  //get post put delete
		          			     data:{journal_Id:journalId},
		            			 success:function(data){ 
		            				 var message="";
		            				 $.each(data,function(){
		            					 message+=this[0].journal_Id
		            				 })//留言明細迴圈     				
		            				 $("#"+journalId+' div[data-desc]').attr('data-desc',message)
		            			 }//留言success結束
		           			 })//留言ajax結束	                
		            	})// each end
	    	                new AnimOnScroll(document.getElementById('grid'), {
	    	                    minDuration: 0.4,
	    	                    maxDuration: 0.6,
	    	                    viewportFactor: 0.2
	    	                });//瀑布流 new 
	    	            	$('.gallery-img').Am2_SimpleSlider();    
	    	 	          }//第2次撈資料  success結束  	 
	    	        })//第2次ajax結束	       
	    	        
	            }//第1次撈資料  success結束      
	        })//第1次ajax結束
	})//jQuery end  	
	</script>
</aside>
<script src="${this_contextPath}/js/masonry.pkgd.mis.js"></script>    
<script src="${this_contextPath}/js/classie.js"></script>
<script src="${this_contextPath}/js/imagesloaded.js"></script>
<script src="${this_contextPath}/js/AnimOnScroll.js"></script>	
<script src="${this_contextPath}/js/Am2_SimpleSlider.js"></script>  
</body>
</html>