<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<link rel="stylesheet" href="${this_contextPath}/css/products.css">
<title>Products</title>

<style type="text/css">
.productsclass{
 margin-top: 4%;
}
 	
.productsbody{
 background-color: #DDDDDD;

}
</style>
</head>

<body class="productsbody">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/products.js"></script>
<aside>

	<div class="row productsclass"></div>
		<h3 style="text-align: center;">商品頁面</h3>
    <div class="row productsclass">

       <div class="col-md-1">      
       </div><!--/span-->
		
		<div id="products"></div>
<!-- 
       <div class="col-md-2">
           <div class="mag">
               iPhone<br/>
               <img data-toggle="magnify" src="http://i.imgur.com/1fgr2IO.jpg" alt="">
           <p>哀鳳</p>   
           </div>                
       </div><!--/span-->
 -->           

       <div class="col-md-1">      
       </div><!--/span-->       

   	</div><!--/row-->
   
<script type="text/javascript">
$.ajax({
	url:'${this_contextPath}/CRFSERVICE/productDetailController/productDetail',
	type:'get',
	data:{},
	success:function(data){
		$.each(data,function(){
			$('#products').append('<div class="col-md-2" id="products"><div class="mag">'+this.product_Name+
					'<br/><img data-toggle="magnify" src="data:image/png;base64,'+this.photo1+'" /></div>')	
		})
	}
	
})
</script>


</aside>
</body>
</html>