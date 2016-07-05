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

</head>

<body >
	
	
	  <ul class="grid effect-7" id="grid"  >
              
	 </ul>
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
<<<<<<< HEAD
	        		 $('#grid').append('<li ><a href=""><img src="data:image/png;base64,'+this.archives+'" /></a>發起人：'+this.member_Id+'<br />類別：'+this.contents+'<br />內容：'+this.contents+'<br />日期：'+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</li>')
=======
	        		 $('#grid').append('<li ><a href=""><img src="data:image/png;base64,'+this.archives+'" /></a>發起人：'+this.memberVO.nickname+'<br />類別：'+this.contents+'<br />內容：'+this.contents+'<br />日期：'+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</li>')
>>>>>>> branch 'master' of https://github.com/AnnaKendrickIII/CRFitness.git
	        		 
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
</body>
</html>