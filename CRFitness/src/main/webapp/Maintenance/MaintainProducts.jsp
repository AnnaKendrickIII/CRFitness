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

#fine-uploader-manual-trigger .qq-upload-button, #fine-uploader-manual-trigger2 .qq-upload-button {
	margin-right: 15px;
}

#fine-uploader-manual-trigger .buttons, #fine-uploader-manual-trigger2 .buttons {
	width: 50%;
}

#fine-uploader-manual-trigger .qq-uploader .qq-total-progress-bar-container, #fine-uploader-manual-trigger2 .qq-uploader .qq-total-progress-bar-container {
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

#creProdBtn, #modProdBtn{
	margin-top: 55px;
}

textarea{
	resize:none;
}
</style>
</head>
<body>

<!-- 頁面部分 開始-->
	<div class="row">
		<div class="col-md-2 "></div>
		<div class="col-md-8 col-xs-12 ">
		
		<button type="button" id="creProdBtn" class="btn btn-primary btn-1g" data-toggle="modal" data-target="#new_products">  
  		<i class="fa fa-plus" aria-hidden="true"></i> <!-- 新增產品 --> 
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
					<th><h3>Status</h3></th>
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
                            
                    <div id="addProducts_form" class="modal-body">
                    <div id='fine-uploader-manual-trigger'></div>
            	        <p>產品名稱&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="insert_name" autocomplete="off" class="form-control" placeholder="輸入名稱" />                                                
                        <p>產品大小&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red" ></span></p>
                   		<input required="required" type="text" id="insert_size" autocomplete="off" class="form-control" placeholder="輸入大小" />
<!--                    <select id="insert_size" name="test1" class="form-control" > -->
<!-- 						<option value="U">U</option> -->
<!-- 						<option value="XS">XS</option> -->
<!-- 						<option value="S">S</option> -->
<!-- 						<option value="M">M</option> -->
<!-- 						<option value="L">L</option> -->
<!-- 						<option value="XL">XL</option> -->
<!-- 						<option value="2XL">2XL</option> -->
<!-- 						<option value="3XL">3XL</option> -->
<!-- 					</select> -->
<!--                    <select id="insert_size" name="test1" class="form-control" > -->
<!-- 						<option value="U">U</option> -->
<!-- 						<option value="US4">US4</option> -->
<!-- 						<option value="US4.5">US4.5</option> -->
<!-- 						<option value="US5">US5</option> -->
<!-- 						<option value="US5.5">US5.5</option> -->
<!-- 						<option value="US6">US6</option> -->
<!-- 						<option value="US6.5">US6.5</option> -->
<!-- 						<option value="US7">US7</option> -->
<!-- 						<option value="US7.5">US7.5</option> -->
<!-- 						<option value="US8">US8</option> -->
<!-- 						<option value="US8.5">US8.5</option> -->
<!-- 						<option value="US9">US9</option> -->
<!-- 						<option value="US9.5">US9.5</option> -->
<!-- 						<option value="US10">US10</option> -->
<!-- 						<option value="US10.5">US10.5</option> -->
<!-- 						<option value="US11">US11</option> -->
<!-- 						<option value="US11.5">US11.5</option> -->
<!-- 						<option value="US12">US12</option> -->
<!-- 						<option value="US12.5">US12.5</option> -->
<!-- 						<option value="US13">US13</option> -->
<!-- 					</select> -->
                        <p>產品顏色&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                   		<input required="required" type="text" id="insert_color" autocomplete="off" class="form-control" placeholder="輸入顏色" />                        
                        <p>產品數量&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="insert_stock" autocomplete="off" class="form-control" placeholder="輸入數量"/>
                        <p>產品價格&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="insert_price" autocomplete="off" class="form-control" placeholder="輸入價格" />
                        <p>產品分類&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <select id="insert_category" name="test1" class="form-control" >
							<option value="運動器材">運動器材</option>
							<option value="服飾類">服飾類</option>
							<option value="運動用品">運動用品</option>
							<option value="鞋類">鞋類</option>
						</select>
                        <p>產品簡介&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <textarea required="required" id="insert_info" class="form-control" ></textarea>    
                     </div> <!-- end of id="addProducts_form" class="modal-body" -->
                     
                     <div class="modal-footer">
<%--                      	<h4 style="color:red;float:left" >${ErrorMessage.registered_error}</h4> --%>
                        <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                        <button id="addbtn" class="btn btn-primary" type="button" value="INSERT_PRODUCT">送出</button> <!-- btn-theme -->                      
                     </div>
                     
                     </div> <!-- <div class="modal-content"> -->
            	</div> <!-- <div class="modal-dialog"> -->
            </div> <!-- end of <div aria-hidden="true" -->
<!-- 新增產品彈出視窗 結束 -->

