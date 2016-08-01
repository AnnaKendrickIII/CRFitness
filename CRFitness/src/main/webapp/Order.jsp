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
<link rel="stylesheet" href="${this_contextPath}/css/alertify.css">
<title>訂單</title>

<style type="text/css">
.orders_class {
	margin-top: 4%;
}
th, tr, td{
text-align: center;
}
</style>
</head>

<body class="ordersbody">
<script src="js/jquery.columns.min.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/alertify.js"></script>
<aside>

	<div class="row orders_class">
		<div class="col-md-2"></div>
		<div id="orderscolumns" class="col-md-8 col-xs-12"></div>
		<div class="col-md-2"></div>
	</div>
	
	<script type="text/javascript">
	// 轉換日期的小程式 開始
// 	Date.prototype.Format = function(fmt) {
// 		var o = {
// 			"Y+" : this.getYear(),
// 			"M+" : this.getMonth() + 1, //月份 
// 			"D+" : this.getDate(), //日 
// 			"h+" : this.getHours(), //小时 
// 			"m+" : this.getMinutes(), //分 
// 			"s+" : this.getSeconds(), //秒 
// 			"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
// 			"ms" : this.getMilliseconds()	//毫秒 
// 		};
// 		if (/(y+)/.test(fmt))
// 			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
// 					.substr(4 - RegExp.$1.length));
// 		for ( var k in o)
// 			if (new RegExp("(" + k + ")").test(fmt))
// 				fmt = fmt.replace(RegExp.$1,
// 				(RegExp.$1.length == 1) ? (o[k])
// 				: (("00" + o[k]).substr(("" + o[k]).length)));
// 		return fmt;
// 	}
//轉換日期的小程式 結束


jQuery(function($){
		$('.logo_here').append('<img  class="img-responsive logo_css" src="${this_contextPath}/images/logo/Order.png">')
	$.ajax({
		  url:'${this_contextPath}/CRFSERVICE/ordersController/searchMemberOrders',
		  data:{member_Id:'${LoginOK.member_Id}'},
	      type:'get', 
	      success: function(json) { 
	    	  if(json==""){
	    		  alertify.alert().set('title', '');
	    			alertify.alert("您目前尚無訂單!", function(){
	    				location.href='${this_contextPath}/Products.jsp?category=cmens-tops&page=1'
		     		  });	
	     	 }else{
// 		 		var date = new Date.Format
// 		 			Date(parseInt('{{order_Time}}')).Format("MM-DD hh:mm:ss")
// 		 		  console.log('date='+date)
				$.each(json,function(){
					var date_int = parseInt(this.order_Time);                          //轉換成數字
		 		   	  var date_value = new Date(date_int);
			 		  console.log(this.order_Time)
			 		  console.log('date_value='+new Date(parseInt('{order_Time}')).Format("yyyy-MM-dd hh:mm"))
				})
		          $('#orderscolumns').columns({	  
		              data:json,
		              schema: [
		                  {"header":"訂單編號", "key":"order_Id", "template":'<a href="${this_contextPath}/OrderDetails.jsp?order_Id={{order_Id}}" >{{order_Id}}</a>'},
		                  {"header":"會員編號", "key":"member_Id"},
		                  {"header":"訂單狀態", "key":"order_Status"},         
		                  {"header":"總金額", "key":"total_Amount"},
		                  {"header":"收件人姓名", "key":"consignee_Name"},
		                  {"header":"收件人地址", "key":"consignee_Address"},
		                  {"header":"訂單日期", "key":"order_Time", "template":'{{order_Time}}'},
		                  {"header":"付款方式", "key":"payment_Method"},
		                  {"header":"取消訂單", "template":'<div class="cancel btn btn-defult glyphicon glyphicon-trash" title="取消此筆訂單"></div>'}
		              ]
	 	          });		         		    	  	    
	     	 }	     	 
	      }
	  });
		
//刪除訂單
		$('#orderscolumns').on('click','.cancel',function(){
 			var order_Id = $(this).parent().parent().find('a').text()
 			var tr = $(this).parent().parent()
    		alertify.confirm().set('title', '刪除訂單');
    		alertify.confirm('確認刪除此筆訂單?',function(){
    			$.ajax({
  				  url:'${this_contextPath}/CRFSERVICE/ordersController/cancelOrder',
  				  data:{order_Id:order_Id},
  			      type:'get',
  			      success:function(){
  			    		tr.remove()
  			      }
    			})
    			alertify.warning('訂單已刪除',3)})			    	  
		})
})
	</script>
	
</aside>
</body>
</html>