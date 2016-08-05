<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<link rel="stylesheet" href="css/classic.css">
<title>訂單明細</title>

<style type="text/css">

.orders_class {
	margin-top: 4%;
}
th, tr, td{
text-align: center;
vertical-align : middle;
}
.photo{
    display: block;
 	width: 100px;
	height:100px;
	margin:auto;
}
</style>
</head>

<body class="orderDetailsbody">
<script src="js/jquery.columns.min.js"></script>
<aside>

	<div class="row orders_class">
		<div class="col-md-2"></div>
		<div id="orderDetialscolumns" class="col-md-8 col-xs-12"></div>
		<div class="col-md-2"></div>
	</div>
	
	<script type="text/javascript">
jQuery(function($){
	$('.logo_here').append('<img  class=" logo_css" src="${this_contextPath}/images/logo/OrderDetail.png">')
	var queryString='${pageContext.request.queryString}';
	queryString=queryString.substr(9);
	$.ajax({
		  url:'${this_contextPath}/CRFSERVICE/orderDetailsController/search',
	      type:'get', 
 	      data:{order_Id:queryString},
	      success: function(json) { 
  	     
	          $('#orderDetialscolumns').columns({
	              data:json,
	              schema: [

	                  {"header":"訂單編號", "key":"order_Id"},
	                  {"header":"商品圖片", "key":"productDetail_Id", "template":'<a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id={{productDetail_Id}}"><img class="photo" src="${this_contextPath}/images/products/{{productDetail_Id}}_1.png"/></a>'},
	                  {"header":"商品名稱", "key":"product_Name"},
	                  {"header":"數量", "key":"quantity"},
	                  {"header":"顏色", "key":"color"},
	                  {"header":"價格", "key":"amount"},
	  
	              ]

	          });
	    
	      }
	  });
})
	</script>
</aside>
</body>
</html>
