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
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jquery.datetimepicker.css"> <!-- 日期選擇器 --> 
<script src="${this_contextPath}/js/modernizr.custom.min.js"></script> <!-- 彈跳視窗 -->
<link rel="stylesheet" href="${this_contextPath}/css/jquery.fs.boxer.css"><!-- 彈跳視窗 -->
<link rel="stylesheet" href="${this_contextPath}/css/bootstrap-editable.css"> <!-- 檔案上傳 -->
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/dialog.css"> <!-- alert -->
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/animate.min.css"> <!-- alert -->


</head>
<style>
aside 
 {  
  	background-color: #F5F5F5; 
 }
@media  screen and (min-width:100px) {
.poto_Outline{
margin:auto;
  height:120px;
  width:100%;
	}
	.div2{border: 1px solid black;
  height:50%;
    width: 50%;
    margin:0px 50px 2px 80px;
padding:10px 5px 2px 5px; 
font-size: 6px;
}
}
@media  screen and (min-width:480px) {
.poto_Outline{
margin:auto;
  height:120px;
  width:97%;
	}
	.div2{border: 1px solid black;
  height:100%;
    margin: 2px;
    width: 32%;
padding:10px 5px 2px 5px; 
}
}
@media  screen and (min-width:720px) {
.poto_Outline{
margin:auto;
  height:200px;
  width:97%;
	}
	.div2{border: 1px solid black;
  height:100%;
    margin: 2px;
    width: 32%;
padding:10px 5px 2px 5px; 
}
}
@media  screen and (min-width:1024px) {
.poto_Outline{
margin:auto;
  height:250px;
  width:97%;
	}
.div2{border: 1px solid black;
  height:100%;
    margin: 5px;
    width: 32%;
padding:10px 5px 2px 5px; 
}
}
@media  screen and (min-width:1280px) {
.poto_Outline{
margin:auto;
  height:320px;
  width:97%;
	}
.div2{border: 1px solid black;
  height:100%;
    margin: 5px;
    width: 32%;
padding:10px 5px 2px 5px; 
}
}
</style>
<body >
<aside>
<button type="button" id="a1" class="btn btn-primary" data-toggle="button" aria-pressed="false" autocomplete="off">
  切換頁面(建立/參加)
</button>
<!-- 	判斷登入者和 queryString 是否相同, 若相同才可修改  -->
	<c:if test="${! empty LoginOK}">
	

<div class="container-fluid">
		<div class="row">
			<div class="col-md-1 col-xs-1"></div>
			<div class="col-md-10 col-xs-10 ">
				<div id="activitys_div" class="row2"></div>
				<div  style="display: none" id="activitys_div2" class="row2"></div>
			</div>
			<div class="col-md-1 col-xs-1"></div>
		</div>
</div>
		<!-- 頁面部分 開始-->
		
		<!-- alert -->
		<div class="my-dialog-wrap">
		  <div class="my-dialog animated">
		    <div class="my-dialog-close">×</div>
		    <div class="my-dialog-header">
		      Dialog header
		    </div>
		    <div class="my-dialog-body">
		      Dialog body
		    </div>
		    <div class="my-dialog-footer">
		      <span type="cancel" class="my-dialog-btn">取消</span>
		      <span type="ok" class="my-dialog-btn">確定</span>
		    </div>
		  </div>
		</div>
