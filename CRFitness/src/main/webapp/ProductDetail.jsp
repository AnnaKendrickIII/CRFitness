<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<link rel="stylesheet" href="${this_contextPath}/css/select.css">
<link rel="stylesheet" href="${this_contextPath}/css/products.css">
<link rel="stylesheet" href="${this_contextPath}/css/lity.min.css">
<link rel="stylesheet" href="${this_contextPath}/css/jquery.fancybox.css">
<link rel="stylesheet" href="${this_contextPath}/css/alertify.css">

<title>商品明細</title>
<style type="text/css">
aside{ 
background-image:url(images/Journal/journal2042.gif); /*背景圖存放路徑*/  
background-attachment:fixed; /*背景固定*/  
background-repeat:repeat; /*背景圖不要重複*/   
background-position:center; /*置放位置 下面 左邊*/  
  }    
.btn-md{
width: 110px;
}
</style>
</head>
<body>
<aside>


<!-- <div style="position: fixed; z-index: 0; width: 100%; height: 100%;"> -->
<!--   <iframe frameborder="0" height="70%" width="100%" -->
<!--     src="https://www.youtube.com/embed/2Vhlzdj6Csw?autoplay=1&controls=0&showinfo=0&autohide=1"> -->
<!--   </iframe> -->
<!-- </div> -->

<div class="ProductDetail">
<div class="row well">

	<div class="col-md-2 col-xs-2"></div>
	<div class="col-md-7 col-xs-7">
		<div class="row" style="text-align: center;">
        <strong>Products Category &nbsp&nbsp</strong>
          <a href="${this_contextPath}/Products.jsp?category=cmens-tops&page=1" class="btn btn-default btn-md">
          	<img src="${this_contextPath}/icon/jacket24.png">&nbsp上裝</a>&nbsp&nbsp
          <a href="${this_contextPath}/Products.jsp?category=cmens-bottoms&page=1" class="btn btn-default btn-md">
          	<img src="${this_contextPath}/icon/pants24.png">&nbsp下裝</a>&nbsp&nbsp
          <a href="${this_contextPath}/Products.jsp?category=cmens-accessories&page=1" class="btn btn-default btn-md">
          	<img src="${this_contextPath}/icon/sports24.png">&nbsp配件</a>&nbsp&nbsp
          <a href="${this_contextPath}/Products.jsp?category=cmens-footwear&page=1" class="btn btn-default btn-md">
          	<img src="${this_contextPath}/icon/shoes24.png">&nbsp鞋類</a>
		</div>
	</div>
    <div class="col-md-3 col-xs-3">
    </div>
   </div>
    <div class="row">
 		<div class="col-xs-2 col-sm-2"></div>
	    <div id="productDetailbody" class="col-md-8"></div> 	    
	 	<div class="col-md-2"></div>
	 		 	
    </div>

	<div class="shopping_car_div">
		<a href="${this_contextPath}/ShoppingCart.jsp">
			<img class="shopping_car" src="${this_contextPath}/images/product-shopping-cart-icon-.png">
		</a>
		 <span class="badge shopping_car_span"></span>
	</div>

</div>
</aside>



<script type="text/javascript">

