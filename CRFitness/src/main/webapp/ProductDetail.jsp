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
<link rel="stylesheet" href="${this_contextPath}/css/lity.min.css">
<link rel="stylesheet" href="${this_contextPath}/css/jquery.fancybox.css">

<title>商品明細</title><base>

</head>
<body>
<aside>
<script type="text/javascript" src="${this_contextPath}/js/products.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/lity.min.js"></script>
<script type="text/javascript" src="${this_contextPath}/js/jquery.fancybox.js"></script>

<div class="ProductDetail">

    <div class="row">
	    <div class="col-md-2"></div>
	    <div id="productDetailbody" class="col-md-8"></div> 
	 	<div class="col-md-2"></div>	 	
    </div>

</div>
</aside>

<script type="text/javascript">
var queryString='${pageContext.request.queryString}';
	queryString=queryString.substring(17);
	
$.ajax({
	url:'${this_contextPath}/CRFSERVICE/productDetailController/findByPrimaryKeySQLQuery',
	type:'get',
 	data:{productDetail_Id:'prodDetail5006'},
	success:function(data){
		$('#productDetailbody').append('<div class="col-md-8">'
							+'<div class="gallery">'
							+'<div class="previews">'
							+'<a class="selected" data-full="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_1.png"><img class="small img-responsive" src="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_1.png"/></a>'
							+'<a data-full="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_2.png"><img class="small img-responsive" src="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_2.png"/></a>'
							+'<a data-full="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_3.png"><img class="small img-responsive" src="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_3.png"/></a>'
							+'<a data-full="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_4.png"><img class="small img-responsive" src="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_4.png"/></a>'
							+'<a data-full="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_5.png"><img class="small img-responsive" src="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_5.png"/></a>'
							+'</div>'
							+'<div class="full mag">'
							+'<img class="magnify" src="${this_contextPath}/images/products/'+data[0][0].productDetail_Id+'_1.png"/>'
							+'</div>'
							+'</div></div>'
							+'<div class="col-md-4">'
							+'<h2><strong>'+data[0][1] 
							+'</strong><h2/><br/>尺寸 : '+data[0][0].size
							+'<br/>顏色 : '+data[0][0].color
							+'<br/>剩餘數量 : '+data[0][0].stock
							+'</br></br>'
							+'商品介紹 :</br>'+'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+data[0][4]
							+'<br/></br></br>'
							+'<a class="btn btn-danger" href="https://youtu.be/2Vhlzdj6Csw"  data-lity>千萬不要按&nbsp!</a>'
							+'&nbsp&nbsp&nbsp<a class="btn btn-success">加入購物車</a>'
							+'&nbsp&nbsp&nbsp<a href='+<%=request.getHeader("referer")%>+' class="btn btn-primary">繼續購物</a>'
							+'</div>')
							
							
							$('a').click(function(){
						 		var largeImage = $(this).attr('data-full');
						 		$('.selected').removeClass();
						 		$(this).addClass('selected');
						 		$('.full img').hide();
						 		$('.full img').attr('src', largeImage);
						 		$('.full img').fadeIn();
						 		}); 

						 		$('.full img').on('click', function(){
						 		var modalImage = $(this).attr('src');
						 		$.fancybox.open(modalImage);
						 		});
	
	$('body').on('click','.addCart',function(){
		$.ajax({
			url:'${this_contextPath}/CRFSERVICE/productDetailController/addShoppingCart',
			type:'get',
			data:{},
			success:function(data){
				
			}
		})
		
	})
						 		
	}	
});


$(document).ready(function(){



}); 
</script>


<!-- https://youtu.be/AUChk0lxF44  victorious -->
<!-- https://youtu.be/-aWcy0TAaWk -->
<!-- https://youtu.be/2Vhlzdj6Csw -->
</body>
</html>