<!-- alert -->
	
	<script>
 		$( "button" ).click(function() { 
 		  $( ".row2" ).toggle("Puff");
 		 
 		  if(!$('#a1').hasClass('active')){
 		 $(".logo_css").attr("src", "${this_contextPath}/images/logo/MyParticipateActivity.png")
 		  }else {
 			$(".logo_css").attr("src", "${this_contextPath}/images/logo/MyCreateActivity.png")
 		  }
 		}); 

	</script>
	
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
		$('.logo_here').append('<img  class="img-responsive logo_css" src="${this_contextPath}/images/logo/MyCreateActivity.png">')
		
		//個人建立的揪團
	    $.ajax({
	    	url:"${this_contextPath}/CRFSERVICE/activitysController/${LoginOK.member_Id}",
		          type:'get',  //get post put delete
		          data:{ },
		          success:function(data){      	  
		        	 var count=1;
		        	  $.each(data,function(index){        
		        		  var message;
		        		  var activityID=this[0].activity_Id;     		   
		        		  var jdate_int = parseInt(this[0].activity_Day);                          //轉換成數字
						  var jdate_value = new Date(jdate_int);
						  var jdate_int2 = parseInt(this[0].deadline);                          //轉換成數字
						  var jdate_value_deadline = new Date(jdate_int2);
						  var names=' ';
						  if(this[1]!=null){
						  var nameData=this[1].replace(",","")
						  }else{
			        		  var nameData = 0;
			        		 }	
		        		 if(index%3 == 0){
		        			 $('#activitys_div').append("<div id='div_"+count+"' class='row'></div>")      			 
		        		 }	 
							$('#div_'+count).append('<div class="col-md-4 col-xs-4 div2 " ><a href="${this_contextPath}/images/activitys/'
									+this[0].activity_Id+'.jpg" class="lightbox_image boxer" data-lightbox-gallery="image_gallery" rel="gallery" title="發起人:'
							+this[2]+'<br />類別：'+this[0].activity_Class+'<br />地區：'
							+this[0].activity_Area+'<br />內容：'
							+this[0].activity_Info+'<br />活動時間：'
							+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />報名截止日：'
							+jdate_value_deadline.Format("yyyy-MM-dd hh:mm:ss")
							//外
							+'"><span title=""><img src="${this_contextPath}/images/activitys/'
							+this[0].activity_Id+'.jpg" class="img-responsive poto_Outline" /></span></a><div class="col-md-12 col-xs-12"><p hidden="hidden">'+this[0].activity_Id+'</p>發起人：'
									+this[2]+'<br />類別：'
									+"<a href='#' class='select'>"+this[0].activity_Class+"</a>"+'<br />地區：'
									+"<a href='#' class='username' data-type='text' data-placement='right' data-title='Enter Area'>"+this[0].activity_Area+"</a>"+'<br />內容：'
									+"<a href='#' class='username' data-type='text' data-placement='right' data-title='Enter Info'>"+this[0].activity_Info+"</a>"+'<br />活動時間：'
									+"<a href='#' class='event' data-type='combodate' data-template='YYYY MM D HH:mm' data-format='YYYY-MM-DD HH:mm' data-viewformat='YYYY-MM-DD HH:mm' data-title='Setup event date and time' class='editable editable-click editable-empty' data-original-title='' title=''>"+jdate_value.Format('yyyy-MM-dd hh:mm')+"</a>"+'<br />活動截止日：'
									+"<a href='#' class='event' data-type='combodate' data-template='YYYY MM D HH:mm' data-format='YYYY-MM-DD HH:mm' data-viewformat='YYYY-MM-DD HH:mm' data-title='Setup event date and time' class='editable editable-click editable-empty' data-original-title='' title=''>"+jdate_value_deadline.Format('yyyy-MM-dd hh:mm')+"</a>"+'<br />目前參加人數：'
									+'<a href="#" class="linkpeople" title='+nameData+'>'+this[0].people+'</a><br />'
									+'<p>報名人數上限：'+this[0].people_Max+'</p></div></div>') 									
// 									+'<button type="button" class="btn btn-default" data-toggle="tooltip" style="border:none;color:red" data-placement="right" title="'
// 									+names+'">'
// 									+'</button><br />'+'報名人數上限：<button class="btn btn-default" style="border:none">'+this[0].people_Max+'</button></div></div>')
									
							if(index%3 == 2){
								count++;
							}
									  					
	                 		 })//each
						
	                 		//tooltip
	                 		     $('.linkpeople').tooltip();
	                 		 //tooltip
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
			
	                 $('div a:not(:first-child)').click(function(){
	                	 var li_notfirst =$(this)
	                	  $('form').submit(function(){
// 	                		    console.log(li_notfirst.siblings("p:first").text())
// 	                			console.log(li_notfirst.parent().find("a:eq(0)").text())
// 	                			console.log(li_notfirst.parent().find("a:eq(1)").text())
// 	                			console.log(li_notfirst.parent().find("a:eq(2)").text())
// 	                			console.log(li_notfirst.parent().find("a:eq(3)").text())
// 	                			console.log(li_notfirst.parent().find("a:eq(4)").text())
		                	   $.ajax({
	    						url:"${this_contextPath}/CRFSERVICE/activitysController/modifyActivitys",
		          				type:'post',  //get post put delete
		          				data:{activity_Id:li_notfirst.siblings("p:first").text(),
		          					  activity_Class:li_notfirst.parent().find("a:eq(0)").text(),
		          					  activity_Area:li_notfirst.parent().find("a:eq(1)").text(),
		          					  activity_Info:li_notfirst.parent().find("a:eq(2)").text(),
		          					  activity_Day:li_notfirst.parent().find("a:eq(3)").text(),
		          					  deadline:li_notfirst.parent().find("a:eq(4)").text()
		          					},
		          				success:function(data){    
		          					console.log(data)
		          				}
		                	   })
	                		 
	                	  })
	                	 
	                  })
		          }//外層success          	 
		      })//外層ajax
		      
		      //個人建立的揪團
		      
		      
