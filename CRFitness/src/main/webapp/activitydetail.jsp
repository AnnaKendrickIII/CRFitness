<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${ empty LoginOK}">
<c:redirect url="/index.jsp?NoLogin"></c:redirect>
</c:if>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<c:set var="title" value="" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<title>揪團紀錄</title>
<jsp:include page="/CRFitness.jsp" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/component.css" /> <!-- 動畫效果 -->
<script src="${this_contextPath}/js/modernizr.custom.js"></script> <!-- 彈跳視窗 -->
<link rel="stylesheet" href="${this_contextPath}/css/jquery.fs.boxer.css"> <!-- 檔案上傳 -->
<link rel="stylesheet" href="${this_contextPath}/css/bootstrap-editable.css"> <!-- 檔案上傳 -->
</head>

<body >

<!-- 	判斷登入者和 queryString 是否相同, 若相同才可修改  -->
	<c:if test="${! empty LoginOK}">
	<ul class="grid effect-7" id="grid"  >
              
	 </ul>
	<script src="${this_contextPath}/js/masonry.pkgd.mis.js"></script> <!-- 瀑布流 -->   
	<script src="${this_contextPath}/js/classie.js"></script> <!-- 瀑布流 -->  
	<script src="${this_contextPath}/js/imagesloaded.js"></script> <!-- 瀑布流 --> 
	<script src="${this_contextPath}/js/AnimOnScroll.js"></script> <!-- 瀑布流 -->	
	
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
	
	
	jQuery(function($){
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
						  var jdate_int2 = parseInt(this[0].deadline);                          //轉換成數字
						  var jdate_value_deadline = new Date(jdate_int2);
						  var names=' ';
		        		  if(this[1]!=null){
						  var nameData=this[1].split(",")						  
						  $.each(nameData,function(){
							if(this!=""){
								names+=this+'\n'
							}				  
						  })	
		        		 }//到第一個ajax
		        		  
		      
		        		  //內
							$('#grid').append('<li ><a href="data:image/png;base64,'
							+this[0].photo1+'" class="lightbox_image boxer" data-lightbox-gallery="image_gallery" rel="gallery" title="發起人：'
							+this[2]+'<br />類別：'+this[0].activity_Class+'<br />地區：'
							+this[0].activity_Area+'<br />內容：'
							+this[0].activity_Info+'<br />日期：'
							+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
							+this[0].people 
							//外
							+'"><span title=""><img src="data:image/png;base64,'
									+this[0].photo1+'" /></span></a><p hidden="hidden">'+this[0].activity_Id+'</p>發起人：'
									+this[2]+'<br />類別：'
									+"<a href='#' class='select'>"+this[0].activity_Class+"</a>"+'<br />地區：'
									+"<a href='#' class='username' data-type='text' data-placement='right' data-title='Enter Area'>"+this[0].activity_Area+"</a>"+'<br />內容：'
									+"<a href='#' class='username' data-type='text' data-placement='right' data-title='Enter Info'>"+this[0].activity_Info+"</a>"+'<br />活動時間：'
									+"<a href='#' class='event' data-type='combodate' data-template='YYYY MM D HH:mm' data-format='YYYY/MM/DD HH:mm' data-viewformat='YYYY/MM/DD HH:mm' data-title='Setup event date and time' class='editable editable-click editable-empty' data-original-title='' title=''>"+jdate_value.Format('yyyy-MM-dd hh:mm')+"</a>"+'<br />活動截止日：'
									+"<a href='#' class='event' data-type='combodate' data-template='YYYY MM D HH:mm' data-format='YYYY/MM/DD HH:mm' data-viewformat='YYYY/MM/DD HH:mm' data-title='Setup event date and time' class='editable editable-click editable-empty' data-original-title='' title=''>"+jdate_value_deadline.Format('yyyy-MM-dd hh:mm')+"</a>"+'<br />目前參加人數：'
									+'<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="'
									+names+'">'
									+this[0].people+'</button></li>')
									  					
	                 		 })//each
							  $('.btn.btn-default').tooltip()
								$(".boxer").boxer({
    							top: 50,
    							fixed:true
								});	
		        	  $.fn.editable.defaults.mode = 'inline';     
		        	    $('.select').editable({
		        	        type: 'select',
		        	        title: 'Select status',
		        	        placement: 'right',
		        	        value: 2,
		        	        source: [
		        	            {value: 1, text: '跑步'},
		        	            {value: 2, text: '登山'},
		        	            {value: 3, text: '游泳'},
		        	            {value: 4, text: '飛輪'},
		        	            {value: 5, text: '自行車'},
		        	            {value: 6, text: '有氧運動'},
		        	            {value: 7, text: '球類運動'},
		        	            {value: 8, text: '室內運動'},
		        	            {value: 9, text: '其他類別'}

		        	        ]
		        	    });
		        	    $('.username').editable();
		        	    $('.event').editable({
		        	        placement: 'right',
		        	        combodate: {
		        	            firstItem: 'name'
		        	        }
		        	    });
	                  new AnimOnScroll(document.getElementById('grid'), {
	                      minDuration: 0.4,
	                      maxDuration: 0.6,
	                      viewportFactor: 0.2
	                  });				
	                 $('li a:not(:first-child)').click(function(){
	                	 var li_notfirst =$(this)
	                	  $('form').submit(function(){
	                		    console.log(li_notfirst.siblings("p").text())
	                		    console.log(li_notfirst.parent().find("a:eq(4)").text())	
	                			console.log(li_notfirst.parent().find("a:eq(1)").text())
	                			console.log(li_notfirst.parent().find("a:eq(2)").text())
	                			console.log(li_notfirst.parent().find("a:eq(3)").text())
	                			console.log(li_notfirst.parent().find("a:eq(5)").text())
		                	   $.ajax({
	    						url:"${this_contextPath}/CRFSERVICE/activitysController/modifyActivitys",
		          				type:'post',  //get post put delete
		          				data:{activity_Id:li_notfirst.siblings("p").text(),
		          					  activity_Class:li_notfirst.parent().find("a:eq(1)").text(),
		          					  activity_Area:li_notfirst.parent().find("a:eq(2)").text(),
		          					  activity_Info:li_notfirst.parent().find("a:eq(3)").text(),
		          					  activity_Day:li_notfirst.parent().find("a:eq(4)").text(),
		          					  deadline:li_notfirst.parent().find("a:eq(5)").text()
		          					},
		          				success:function(data){    
		          					console.log(data)
		          				}
		                	   })
	                		 
	                	  })
	                	 
	                  })
		          }//外層success          	 
		      })//外層ajax
		      
	})
	</script>

</c:if>
	<!--  頁面部分 結束 -->
<script src="${this_contextPath}/js/jquery.fs.boxer.js"  ></script>
<script src="${this_contextPath}/js/bootstrap-editable.js"  ></script>
<script src="${this_contextPath}/js/moment.min.js"  ></script>
</body>
</html>