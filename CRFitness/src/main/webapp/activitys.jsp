<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>揪團</title>
<jsp:include page="/CRFitness.jsp" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/component.css" />
<script src="${this_contextPath}/js/modernizr.custom.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/site.css">
<link href="${this_contextPath}/css/fine-uploader-new.css" rel="stylesheet" />
<script src="${this_contextPath}/js/jquery.fine-uploader.js"></script>
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
			<form  name="member" class="form-login" action="${this_contextPath}/CRF/member!registered.action" method="post" >
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
                                <input required="required" type="text" name="addActivitys_day" autocomplete="off" class="form-control" placeholder="活動時間" />                                                
                                <p>活動類別&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.e_mail_error}</span></p>
                                <input required="required" type="text" id="addActivitys_class" autocomplete="off" class="form-control" placeholder="活動類別" />
                                <p>活動地點&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.password_error}</span></p>
                                <input required="required" type="text" id="addActivitys_place" class="form-control" autocomplete="off" placeholder="活動地點"/>
                                <p>活動內容&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.checkpassword_error}</span></p>
                                <input required="required" type="text" id="addActivitys_info"  class="form-control" autocomplete="off" placeholder="活動內容" />
                                <p>報名截止日&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.checkpassword_error}</span></p>
                                <input required="required" type="text" id="addActivitys_end_day"  class="form-control" autocomplete="off" placeholder="報名截止日" />
                            </div>
                            <div class="modal-footer">
                             <h4 style="color:red;float:left" >${ErrorMessage.registered_error}</h4>
                                <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                                <button id="addActivitys" class="btn btn-theme" type="button" value="INSERT_MEMBER">送出</button>                       
                            </div>
                        </div>
                    </div>
                </div>
               </form>
                <!-- 輸入日期 開始-->

                <!-- 輸入日期 結尾-->
                
                
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
       			 activity_Area:$('#location').val(),
    			 activity_Info:  $('#addActivitys_info').val(),
    			 photo1: $('.qq-thumbnail-selector').attr('src').substr(23),
    			 date: $('#date').val()},
               success:function(data){
                  
//                        $('#friend_tbody').append('<tr><td><img src="data:image/png;base64,'+this.photo+'" class="img-circle friend_photo" alt="Responsive image" /><td class="friend_Name">'+  this.nickname +'</td><td>'+  this.e_mail +'</td>')  
                  
               }          	 
           })
	})	    
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

</body>
</html>