<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="page" value="${pageContext.request.requestURI}" scope="page"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<link rel="stylesheet" href="${this_contextPath}/css/products2.css">
<link rel="stylesheet" href="${this_contextPath}/css/lightbox.css">
<link rel="stylesheet" href="${this_contextPath}/css/searchform.css">
<link rel="stylesheet" href="${this_contextPath}/css/alertify.css">

<title>商品</title>


</head>

<body class="productsbody">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<script type="text/javascript" src="${this_contextPath}/js/products2.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/lightbox.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/alertify.js"></script>

<aside>
<div class="productsclass">
<div class="row well">
    <div class="col-md-8 col-xs-8">
        <strong> Commodity Category </strong>
        <div class="btn-group">
            <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list">
            </span>List</a> <a href="#" id="grid" class="btn btn-default btn-sm"><span
                class="glyphicon glyphicon-th"></span>Grid</a>
        </div>
    </div>
    <div class="col-md-4 col-xs-4">
    	<form action="" class="search-form">
            <div class="form-group has-feedback">
        		<label for="search" class="sr-only">Search</label>
        		<input type="text" class="form-control" name="search" id="search" autocomplete="off" placeholder="不能查詢不要亂玩&nbsp!">
          		<span class="glyphicon glyphicon-search form-control-feedback"></span>
        	</div>
        </form>
    </div>
</div>
<div class="row">
   	  <div class="col-xs-1 col-lg-1"> </div>
	    <div id="products" class="row list-group col-xs-10 col-lg-10" ></div>
      <div class="col-xs-1 col-lg-1 shopping_car"> </div>
</div>
<div class="container">
<ul class="pagination">
              <li><a href="">«</a></li>
              <li><a href="">1</a></li>
              <li><a href="">2</a></li>
              <li><a href="">3</a></li>
              <li><a href="">4</a></li>
              <li><a href="">5</a></li>
              <li><a href="">»</a></li>
            </ul>
            
</div>
</div>
<a href="${this_contextPath}/ShoppingCart.jsp"><img class="shopping_car" src="${this_contextPath}/images/product-shopping-cart-icon-.png"></a>

<script type="text/javascript">
jQuery(function($){
var Type='${pageContext.request.queryString}';
num1 = Type.substr(9).indexOf("&")
num2 = Type.indexOf("&")
var queryString = Type.substr(0,num2)
var whichPage = Type.substr(num2)
whichPage = whichPage.substr(6)
Type = Type.substr(9,num1)
var page = parseInt(whichPage)

if(page<=1){
// 	 alertify.alert('警告','已是第一頁')
	$('.pagination>li:nth-child(2) a').attr("href",'${page}?'+queryString+"&page=1")
}else{
	$('.pagination>li:nth-child(1) a').attr("href",'${page}?'+queryString+"&page="+(page-1))
}
if(page>=3){
	 alertify.alert('警告','本頁已無商品')
	$('.pagination>li:nth-child(3) a').attr("href",'${page}?'+queryString+"&page=2")
}else{
	$('.pagination>li:nth-child(7) a').attr("href",'${page}?'+queryString+"&page="+(page+1))
}

$('.pagination>li:nth-child('+(page+1)+')').addClass("active")
$('.pagination>li:nth-child(2) a').attr("href",'${page}?'+queryString+"&page=1")
$('.pagination>li:nth-child(3) a').attr("href",'${page}?'+queryString+"&page=2")
$('.pagination>li:nth-child(4) a').attr("href",'${page}?'+queryString+"&page=3")
$('.pagination>li:nth-child(5) a').attr("href",'${page}?'+queryString+"&page=4")
$('.pagination>li:nth-child(6) a').attr("href",'${page}?'+queryString+"&page=5")




if(Type=='Sports_Equipment'){
	Type='運動器材'
}else if(Type=='Apparel'){
	Type='服飾類'
}else if(Type=='Sporting_Goods'){
	Type='運動用品'
}else if(Type=='Shoes'){
	Type='鞋類'
}


$.ajax({
	url:'${this_contextPath}/CRFSERVICE/productDetailController/searchByCategory',
	type:'get',
	data:{category:Type, page:whichPage},
	success:function(data){
		$.each(data,function(){
			$('#products').append('<div  class="item  col-xs-3 col-lg-3"><div class="thumbnail "><a href="data:image/png;base64,'
						+this[0].photo1+'" data-lightbox="image-1" data-title="'
						+this[1] +'"><img  class="shopimage" src="data:image/png;base64,'
						+this[0].photo1+'" /></a><div class="caption"><h4 class="group inner list-group-item-heading" style="color:#3333ff"><strong>'
						+this[1] +'</strong></h4><br/><div class="row"><div class="col-xs-12 col-md-4"><p class="lead" style="color:#E63F00">$'
						+this[2] +'</p></div><div class="col-xs-12 col-md-4"><a class="btn btn-success" href="${this_contextPath}/ProductDetail.jsp?productDetail_Id='
						+this[0].productDetail_Id+'">商品介紹</a></div><div class="col-xs-12 col-md-4">'
						+'<div class="btn shop">'+'<span hidden="hidden" class="detailId">'+this[0].productDetail_Id+'</span></button>加入購物車</div></div></div></div></a></div></div>'
					)	
		})		
	}
});

$('body').on('click','.shop',function(){
	var whichImg=$(this).parent().parent().parent().parent().find('img')
	var copyimg=$('<img width="150px" height="150px" src="' 
	+ whichImg.attr('src') + '"/>').css({"position": "fixed", "z-index": "999"});
	whichImg.parent().prepend(copyimg);	
	copyimg.animate({"top":$('.shopping_car').position().top,
					"left":$('.shopping_car').position().left+100+'px'
					},500,"linear", function() {
					      copyimg.remove();
					 });

// 	console.log($('.shopping_car').position().left)
// 	console.log($('.shopping_car').position().top)

	var detailId=$(this).find('span.detailId').text()
//	console.log(detailId)
	$.ajax({
		url:'${this_contextPath}/CRFSERVICE/productDetailController/addShoppingCart',
		type:'get',
		data:{productDetail_Id:detailId},
		success:function(data){
			console.log(data)
		}
	})
	})

})


</script>


</aside>
</body>
</html>
