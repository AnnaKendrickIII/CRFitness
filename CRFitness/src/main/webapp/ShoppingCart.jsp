<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="page" value="${pageContext.request.requestURI}" scope="page"/>
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
<link rel="stylesheet" href="${this_contextPath}/css/shoppingcart.css">
<link rel="stylesheet" href="${this_contextPath}/css/alertify.css">
<link rel="stylesheet" href="${this_contextPath}/css/select.css">
<title>購物車</title>

</head>
<body>
<script type="text/javascript" src="${this_contextPath}/js/alertify.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/select.js"></script>

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
						<h4 class="text-right"  id="amount">
							總金額: $<strong></strong>
						</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-3"></div>
</div>
<br />
<div class="row">
	<div class="checkorder">
		<Form class="form-horizontal">
			<fieldset>
				<!-- Form Name -->
				<legend class="well well-sm" style="text-align: center">填寫訂單資訊</legend>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="name">收件人姓名</label>
					<div class="col-md-4">
						<input id="consignee_Name" name="name" type="text" placeholder="收件人姓名"
							class="form-control input-lg" autocomplete="off" required="">
					</div>
					<div class="error_name"><span>${ErrorMessage.error_name}</span></div>
				</div>
				<br>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address">收件地址</label>
					<div class="col-md-4">
						<input id="consignee_Address" name="address" type="text"
							placeholder="收件地址" class="form-control input-lg"
							autocomplete="off">
					</div>
					<div class="error_address"><span>${ErrorMessage.error_address}</span></div>
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
					<div class="error_email"><span>${ErrorMessage.error_email}</span></div>
				</div>
				<br>
				<!-- 付款方式 -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="payment"> 付款方式</label>
					<div class="col-md-4">
						<div class="input-group">
							<div id="radioBtn" class="btn-group">
								<a class="btn btn-primary btn-lg active" data-toggle="happy"
								data-title="x">線上刷卡</a>
								<a class="btn btn-primary btn-lg notActive" data-toggle="happy"
								data-title="y">ATM轉帳</a>
								<a class="btn btn-primary btn-lg notActive" data-toggle="happy"
								data-title="z">超商繳費</a>
<!-- 								<a class="btn btn-primary btn-lg notActive" data-toggle="happy" -->
<!-- 								data-title="a" disabled="disabled">用身體付</a> -->
							</div>
							
						</div>
					</div>
				</div>
				<br>
				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="check"></label>
					<div class="col-md-4">
						<a id="check" class="btn btn-success" name="sendbutton">送出訂單</a>
					</div>
					<div class="checkfail"><span>${ErrorMessage.checkfail}</span></div>
				</div>
			</fieldset>
		</Form>
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

//清空購物車
function cleanCart(){
	$.ajax({
		url:'${this_contextPath}/CRFSERVICE/productDetailController/cleanCart',
		typr:'get',
		data:{},
		success:function(){
			$('.item').remove()
		}
	})
}

//付費方式 Radio Box
$('#radioBtn a').on('click', function() {
	var sel = $(this).data('title');
	var tog = $(this).data('toggle');
	var a= $('#' + tog).prop('value', sel);
	$('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]')
			.removeClass('active').addClass('notActive');	
	$('a[data-toggle="' + tog + '"][data-title="' + sel + '"]')
			.removeClass('notActive').addClass('active');
})


