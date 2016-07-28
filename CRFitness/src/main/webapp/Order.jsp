<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<c:if test="${ empty LoginOK}">
<c:redirect url="/index.jsp?NoLogin"></c:redirect>
</c:if>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<link rel="stylesheet" href="${this_contextPath}/css/classic.css">
<title>訂單</title>

<style type="text/css">
.orders_class {
	margin-top: 4%;
}
.ordersbody{

}
</style>
</head>

<body class="ordersbody">
<script src="js/jquery.columns.min.js"></script>
<aside>

	<div class="row orders_class">
		<div class="col-md-2"></div>
		<div id="orderscolumns" class="col-md-8 col-xs-12"></div>
		<div class="col-md-2"></div>
	</div>
	
	<script type="text/javascript">
jQuery(function($){
		$('.logo_here').append('<img  class="img-responsive logo_css" src="${this_contextPath}/images/logo/Order.png">')
	$.ajax({
		  url:'${this_contextPath}/CRFSERVICE/ordersController/searchMemberOrders',
		  data:{member_Id:'${LoginOK.member_Id}'},
	      type:'post', 
	      success: function(json) { 
	          $('#orderscolumns').columns({
	              data:json,
	              schema: [
	                  {"header":"訂單編號", "key":"order_Id", "template":'<a href="${this_contextPath}/OrderDetails.jsp?order_Id={{order_Id}}">{{order_Id}}</a>'},
	                  {"header":"會員編號", "key":"member_Id"},
	                  {"header":"訂單狀態", "key":"order_Status"},         
	                  {"header":"金額", "key":"total_Amount"},
	                  {"header":"發票號碼", "key":"invoice_Number"},
	                  {"header":"收件人姓名", "key":"consignee_Name"},
	                  {"header":"收件人地址", "key":"consignee_Address"},
	                  {"header":"訂單日期", "key":"order_Time"},
	                  {"header":"付款方式", "key":"payment_Method"}
	              ]

	          }); 
	      }
	  });
})
	</script>
	
</aside>
</body>
</html>