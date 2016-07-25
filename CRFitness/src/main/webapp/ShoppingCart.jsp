<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<link rel="stylesheet" href="${this_contextPath}/css/shoppingcart.css">
<link rel="stylesheet" href="${this_contextPath}/css/alertify.css">
<title>購物車</title>

</head>
<body>
<script type="text/javascript" src="${this_contextPath}/js/alertify.js"></script>

<aside>
<div class="row">
	<legend class="well well-sm" style="text-align: center">確認購物車</legend>
	<div class="col-xs-3"></div>
	<div class="row col-xs-6">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">
					<div class="row">
						<div class="col-xs-6">
							<h5>
								<span class="glyphicon glyphicon-shopping-cart"></span>&nbspShopping
								Cart
							</h5>
						</div>
						<div class="col-xs-6">
							<a href='<%=request.getHeader("referer")%>'
								class="btn btn-primary btn-sm btn-block"><span
								class="glyphicon glyphicon-share-alt"></span>&nbsp&nbsp&nbsp繼續購物 </a>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-body" id="itemlist">
				<!-- 商品資料  開始 -->


				<!-- 商品資料  結束 -->
			</div>
			<div class="row">
				<div class="text-center">
				<div class="col-xs-9">
					<h6 class="text-right">Clean All items?</h6>
				</div>
				<div class="col-xs-3">
<%-- 					<a href="${pageContext.request.requestURI}" class="btn btn-default btn-sm btn-block" type="button" id="refresh">更新購物車</a> --%>
					<a  class="btn btn-default btn-sm btn-block" type="button" id="clean">一鍵清空購物車</a>
					</div>
				</div>
			</div>
			<hr>
			<div class="panel-footer">
				<div class="row text-center">
					<div class="col-xs-12">
						<h4 class="text-right" id="amount">
							總金額: $<strong></strong>
						</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-3"></div>
</div>

<div class="row">
	<div class="checkorder">
		<form class="form-horizontal">
			<fieldset>
				<!-- Form Name -->
				<legend class="well well-sm" style="text-align: center">填寫訂單資訊</legend>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">收件人姓名</label>
					<div class="col-md-4">
						<input id="name" name="name" type="text" placeholder="收件人姓名"
							class="form-control input-lg" autocomplete="off" required="">
					</div>
				</div>
				<br>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address">收件地址</label>
					<div class="col-md-4">
						<input id="address" name="address" type="text"
							placeholder="收件地址" class="form-control input-lg"
							autocomplete="off">
					</div>
				</div>
				<br>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="e-mail">E-mail</label>
					<div class="col-md-4">
						<input id="email" name="email" type="email"
							placeholder="E-mail" class="form-control input-lg"
							autocomplete="off">
					</div>
				</div>
				<br>
				<!-- 付款方式 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="payment"> 付款方式</label>
					<div class="col-md-4">
						<div class="input-group">
							<div id="radioBtn" class="btn-group">
								<a class="btn btn-primary btn-lg active" data-toggle="happy"
								data-title="X">線上刷卡</a>
								<a class="btn btn-primary btn-lg notActive" data-toggle="happy"
								data-title="Y">ATM轉帳</a>
								<a class="btn btn-primary btn-lg notActive" data-toggle="happy"
								data-title="Z">超商繳費</a>
								<a class="btn btn-primary btn-lg notActive" data-toggle="happy"
								data-title="A" disabled="disabled">用身體付</a>
							</div>
							<input type="hidden" name="payment" id="payment">
						</div>
					</div>
				</div>
				<br>
				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="check"></label>
					<div class="col-md-4">
						<a id="check" class="btn btn-success">送出訂單</a>
					</div>
				</div>

			</fieldset>
		</form>
	</div>
</div>
<br /> <br /> <br />

<script type="text/javascript">
var queryString='${pageContext.request.queryString}';
queryString=queryString.substring(17);
//總金額function
 function totalAmount(){
	$.ajax({
	url:'${this_contextPath}/CRFSERVICE/productDetailController/totalAmount',
	typr:'get',
	data:{},
	success:function(data){
	$('#amount strong').text(data);
		}
	})
}

