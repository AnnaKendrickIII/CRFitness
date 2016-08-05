<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

	<title>維護訂單</title>
    
    <jsp:include page="/admin/adminFrame.jsp"/>
  </head>
  <script type="text/javascript">
	//轉換日期的小程式   開始
	jQuery(function($){

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
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
						: (("00" + o[k]).substr(("" + o[k]).length)));
			return fmt;
		}
	});
	//轉換日期的小程式 結束
  </script>
  <style>

.content-panel{
	background-color: #F2F2F2;
}

.table {
  	background-color: #E0E0E0;
	border-radius: 20px;
}

.table>tbody>tr>td{
	vertical-align: middle;
	text-align: center;
	width:100px;
	height:100px;
}

th{
	vertical-align: middle;
	text-align: center;
}

#creProdBtn{
  	margin-bottom: 10px;
 }  

.sb-search{ 
 	margin-top: -1px;
 } 

#myModalLabel1, #myModalLabel2{
	text-align: center;
}

  </style>
  </head>

<body>
<!-- 每頁不同內容   開始 -->
  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		
	<div class="row mt">
<!-- 		<div class="col-md-1 col-xs-1"></div> -->
    	<div class="col-md-12 col-xs-12">
        	<div class="content-panel">

			<div class="row">
				<div class="col-md-12 col-xs-12">
					<div id="sb-search" class="sb-search">
						<form>
							<input id="tablesearchinput" class="sb-search-input" placeholder="關鍵字" type="text" value="" name="search"> 
							<input id='searchId' class="sb-search-submit" type="submit" value=""><span class="sb-icon-search"></span>
						</form>
					</div>
				</div>
			</div>

            <table class="table table-striped table-advance table-hover table-bordered table-striped table-condensed table-responsive" id="orders_table">
		
			<thead>
				<tr class="alv-primary" >
					<th><h3><strong># 訂單ID</strong></h3></th>
					<th><h3><strong># 會員ID</strong></h3></th>
					<th><h3><i class="fa fa-user" aria-hidden="true"></i><strong> 收件人</strong></h3></th>
					<th><h3><strong># 發票號碼</strong></h3></th>
					<th><h3><i class="fa fa-university" aria-hidden="true"></i><strong> 總金額</strong></h3></th>
					<th><h3><i class="fa fa-calendar" aria-hidden="true"></i><strong> 訂單日期</strong></h3></th>
					<th><h3><i class="fa fa-truck" aria-hidden="true"></i><strong> 出貨日期</strong></h3></th>
					<th><h3><i class="fa fa-credit-card" aria-hidden="true"></i><strong> 付款方式</strong></h3></th>
					<th><h3><i class="fa fa-toggle-on" aria-hidden="true"></i><strong> 狀態訂單</strong></h3></th>
				</tr>
			</thead>
			<tbody id="orders_tbody"></tbody>
		
            	</table>
        	</div><!-- /content-panel -->
    	</div> <!-- /col-md-8 xs-8 -->
<!-- 		<div class="col-md-1  col-xs-1"></div> -->
	</div><!-- 184 <div class="row mt"> -->
		
		</section> <!-- 182 <section class="wrapper"> -->
      </section> <!-- 181 /MAIN CONTENT -->
      <!-- main content end -->
      
      <!-- footer start -->
      <footer class="site-footer">
          <div class="text-center">
              2016 - C.R.Fitness Co., Ltd.
              <a href="adminOrders.jsp" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
	  <!-- footer end -->		
	  
  </section> <!-- 176 <section id="container" > -->		
<!-- 每頁不同內容   結束 -->

<!-- 所有功能的程式   開始 -->
<script>
	jQuery(function ($) {
		
		new UISearch(document.getElementById('sb-search'));

// 1.顯示會員的程式   開始
	$.ajax({
		url : "${this_contextPath}/CRFSERVICE/ordersController/orders",
		type : 'get', //get post put delete
		data : {},
		success : function(data) {
			$.each( data, function(index) {
					var odate_int = parseInt(this.order_Time); //轉換成數字
					var odate_value = new Date(odate_int);
					var sdate_int = parseInt(this.ship_Date); //轉換成數字
					var sdate_value = new Date(sdate_int);
					var Status="";
					if(this.order_Status == '已出貨'){
						Status=1;
					}else if(this.order_Status == '未出貨'){
						Status=0;
					};
					$('#orders_tbody').append('<tr class="'+this.order_Id+'"><td><h4>'
													+ this.order_Id
													+ '</td><td><h4>'
													+ this.member_Id
													+ '</td><td><h4>'                              
													+ this.consignee_Name
													+ '</td><td><h4>'
													+ this.invoice_Number
													+ '</td><td><h4>'
													+ this.total_Amount
													+ '</td><td><h4>'
													+ odate_value.Format("yyyy-MM-dd hh:mm:ss")
													+ '</td><td><h4>'
													+ sdate_value.Format("yyyy-MM-dd hh:mm:ss")
													+ '</td><td><h4>'
													+ this.payment_Method
													+ '</td><td hidden="hidden">'
									                + this.order_Status
													+ '</td><td><button type="button" class="btn btn-primary btn-round btn-1g 3g" data-toggle="modal" data-target="#change_status"><span class="easyswitch" data-default="'+Status+'" data-label-on="已出貨" data-label-off="未出貨"></i>'
													+ '</td></tr>') // end of append
			}) // end $.each( data, function(index) {
					// 會員狀態on&off的程式   開始
					$('.easyswitch').easyswitch();
					// 會員狀態on&off的程式   結束
					// 改變會員狀態的程式 開始
					$('body').on('click', '.3g', function(order_Id, order_Status){
// 					console.log($(this).parent().siblings(":eq(9)").text());
// 					console.log($(this).parent().siblings(":eq(1)").text());
 						var this_orderStatus = $(this).parent().siblings(":eq(9)");
						var orderId = $(this).parent().siblings(":eq(1)").text();
						var orderStatus = this_orderStatus.text();
						var reversedState = "";
						if(orderStatus=="已出貨"){
							reversedState="未出貨";
						}else{
							reversedState="已出貨";
							}
						 $.ajax({
							    url:"${this_contextPath}/CRFSERVICE/orderControllerBE/changeStatus",
						        type:'post',  //get post put delete
					    		data: {'order_Id': orderId,
										'order_Status': reversedState}, //
						    	success:function(data){
						    		this_orderStatus.text(reversedState)
						        } // end of success:function(data)	 
						 }) // end of  $.ajax({  	    	   
					}); // end of 	$('.3g').click(function () {
					// 改變會員狀態的程式 結束
			$("#orders_table").searcher({
		    	inputSelector: "#tablesearchinput"
		    })						
		} // end of success : function(data) 
	}) // end of $.ajax({
// 1.顯示會員的程式   結束			

}); // end 155 jQuery(function ($)
</script>

	</body>
</html>
