<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<title>購物車</title>

<style type="text/css">
.cart {
	margin-top: 4%;
	background-color: #f5f5f5;
}

</style>
</head>
<body>
	<aside>
		<div class="cart">
		<legend class="well well-sm" style="text-align: center">確認購物車</legend>
			<div class="col-xs-2"></div>
			<div class="row col-xs-8">
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
									<button type="button" class="btn btn-primary btn-sm btn-block"
										onclick="">
										<span class="glyphicon glyphicon-share-alt"></span> 繼續購物
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<!-- 商品資料  開始 -->
						<div class="row">
							<div class="col-xs-2">
								<img class="img-responsive" src="http://placehold.it/100x70">
							</div>
							<div class="col-xs-4">
								<h4 class="product-name">
									<strong>Product name</strong>
								</h4>
								<h4>
									<small>Product description</small>
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
									<button type="button" class="btn btn-link btn-xs" title="移除此商品">
										<span class="glyphicon glyphicon-trash" title="移除此商品">
										</span>
									</button>
								</div>
							</div>
						</div>
						<hr>
						<!-- 商品資料  結束 -->
						<div class="row">
							<div class="text-center">
								<div class="col-xs-9">
									<h6 class="text-right">Added items?</h6>
								</div>
								<div class="col-xs-3">
									<button type="button" class="btn btn-default btn-sm btn-block">
										更新購物車</button>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<div class="row text-center">
							<div class="col-xs-9">
								<h4 class="text-right">
									總金額: $<strong>9999999999.00</strong>
								</h4>
							</div>
							<div class="col-xs-3">
								<button type="button" class="btn btn-success btn-block">
									填寫訂單</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-2"></div>
		</div>
	</aside>
	<script type="text/javascript">
		
	</script>
</body>

</html>