jQuery(function($){
	$('.logo_here').append('<img  class="img-responsive logo_css" src="${this_contextPath}/images/logo/ShoppingCart.png">')
	$.ajax({
		url:'${this_contextPath}/CRFSERVICE/productDetailController/showCart',
		typr:'get',
		data:{},
		success:function(data){
			$.each(data,function(){
		$('#itemlist').append('<div class="item">'+
				'<div class="row"><div class="col-xs-2">'+
				'<img class="img-shoppingcart" src="${this_contextPath}/images/products/'
				+this[0][0].productDetail_Id+'_1.png"/></div>'+
				'<div class="col-xs-4"><span hidden="hidden">'+this[0][0].productDetail_Id+'</span><h4 class="product-name"><strong>'+
				this[0][1]+'</strong></h4><h4><small>尺寸 : '+this[0][0].size+'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp顏色 : '+this[0][0].color+'</small></h4></div>'+
				'<div class="col-xs-6">'+
				'<div class="col-xs-6 text-right"><h5><strong class="price">'+
				this[0][2]+'</strong><span class="text-muted">&nbsp&nbspx&nbsp</span></h5></div>'+
				'<div class="col-xs-4"><input type="text" class="form-control input-sm qty" value="'+this[1]+'"/></div>'+
				'<div class="col-xs-2"><button type="button" class="btn btn-link btn-xs delete" title="移除此商品">'+
				'<span class="glyphicon glyphicon-trash" title="移除此商品"></span></button></div></div></div><hr></div>')	
		})
		//取出新總額
		totalAmount()	
	}
})
	
})
</script>

<script type="text/javascript">
//刪除商品
$('#itemlist').on('click','.delete', function() {
	var thisdelete =$(this)
	alertify.confirm().set('title', '刪除購物車商品');
	alertify.confirm('您確認將該商品從購物車中刪除?', function(){ 
	$.ajax({
		url:'${this_contextPath}/CRFSERVICE/productDetailController/deleteItem',
		typr:'get',
		data:{productDetail_Id:thisdelete.parent().parent().parent().find('span[hidden]').text()},
		success:function(data){
				 thisdelete.parent().parent().parent().parent().remove();
		}
	})
		alertify.warning('商品刪除成功')
		//取出新總額
		totalAmount()	
 });
});	
</script>

<script type="text/javascript">
$('body').on('click','#clean',function(){
	alertify.confirm().set('title', '刪除整台購物車');
	alertify.confirm('確認將購物車清空?',function(){
		$.ajax({
			url:'${this_contextPath}/CRFSERVICE/productDetailController/cleanCart',
			typr:'get',
			data:{},
			success:function(){
				$('.item').remove()
			}
		})
		alertify.warning('購物車已清空')
			totalAmount()
	})
	
})
</script>

<script type="text/javascript">
//當換數量 總價格變動
$('#itemlist').on('focusout', 'div.item input.qty',function(){
	var productDetailId=$(this).parent().parent().prev().find('span[hidden]').text();
	$.ajax({
		url:'${this_contextPath}/CRFSERVICE/productDetailController/ChangeProductNum',
		type:'post',
		data:{ productDetail_Id:productDetailId,
			 	num:$(this).val()},
		success:function(data){
			totalAmount()
		}
	})
	
})

// 	$('#itemlist').on('change', 'div.item input.qty',function(){
// 	var amount = 0;
// 	var sum = 0;
// 	for(var i=0; i<$('.qty').length; i++){
// 		var qty = parseInt($('.qty:eq('+i+')').val());
// 		var price = parseInt($('.price:eq('+i+')').text());
// 		amount = qty * price;
// 		console.log(amount);	
// 		sum += amount;
// 	}
	
// 	})
</script>

<script type="text/javascript">
	$('#radioBtn a').on('click', function() {
		var sel = $(this).data('title');
		var tog = $(this).data('toggle');
		$('#' + tog).prop('value', sel);
		$('a[data-toggle="' + tog + '"]').not(
				'[data-title="' + sel + '"]').removeClass(
				'active').addClass('notActive');
		$(
				'a[data-toggle="' + tog + '"][data-title="'
						+ sel + '"]').removeClass('notActive')
				.addClass('active');
	})
</script>

<script type="text/javascript">
$('.btn-success').on('click', function () {
    alertify.confirm('確認訂單', '<strong>訂單內容確認無誤?</strong>', function () {
    	alertify.success('訂單送出') 

    	var name = $('#name').val();
    	var address = $('#address').val();
    	var email = $('#email').val();
    	var pay = $('#radioBtn .active').text();

		console.log(name)
		console.log(address)
		console.log(email)
		console.log(pay)
		
   		 }, function () { 
        alertify.error('訂單取消') });
});
</script>

</aside>
</body>

</html>
