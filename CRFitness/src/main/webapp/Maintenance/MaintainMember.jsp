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
<%-- <link href="${this_contextPath}/css/fine-uploader-new.css" rel="stylesheet" /> <!-- upload files --> --%>
<%-- <script src="${this_contextPath}/js/jquery.fine-uploader.js"></script> <!-- upload files --> --%>
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jquery.easyswitch.css" /> <!-- switch button -->
<script type="text/javascript" src="${this_contextPath}/js/jquery.easyswitch.js"></script> <!-- on & off button -->

<title>MaintainMembers</title>


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


#creProdBtn, #modProdBtn{
	margin-top: 55px;
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
					<th><h3>大頭照</h3></th>
					<th><h3>會員ID</h3></th>
					<th><h3>Emil</h3></th>
<!-- 					<th><h3>密碼</h3></th> -->
					<th><h3>暱稱</h3></th>
					<th><h3>註冊日</h3></th>
					<th><h3>會員狀態</h3></th>
				</tr>
			</thead>
			<tbody id="products_tbody"></tbody>
		</table>	
		</div> <!-- end of class="col-md-8 col-xs-12" -->
		<div class="col-md-2"></div>
<!-- 資料表格 結束 -->

<!-- 1.新增上傳圖片 開始 以下這段一定要放這，不然就是ready or onload-->
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
<!-- 1.新增上傳圖片   結尾-->


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


// 所有功能的程式   開始
	jQuery(function ($) {	  
		  var file;	
		  var count=0;
// 1.新增上傳圖片的小程式   開始
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
// 1.新增上傳圖片的小程式   結束

    	
// 3.顯示產品的程式   開始
	$.ajax({
		url : "${this_contextPath}/CRFSERVICE/productDetailControllerBE/getAllByDesc",
		type : 'get', //get post put delete
		data : {},
		success : function(data) {
			$.each( data,
				function(index) {
					var pdate_int = parseInt(this[0].published_Date); //轉換成數字
					var pdate_value = new Date(pdate_int);
// 					console.log(this[0].product_Status);
					var Status="";
					if(this[0].product_Status == '上架中'){
						Status=1;
					}else if(this[0].product_Status == '已下架'){
						Status=0;
					};
					$('#products_tbody').append('<tr class="'+this[0].productDetail_Id+'"><td><img src="data:image/png;base64,' 
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
									                + this[0].info
													+ '</td><td hidden="hidden">'
									                + this[0].product_Status
													+ '</td><td><button type="button" class="btn btn-primary btn-1g 2g" data-toggle="modal" data-target="#update_products"><i class="fa fa-refresh" aria-hidden="true"></i>'
													+ '</td><td><button type="button" class="btn btn-primary btn-1g 3g" data-toggle="modal" data-target="#change_status"><span class="easyswitch" data-default="'+Status+'" data-label-on="ON" data-label-off="OFF"></i>'
													+ '</td></tr>') // end of append
												}) // end of $.each(
					// 產品狀態on&off的程式   開始
						$('.easyswitch').easyswitch();
					// 產品狀態on&off的程式   結束
					// 修改產品的小程式   開始	
// 					$('body').on('click', '.2g', function(){									
// 					$('.2g').click(function(){	
// 					var updProducts = $('#update_products')  // 寫成這樣才有效能
// 					var eq1 = $(this).parent().siblings(":eq(1)")
// 					updProducts.find('input:eq(2)').prop("readonly",true).val(eq1.text())
// 					var eq2 = $(this).parent().siblings(":eq(2)")
// 					updProducts.find('input:eq(3)').prop("readonly",true).val(eq2.text())
//      			updProducts.find('input:eq(4)').val($(this).parent().siblings(":eq(3)").text())
// 					updProducts.find('input:eq(5)').val($(this).parent().siblings(":eq(4)").text())
// 					updProducts.find('input:eq(6)').val($(this).parent().siblings(":eq(5)").text())
// 					updProducts.find('input:eq(7)').val($(this).parent().siblings(":eq(6)").text())
// 					updProducts.find('input:eq(8)').val($(this).parent().siblings(":eq(7)").text())
// 					updProducts.find('select:eq(0)').val($(this).parent().siblings(":eq(8)").text())
// 					updProducts.find('select:eq(1)').val($(this).parent().siblings(":eq(11)").text())
// 					updProducts.find('textarea:eq(0)').val($(this).parent().siblings(":eq(10)").text())									
// 					})	// end of $('.2g').click(function(){
					// 修改產品的小程式  結束	
					// 改變產品狀態的程式 開始
					$('body').on('click', '.3g', function(productDetail_Id, product_Status){
// 					$('.3g').click(function (productDetail_Id, product_Status) {
 						var this_prodStatus=$(this).parent().siblings(":eq(11)");
						var prodDetaId = $(this).parent().siblings(":eq(2)").text();
						var prodStatus = this_prodStatus.text();
						var reversedState = "";
						if(prodStatus=="上架中"){
							reversedState="已下架";
						}else{
							reversedState="上架中";
							}
						 $.ajax({
							    url:"${this_contextPath}/CRFSERVICE/productDetailControllerBE/changeStatus",
						        type:'post',  //get post put delete
					    		data: {'productDetail_Id': prodDetaId,
										'product_Status': reversedState}, // 把
						    	success:function(data){
						        	this_prodStatus.text(reversedState)
						        } // end of success:function(data)	 
						 }) // end of  $.ajax({  	    	   
					}); // end of 	$('.3g').click(function () {
					// 改變產品狀態的程式 結束
		} // end of success : function(data) 
	}) // end of $.ajax({
// 3.顯示產品的程式   結束			

}); // end of jQuery(function ($)
</script>

</div> <!-- end of <div class="row"> -->
	<!--  頁面部分 結束 -->
</body>
</html>
