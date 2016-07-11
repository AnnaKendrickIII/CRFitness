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
<link rel="stylesheet" href="${this_contextPath}/css/jquery.fs.boxer.css">
<link rel="stylesheet" href="${this_contextPath}/css/jquerysctipttop.css">
<link rel="stylesheet" href="${this_contextPath}/css/optionsGoogle.css">
<link rel="stylesheet" href="${this_contextPath}/css/themify-icons.css">
<script src="${this_contextPath}/js/optionsGoogle.js"></script>

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
		        		  var activityID=this[0].activity_Id;     		   
		        		  var jdate_int = parseInt(this[0].activity_Day);                          //轉換成數字
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
							+this[0].photo1+'" class="lightbox_image boxer" data-lightbox-gallery="image_gallery" rel="gallery" title="發起人：'
							+this[2]+'<br />類別：'+this[0].activity_Class+'<br />地區：'
									+this[0].activity_Area+'<br />內容：'
									+this[0].activity_Info+'<br />日期：'
									+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
									+this[0].people+"<button class='btn btn-theme' style='float:right' type='submit' value='INSERT_MEMBER'>參加活動</button>" 
									+'"><span title=""><img src="data:image/png;base64,'
									+this[0].photo1+'" /></span></a>發起人：'
									+this[2]+'<br />類別：'
									+this[0].activity_Class+'<br />地區：'
									+this[0].activity_Area+'<br />內容：'
									+this[0].activity_Info+'<br />日期：'
									+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
									+'<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="'
									+names+'">'
									+this[0].people+'</button></li>')
									  					
	                 		 })
							  $('.btn.btn-default').tooltip()
								$(".boxer").boxer({
    							top: 50,
    							fixed:true
								});	
				        	  $('.lightbox_image').optionsGoogle({
				      			options:[{
				      				class:'ti-pencil', 
				      				callable:edit, 
				      				text:'Edit'
				      			}], 
				      			margin:25
				      		});
				        	  function edit(){
				      		}
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
<script src="${this_contextPath}/js/jquery.fs.boxer.js"  ></script>
</body>
</html>