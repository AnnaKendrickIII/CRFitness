<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<link rel="stylesheet" href="${this_contextPath}/css/products2.css">
<link rel="stylesheet" href="${this_contextPath}/css/lightbox.css">
<link rel="stylesheet" href="${this_contextPath}/css/lity.min.css">
<link rel="stylesheet" href="${this_contextPath}/css/searchform.css">

<title>鞋類</title>

<style type="text/css">
aside{
background-color: #f5f5f5;
}
.productsclass {
	background-color: #f5f5f5;
}
#a{
height:425px; 
}
#b{
height:250px;
}
#a:hover{
border:1px solid #3333ff;

}
.shopping_car{
position:fixed;
right:2%;
top:35%;
 opacity:0.6;
}
.shopping_car:hover{
position:fixed;
right:2%;
top:35%;
 opacity:1;
}
.shop{
background-color: red;
color: white
}
.shop:LINK,.shop:FOCUS,.shop:hover,.shop:ACTIVE{
background-color: #AE0000;
color: white
}

</style>

</head>

<body class="productsbody">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<script type="text/javascript" src="${this_contextPath}/js/products2.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/lightbox.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/lity.min.js"></script>

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
   	  <div class="col-xs-2 col-lg-2"> </div>
	    <div id="products" class="row list-group col-xs-8 col-lg-8" ></div>
      <div class="col-xs-2 col-lg-2 shopping_car"> </div>
    </div>
</div>
<a href="${this_contextPath}/ShoppingCart.jsp"><img class="shopping_car" src="${this_contextPath}/images/product-shopping-cart-icon-.png"></a>
<script type="text/javascript">
jQuery(function($){
var Type='${pageContext.request.queryString}';
Type=Type.substr(9)
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
	data:{category:Type},
	success:function(data){
		$.each(data,function(){
			$('#products').append('<div  class="item  col-xs-4 col-lg-4"><div id="a" class="thumbnail"><a href="data:image/png;base64,'
						+this[0].photo1+'" data-lightbox="image-1" data-title="'
						+this[0].product_Name+'"><img id="b"   class="group list-group-image"  src="data:image/png;base64,'
						+this[0].photo1+'" /></a><div class="caption"><h4 class="group inner list-group-item-heading" style="color:#3333ff">'
						+this[0].product_Name+'</h4><p class="group inner list-group-item-text" style="color:#555555">'
						+this[0].introduction+'</p><div class="row"><div class="col-xs-12 col-md-4"><p class="lead" style="color:#E63F00">$'
						+this[1]+'</p></div><div class="col-xs-12 col-md-4"><a class="btn btn-success" href="${this_contextPath}/ProductDetail.jsp?productDetail_Id='
						+this[0].productDetail_Id+'">商品介紹</a></div><div class="col-xs-12 col-md-4"><a class="btn shop" >加入購物車</a></div></div></div></a></div></div>'
					)	
		})		
	}
});
})
</script>


</aside>
</body>
</html>
