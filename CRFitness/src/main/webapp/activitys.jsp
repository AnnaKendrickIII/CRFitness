<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<c:if test="${ empty LoginOK}">
<c:redirect url="/index.jsp?NoLogin"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>揪團</title>
<jsp:include page="/CRFitness.jsp" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/component_activity.css" />

<script src="${this_contextPath}/js/modernizr.custom.js"></script><!-- 瀑布流 -->
<link rel="stylesheet" href="${this_contextPath}/css/jquery.fs.boxer.css"> <!-- 彈跳視窗 -->
<link href="${this_contextPath}/css/fine-uploader-new.css" rel="stylesheet" /> <!-- 檔案上傳 -->
<script src="${this_contextPath}/js/jquery.fine-uploader.js"></script> <!-- 檔案上傳 -->
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jquery.datetimepicker.css">    <!-- 日期選擇器 -->
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jquery.alertable.css"> <!-- alert -->
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jAlert-v4.css">  <!-- alert -->
<script src="${this_contextPath}/js/velocity.min.js" ></script>  <!-- alert -->
<script src="${this_contextPath}/js/velocity.ui.min.js" ></script>  <!-- alert -->
<script src="${this_contextPath}/js/jquery.alertable.min.js" ></script>  <!-- alert -->
<script src="${this_contextPath}/js/jAlert-v4.min.js" ></script>  <!-- alert -->

<style>
aside 
 {  
  	background-color: #F5F5F5; 
 }
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
.qq-edit-filename-icon {
    display: none;
    background: url("${this_contextPath}/images/edit.gif");
    width: 15px;
    height: 15px;
    vertical-align: text-bottom;
    margin-right: 16px;
}

.chat_commenting{
margin-left: 5%;
}
.chat_commenting:HOVER {
	color:#84C1FF;
	font-size: 22px;
}
</style>
<script type="text/template" id="qq-template-manual-trigger">
        <div class="qq-uploader-selector qq-uploader" qq-drop-area-text="Drop files here">
            <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
                <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="50" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
            </div>
            <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
                <span class="qq-upload-drop-area-text-selector"></span>
            </div>
            <div class="buttons">
                <div class="qq-upload-button-selector qq-upload-button">
                    <div>Select files</div>
                </div>
            </div>
            <ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">
                <li>
                    <div class="qq-progress-bar-container-selector">
                        <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                    </div>
                    <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                    <img class="qq-thumbnail-selector" qq-max-size="100" qq-server-scale>
                    <span class="qq-upload-file-selector qq-upload-file"></span>
                    <span class="qq-edit-filename-icon-selector qq-edit-filename-icon" aria-label="Edit filename"></span>
                    <input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">
                    <span class="qq-upload-size-selector qq-upload-size"></span>
                    <button type="button" class="qq-btn qq-upload-cancel-selector qq-upload-cancel">Cancel</button>
                    <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete">Delete</button>
                    <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
                </li>
            </ul>

            <dialog class="qq-alert-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">Close</button>
                </div>
            </dialog>

            <dialog class="qq-confirm-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">No</button>
                    <button type="button" class="qq-ok-button-selector">Yes</button>
                </div>
            </dialog>

            <dialog class="qq-prompt-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <input type="text">
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">Cancel</button>
                    <button type="button" class="qq-ok-button-selector">Ok</button>
                </div>
            </dialog>
        </div>
    </script>

    <style>
        #trigger-upload {
            color: white;
            background-color: #00ABC7;
            font-size: 14px;
            padding: 7px 20px;
            background-image: none;
        }

        #fine-uploader-manual-trigger .qq-upload-button {
            margin-right: 15px;
        }

        #fine-uploader-manual-trigger .buttons {
            width: 50%;
        }

        #fine-uploader-manual-trigger .qq-uploader .qq-total-progress-bar-container {
            width: 60%;
        }
    </style>


