<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="google-signin-client_id"
	content="826213451911-6rpb37oapsg46p3ao0mhv6ks9orcja5h.apps.googleusercontent.com" />
<jsp:include page="/AdminFrame.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<script src="${this_contextPath}/js/jquery-2.2.4.min.js"></script>  
<link href="${this_contextPath}/css/fine-uploader-new.css" rel="stylesheet" />
<script src="${this_contextPath}/js/jquery.fine-uploader.js"></script>

<title>MaintainProducts</title>

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
body {
	background-color: #E0E0E0;
}

.table {
	background-color: white;
	border-radius: 20px;
}

.table thead tr {
	background-color: #46A3FF;
}
/* .table thead th:nth-child(1){ */

/* } */
/* .table thead th:nth-child(5){ */

/* } */
.table tbody a {
	color: #F75000;
	text-decoration: none;
}

.table tbody a:hover {
	color: black;
}


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

#creProdBtn{
	margin-top:55px;
}

#grid{
	margin-top:55px;
}
</style>
</head>
<body>

<!-- 頁面部分 開始-->
	<div class="row">
		<div class="col-md-2 "></div>
		<div class="col-md-8 col-xs-12 ">
		
		<button type="button" id="creProdBtn" class="btn btn-primary btn-1g" data-toggle="modal" data-target="#new_products">  
  		新增產品 
  		</button>

<!-- 資料表格 開始 -->
		<table id="games_talbe" class="table">
			<thead>
				<tr>
					<th><h3>Photo</h3></th>
					<th><h3>ID</h3></th>
					<th><h3>Detailed ID</h3></th>
					<th><h3>Name</h3></th>
					<th><h3>Size</h3></th>
					<th><h3>Color</h3></th>
					<th><h3>Stock</h3></th>
					<th><h3>Price</h3></th>
					<th><h3>Category</h3></th>
					<th><h3>Published Date</h3></th>
					<th><h3>Modify</h3></th>
					<th><h3>Suspended</h3></th>
				</tr>
			</thead>
			<tbody id="products_tbody"></tbody>
		</table>
		
		</div> <!-- end of class="col-md-8 col-xs-12" -->
		<div class="col-md-2"></div>
<!-- 資料表格 結束 -->

<!-- 新增產品彈出視窗 開始-->
        	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="new_products" class="modal fade">
            	<div class="modal-dialog">
                	<div class="modal-content">
                	
                    <div class="modal-header login_header">
                    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3 class="modal-title">新增產品</h3>
                    </div>
                            
                    <div id="addActivitys_form" class="modal-body">
                    <div id='fine-uploader-manual-trigger'></div>
            	        <p>產品名稱&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="insert_Name" autocomplete="off" class="form-control" placeholder="輸入名稱" />                                                
                        <p>產品顏色&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                   		<input required="required" type="text" id="insert_color" autocomplete="off" class="form-control" placeholder="輸入顏色" />
                        <p>產品大小&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red" ></span></p>
                        <select id="insert_size" name="test1" class="form-control" >
							<option value="1">XS</option>
							<option value="2">S</option>
							<option value="3">M</option>
							<option value="4">L</option>
							<option value="5">XL</option>
							<option value="6">2XL</option>
							<option value="7">3XL</option>
							<option value="8">U</option>
						</select>
                        <p>產品數量&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="insert_stock" class="form-control" autocomplete="off" placeholder="輸入數量"/>
                        <p>產品價格&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="insert_price" class="form-control" autocomplete="off" placeholder="輸入價格" />
                        <p>產品分類&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="insert_category" class="form-control" autocomplete="off" placeholder="輸入分類" />
                        <p>產品簡介&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="insert_introduction" class="form-control" autocomplete="off" placeholder="輸入簡介" />
                            
                     </div> <!-- end of id="addActivitys_form" class="modal-body" -->
                     
                     <div class="modal-footer">
<%--                      	<h4 style="color:red;float:left" >${ErrorMessage.registered_error}</h4> --%>
                        <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                        <button id="addbtn" class="btn btn-theme" type="button" value="INSERT_PRODUCT">送出</button>                       
                     </div>
                     
                     </div>
                  </div>
            </div>
<!-- 新增產品彈出視窗 結束 -->
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

