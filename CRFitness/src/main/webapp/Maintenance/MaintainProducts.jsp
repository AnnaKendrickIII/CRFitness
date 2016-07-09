<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="google-signin-client_id"
	content="826213451911-6rpb37oapsg46p3ao0mhv6ks9orcja5h.apps.googleusercontent.com" />
<jsp:include page="/AdminFrame.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/component.css" />
<script src="${this_contextPath}/js/modernizr.custom.js"></script>
<link rel="stylesheet" href="${this_contextPath}/css/site.css">
<link href="${this_contextPath}/css/fine-uploader-new.css" rel="stylesheet" />
<script src="${this_contextPath}/js/jquery.fine-uploader.js"></script>

<title>MaintainProducts</title>
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

#tablesearchinput {
	margin-top: 55px;
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
#createProduct{
margin-top:55px;
}
</style>
</head>
<body>

<!-- 頁面部分 開始-->
	<div class="row">
		<div class="col-md-2 "></div>
		<div class="col-md-8 col-xs-12 ">
		
		<button type="button" id="createProduct" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#products_tbody">
  		新增產品
  		</button>
	
<!-- 新增活動 開始-->
<%-- 		<form  name="member" class="form-login" action="${this_contextPath}/CRF/member.action" method="post" > --%>
<!--         	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="products_tbody" class="modal fade"> -->
<!--             	<div class="modal-dialog"> -->
<!--                 	<div class="modal-content"> -->
<!--                     <div class="modal-header login_header"> -->
<!--                     	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
<!--                         <h3 class="modal-title">新增產品</h3> -->
<!--                     </div> -->
                            
<!--                     <div id="addActivitys_form" class="modal-body"> -->
<!--                     <div id='fine-uploader-manual-trigger'></div> -->
<%--             	        <p>產品名稱&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.nickname_error}</span></p> --%>
<!--                         <input required="required" type="text" id="insert_Name" autocomplete="off" class="form-control" placeholder="產品名稱" />                                                 -->
<!--                         <p>產品顏色&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red"></span></p> -->
<!--                    		<input required="required" type="text" id="insert_color" autocomplete="off" class="form-control" placeholder="產品顏色" /> -->
<!--                         <p>產品大小&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red" ></span></p> -->
<!--                         <select id="insert_size" name="test1" class="form-control" > -->
<!-- 							<option value="1">XS</option> -->
<!-- 							<option value="2">S</option> -->
<!-- 							<option value="3">M</option> -->
<!-- 							<option value="4">L</option> -->
<!-- 							<option value="5">XL</option> -->
<!-- 							<option value="6">2XL</option> -->
<!-- 							<option value="7">3XL</option> -->
<!-- 							<option value="8">U</option> -->
<!-- 						</select> -->
<!--                         <p>產品數量&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red">}</span></p> -->
<!--                         <input required="required" type="text" id="insert_stock" class="form-control" autocomplete="off" placeholder="產品數量"/> -->
<!--                         <p>產品價格&nbsp&nbsp&nbsp<span style="color:red"></span></p> -->
<!--                         <input required="required" type="text" id="insert_price" class="form-control" autocomplete="off" placeholder="產品價格" /> -->
<!--                         <p>產品分類&nbsp&nbsp&nbsp<span style="color:red"></span></p> -->
<!--                         <input required="required" type="text" id="insert_category" class="form-control" autocomplete="off" placeholder="產品分類" /> -->
<!--                         <p>產品簡介&nbsp&nbsp&nbsp<span style="color:red"></span></p> -->
<!--                         <input required="required" type="text" id="insert_introduction" class="form-control" autocomplete="off" placeholder="產品簡介" /> -->
                            
<!--                      </div> end of id="addActivitys_form" class="modal-body" -->
<!--                      <div class="modal-footer"> -->
<%-- <%--                      	<h4 style="color:red;float:left" >${ErrorMessage.registered_error}</h4> --%> --%>
<!--                         <button data-dismiss="modal" class="btn btn-default" type="button">取消</button> -->
<!--                         <button id="addActivitys" class="btn btn-theme" type="button" value="INSERT_MEMBER">送出</button>                        -->
<!--                      </div> -->
<!--                      </div> -->
<!--                   </div> -->
<!--             </div> -->
<!-- 		</form> -->
<!-- 新增活動 結束-->		
				
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
		</div><!-- end of class="col-md-8 col-xs-12" -->
		<div class="col-md-2"></div>

		<script src="${this_contextPath}/js/masonry.pkgd.mis.js"></script>
		<script src="${this_contextPath}/js/classie.js"></script>
		<script src="${this_contextPath}/js/imagesloaded.js"></script>
		<script src="${this_contextPath}/js/AnimOnScroll.js"></script>

		<script>
			// type="text/javascript"
			Date.prototype.Format = function(fmt) {
				var o = {
					"M+" : this.getMonth() + 1, //月份 
					"d+" : this.getDate(), //日 
					"h+" : this.getHours(), //小时 
					"m+" : this.getMinutes(), //分 
					"s+" : this.getSeconds(), //秒 
					"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
					"S" : this.getMilliseconds()
				//毫秒 
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

			$(function() {
				$.ajax({
	//       	url:"${this_contextPath}/CRFSERVICE/producController/product",
					url : "${this_contextPath}/CRFSERVICE/productDetailController/productDetail",
					type : 'get', //get post put delete
					data : {},
					success : function(data) {
						$.each(
							data,
							function() {
								var pdate_int = parseInt(this.published_Date); //轉換成數字
								var pdate_value = new Date(
									pdate_int);
					//             	$('#products_tbody').append('<tr><td>'+ this.product_Id + '</td><td>'+ this.product_Name +'</td><td>' + this.price + '</td><td>' + this.category +'</td></tr>')  
									$('#products_tbody').append('<tr><td><img src="data:image/png;base64,' + this.photo1 + '" class="img-thumbnail" /></td><td>'
														+ this.product_Id
														+ '</td><td>'
														+ this.productDetail_Id
														+ '</td><td>'
														+ this.product_Name
														+ '</td><td>'
														+ this.size
														+ '</td><td>'
														+ this.color
														+ '</td><td>'
														+ this.stock
														+ '</td><td>'
//  														+ this.productsVO.price
														+ '</td><td>'
//  														+ this.productsVO.category
 														+ '</td><td>'
														+ pdate_value.Format("yyyy-MM-dd hh:mm:ss")
														+ '</td><td><img class="glyphicon glyphicon-wrench">'
														+ '</td><td><img class="glyphicon glyphicon-trash">'
														+ '</td></tr>') // end of append
									})
							}
						})
			})
		</script>

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

	</div>
	<!--  頁面部分 結束 -->
</body>
</html>