</head>
<body >
<aside>
	<!-- 頁面部分 開始-->

    <ul class="grid effect-5 " id="grid">
               <li> <a data-toggle="modal" href="#new_activity"><img src="${this_contextPath}/images/new.jpg"> </a>新增揪團</li>
				
		</ul>
 	<!-- 新增活動 開始-->

                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="new_activity" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header login_header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3 class="modal-title">發起新活動</h3>
                            </div>
                            <div id="addActivitys_form" class="modal-body">
                            <div id='fine-uploader-manual-trigger'></div>
                                <p>活動時間&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                                <input required="required" type="text" id="datetimepicker" name="addActivitys_Day" autocomplete="off" class="form-control" placeholder="活動時間" />                                                
                                <p>活動類別&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
	                            <select id="addActivity_Class" name="test1" class="form-control" >
								  <option value="跑步">跑步</option>
								  <option value="登山">登山</option>
								  <option value="游泳">游泳</option>
								  <option value="飛輪">飛輪</option>
								  <option value="自行車">自行車</option>
								  <option value="有氧運動">有氧運動</option>
								  <option value="球類運動">球類運動</option>
								  <option value="室內運動">室內運動</option>
								  <option value="其他類別">其他類別</option>
								</select>
                                <p>活動地點&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                                <input required="required" type="text" id="addActivitys_Area" class="form-control" autocomplete="off" placeholder="活動地點"/>
                                <p>活動內容&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                                <input required="required" type="text" id="addActivitys_Info"  class="form-control" autocomplete="off" placeholder="活動內容" />
                                <p>報名截止日&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                                <input required="required" type="text" id="datetimepickerb" name="deadline" autocomplete="off" class="form-control" placeholder="報名截止日" />
                                <p>人數上限&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                                <input required="required" type="text" id="addActivitys_People" class="form-control" autocomplete="off" placeholder="人數上限"/>
                            </div>
                            <div class="modal-footer">
                             <h4 style="color:red;float:left" >${ErrorMessage.registered_error}</h4>
                                <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                                <button id="addActivitys" class="btn btn-theme" type="button" value="INSERT_MEMBER">送出</button>                                      
                            </div>
                        </div>
                    </div>
                </div>


                <!-- 上傳圖片 開始-->
                <script>
        $('#fine-uploader-manual-trigger').fineUploader({
            template: 'qq-template-manual-trigger',
            request: {
                endpoint: '/server/uploads'
            },
            thumbnails: {
                placeholders: {
                    waitingPath: '${this_contextPath}/images/loader-small.gif',
                    notAvailablePath: '${this_contextPath}/images/not_available-generic.png'
                }
            },
            autoUpload: false
        });

        $('#trigger-upload').click(function() {
            $('#fine-uploader-manual-trigger').fineUploader('uploadStoredFiles');
        });
    </script>
                <!-- 上傳圖片 結尾-->
               
                   <!-- 新增活動 結尾-->
    <script src="${this_contextPath}/js/masonry.pkgd.mis.js"></script>    <!-- 瀑布流 -->
	<script src="${this_contextPath}/js/classie.min.js"></script><!-- 瀑布流 -->
	<script src="${this_contextPath}/js/imagesloaded.min.js"></script><!-- 瀑布流 -->
	<script src="${this_contextPath}/js/AnimOnScroll.min.js"></script>	<!-- 瀑布流 -->
	
	<!-- 輸入日期 開始-->
	<script src="${pageContext.servletContext.contextPath}/js/jquery.datetimepicker.full.min.js"></script><!-- 日期選擇器 -->
	
	<script>
		$('#datetimepicker').datetimepicker({value:'2016/08/12 10:00:00',step:10});
		$('#datetimepickerb').datetimepicker({value:'2016/08/19 10:00:00',step:10});
	</script>
	<!-- 輸入日期 結尾-->
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
	  jQuery(function ($) {
		  $('.logo_here').append('<img  class="img-responsive logo_css" src="${this_contextPath}/images/logo/Activitys.png">')
		  var file;	
		  $('#fine-uploader-manual-trigger .qq-uploader-selector').change(function (event) {		 
		 file=event.target.files;			  	 	 
		  })
			jQuery.event.props.push('dataTransfer');
			//加入dragover和drop
		$('#fine-uploader-manual-trigger .qq-uploader-selector .qq-upload-drop-area-selector').on('dragover', function(event){
    		//停止開啟檔案及其他動作
    		event.stopPropagation();
    		event.preventDefault();
    		//複製拖移的物件
    		event.dataTransfer.dropEffect = 'copy';
			});
		$('#fine-uploader-manual-trigger .qq-uploader-selector .qq-upload-drop-area-selector').on('drop', function(event){
   			//停止開啟檔案及其他動作
    		event.stopPropagation();
    		event.preventDefault();
    		//透過dataTransfer取得FileList object.
    		file = event.dataTransfer.files;
    		
		})	  
	
	  $('#addActivitys').click(function () {
		  	var formData = new FormData();
		  	var datetimepicker = $('#datetimepicker');
		  	var datetimepickerb = $('#datetimepickerb');
		  	formData.append('photo1', file[0]);
			 formData.append('member_Id',  '${LoginOK.member_Id}');
			 formData.append('activity_Day', datetimepicker.val());
			 formData.append('activity_Class', $('#addActivity_Class').val());
			 formData.append('activity_Area', $('#addActivitys_Area').val());
			 formData.append('activity_Info', $('#addActivitys_Info').val());
			 formData.append('deadline', datetimepickerb.val());
			 formData.append('people_Max', $('#addActivitys_People').val());
		   $.ajax({
               url:"${this_contextPath}/CRFSERVICE/activitysController/addActivitys",
               type:'post',  //get post put delete
				data: formData,
    		   processData: false,
			   contentType: false,
               success:function(data){
            	   var jdate_int = parseInt(data.activity_Day);                          //轉換成數字
				   var jdate_value = new Date(jdate_int);
				   var jdate_intb = parseInt(data.deadline);                        //轉換成數字
				   var jdate_value_deadline = new Date(jdate_intb);
            	   $('#new_activity').modal('hide');	
            	   $('#grid>li:nth-child(1)').after('<li class="animate"><a href="${this_contextPath}/images/activitys/'
							+data.activity_Id+'.jpg" class="lightbox_image boxer" data-lightbox-gallery="image_gallery" rel="gallery" title="發起人：'
							+'${LoginOK.nickname}'+'<br />類別：'+data.activity_Class+'<br />地區：'
									+data.activity_Area+'<br />內容：'
									+data.activity_Info+'<br />活動時間：'
									+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />報名截止日：'
									+jdate_value_deadline.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
									+data.people+"<br /><button class='btn btn-theme submit_x' style='float:right;border:none' type='submit' value='INSERT_MEMBER'>參加活動</button>" 
									+"<div hidden='hidden'>"+data.activity_Id
									+'</div>"><span title=""><img src=${this_contextPath}/CRFSERVICE/activitysController/photo/'
									+data.activity_Id+'.jpg" /></span></a>發起人：'
									+'<a class="aIswho" href="${this_contextPath}/PersonalJournal.jsp?${LoginOK.member_Id}">${LoginOK.nickname}</a>'
									+'<div class="activity_who" hidden="hidden">${LoginOK.member_Id}</div>'
									+'<i class="fa fa-commenting-o chat_commenting" aria-hidden="true"></i><br />類別：'
									+data.activity_Class+'<br />地區：'
									+data.activity_Area+'<br />內容：'
									+data.activity_Info+'<br />活動時間：'
									+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />報名截止日：'
									+jdate_value_deadline.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
									+'<a href="#" class="linkpeople" title='+0+'>'+data.people+'</a><br /><p>報名人數上限：'+data.people_Max+'</p></li>')
// 									+'<button type="button" class="btn btn-default " data-toggle="tooltip" style="border:none" data-placement="right" title=" ">'
// 									+data.people+'</button><br /><p>報名人數上限：'+data.people_Max+'</p></li>')								
// 										 $('.btn.btn-default').tooltip()	
						
										$(".linkpeople").tooltip();
									  $(".boxer").boxer({ 
											  top: 50,
											  fixed:true
										  });	
										new AnimOnScroll(document.getElementById('grid'), {
						                      minDuration: 0.4,
						                      maxDuration: 0.6,
						                      viewportFactor: 0.2
						                  }); 		
							$('input').val('')	
							$('#datetimepicker').datetimepicker({value:'2016/08/12 10:00:00',step:10});
							$('#datetimepickerb').datetimepicker({value:'2016/08/12 10:00:00',step:10});
							$('#fine-uploader-manual-trigger .qq-upload-list-selector').empty()
							file=null
               						}	 
           })
	})	    
	    $.ajax({
		          url:"${this_contextPath}/CRFSERVICE/activitysController/AllActivitysMembers",
		          type:'get',  //get post put delete
		          data:{ },
		          success:function(data){      	  
		        	  $.each(data,function(index){        		  
		        		  var message;
		        		  var activityID=this[0].activity_Id;     		   
		        		  var jdate_int = parseInt(this[0].activity_Day);                          //轉換成數字
						  var jdate_value = new Date(jdate_int);
						  var jdate_intb = parseInt(this[0].deadline);                        //轉換成數字
						  var jdate_value_deadline = new Date(jdate_intb);
						  var names=' ';
						  var full = ' ';
		        		  if(this[1]!=null){
						  var nameData=this[1].replace(",","")						  
// 						  $.each(nameData,function(){
// 							if(this!=""){
// 								names+=this+'\n'
// 							}				  
// 						  })//第二個each	
		        		 }else{
			        		  var nameData = 0;
		        		 }
		        		  if(this[0].people < this[0].people_Max){
								full = "<button class='alert-vel btn btn-theme submit_x' style='float:right' type='submit' value='INSERT_MEMBER'>參加活動</button>" 
								}else{
								full = "<button class='alert-vel btn btn-danger submit_f' style='float:right' type='submit'>已額滿</button>" 	
								}
		        		  								//href="data:image/png;base64,'+this[0].photo1+'"
                          								//href="${this_contextPath}/CRFSERVICE/activitysController/photo/'+this[0].activity_Id+'"
                          								//${this_contextPath}/images/activitys/'+this[0].activity_Id+' .jpg
							$('#grid').append('<li ><a href="${this_contextPath}/images/activitys/'
							+this[0].activity_Id+'.jpg" class="lightbox_image boxer" data-lightbox-gallery="image_gallery" rel="gallery" title="發起人：'
							+this[2]+"<i aria-hidden='true'></i>"
							+'<br />類別：'+this[0].activity_Class+'<br />地區：'
									+this[0].activity_Area+'<br />內容：'
									+this[0].activity_Info+'<br />活動時間：'
									+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />報名截止日：'
									+jdate_value_deadline.Format("yyyy-MM-dd hh:mm:ss")
									+full+"<div hidden='hidden'>"+this[0].activity_Id
									+'</div>"><span title=""><img src="${this_contextPath}/CRFSERVICE/activitysController/photo/'
									+this[0].activity_Id+'.jpg" /></span></a>發起人：'
									+'<a class="aIswho" href="${this_contextPath}/PersonalJournal.jsp?'+this[0].member_Id+'">'+this[2]+'</a>'
									+'<div class="activity_who" hidden="hidden">'+this[0].member_Id+'</div>'
									+'<i class="fa fa-commenting-o chat_commenting" aria-hidden="true"></i><br />類別：'
									+this[0].activity_Class+'<br />地區：'
									+this[0].activity_Area+'<br />內容：'
									+this[0].activity_Info+'<br />活動時間：'
									+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />報名截止日：'
									+jdate_value_deadline.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
									+'<a href="#" id="button'+this[0].activity_Id+'" class="linkpeople" title='+nameData+'>'+this[0].people+'</a><br /><p>報名人數上限：'+this[0].people_Max+'</p></li>')
// 									+'<button type="button" id="button'+this[0].activity_Id+'" class="btn btn-default" style="border:none" data-toggle="tooltip" data-placement="right" title="'
// 									+names+'">'
// 									+this[0].people+'</button><br />'+'<p>報名人數上限：'+this[0].people_Max+'</p></li>')
									  					
	                 		 })//第一個each
// 							  $('.btn.btn-default').tooltip()
								$(".linkpeople").tooltip();
								$(".boxer").boxer({
    							top: 50,
    							fixed:true
								});																	
	                  new AnimOnScroll(document.getElementById('grid'), {
	                      minDuration: 0.4,
	                      maxDuration: 0.6,
	                      viewportFactor: 0.2
	                  });     
		          }//success	 
		      })//ajax
		      
		      
		      $("body").on("click", '.submit_f', function(){	    
							   $("#boxer-overlay").remove();
							   $("#boxer").remove();
							   $('body').toggleClass();						     			
							   errorAlert('抱歉', '活動人數已額滿。');
					   })
		    	  
	 
		      $("body").on("click", '.submit_x', function(){
		    	  var whatActivityID=$(this).parent().siblings("div").text()
		    	   $.ajax({
		    		   url:"${this_contextPath}/CRFSERVICE/activityDetailController/addActivityDetail",
		    		   type:'post',
		    		   data:{
		    			   activity_Id:$('.boxer-caption').find('div').text(),
		    			   member_Id:'${LoginOK.member_Id}'
		    		   },
		    		   success:function(data){
		    			   //console.log(data[0])
		    			   if(data[0]=='無法參加自己的活動'){
		    				   $("#boxer-overlay").remove();
		    				   $("#boxer").remove();
		    				   $('body').toggleClass();	   
		    				   errorAlert('錯誤', '無法參加自己舉辦的活動。');  
		    			   }else if(data[0]=='參加過'){
		    				   $("#boxer-overlay").remove();
		    				   $("#boxer").remove();
		    				   $('body').toggleClass();		   		
		    				   errorAlert('警告', '您已經參加過此活動。');
		    			   }
		    			   else{
		    				var members="";
		    				var sum =0;
		    				var whoButton=$('#button'+whatActivityID);
		    				   $.each(data,function(index){          
		    					   members+=this+" ";
		    					   sum+=1;
		    				   })   
		    				   whoButton.text(sum)
		    				   whoButton.attr("data-original-title",members)
		    
		    				   
		    				   $("#boxer-overlay").remove();
		    				   $("#boxer").remove();
		    				   $('body').toggleClass();		
		    				
		    				   $.alertable.alert('參加成功', {
		    					   show: function() {
		    					     $(this.overlay).velocity('transition.fadeIn');        
		    					     $(this.modal).velocity('transition.flipBounceYIn');
		    					   },
		    					   hide: function() {
		    					     $(this.overlay).velocity('transition.fadeOut');
		    					     $(this.modal).velocity('transition.perspectiveUpOut');
		    					   } 
		    					 });

		    			   }			   
		    		   }
		    	   })
 				});
		  	$('body').on('click','.chat_commenting',function(){	
		  		var thisId=$(this).siblings('.activity_who').text();
		  		var who=$(this).siblings('.aIswho').text();
		  		if(thisId!="${LoginOK.member_Id}"){
		  		bodyappend(thisId,who);//用框架裡bodyappend 增加聊天室
				IsReadThree(thisId)//用框架裡IsReadThree 增加已讀三則
		  		}
		  	})	
	  })
    
</script>
<script src="${this_contextPath}/js/jAlert-functions.min.js"></script><!-- alert -->
<script src="${this_contextPath}/js/jquery.fs.boxer.min.js" ></script><!-- 彈跳視窗 -->
<!-- 頁面部分 結束-->
</aside>
</body>
</html>