// 		      //個人參加的揪團
		      
	    $.ajax({
	    	url:"${this_contextPath}/CRFSERVICE/activitysController/myActivitys/${LoginOK.member_Id}",
		          type:'get',  //get post put delete
		          data:{ },
		          success:function(data){      	  
		        	 var count=1;
		        	  $.each(data,function(index){        
		        		  var message;
		        		  var activityID=this[0].activity_Id;     		   
		        		  var jdate_int = parseInt(this[0].activity_Day);                          //轉換成數字
						  var jdate_value = new Date(jdate_int);
						  var jdate_int2 = parseInt(this[0].deadline);                          //轉換成數字
						  var jdate_value_deadline = new Date(jdate_int2);
						  var names=' ';
						  if(this[3]!=null){
						  var nameData=this[3].replace(",","")
						  }else{
			        		  var nameData = 0;
			        	 }	
		        		 if(index%3 == 0){
		        			 $('#activitys_div2').append("<div id='div2_"+count+"' class='row'></div>")      			 
		        		 }	 
							$('#div2_'+count).append('<div id='+this[0].activity_Id+' class="col-md-4 col-xs-4 div2 " ><a href="${this_contextPath}/images/activitys/'
							+this[0].activity_Id+'.jpg" class="lightbox_image boxer" data-lightbox-gallery="image_gallery" rel="gallery" title="發起人:'
							+this[2]+'<br />類別：'+this[0].activity_Class+'<br />地區：'
							+this[0].activity_Area+'<br />內容：'
							+this[0].activity_Info+'<br />活動時間：'
							+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />報名截止日：'
							+jdate_value_deadline.Format("yyyy-MM-dd hh:mm:ss")
							+"<button class='alert-vel btn btn-warning submit_x' style='float:right' type='submit' value='INSERT_MEMBER'>取消參加</button>"
							+"<div hidden='hidden'>"+this[0].activity_Id+"</div>"
							//外
							+'"><span title=""><img src="${this_contextPath}/images/activitys/'
							+this[0].activity_Id+'.jpg" class="img-responsive poto_Outline" /></span></a><div class="col-md-12 col-xs-12"><p hidden="hidden">'+this[0].activity_Id+'</p>發起人：'
							+'<a href="${this_contextPath}/PersonalJournal.jsp?'+this[0].member_Id+'">'+this[2]+'</a>'
									+'<br />類別：'
									+this[0].activity_Class+"</a>"+'<br />地區：'
									+this[0].activity_Area+"</a>"+'<br />內容：'
									+this[0].activity_Info+"</a>"+'<br />活動時間：'
									+jdate_value.Format('yyyy-MM-dd hh:mm')+'<br />活動截止日：'
									+jdate_value_deadline.Format('yyyy-MM-dd hh:mm')+'<br />目前參加人數：'
									+'<a href="#" class="linkpeople" title='+nameData+'>'+this[0].people+'</a><br />'
									+'<p>報名人數上限：'+this[0].people_Max+'</p></div></div>') 
// 									+'<button type="button" class="btn btn-default" data-toggle="tooltip" style="border:none;color:red" data-placement="right" title="'
// 									+">'
// 									+'</button><br />'+'報名人數上限：<button class="btn btn-default" style="border:none">'+this[0].people_Max+'</button></button></div></div>')
									
							if(index%3 == 2){
								count++;
							}
									  					
	                 		 })//each

	                 		
	                 		 //tooltip
	                 		    $('.linkpeople').tooltip();
	                 		 //tooltip
	                 		  
	                 		 
	                 		 //彈跳視窗	                 		 
								$(".boxer").boxer({
    							top: 50,
    							fixed:true
								});	
							//彈跳視窗
							
							
							//取消參加
							
							$("body").on("click", '.submit_x', function(){
								var acid=$('.boxer-caption').find('div').text()
							var whatActivityID=$(this).parent().siblings("div").text()
							$("#boxer-overlay").remove();
						    $("#boxer").remove();
						    $('body').toggleClass();
							//alert
			                     dialog.confirm({
						         title: '警告',
						         inner: '確認取消參加活動嗎?',
						         ok: function(){
						        	 del(acid,whatActivityID)
						        },
						         showType: 'swing'
						   		});
							});
							    //alert
							function del(acid,whatActivityID){
							$.ajax({
						    	 url:"${this_contextPath}/CRFSERVICE/activityDetailController/cleanActivityDetail",
						    	 type:'post',
						    	 data:{
						    		  activity_Id:acid,
						    		  member_Id:'${LoginOK.member_Id}'
						    		  },
						    		  success:function(data){
						    		  var members="";
						    		  var sum =0;
						    		  var whoButton=$('#button'+whatActivityID);
						    		  $.each(data,function(index){          
						    		            members+=this+" ";
						    		    		sum+=1;
						    		    	})   
						    		  $("#"+acid).fadeOut(700,function(){
						    			  $(this).remove();	  
						    		  })	
						    		  console.log(acid)
							    		}//success			   
							     }) //ajax
							    }
 											
							//取消參加		
		          }//外層success          	 
		      })
		      
// 		      //個人參加的揪團     
	})
	</script>

</c:if>
	<!--  頁面部分 結束 -->
<script src="${this_contextPath}/js/dialog.min.js" ></script><!-- alert -->
<script src="${this_contextPath}/js/jquery.fs.boxer.min.js" ></script> <!-- 彈跳視窗--> 
<script src="${this_contextPath}/js/bootstrap-editable.min.js" ></script> <!-- 日期選擇器 -->
<script src="${this_contextPath}/js/moment.js" ></script> <!-- 日期選擇器 --> 
</aside>
</body>
</html>
