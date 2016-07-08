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
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<title>MaintainProducts</title>
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
/* .test { */
/* 	margin-top: 235px; */
/* 	margin-left: 250px; */
/* } */

/* th { */
/* 	border: 1px solid black; */
/* 	padding: 10px; */
/* 	text-align: center; */
/* 	vertical-align: bottom; */
/* } */

/* td { */
/* 	border: 1px solid black; */
/* 	padding: 5px; */
/* 	text-align: center; */
/* 	vertical-align: bottom; */
/* } */

/* tbody tr:nth-child(2n) { */
/* 	background-color: gray */
/* } */

/* tbody tr:nth-child(2n+1) { */
/* 	background-color: silver */
/* } */

/* tbody tr:hover { */
/* 	background-color: yellow */
/* } */

/* table { */
/* 	border: 1px solid black; */
/* 	border-collapse: collapse; */
/* 	margin: 0 auto; */
/* 	border-radius: 20px; */
/* } */
</style>
</head>
<body>
	<jsp:include page="/CRFitness.jsp" />
	<!-- 頁面部分 開始-->

<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-2 "></div> -->
<!-- 		<div class="col-md-8 col-xs-12 "> -->
<!-- 			<input type="text" id="tablesearchinput" required="required" -->
<!-- 				placeholder="請輸入關鍵字" /> -->
<!-- 			<table id="games_talbe" class="table"> -->
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th><h3>Photo</h3></th> -->
<!-- 						<th><h3>ID</h3></th> -->
<!-- 						<th><h3>Name</h3></th> -->
<!-- 						<th><h3>Size</h3></th> -->
<!-- 						<th><h3>Color</h3></th> -->
<!-- 						<th><h3>Stock</h3></th> -->
<!-- 						<th><h3>Published Date</h3></th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
<!-- 				<tbody> -->

<!-- 				</tbody> -->
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 		<!-- end of class="col-md-8 col-xs-12" --> -->
<!-- 		<div class="col-md-2"></div> -->
<!-- 	</div> -->



	<!-- 	<div class="test"> -->
	<div class="row">
		<div class="col-md-2 "></div>
		<div class="col-md-8 col-xs-12 ">
			<input type="text" id="tablesearchinput" required="required"
				placeholder="Please input key words" />
			<table id="games_talbe" class="table">
				<thead>
					<tr>
						<!-- 		<th>ID</th> -->
						<!-- 		<th>Name</th> -->
						<!-- 		<th>Price</th> -->
						<!-- 		<th>Category</th> -->
						<th><h3>Photo</h3></th>
						<th><h3>ID</h3></th>
						<th><h3>Name</h3></th>
						<th><h3>Size</h3></th>
						<th><h3>Color</h3></th>
						<th><h3>Stock</h3></th>
						<th><h3>Published Date</h3></th>
					</tr>
				</thead>
				<tbody id="products_tbody">
				</tbody>
			</table>
		</div>
		<!-- end of class="col-md-8 col-xs-12" -->
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
				$
						.ajax({
							//       	url:"${this_contextPath}/CRFSERVICE/producController/product",
							url : "${this_contextPath}/CRFSERVICE/productDetailController/ShoesDetails",
							type : 'get', //get post put delete
							data : {},
							success : function(data) {
								$
										.each(
												data,
												function() {
													var pdate_int = parseInt(this.published_Date); //轉換成數字
													var pdate_value = new Date(
															pdate_int);
													//             	$('#products_tbody').append('<tr><td>'+ this.product_Id + '</td><td>'+ this.product_Name +'</td><td>' + this.price + '</td><td>' + this.category +'</td></tr>')  
													$('#products_tbody')
															.append(
																	'<tr><td><img src="data:image/png;base64,' + this.photo1 + '" class="img-circle friend_photo" /></td><td>'
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
																			+ pdate_value
																					.Format("yyyy-MM-dd hh:mm:ss")
																			+ '</td></tr>')
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