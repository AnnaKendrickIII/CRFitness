<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="title" value="" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<title>揪團紀錄</title>
<jsp:include page="/CRFitness.jsp" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/component.css" />
<script src="${this_contextPath}/js/modernizr.custom.js"></script>
<link rel="stylesheet" href="${this_contextPath}/css/site.css">
</head>

<body >

<!-- 	判斷登入者和 queryString 是否相同, 若相同才可修改  -->
	<c:if test="${! empty LoginOK}">
	<ul class="grid effect-7" id="grid"  >
              
	 </ul>
	<script src="${this_contextPath}/js/masonry.pkgd.mis.js"></script>    
	<script src="${this_contextPath}/js/classie.js"></script>
	<script src="${this_contextPath}/js/imagesloaded.js"></script>
	<script src="${this_contextPath}/js/AnimOnScroll.js"></script>	
	
	<!-- 頁面部分 開始-->
	
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
	    $.ajax({
		          url:"${this_contextPath}/CRFSERVICE/activitysController/${LoginOK.member_Id}",
		          type:'get',  //get post put delete
		          data:{ },
		          success:function(data){      	  
		        	  $.each(data,function(){        		  
		        		  var message;
		        		  var activityID=this.activity_Id;     		   
		        		  var jdate_int = parseInt(this.activity_Day);                          //轉換成數字
						  var jdate_value = new Date(jdate_int);
						  var names=' ';
		        		  if(this[1]!=null){
						  var nameData=this[1].split(",")						  
						  $.each(nameData,function(){
							if(this!=""){
								names+=this+'\n'
							}				  
						  })	
		        		 }
							$('#grid').append('<li ><a href="data:image/png;base64,'
							+this[0].photo1+'" class="lightbox_image js-lightbox" data-lightbox-gallery="image_gallery" title="發起人：'
							+this[2]+'<br />類別：'+this[0].activity_Class+'<br />地區：'
									+this[0].activity_Area+'<br />內容：'
									+this[0].activity_Info+'<br />日期：'
									+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
									+this[0].people+"<br /><button class='btn btn-theme' type='submit' value='INSERT_MEMBER'>參加活動</button>" 
									+'"><img src="data:image/png;base64,'
									+this[0].photo1+'" /></a>發起人：'
									+this[2]+'<button type="button" style="float:right" class="glyphicon glyphicon-pencil">修改</button><br />類別：'
									+this[0].activity_Class+'<br />地區：'
									+this[0].activity_Area+'<br />內容：'
									+this[0].activity_Info+'<br />日期：'
									+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
									+'<button  type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="'
									+names+'">'
									+this[0].people+'</button></li>')			  					
	                 		 })
							  $('.btn.btn-default').tooltip()																
	                  $.getScript('${this_contextPath}/js/site.js',function(){
	                	  
	                  })
	                  new AnimOnScroll(document.getElementById('grid'), {
	                      minDuration: 0.4,
	                      maxDuration: 0.6,
	                      viewportFactor: 0.2
	                  });
		          }          	 
		      })
	</script>
	

</c:if>
	<!--  頁面部分 結束 -->
	
</body>
</html>