<!-- 新增上傳圖片 開始 以下這段一定要放這，不然就是ready or onload-->
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

<!-- 修改產品彈出視窗 開始-->
        	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="update_products" class="modal fade">
            	<div class="modal-dialog">
                	<div class="modal-content">
                	
                    <div class="modal-header login_header">
                    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3 class="modal-title">修改產品</h3>
                    </div>
                            
                    <div id="updateProducts_form" class="modal-body">
                    <div id='fine-uploader-manual-trigger2'></div>
            	        <p>產品ID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="update_prodId" autocomplete="off" class="form-control" />                                                
                        <p>產品明細ID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="update_prodDetId" autocomplete="off" class="form-control" />                                                
                        <p>產品名稱&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="update_name" autocomplete="off" class="form-control" />                                                
                        <p>產品大小&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                   		<input required="required" type="text" id="update_size" autocomplete="off" class="form-control" />
                        <p>產品顏色&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red" ></span></p>
                        <input required="required" type="text" id="update_color" autocomplete="off" class="form-control" />
                        <p>產品數量&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="update_stock" autocomplete="off" class="form-control" />
                        <p>產品價格&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <input required="required" type="text" id="update_price" autocomplete="off" class="form-control" />
                        <p>產品分類&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <select id="update_category" name="test2" class="form-control" >
							<option value="運動器材">運動器材</option>
							<option value="服飾類">服飾類</option>
							<option value="運動用品">運動用品</option>
							<option value="鞋類">鞋類</option>
						</select>
                        <p>產品簡介&nbsp&nbsp&nbsp<span style="color:red"></span></p>
                        <textarea required="required" id="update_info" class="form-control" ></textarea>
                     </div> <!-- end of id="updateProducts_form" class="modal-body" -->
                     
                     <div class="modal-footer">
<%--                      	<h4 style="color:red;float:left" >${ErrorMessage.registered_error}</h4> --%>
                        <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                        <button id="updatebtn" class="btn btn-primary" type="button" value="UPDATE_PRODUCT">送出</button>                       
                     </div>
                     
                     </div> <!-- <div class="modal-content"> -->
            	</div> <!-- <div class="modal-dialog"> -->
            </div> <!-- end of <div aria-hidden="true" -->
<!-- 修改產品彈出視窗 結束 -->

