<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<title>健康日誌</title>
<jsp:include page="/CRFitness.jsp" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/component.css" />
<script src="${this_contextPath}/js/modernizr.custom.js"></script>

<!-- 新增CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="${this_contextPath}/css/bootstrap-image-gallery.min.css">
<!-- 新增CSS結束 -->

</head>

<body >

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
	        		 $('#grid').append('<li><a href="data:image/png;base64,'
	        		 +this.archives+'" title="1321564" data-gallery><img src="data:image/png;base64,'
	        		 +this.archives+'" /></a>發起人：'+this.member_Id+'<br />類別：'
	        		 +this.contents+'<br />內容：'+this.contents+'<br />日期：'
	        		 +jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</li>')
	        		 
                })
                $.getScript('${this_contextPath}/js/bootstrap-image-gallery.min.js',function(){
            		
            	})
                new AnimOnScroll(document.getElementById('grid'), {
                    minDuration: 0.4,
                    maxDuration: 0.6,
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

	<!--  頁面部分 結束 -->
	
	<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
<div id="blueimp-gallery" class="blueimp-gallery" data-use-bootstrap-modal="false">
    <!-- The container for the modal slides -->
    <div class="slides"></div>
    <!-- Controls for the borderless lightbox -->
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
    <!-- The modal dialog, which will be used to wrap the lightbox content -->
    <div class="modal fade">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-hidden="true">&times;</button>
                    
                </div>
                <div class="modal-body next"></div>
                <div class="modal-footer">
                <h4 class="modal-title" ></h4>
                    <button type="button" class="btn btn-default pull-left prev">
                        <i class="glyphicon glyphicon-chevron-left"></i>
                        Previous
                    </button>
                    <button type="button" class="btn btn-primary next">
                        Next
                        <i class="glyphicon glyphicon-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- 新增JS -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="//blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<!-- <script src="js/bootstrap-image-gallery.min.js"></script> -->

<!-- 新增JS結束 -->

</body>
</html>