jQuery(function($){
	$('.logo_here').append('<img  class=" logo_css" src="${this_contextPath}/images/logo/ShoppingCart.png">')
	$.ajax({
		url:'${this_contextPath}/CRFSERVICE/productDetailController/showCart',
		type:'get',
		data:{},
		success:function(data){
			$.each(data,function(){
		$('#itemlist').append('<div class="item">'+
				'<div class="row"><div class="col-xs-2">'+
				'<img class="img-shoppingcart" src="${this_contextPath}/images/products/'
				+this[0][0].productDetail_Id+'_1.png"/></div>'+
				'<div class="col-xs-4"><span hidden="hidden">'+this[0][0].productDetail_Id+'</span><h4 class="productname"><strong>'+
				this[0][1]+'</strong></h4><h4 class="size"><small>尺寸 : '+this[0][0].size+'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</small></h4><h4 class="color"><small>顏色 : '+this[0][0].color+'</small></h4></div>'+
				'<div class="col-xs-6">'+
				'<div class="col-xs-6 text-right"><h5><strong class="price">'+
				this[0][2]+'</strong><span class="text-muted">&nbsp&nbspx&nbsp</span></h5></div>'
				+'<div class="col-xs-4"><strong><button class="btn btn-primary btn-select btn-select-light"><input hidden="hidden" type="text" class="btn-select-input" id="" name="" value="" />'
				+'<strong><span class="btn-select-value">'+this[1]+'</span>'
                +'<span class="btn-select-arrow glyphicon glyphicon-chevron-down"></span></strong>'
     			+'<ul class="num"></ul></button></div>'
				+'<div class="col-xs-2"><button type="button" class="btn btn-link btn-xs delete" title="移除此商品">'+
				'<span class="glyphicon glyphicon-trash" title="移除此商品"></span></button></div></div></div><hr></div>'
				)

			})
		//取出新總額
		totalAmount()
		//每筆商品增加下拉選單
		for(var i=1;i<=100;i++){
			$('.num').append(
					'<li>'+i+'</li>'		
					)
				}
			
		$('body').on('click', '.btn-success', function () {
			var consignee_Name = $('#consignee_Name').val();
			var consignee_Address = $('#consignee_Address').val();
			var email = $('#email').val();
			var payment_Method = $('#radioBtn .active').text();
			var qty = $('.qty').val();
			if(consignee_Name =='' || consignee_Address =='' || email =='')
			{
				alertify.alert("請填寫收件人相關資料",function(){					
				}).set("title","警告 !").set('label', '對不起我錯了'); 


			}else{
		    alertify.confirm('確認訂單', '<strong>訂單內容確認無誤?</strong>', function () {
				
				//驗證Form
// 			$.ajax({
// 				url:'${this_contextPath}/CRFSERVICE/orderDetailsController/checkForm',
// 				type:'get',
// 				data:{consignee_Name:consignee_Name,
// 					consignee_Address:consignee_Address,
// 					payment_Method:payment_Method,							
// 					},
// 				success:function(){
					
// 				}
// 			})
			
			//送出訂單
				$.ajax({
					url:'${this_contextPath}/CRFSERVICE/orderDetailsController/addOrder',
					type:'get',
					data:{
						member_Id:'${LoginOK.member_Id}',
						consignee_Name:consignee_Name,
						consignee_Address:consignee_Address,
						payment_Method:payment_Method,
					},
					success:function(data){

						//確認訂單後清空session和頁面上的資料
			    		$('#consignee_Name').val('');
				    	$('#consignee_Address').val('');
				    	$('#email').val('');				    	
				    	$('a[data-toggle="happy"]').not('[data-title="x"]')
				    			.removeClass('active').addClass('notActive');	
				    	$('a[data-toggle="happy"][data-title="x"]')
				    			.removeClass('notActive').addClass('active'); 						
						cleanCart()
						totalAmount()
						//訂單送出後導向推薦者頁面
						alertify.success('訂單送出 &nbsp&nbsp&nbsp即將回到首頁',setTimeout(function(){	
 							location.href ="${this_contextPath}/index.jsp?${LoginOK.member_Id}"
							},2000) 
						)				
					}
				})
		   		 }, function () { 
			alertify.notify( "訂單取消", 'error', 3)});
			}
		});
	}
})
})

	//刪除商品
$('#itemlist').on('click','.delete', function() {
	var thisdelete =$(this)
	alertify.confirm().set('title', '刪除購物車商品');
	alertify.confirm('您確認將該商品從購物車中刪除?', function(){ 
	$.ajax({
		url:'${this_contextPath}/CRFSERVICE/productDetailController/deleteItem',
		typr:'get',
		data:{productDetail_Id:thisdelete.parent().parent().parent().parent().find('span[hidden]').text()},
		success:function(data){
			var num = $('.btn-select-value').text()
			console.log('num='+num)
				 thisdelete.parent().parent().parent().parent().remove();
		}
	})
		alertify.warning('商品刪除成功',2)
		//取出新總額
		totalAmount()	
 });
});

//刪除整台車
$('body').on('click','#clean',function(){
	alertify.confirm().set('title', '刪除整台購物車');
	alertify.confirm('確認將購物車清空?',function(){
			cleanCart()
		alertify.warning('購物車已清空',2)
			totalAmount()
	})
	
})

//當換數量 總價格變動
$('#itemlist').on('click', '.num li',function(){
	var productDetailId=$(this).parent().parent().parent().parent().parent().parent().find('span[hidden]').text();
	var num = $(this).text()
	console.log(productDetailId)
	console.log(num)
	$.ajax({
		url:'${this_contextPath}/CRFSERVICE/productDetailController/ChangeProductNum',
		type:'post',
		data:{ productDetail_Id:productDetailId,
			 	num:num},
		success:function(data){
			totalAmount()
		}
	})
	
})


</script>

</aside>
</body>
</html>