<!-- 修改圖片 開始 以下這段一定要放這，不然就是ready or onload-->
<script>
        $('#fine-uploader-manual-trigger2').fineUploader({
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
        })
        $('#trigger-upload').click(function() {
            $('#fine-uploader-manual-trigger2').fineUploader('uploadStoredFiles');
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

// 所有功能的程式開始
	jQuery(function ($) {	  
		  var file;	
// 新增上傳圖片的小程式 開始
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
// 新增上傳圖片的小程式 結束

// 修改上傳圖片的小程式 開始
		$('#fine-uploader-manual-trigger2 .qq-uploader-selector').change(function (event) {		 
		 file=event.target.files;			  	 	 
		})
			jQuery.event.props.push('dataTransfer');
			//加入dragover和drop
		$('#fine-uploader-manual-trigger2 .qq-uploader-selector .qq-upload-drop-area-selector').on('dragover', function(event){
    		//停止開啟檔案及其他動作
    		event.stopPropagation();
    		event.preventDefault();
    		//複製拖移的物件
    		event.dataTransfer.dropEffect = 'copy';
		});
		$('#fine-uploader-manual-trigger2 .qq-uploader-selector .qq-upload-drop-area-selector').on('drop', function(event){
   			//停止開啟檔案及其他動作
    		event.stopPropagation();
    		event.preventDefault();
    		//透過dataTransfer取得FileList object.
    		file = event.dataTransfer.files;
		})
// 修改上傳圖片的小程式 結束


// 新增產品的程式 開始
		  $('#addbtn').click(function () {
			  	var formData = new FormData();
			  	formData.append('photo1', file[0]);
// 				formData.append('member_Id',  '${LoginOK.member_Id}');
				formData.append('product_Name', $('#insert_name').val());
				formData.append('size', $('#insert_size').val());
				formData.append('color', $('#insert_color').val());
				formData.append('stock', $('#insert_stock').val());
				formData.append('price', $('#insert_price').val());
				formData.append('category', $('#insert_category').val());
				formData.append('introduction', $('#insert_info').val());
			   $.ajax({
	               url:"${this_contextPath}/CRFSERVICE/productDetailControllerBE/addProducts",
	               type:'post',  //get post put delete
					data: formData,
	    		   processData: false,
				   contentType: false,
	               success:function(data){
						var pdate_int = parseInt(data[1].published_Date); //轉換成數字
						var pdate_value = new Date(pdate_int);  
	            	   $('#new_products').modal('hide');	
	   					$('#products_tbody>tr:nth-child(1)').before('<tr><td><img src="data:image/png;base64,' 
	   								+ data[1].photo1 
	   								+ '" class="img-thumbnail" /></td><td>'
									+ data[0].product_Id
									+ '</td><td>'
									+ data[1].productDetail_Id
									+ '</td><td>'
									+ data[1].product_Name
									+ '</td><td>'
									+ data[1].size
									+ '</td><td>'
									+ data[1].color
									+ '</td><td>'
									+ data[1].stock
									+ '</td><td>'
									+ data[0].price
									+ '</td><td>'
									+ data[0].category
									+ '</td><td>'
									+ pdate_value.Format("yyyy-MM-dd hh:mm:ss")
									+ '</td><td hidden="hidden">'
									+ data[1].introduction
									+ '</td><td><button type="button" class="btn btn-primary btn-1g 2g" data-toggle="modal" data-target="#update_products"><i class="fa fa-refresh" aria-hidden="true"></i>'
									+ '</td><td><button type="button" class="btn btn-primary btn-1g" data-toggle="modal" data-target="#status_products"><i class="fa fa-toggle-on" aria-hidden="true"></i>'
									+ '</td></tr>') // end of after	            	   
							$('#fine-uploader-manual-trigger .qq-upload-list-selector').empty();
							file = null;				 
	               	} // end of success:function(data)	 
	           }) // end of  $.ajax({
	}) // end of $('#addbtn').click(function ()
// 新增產品的程式 結束


// 修改產品的程式 開始 
	$('table').on('click',".2g",(function(){	
		var btn=$(this);
		  $('#updatebtn').click(function () {
			  	var formData = new FormData();
			  	formData.append('photo1', file[0]);
				formData.append('product_Name', $('#update_name').val());
				formData.append('size', $('#update_size').val());
				formData.append('color', $('#update_color').val());
				formData.append('stock', $('#update_stock').val());
				formData.append('price', $('#update_price').val());
				formData.append('category', $('#update_category').val());
				formData.append('introduction', $('#update_info').val());
			   $.ajax({
	               url:"${this_contextPath}/CRFSERVICE/productDetailControllerBE/updateProducts",
	               type:'post',  //get post put delete
					data: formData,
	    		   processData: false,
				   contentType: false,
	               success:function(data){
						var pdate_int = parseInt(data[1].published_Date); //轉換成數字
						var pdate_value = new Date(pdate_int);  
	            	   $('#update_products').modal('hide');
	            	   var beforeSiblingTr = btn.parent().parent().prev();
	            	  	btn.parent().parent().fadeOut(800,function(){
	            	  		$(this).remove();
	            	  	})
	            	   beforeSiblingTr.after('<tr hidden="hidden"><td><img src="data:image/png;base64,' 
	   								+ data[1].photo1 
	   								+ '" class="img-thumbnail" /></td><td>'
									+ data[0].product_Id
									+ '</td><td>'
									+ data[1].productDetail_Id
									+ '</td><td>'
									+ data[1].product_Name
									+ '</td><td>'
									+ data[1].size
									+ '</td><td>'
									+ data[1].color
									+ '</td><td>'
									+ data[1].stock
									+ '</td><td>'
									+ data[0].price
									+ '</td><td>'
									+ data[0].category
									+ '</td><td>'
									+ pdate_value.Format("yyyy-MM-dd hh:mm:ss")
									+ '</td><td hidden="hidden">'
									+ data[1].introduction
									+ '</td><td><button type="button" class="btn btn-primary btn-1g 2g" data-toggle="modal" data-target="#update_products"><i class="fa fa-refresh" aria-hidden="true"></i>'
									+ '</td><td><button type="button" class="btn btn-primary btn-1g" data-toggle="modal" data-target="#status_products"><i class="fa fa-toggle-on" aria-hidden="true"></i>'
									+ '</td></tr>') // end of xxx
									// 修改產品的小程式		
										// end of $('.2g').click(function(){				
							$("tr").fadeIn(800)				
							$('#fine-uploader-manual-trigger2 .qq-upload-list-selector').empty();
							file = null;				 
	               	} // end of success:function(data)	 
	           }) // end of  $.ajax({
	}) // end of $('#updatebtn').click(function ()
}))			
// 修改產品的程式 結束

    	
// 顯示產品的程式 開始
	$.ajax({
		url : "${this_contextPath}/CRFSERVICE/productDetailControllerBE/getAllByDesc",
		type : 'get', //get post put delete
		data : {},
		success : function(data) {
			$.each( data,
				function() {
					var pdate_int = parseInt(this[0].published_Date); //轉換成數字
					var pdate_value = new Date(pdate_int);  
						$('#products_tbody').append('<tr><td><img src="data:image/png;base64,' 
													+ this[0].photo1 
													+ '" class="img-thumbnail" /></td><td>'
													+ this[0].product_Id
													+ '</td><td>'
													+ this[0].productDetail_Id
													+ '</td><td>'
													+ this[1] // product_Name
													+ '</td><td>'
													+ this[0].size
													+ '</td><td>'
													+ this[0].color
													+ '</td><td>'
													+ this[0].stock
													+ '</td><td>'
 													+ this[2] // price
													+ '</td><td>'
 													+ this[3] // category
 													+ '</td><td>'
													+ pdate_value.Format("yyyy-MM-dd hh:mm:ss")
													+ '</td><td hidden="hidden">'
									                + this[0].introduction
													+ '</td><td><button type="button" class="btn btn-primary btn-1g 2g" data-toggle="modal" data-target="#update_products"><i class="fa fa-refresh" aria-hidden="true"></i>'
													+ '</td><td><button type="button" class="btn btn-primary btn-1g 3g" data-toggle="modal" data-target="#status_products"><i class="fa fa-toggle-on" aria-hidden="true"></i>'
													+ '</td></tr>') // end of append
												}) // end of $.each(
												// 修改產品的小程式		
												$('.2g').click(function(){	
// 												console.log($('.img-thumbnail:eq(0)').attr('src'))
// 												console.log($(this).parent().parent().find("img").attr('src'))
// 												console.log($(this).parent().parent().find("img").attr('src').substr(22))
												$('#uploadfile').prop("files",$(this).parent().parent().find("img").attr('src').substr(22));
												console.log($(this).parent().siblings(":eq(1)").text())
												console.log($(this).parent().siblings(":eq(2)").text())
												console.log($(this).parent().siblings(":eq(3)").text())
												console.log($(this).parent().siblings(":eq(4)").text())
												console.log($(this).parent().siblings(":eq(5)").text())
												console.log($(this).parent().siblings(":eq(6)").text())
												console.log($(this).parent().siblings(":eq(7)").text())
												console.log($(this).parent().siblings(":eq(8)").text())
												console.log($(this).parent().siblings(":eq(9)").text())
												console.log($(this).parent().siblings(":eq(10)").text())
												var updProducts = $('#update_products')  // 寫成這樣才有效能
												var eq1 = $(this).parent().siblings(":eq(1)")
												updProducts.find('input:eq(2)').prop("readonly",true).val(eq1.text())
												var eq2 = $(this).parent().siblings(":eq(2)")
												updProducts.find('input:eq(3)').prop("readonly",true).val(eq2.text())
												// 以下2行為chaining寫法
// 												updProducts.find('input:eq(2)').prop("readonly",true).val($(this).parent().siblings(":eq(1)").text())
// 												updProducts.find('input:eq(3)').prop("readonly",true).val($(this).parent().siblings(":eq(2)").text())
												// 以下2行為沒有readonly寫法
// 												updProducts.find('input:eq(2)').val($(this).parent().siblings(":eq(1)").text()) // 沒有readonly寫法
// 												updProducts.find('input:eq(3)').val($(this).parent().siblings(":eq(2)").text()) // 沒有readonly寫法
												updProducts.find('input:eq(4)').val($(this).parent().siblings(":eq(3)").text())
												updProducts.find('input:eq(5)').val($(this).parent().siblings(":eq(4)").text())
												updProducts.find('input:eq(6)').val($(this).parent().siblings(":eq(5)").text())
												updProducts.find('input:eq(7)').val($(this).parent().siblings(":eq(6)").text())
												updProducts.find('input:eq(8)').val($(this).parent().siblings(":eq(7)").text())
												updProducts.find('select:eq(0)').val($(this).parent().siblings(":eq(8)").text())
												updProducts.find('textarea:eq(0)').val($(this).parent().siblings(":eq(10)").text())									
												})	// end of $('.2g').click(function(){
		
		} // end of success : function(data) 
	}) // end of $.ajax({
// 顯示產品的程式 結束			


// 改變產品狀態的程式 開始
	$('.3g').click(function () {
		
		// 關閉的圖示 <i class="fa fa-toggle-off" aria-hidden="true"></i>
	});
// 改變產品狀態的程式 結束


// 	$.ajax({
//         url:"${this_contextPath}/CRFSERVICE/activitysController/AllActivitysMembers",
//         type:'get',  //get post put delete
//         data:{ },
//         success:function(data){      	  
//       	  $.each(data,function(){        		  

//            }) // end of $.each(data,function()
//         }//end of success:function(data)
//     }) // end of $.ajax({

}); // end of jQuery(function ($)
</script>

</div> <!-- end of <div class="row"> -->
	<!--  頁面部分 結束 -->
</body>
</html>

<!-- <span class="glyphicon glyphicon-wrench"> -->
