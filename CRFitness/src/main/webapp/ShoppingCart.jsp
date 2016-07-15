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
								class="glyphicon glyphicon-share-alt"></span> 繼續購物 </a>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-body" id="itemlist">
				<!-- 商品資料  開始 -->
				<div class="item">
					<div class="row">
						<div class="col-xs-2">
							<img class="img-shoppingcart" src="http://placehold.it/100x70">
						</div>
						<div class="col-xs-4">
							<h4 class="product-name">
								<strong>Product name</strong>
							</h4>
						</div>
						<div class="col-xs-6">
							<div class="col-xs-6 text-right">
								<h6>
									<strong>25.00 <span class="text-muted">x</span></strong>
								</h6>
							</div>
							<div class="col-xs-4">
								<input type="text" class="form-control input-sm" value="1">
							</div>
							<div class="col-xs-2">
								<button type="button" class="btn btn-link btn-xs delete"
									title="移除此商品">
									<span class="glyphicon glyphicon-trash" title="移除此商品">
									</span>
								</button>
							</div>
						</div>
					</div>
					<hr>
				</div>

				<div class="item">
					<div class="row">
						<div class="col-xs-2">
							<img class="img-responsive" src="http://placehold.it/100x70">
						</div>
						<div class="col-xs-4">
							<h4 class="product-name">
								<strong>Product name</strong>
							</h4>
						</div>
						<div class="col-xs-6">
							<div class="col-xs-6 text-right">
								<h6>
									<strong>25.00 <span class="text-muted">x</span></strong>
								</h6>
							</div>
							<div class="col-xs-4">
								<input type="text" class="form-control input-sm" value="1">
							</div>
							<div class="col-xs-2">
								<button type="button" class="btn btn-link btn-xs delete"
									title="移除此商品">
									<span class="glyphicon glyphicon-trash" title="移除此商品">
									</span>
								</button>
							</div>
						</div>
					</div>
					<hr>
				</div>
				<div class="item">
					<div class="row">
						<div class="col-xs-2">
							<img class="img-responsive" src="http://placehold.it/100x70">
						</div>
						<div class="col-xs-4">
							<h4 class="product-name">
								<strong>Product name</strong>
							</h4>
						</div>
						<div class="col-xs-6">
							<div class="col-xs-6 text-right">
								<h6>
									<strong>25.00 <span class="text-muted">x</span></strong>
								</h6>
							</div>
							<div class="col-xs-4">
								<input type="text" class="form-control input-sm" value="1">
							</div>
							<div class="col-xs-2">
								<button type="button" class="btn btn-link btn-xs delete"
									title="移除此商品">
									<span class="glyphicon glyphicon-trash" title="移除此商品">
									</span>
								</button>
							</div>
						</div>
					</div>
					<hr>
				</div>
				<!-- 商品資料  結束 -->
			</div>
			<div class="row">
				<div class="text-center">
				<div class="col-xs-9">
					<h6 class="text-right">Added items?</h6>
				</div>
				<div class="col-xs-3">
					<a href="${pageContext.request.requestURI}" class="btn btn-default btn-sm btn-block" type="button">更新購物車</a>
					</div>
				</div>
			</div>
			<hr>
			<div class="panel-footer">
				<div class="row text-center">
					<div class="col-xs-12">
						<h4 class="text-right">
							總金額: $<strong>999999.99</strong>
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
				</br>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address">收件地址</label>
					<div class="col-md-4">
						<input id="address" name="address" type="text"
							placeholder="收件地址" class="form-control input-lg"
							autocomplete="off">
					</div>
				</div>
				</br>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="e-mail">E-mail</label>
					<div class="col-md-4">
						<input id="e-mailt" name="e-mail" type="text"
							placeholder="E-mail" class="form-control input-lg"
							autocomplete="off">
					</div>
				</div>
				</br>
				<!-- 付款方式 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="payment"> 付款方式</label>
					<div class="col-md-4">
						<div class="input-group">
							<div id="radioBtn" class="btn-group">
								<a class="btn btn-primary btn-sm active" data-toggle="happy"
								data-title="X">線上刷卡</a>
								<a class="btn btn-primary btn-sm notActive" data-toggle="happy"
								data-title="Y">ATM轉帳</a>
								<a class="btn btn-primary btn-sm notActive" data-toggle="happy"
								data-title="Z">超商繳費</a>
								<a class="btn btn-primary btn-sm notActive" data-toggle="happy"
								data-title="A">用身體付</a>
							</div>
							<input type="hidden" name="payment" id="payment">
						</div>
					</div>
				</div>
				</br>
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

console.log(queryString)

$.ajax({
	url:'${this_contextPath}/CRFSERVICE/productDetailController/findByPrimaryKeySQLQuery',
	typr:'get',
	data:{productDetail_Id:queryString},
	success:function(data){
		$('#itemlist').append('<div class="item">'+
				'<div class="row"><div class="col-xs-2">'+
				'<img class="img-shoppingcart" src="data:image/png;base64,'+
				data[0][0].photo1+'"/></div>'+
				'<div class="col-xs-4"><h4 class="product-name"><strong>'+
				data[0][1]+'</strong></h4></div>'+
				'<div class="col-xs-6">'+
				'<div class="col-xs-6 text-right"><h6><strong>'+
				data[0][2]+'<span class="text-muted">&nbsp&nbspx&nbsp</span></strong></h6></div>'+
				'<div class="col-xs-4"><input type="text" class="form-control input-sm" value="1"></div>'+
				'<div class="col-xs-2"><button type="button" class="btn btn-link btn-xs delete" title="移除此商品">'+
				'<span class="glyphicon glyphicon-trash" title="移除此商品"></span></button></div></div></div><hr></div>')
		
	}
	
})

</script>

<script type="text/javascript">
	$('.delete').on('click', function() {
		$(this).parent().parent().parent().parent().remove();
	});
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
    	alertify.success('訂單送出') }
        , function () { 
        alertify.error('訂單取消') });
});

</script>

</aside>
</body>

</html>