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
	
    $(function () {
        $.ajax({
            url:"${this_contextPath}/CRFSERVICE/commonJournalController/commonJournal",
            type:'get',  //get post put delete
            data:{},
            success:function(data){
            	$.each(data,function(){		        
	        		  var jdate_int = parseInt(this.publishTime);                          //轉換成數字
						var jdate_value = new Date(jdate_int); 
	        		 $('#grid').append('<li ><a href="data:image/png;base64,'
	        		 +this.archives+'" title="'+this.memberVO.nickname+'" data-gallery  ><span title=""><img src="data:image/png;base64,'
	        		 +this.archives+'" /></span></a>發起人：'+this.memberVO.nickname+'<br /><div class="divcssj">類別：'
	        		 +this.contents+'</div><br /><div class="divcssj">內容：'+this.contents+'</div><br />日期：'
	        		 +jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</li>')
	        		
                })         
//                 $.getScript('${this_contextPath}/js/jquery.blueimp-gallery.js',function(){
            		
//             	})
                new AnimOnScroll(document.getElementById('grid'), {
                    minDuration: 0.8,
                    maxDuration: 0.1,
                    viewportFactor: 0.2
                });
 	          }
//           ,beforeSend:function(){
//                 $('#imgloading').show();
//               },
//               complete:function(){
//             	 $('#imgloading').hide();
//               }        	
                  	 
        })
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