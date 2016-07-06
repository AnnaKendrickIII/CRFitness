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
<title>商品明細</title><base>
<style type="text/css">
.ProductDetail{
	margin-top: 4%;
}
</style>
</head>
<body>
<aside>
<script type="text/javascript" src="${this_contextPath}/js/products.js"></script>

<div class="ProductDetail">
    <div class="row">
    
        <div class="col-md-8">
            <div class="mag">
                this.product_Name<br>
                <img data-toggle="magnify" src="http://i.imgur.com/kzGVqbd.jpg" alt="">
            </div>
        </div ><!--/span-->
        <div class="col-md-4"></div>
        
 
    </div><!--/row-->
</div>
</aside>


</script>
</body>
</html>