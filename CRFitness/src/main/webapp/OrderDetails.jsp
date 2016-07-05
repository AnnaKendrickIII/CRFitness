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
<title>OrderDetails</title>

<style type="text/css">
.orders_class {
	margin-top: 4%;
}
.orderDetailsbody{
background-color: #DDDDDD;
}
</style>
</head>

<body class="orderDetailsbody">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/jquery.columns.min.js"></script>
<aside>
	<div class="row">
		<div class="col-md-1"></div>
		<div id="orderDetialscolumns" class="orders_class col-md-10 col-xs-12"></div>
		<div class="col-md-1"></div>
	</div>
	
	<script type="text/javascript">
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
	                  {"header":"明細編號", "key":"details_No"},
	                  {"header":"商品名稱", "key":"product_Name"},
	                  {"header":"數量", "key":"quantity"},
	                  {"header":"尺寸", "key":"size"},
	                  {"header":"顏色", "key":"color"},
	                  {"header":"價格", "key":"amount"},
	              ]

	          }); 
	      }
	  });
	</script>
</aside>
</body>
</html>