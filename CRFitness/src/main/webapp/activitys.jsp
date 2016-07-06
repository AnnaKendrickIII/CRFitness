<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>揪團</title>
<jsp:include page="/CRFitness.jsp" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/component.css" />
<script src="${this_contextPath}/js/modernizr.custom.js"></script>
<link rel="stylesheet" href="${this_contextPath}/css/site.css">
<style>
.gallery {
	margin: 20px 0;
	overflow: hidden;
}

.lightbox_image {
	display: block;
	float: left;
	margin: 0 2% 10px 0;
	width: 100%;/*網頁圖片大小*/
	max-width: 150px;/**/
}

.lightbox_image img {
	display: block;
	width: 100%;
}
</style>

</head>
<body >
	
	<!-- 頁面部分 開始-->
    <ul class="grid effect-5 " id="grid">
               <li><a href="${this_contextPath}/images/new.jpg" class="lightbox_image js-lightbox" title="sssssss<br /><button name='member_action' class='btn btn-theme' type='submit' value='INSERT_MEMBER'>送出</button>  " ><img src="${this_contextPath}/images/new.jpg"></a>新增揪團</li>
		</ul>
                       
    <script src="${this_contextPath}/js/masonry.pkgd.mis.js"></script>    
	<script src="${this_contextPath}/js/classie.js"></script>
	<script src="${this_contextPath}/js/imagesloaded.js"></script>
	<script src="${this_contextPath}/js/AnimOnScroll.js"></script>	

	<script>
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
	    $.ajax({
		          url:"${this_contextPath}/CRFSERVICE/activitysController/AllActivitys",
		          type:'get',  //get post put delete
		          data:{ },
		          success:function(data){
		        	  $.each(data,function(){		        
		        		  var jdate_int = parseInt(this.activity_Day);                          //轉換成數字
							var jdate_value = new Date(jdate_int); 
							$('#grid').append('<li ><a href="data:image/png;base64,'
							+this.photo1+'" class="lightbox_image js-lightbox" data-lightbox-gallery="image_gallery" title="發起人：'
							+this.memberVO.nickname+'<br />類別：'+this.activity_Class+'<br />地區：'
									+this.activity_Area+'<br />內容：'
									+this.activity_Info+'<br />日期：'
									+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+"<br /><button class='btn btn-theme' type='submit' value='INSERT_MEMBER'>參加活動</button>" 
									+'"><img src="data:image/png;base64,'
									+this.photo1+'" /></a>發起人：'
									+this.memberVO.nickname+'<br />類別：'
									+this.activity_Class+'<br />地區：'
									+this.activity_Area+'<br />內容：'
									+this.activity_Info+'<br />日期：'
									+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</li>')
 
	                  })
	                  $.getScript('${this_contextPath}/js/site.js',function(){
	                	  
	                  })
	                  new AnimOnScroll(document.getElementById('grid'), {
	                      minDuration: 0.4,
	                      maxDuration: 0.6,
	                      viewportFactor: 0.2
	                  });
		          }          	 
		      })
	 
	  })
    
</script>
<!-- 頁面部分 結束-->

<!-- 彈跳視窗 開始-->

<!-- 彈跳視窗 結束-->
</body>
</html>