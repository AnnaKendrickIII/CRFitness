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
<link rel="stylesheet" href="${this_contextPath}/css/jquery.desoslide.css">
<link rel="stylesheet" href="${this_contextPath}/css/animate.min.css">
<link rel="stylesheet" href="${this_contextPath}/css/magic.min.css">

<title>商品</title>

<style type="text/css">
.img_inner{
border: 1px solid #E0E0E0;
}
@media  screen and (min-width:1235px) {
.product_Name{
text-align: center;
height:45px; 
	}
}
.product_Name{
text-align: center;
	}
.price_div{
margin-top: 1%;
text-align: center;
}
.shop{
}
.color_div{
text-align: center;
}
</style>
</head>

<body class="productsbody">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<script type="text/javascript" src="${this_contextPath}/js/products2.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/lightbox.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/alertify.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/jquery.desoslide.min.js"></script>
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
	    <div id="products" class="row list-group col-xs-8 col-lg-8" >       
	    </div>
      <div class="col-xs-2 col-lg-2 shopping_car"> </div>
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
if(page>=6){
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

if(Type=='cmens-tops'){
	Type='上裝'
}else if(Type=='cmens-bottoms'){
	Type='下裝'
}else if(Type=='cmens-accessories'){
	Type='配件'
}else if(Type=='cmens-footwear'){
	Type='鞋類'
}


$.ajax({
	url:'${this_contextPath}/CRFSERVICE/productDetailController/searchByCategory',
	type:'get',
	data:{category:Type, page:whichPage},
	success:function(data){
		var prev_id="";
		$.each(data,function(index){
			
			//<a href="${this_contextPath}/images/products/'+this[0].productDetail_Id+'_1.png" data-lightbox="image-1" data-title="'+this[1] +'">
			//<img  class="shopimage" src="${this_contextPath}/images/products/'+this[0].productDetail_Id+'_1.png" />
			//<span hidden="hidden" class="detailId">+this[0].productDetail_Id</span>
			//this[1]//名字    this[2]//價格
			//<a class="btn btn-success" href="${this_contextPath}/ProductDetail.jsp?productDetail_Id='+this[0].productDetail_Id+'">商品介紹</a> 連結
			//'<div class="btn shop">'+'加入購物車</div>	
					if(index%4==0){
						$('#products').append('<div class="row"></div>')
					}
					if(this.product_Id!=prev_id){
						prev_id=this.product_Id
					$('#products>.row:last').append(
							'<div  class="item  col-xs-3 col-lg-3 col-xs-3 thumbnail">'
                        	+'<div class="row">'
                           		+'<div id="main'+this.product_Id+'" class="col-lg-12 col-md-12 col-xs-12 "></div>'
                        	+'</div><div class="col-lg-12 col-md-12 col-xs-12 color_div">'
                        	+'<a data-toggle="collapse" data-target="#'+this.product_Id+'"  aria-controls="demo">color</a>'
                        	+'<ul id="'+this.product_Id+'" class="collapse row img_color desoslide-thumbs-horizontal list-inline text-center"></ul></div>'
							+'<div class="col-lg-12 col-md-12 col-xs-12 product_Name"><strong>'+this.product_Name+'</strong></div>' 
							+'<div class="col-lg-12 col-md-12 col-xs-12 price_div"><p>$'+this.price+'</p></strong></div>' 
							+'<div class="col-lg-12 col-md-12 col-xs-12"><div class="btn shop">加入購物車</div>'
			                +'</div></div>'
						)	
					
					$.ajax({
						url:'${this_contextPath}/CRFSERVICE/productDetailController/getItemDetail',
						type:'get',
						data:{product_Id:prev_id},
						success:function(data){
							var nid=""
							$.each(data,function(index){
								 nid=this.product_Id
								$('#'+this.product_Id).append(
							'<li class="col-xs-3 col-lg-3  img_inner">'
							+'<a href="${this_contextPath}/images/products/'+this.productDetail_Id+'_1.png">'
			                +'<img  alt="'+this.productDetail_Id+'"  class="shopimage img-responsive" data-desoslide-caption-title="'
			                +this.color+'" src="${this_contextPath}/images/products/'
			                +this.productDetail_Id+'_1.png" /></a></li>'
			               	)                     
						})//小表 ajax迴圈結束
					 	$('#main'+nid).desoSlide({
				            thumbs: $('#'+nid+' li > a'),
				            overlay: 'hover',
				            effect: {
				                provider: 'animate',
				                name: 'sideFade'
				            },  
				            controls: {
				                show: false,
				                keys: true
				            }
				        })				
					}//小表ajax success結束
				})//小表ajax
			}	
					
		})//大表 ajax迴圈結束
	 	
	}//大表ajax success結束
});//大表ajax結束

$('body').on('click','.shop',function(){
	//動畫
// 	var whichImg=$(this).parent().parent().parent().parent().find('img')
// 	var copyimg=$('<img width="150px" height="150px" src="' 
// 	+ whichImg.attr('src') + '"/>').css({"position": "fixed", "z-index": "999"});
// 	whichImg.parent().prepend(copyimg);	
// 	copyimg.animate({"top":$('.shopping_car').position().top,
// 					"left":$('.shopping_car').position().left+100+'px'
// 					},500,"linear", function() {
// 					      copyimg.remove();
// 					 });

// 	console.log($('.shopping_car').position().left)
// 	console.log($('.shopping_car').position().top)

	var detailId=$(this).parent().parent().find('.desoslide-wrapper>img').attr('alt')
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
