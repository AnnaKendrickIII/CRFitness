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
<title>服飾</title>

<style type="text/css">
.productsclass {
	margin-top: 4%;

}
#a{
height:425px; 
}
#b{

height:250px;
}
#a:hover{
border:1px solid #0000FF;

}

</style>

</head>

<body class="productsbody">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/products2.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/lightbox.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/lity.min.js"></script>

<aside>
<div class="productsclass">
    <div class="well well-sm">
        <strong> Commodity Category </strong>
        <div class="btn-group">
            <a href="changeCategory()" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list">
            </span>List</a> <a href="#" id="grid" class="btn btn-default btn-sm"><span
                class="glyphicon glyphicon-th"></span>Grid</a>
        </div>
    </div>
    
    <div class="row">
   	  <div class="col-xs-2 col-lg-2"> </div>
	    <div id="products" class="row list-group col-xs-8 col-lg-8" ></div>
      <div class="col-xs-2 col-lg-2"> </div>
    </div>
</div>

<script type="text/javascript">
$.ajax({
	url:'${this_contextPath}/CRFSERVICE/productDetailController/searchByCategory',
	type:'get',
	data:{category:"服飾類"},
	success:function(data){
		$.each(data,function(){
			$('#products').append('<div  class="item  col-xs-4 col-lg-4"><div id="a" class="thumbnail"><a href="data:image/png;base64,'
						+this[0].photo1+'" data-lightbox="image-1" data-title="'
						+this[0].product_Name+'"><img id="b"   class="group list-group-image"  src="data:image/png;base64,'
						+this[0].photo1+'" /></a><div class="caption"><h4 class="group inner list-group-item-heading" style="color:#0000FF">'
						+this[0].product_Name+'</h4><p class="group inner list-group-item-text" style="color:#777777">'
						+this[0].introduction+'</p><div class="row"><div class="col-xs-12 col-md-6"><p class="lead" style="color:#E63F00">$'
						+this[1]+'</p></div><div class="col-xs-12 col-md-6"><a class="btn btn-success" a href="${this_contextPath}/ProductDetail.jsp?productDetail_Id='
						+this[0].productDetail_Id+'">商品介紹</a></div></div></div></a></div></div>'
					)	
		})		
	}
});
</script>

</aside>
</body>
</html>