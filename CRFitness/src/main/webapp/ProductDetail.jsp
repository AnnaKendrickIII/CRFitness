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


<title>商品明細</title>
<style type="text/css">
.aside{ 
background-image:url(images/Journal/journal2042.gif); /*背景圖存放路徑*/  
background-attachment:fixed; /*背景固定*/  
background-repeat:repeat; /*背景圖不要重複*/   
background-position:center; /*置放位置 下面 左邊*/  
  }    
.btn-md{
width: 150px;
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

	<div class="col-xs-2 col-md-2 col-lg-2"></div>
	<div class="col-xs-7 col-md-7 col-lg-7">
		<div class="row" style="text-align: center;">
        <strong>Products Category &nbsp&nbsp</strong>
        <div class="btn-group">
          <a href="${this_contextPath}/Products.jsp?category=cmens-tops&page=1" class="btn btn-default btn-md">
          	<img src="${this_contextPath}/icon/sportive-t-shirt.png">&nbsp上裝</a>&nbsp&nbsp
          <a href="${this_contextPath}/Products.jsp?category=cmens-bottoms&page=1" class="btn btn-default btn-md">
          	<img src="${this_contextPath}/icon/shorts.png">&nbsp下裝</a>&nbsp&nbsp
          <a href="${this_contextPath}/Products.jsp?category=cmens-accessories&page=1" class="btn btn-default btn-md">
          	<img src="${this_contextPath}/icon/sports.png">&nbsp配件</a>&nbsp&nbsp
          <a href="${this_contextPath}/Products.jsp?category=cmens-footwear&page=1" class="btn btn-default btn-md">
          	<img src="${this_contextPath}/icon/sport.png">&nbsp鞋類</a>
		</div>
		</div>
	</div>
    <div class="col-md-3 col-lg-3">
    </div>
   </div>
    <div class="row">
 		<div class="col-md-2"></div>
	    <div id="productDetailbody" class="col-md-8 col-xs-12 col-sm-12"></div> 	    
	 	<div class="col-md-2"></div>
	 		 	
    </div>

	<div class="shopping_car_div"  data-html="true" data-toggle="popover" data-trigger="hover "  
	data-placement="left" data-content="">
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
	function showCart(){
		$.ajax({
			url:'${this_contextPath}/CRFSERVICE/productDetailController/showCart',
			typr:'get',
			data:{},
			success:function(data){	
				var count=0;
				var CarContent="";
				$.each(data,function(index){
					CarContent+='<div class="row"><div class="col-lg-4 col-md-4 col-xs-4 car_img_div">'
					+'<img class="img-responsive" src="${this_contextPath}/images/products/'
					+this[0][0].productDetail_Id+'_1.png"/></div>'
					+'<div class="col-lg-4 col-md-4 col-xs-4"><div class="row car_name_div"><strong >'+this[0][1]+'</strong></div></div>'
					+'<div class="col-lg-4 col-md-4 col-xs-4"><div class="row Car_price_div"><strong >$'
					+this[0][2]+'</strong></div ><div class="row num_car_div"><strong >數量:'+this[1][0]+'</strong></div ></div></div>'
					count++;
				})
				$.ajax({
					url:'${this_contextPath}/CRFSERVICE/productDetailController/totalAmount',
					typr:'get',
					data:{},
					success:function(data){		
				$('.shopping_car_div').attr('data-content','<div class="row Amount_div"><h3><strong>總價:</strong>'
						+'<strong >$'+data
						+'</strong></h3></div>'+CarContent)
						}
					})
			
					if(count>0){
					$('.shopping_car_span').text(count)
					}
				
				
				
				}
			})
		}	
		showCart();	
	
	
var queryString='${pageContext.request.queryString}';
	queryString=queryString.substring(17);
	jQuery(function($){
		$('.logo_here').append('<img  class=" logo_css" src="${this_contextPath}/images/logo/ProductDetail.png">')
		
$.ajax({
	url:'${this_contextPath}/CRFSERVICE/productDetailController/findByPrimaryKeySQLQuery',
	type:'get',
 	data:{productDetail_Id:queryString},
	success:function(data){
		$('#productDetailbody').append('<div class="col-md-7 col-sm-12 col-xs-12">'
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
							+'<div class="col-md-5 col-sm-12 col-xs-12">'
							+'<h2 style="color:blue"><strong>'+data[0][1] 
							+'</strong><h2/><br/><p style="color:#888888"><div>顏色 : '
							+data[0][0].color
							+'</div><div>剩餘數量 : '
							+data[0][0].stock
							+'</div></p>'
							+'</br></br><div><strong>商品介紹 :</br><p>'+'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+data[0][4]
							+'</p></strong></div></br><div><h3 style="color:#FF3333"><strong>特價 : '+data[0][2]+'</strong></h3></div></br>'
// 							+'<div class="btn btn-warning" href="https://youtu.be/2Vhlzdj6Csw?autoplay=1&controls=0&showinfo=0&autohide=1" data-lity><i class="fa fa-ban" aria-hidden="true"></i>&nbsp&nbsp千萬不要按&nbsp!</div>'
							+'&nbsp&nbsp&nbsp<div class="btn btn-danger addCart"><span hidden="hidden">'+data[0][0].productDetail_Id+'</span><i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp&nbsp加入購物車</div>'
							+'&nbsp&nbsp&nbsp<a href=<%=request.getHeader("referer")%> class="btn btn-primary"><span class="glyphicon glyphicon-share-alt"></span>&nbsp&nbsp繼續購物</a>'
							+'</div>')
							
							
							$(".small ").error(function(e) {
								$(e.target).parent().remove();
// 			        			$(e.target).attr("src", "${this_contextPath}/images/logo/iconBig.png");
			   				})
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
					showCart();	
					var size = $('.btn-select-value').text()
					console.log(size)
					
					 alertify.success('成功加入購物車',2);
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

</body>
</html>