jQuery(function($){
$('.shopping_car_div').popover()
var queryString='${pageContext.request.queryString}';
	queryString=queryString.substring(17);
	jQuery(function($){
		$('.logo_here').append('<img  class="img-responsive logo_css" src="${this_contextPath}/images/logo/ProductDetail.png">')
		
$.ajax({
	url:'${this_contextPath}/CRFSERVICE/productDetailController/findByPrimaryKeySQLQuery',
	type:'get',
 	data:{productDetail_Id:queryString},
	success:function(data){
		$('#productDetailbody').append('<div class="col-md-7">'
							+'<div class="gallery">'
							+'<div class="previews">'
							+'<a class="changeImg onselected" data-full="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_1.png"><img class="small img-responsive" src="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_1.png"/></a>'
							+'<a class="changeImg" data-full="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_2.png"><img class="small img-responsive" src="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_2.png"/></a>'
							+'<a class="changeImg" data-full="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_3.png"><img class="small img-responsive" src="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_3.png"/></a>'
							+'<a class="changeImg" data-full="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_4.png"><img class="small img-responsive" src="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_4.png"/></a>'
							+'<a class="changeImg" data-full="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_5.png"><img class="small img-responsive" src="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_5.png"/></a>'
							+'</div>'
							+'<div class="full">'
							+'<img data-lity alt="'+data[0][0].productDetail_Id+'" src="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_1.png"/>'
							+'</div>'
							+'</div></div>'
							+'<div class="col-md-5">'
							+'<h2 style="color:blue"><strong>'+data[0][1] 
							+'</strong><h2/><p style="color:#888888"><div>顏色 : '
							+data[0][0].color
							+'</div><div>剩餘數量 : '
							+data[0][0].stock
							+'</div></p>'
							+'<div><a class="btn btn-primary btn-select btn-select-light"><input type="hidden" class="btn-select-input" id="" name="" value="" />'
							+'<span class="btn-select-value">請選擇尺寸</span>'
			                +'<span class="btn-select-arrow glyphicon glyphicon-chevron-down"></span>'
			     			+'<ul><li>US 8</li><li>US 8.5</li><li>US 9</li><li>US 9.5</li><li>US 10</li></ul></a></div>'
							+'</br></br><div><strong>商品介紹 :</br><p>'+'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+data[0][4]
							+'</p></strong></div></br></br>'
							+'<div class="btn btn-warning" href="https://youtu.be/2Vhlzdj6Csw?autoplay=1&controls=0&showinfo=0&autohide=1" data-lity><i class="fa fa-ban" aria-hidden="true"></i>&nbsp&nbsp千萬不要按&nbsp!</div>'
							+'&nbsp&nbsp&nbsp<div class="btn btn-danger addCart"><span hidden="hidden">'+data[0][0].productDetail_Id+'</span><i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp&nbsp加入購物車</div>'
							+'&nbsp&nbsp&nbsp<a href=<%=request.getHeader("referer")%> class="btn btn-primary"><span class="glyphicon glyphicon-share-alt"></span>&nbsp&nbsp繼續購物</a>'
							+'</div>')
							
								$(".selLabel").click(function() {
		$('.dropdown').toggleClass('active');
	});

	$(".dropdown-list li").click(function() {
		$('.selLabel').text($(this).text());
		$('.dropdown').removeClass('active');
		$('.selected-item p span').text($('.selLabel').text());
	});
							
							
							var itemId = $('.btn-success>[span]').text()
							
							
							$('.changeImg').click(function(){
						 		var largeImage = $(this).attr('data-full');
						 		$('.onselected').removeClass();
						 		$(this).addClass('onselected');
						 		$('.full img').hide();
						 		$('.full img').attr('src', largeImage);
						 		$('.full img').fadeIn();
						 		}); 

						 		$('.full img').on('click', function(){
						 		var modalImage = $(this).attr('src');
						 		//$.fancybox.open(modalImage);
						 		});
	
	
						 	
	}	
});

//偷來的購物車動畫
$('body').on('click','.addCart',function(){
	var whichImg=$(this).parent().parent().find('.full>img')
	var detailId=$(this).find('span[hidden]')
		var size = $('.btn-select-value').text()
					console.log(size)
	$.ajax({
		url:'${this_contextPath}/CRFSERVICE/productDetailController/addShoppingCart',
		type:'get',
		data:{
			productDetail_Id:queryString,
			size:size
			},
		success:function(data){
			var copyimg=$('<img width="100px" height="100px" src="' 
					+ whichImg.attr('src') + '"/>').css(
							{"position": "fixed",
							 'top': whichImg.parent().parent().find('.full').offset().top - $(document).scrollTop(),
							"z-index": "999"});
					whichImg.parent().parent().append(copyimg);	
					copyimg.animate({"top":$('.shopping_car_div').position().top,
									"left":$('.shopping_car_div').position().left,
									"opacity": 0,
									},500,"linear", function() {
									      copyimg.remove();
									 });
					var count=0;
					$.each(data,function(index){
						count++;
					})
					$('.shopping_car_span').text(count)
					
					var size = $('.btn-select-value').text()
					console.log(size)
					
					 alertify.success('成功加入購物車');
		}
	})
	
})
	})
})
	

</script>

<script type="text/javascript" src="${this_contextPath}/js/select.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/products.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/lity.min.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/jquery.fancybox.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/alertify.js"></script>
</body>
</html>