<script>
// 轉換日期的小程式 開始
			Date.prototype.Format = function(fmt) {
				var o = {
					"M+" : this.getMonth() + 1, //月份 
					"d+" : this.getDate(), //日 
					"h+" : this.getHours(), //小时 
					"m+" : this.getMinutes(), //分 
					"s+" : this.getSeconds(), //秒 
					"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
					"S" : this.getMilliseconds()	//毫秒 
				};
				if (/(y+)/.test(fmt))
					fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
							.substr(4 - RegExp.$1.length));
				for ( var k in o)
					if (new RegExp("(" + k + ")").test(fmt))
						fmt = fmt.replace(RegExp.$1,
								(RegExp.$1.length == 1) ? (o[k])
										: (("00" + o[k])
												.substr(("" + o[k]).length)));
				return fmt;
			}
// 轉換日期的小程式 結束

// 新增圖片的程式 開始
	jQuery(function ($) {	  
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
// 新增圖片的小程式 結束

// 新增產品的程式 開始
		  $('#addbtn').click(function () {
			  	var formData = new FormData();
			  	formData.append('photo1', file[0]);
// 				 formData.append('member_Id',  '${LoginOK.member_Id}');
				 formData.append('product_Name', $('#insert_Name').val());
				 formData.append('color', $('#insert_color').val());
				 formData.append('size', $('#insert_size').val());
				 formData.append('stock', $('#insert_stock').val());
				 formData.append('price', $('#insert_price').val());
				 formData.append('category', $('#insert_category').val());
				 formData.append('introduction', $('#insert_introduction').val());
			   $.ajax({
	               url:"${this_contextPath}/CRFSERVICE/productDetailControllerBE/addProducts",
	               type:'post',  //get post put delete
					data: formData,
	    		   processData: false,
				   contentType: false,
	               success:function(data){
// 						var pdate_int = parseInt(this[0].published_Date); //轉換成數字
// 						var pdate_value = new Date(pdate_int);  
	            	   $('#new_products').modal('hide');	
	   					$('#products_tbody>td:nth-child(1)').after('<tr><td><img src="data:image/png;base64,' + this[0].photo1 + '" class="img-thumbnail" /></td><td>'
									+ this[0].product_Id
									+ '</td><td>'
									+ this[0].productDetail_Id
									+ '</td><td>'
									+ this[0].product_Name
									+ '</td><td>'
									+ this[0].size
									+ '</td><td>'
									+ this[0].color
									+ '</td><td>'
									+ this[0].stock
									+ '</td><td>'
									+ this[1]
									+ '</td><td>'
									+ this[2]
									+ '</td><td>'
// 									+ pdate_value.Format("yyyy-MM-dd hh:mm:ss")
									+ '</td><td><span class="glyphicon glyphicon-wrench">'
									+ '</td><td><i class="fa fa-code-fork" aria-hidden="true"></i>'
									+ '</td></tr>') // end of after	            	   
	            	   
// 					           $('#grid>li:nth-child(1)').after('<li class="animate"><a href="data:image/png;base64,'	            	   
// 								+data.photo1+'" class="lightbox_image boxer " data-lightbox-gallery="image_gallery" rel="gallery" title="發起人：'
// 								+data.member_Id+'<br />類別：'+data.activity_Class+'<br />地區：'
// 								+data.activity_Area+'<br />內容：'
// 								+data.activity_Info+'<br />日期：'
// 								+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
// 								+data.people+"<br /><button class='btn btn-theme' style='float:right' type='submit' value='INSERT_PRODUCT'>參加活動</button>" 
// 								+'"><img src="data:image/png;base64,'
// 								+data.photo1+'" /></a>發起人：'
// 								+data.member_Id+'<br />類別：'
// 								+data.activity_Class+'<br />地區：'
// 								+data.activity_Area+'<br />內容：'
// 								+data.activity_Info+'<br />日期：'
// 								+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
// 								+'<button  type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title=" ">'
// 								+data.people+'</button></li>')			
// 						 $('.btn.btn-default').tooltip()	
// 						  $(".boxer").boxer({ 
// 									  top: 50,
// 									  fixed:true});	 				 
	               	} // end of success:function(data)	 
	           }) // end of  $.ajax({
	}) // end of $('#addbtn').click(function ()
//新增產品的程式 結束
	
// 	$.ajax({
//         url:"${this_contextPath}/CRFSERVICE/activitysController/AllActivitysMembers",
//         type:'get',  //get post put delete
//         data:{ },
//         success:function(data){      	  
//       	  $.each(data,function(){        		  
//       		  var message;
//       		  var activityID=this[0].activity_Id;     		   
//       		  var jdate_int = parseInt(this[0].activity_Day);                          //轉換成數字
// 				  var jdate_value = new Date(jdate_int);
// 				  var names=' ';
//       		  if(this[1]!=null){
// 				  var nameData=this[1].split(",")						  
// 				  $.each(nameData,function(){
// 					if(this!=""){
// 						names+=this+'\n'
// 					}				  
// 				  }) 	
//       		 }
// 			$('#grid').append('<li ><a href="data:image/png;base64,'
// 					+this[0].photo1+'" class="lightbox_image boxer" data-lightbox-gallery="image_gallery" rel="gallery" title="發起人：'
// 					+this[2]+'<br />類別：'+this[0].activity_Class+'<br />地區：'
// 					+this[0].activity_Area+'<br />內容：'
// 					+this[0].activity_Info+'<br />日期：'
// 					+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
// 					+this[0].people+"<button class='btn btn-theme' style='float:right' type='submit' value='INSERT_PRODUCT'>參加活動</button>" 
// 					+'"><span title=""><img src="data:image/png;base64,'
// 					+this[0].photo1+'" /></span></a>發起人：'
// 					+this[2]+'<br />類別：'
// 					+this[0].activity_Class+'<br />地區：'
// 					+this[0].activity_Area+'<br />內容：'
// 					+this[0].activity_Info+'<br />日期：'
// 					+jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'<br />目前參加人數：'
// 					+'<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="'
// 					+names+'">'
// 					+this[0].people+'</button></li>') // end of $('#grid').append
							  					
//            }) // end of $.each(data,function()
// // 				$('.btn.btn-default').tooltip()
// // 					$(".boxer").boxer({
// // 								top: 50,
// // 								fixed:true});																	
// //             new AnimOnScroll(document.getElementById('grid'), {
// //                 minDuration: 0.4,
// //                 maxDuration: 0.6,
// //                 viewportFactor: 0.2});
//         }//end of success:function(data)
//     }) // end of $.ajax({
    	
// 顯示table的程式 開始
	$.ajax({
	// url:"${this_contextPath}/CRFSERVICE/producController/product",
		url : "${this_contextPath}/CRFSERVICE/productDetailController/getAllDetail",
		type : 'get', //get post put delete
		data : {},
		success : function(data) {
			$.each( data,
				function() {
					var pdate_int = parseInt(this[0].published_Date); //轉換成數字
					var pdate_value = new Date(pdate_int);  
						$('#products_tbody').append('<tr><td><img src="data:image/png;base64,' + this[0].photo1 + '" class="img-thumbnail" /></td><td>'
													+ this[0].product_Id
													+ '</td><td>'
													+ this[0].productDetail_Id
													+ '</td><td>'
													+ this[0].product_Name
													+ '</td><td>'
													+ this[0].size
													+ '</td><td>'
													+ this[0].color
													+ '</td><td>'
													+ this[0].stock
													+ '</td><td>'
 													+ this[1]
													+ '</td><td>'
 													+ this[2]
 													+ '</td><td>'
													+ pdate_value.Format("yyyy-MM-dd hh:mm:ss")
													+ '</td><td><span class="glyphicon glyphicon-wrench">'
													+ '</td><td><i class="fa fa-minus-square" aria-hidden="true"></i>'
													+ '</td></tr>') // end of append
			}) // end of $.each(
		} // end of success : function(data) 
	}) // end of $.ajax({
// 顯示table的程式 結束			

	}) // end of jQuery(function ($)
</script>

	</div>
	<!--  頁面部分 結束 -->
</body>
</html>
		<!--                <script type="text/javascript"> -->
		<!--                      $(function () { -->
		<!--                          $.ajax({ -->
		<%--                              url:"${this_contextPath}/CRFSERVICE/friendships/${LoginOK.member_Id}", --%>
		<!--                              type:'get',  //get post put delete -->
		<!--                              data:{}, -->
		<!--                              success:function(data){ -->
		<!--                                  $.each(data,function(){ -->
		<%--                                      $('#friend_tbody').append('<tr><td><img src="${this_contextPath}/CRFSERVICE/memberController/photo/'+this.member_Id+'" class="img-circle friend_photo" alt="Responsive image" /><td class="friend_Name">'+  this.nickname +'</td><td>'+  this.e_mail +'</td>')   --%>
		<!--                                  }) -->
		<!--                              }          	  -->
		<!--                          }) -->
		<!--                      }) -->
		<!--                  </script >  -->
<!-- 		<span class="glyphicon glyphicon-trash"> -->