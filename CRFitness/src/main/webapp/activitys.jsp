<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>揪團</title>
<jsp:include page="/CRFitness.jsp" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/component.css" />

<script src="${this_contextPath}/js/modernizr.custom.js"></script>
<link rel="stylesheet" href="${this_contextPath}/css/site.css">
<link href="${this_contextPath}/css/fine-uploader-new.css" rel="stylesheet" />
<script src="${this_contextPath}/js/jquery.fine-uploader.js"></script>
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jquery.datetimepicker.css">  


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
.qq-edit-filename-icon {
    display: none;
    background: url("${this_contextPath}/images/edit.gif");
    width: 15px;
    height: 15px;
    vertical-align: text-bottom;
    margin-right: 16px;
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

	<!-- 頁面部分 開始-->

    <ul class="grid effect-5 " id="grid">
               <li>
              
               <a data-toggle="modal" href="#new_activity"><img src="${this_contextPath}/images/new.jpg"></a>新增揪團</li>
		</ul>
 	<!-- 新增活動 開始-->
<%-- 			<form  name="member" class="form-login" action="${this_contextPath}/CRF/member!registered.action" method="post" > --%>
                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="new_activity" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header login_header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3 class="modal-title">發起新活動</h3>
                            </div>
                            <div id="addActivitys_form" class="modal-body">
                            <div id='fine-uploader-manual-trigger'></div>
                                <p>活動時間&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.nickname_error}</span></p>
                                <input required="required" type="text" id="datetimepicker" name="addActivitys_Day" autocomplete="off" class="form-control" placeholder="活動時間" />                                                
                                <p>活動類別&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.e_mail_error}</span></p>
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
                                <p>活動地點&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.password_error}</span></p>
                                <input required="required" type="text" id="addActivitys_Area" class="form-control" autocomplete="off" placeholder="活動地點"/>
                                <p>活動內容&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.checkpassword_error}</span></p>
                                <input required="required" type="text" id="addActivitys_Info"  class="form-control" autocomplete="off" placeholder="活動內容" />
                                <p>報名截止日&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.checkpassword_error}</span></p>
                                <input required="required" type="text" id="datetimepickerb" name="deadline" autocomplete="off" class="form-control" placeholder="報名截止日" />
                            </div>
                            <div class="modal-footer">
                             <h4 style="color:red;float:left" >${ErrorMessage.registered_error}</h4>
                                <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                                <button id="addActivitys" class="btn btn-theme" type="button" value="INSERT_MEMBER">送出</button>                       
                            </div>
                        </div>
                    </div>
                </div>
<!--                </form> -->

                <!-- 上傳圖片 開始-->
                <script>
        $('#fine-uploader-manual-trigger').fineUploader({
            template: 'qq-template-manual-trigger',
            request: {
                endpoint: '/server/uploads'
            },
            thumbnails: {
                placeholders: {
                    waitingPath: '${this_contextPath}/images/waiting-generic.png',
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
    <script src="${this_contextPath}/js/masonry.pkgd.mis.js"></script>    
	<script src="${this_contextPath}/js/classie.js"></script>
	<script src="${this_contextPath}/js/imagesloaded.js"></script>
	<script src="${this_contextPath}/js/AnimOnScroll.js"></script>	
	
	<!-- 輸入日期 開始-->
	<script src="${pageContext.servletContext.contextPath}/js/jquery.datetimepicker.full.js"></script>
	<script>
		$('#datetimepicker').datetimepicker({value:'2016/08/12 10:00:00',step:10});
		$('#datetimepickerb').datetimepicker({value:'2016/08/12 10:00:00',step:10});
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
	  $(function () { 
	  $('#addActivitys').click(function () {
		   $.ajax({
               url:"${this_contextPath}/CRFSERVICE/activitysController/addActivitys",
               type:'post',  //get post put delete
               data:{ member_Id:'${LoginOK.member_Id}',
            	 activity_Day:$('#datetimepicker').val(),
            	 activity_Class:$('#addActivity_Class').val(),
       			 activity_Area:$('#addActivitys_Area').val(),
       			 photo1: $('.qq-thumbnail-selector').attr('src').substr(23),
    			 activity_Info:  $('#addActivitys_Info').val(),
    			 deadline:$('#datetimepickerb').val(),
    			 date: $('#date').val()},
               success:function(data){
                  
//                        $('#friend_tbody').append('<tr><td><img src="data:image/png;base64,'+this.photo+'" class="img-circle friend_photo" alt="Responsive image" /><td class="friend_Name">'+  this.nickname +'</td><td>'+  this.e_mail +'</td>')  
                  
               }          	 
           })
	})	    
	    $.ajax({
		          url:"${this_contextPath}/CRFSERVICE/activitysController/AllActivitysMembers",
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
							+this[0].photo1+'" class="lightbox_image js-lightbox" data-lightbox-gallery="image_gallery" title="發起人：'
							+this[2]+'<br />類別：'+this[0].activity_Class+'<br />地區：'
									+this[0].activity_Area+'<br />內容：'
									+this[0].activity_Info+'<br />日期：'
									+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
									+this[0].people+"<br /><button class='btn btn-theme' type='submit' value='INSERT_MEMBER'>參加活動</button>" 
									+'"><img src="data:image/png;base64,'
									+this[0].photo1+'" /></a>發起人：'
									+this[2]+'<br />類別：'
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
// 	                  $.getScript('${this_contextPath}/js/overlibmws.js',function(){
	                	  
// 	                  })
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




</body>
</html>
