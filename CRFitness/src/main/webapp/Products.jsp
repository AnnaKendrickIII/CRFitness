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
<title>Products</title>

<style type="text/css">
</style>

</head>

<body class="productsbody">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/products2.js"></script>
<aside>
<div class="productsclass">
    <div class="well well-sm">
        <strong>Category Title</strong>
        <div class="btn-group">
            <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list">
            </span>List</a> <a href="#" id="grid" class="btn btn-default btn-sm"><span
                class="glyphicon glyphicon-th"></span>Grid</a>
        </div>
    </div>
    <div id="products" class="row list-group" >
    
 
   	  
        <div class="item  col-xs-4 col-lg-4">
            <div class="thumbnail">
                <img class="group list-group-image" src="http://placehold.it/400x250/000/fff" alt="" />
                <div class="caption">
                    <h4 class="group inner list-group-item-heading">
                        this.product_Name</h4>
                    <p class="group inner list-group-item-text">
            		  商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介
                     	商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介
	                                              商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介</p>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <p class="lead">
                                $+this.productsVO.price</p>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <a class="btn btn-success" href="http://www.jquery2dotnet.com">加入購物車</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item  col-xs-4 col-lg-4">
            <div class="thumbnail">
                <img class="group list-group-image" src="http://placehold.it/400x250/000/fff" alt="" />
                <div class="caption">
                    <h4 class="group inner list-group-item-heading">
                        Product title</h4>
                    <p class="group inner list-group-item-text">
                      	                        商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介
						                        商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介
						                        商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介</p>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <p class="lead">
                                $21.000</p>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <a class="btn btn-success" href="http://www.jquery2dotnet.com">加入購物車</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item  col-xs-4 col-lg-4">
            <div class="thumbnail">
                <img class="group list-group-image" src="http://placehold.it/400x250/000/fff" alt="" />
                <div class="caption">
                    <h4 class="group inner list-group-item-heading">
                        Product title</h4>
                    <p class="group inner list-group-item-text">
	                        商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介
	                        商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介
	                        商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介商品簡介</p>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <p class="lead">
                                $21.000</p>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <a class="btn btn-success" href="http://www.jquery2dotnet.com">加入購物車</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
    </div>
</div>

    
<script type="text/javascript">
$.ajax({
	url:'${this_contextPath}/CRFSERVICE/productDetailController/getAllDetail',
	type:'get',
	data:{},
	success:function(data){
		$.each(data,function(){
			$('#products').append('<div class="item  col-xs-4 col-lg-4"><div class="thumbnail"><img class="group list-group-image" src="http://placehold.it/400x250/000/fff" /><div class="caption"><h4 class="group inner list-group-item-heading">'
				+this.product_Name+'</h4><p class="group inner list-group-item-text">商品簡介</p><div class="row"><div class="col-xs-12 col-md-6"><p class="lead">$'
				+this.productsVO.price+'</p></div><div class="col-xs-12 col-md-6"><a class="btn btn-success" href="http://www.jquery2dotnet.com">加入購物車</a></div></div></div></div></div>'
					)	
		})
	}
});
</script>
<!-- src="data:image/png;base64,'+this.photo1+'" -->

</aside>
</body>
</html>