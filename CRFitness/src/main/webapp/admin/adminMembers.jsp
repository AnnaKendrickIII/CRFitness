<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

	<title>MaintainMembers</title>
    
    <jsp:include page="/admin/adminFrame.jsp"/>
  </head>
  <script type="text/javascript">
	//轉換日期的小程式   開始
	jQuery(function($){

		Date.prototype.Format = function(fmt) {
			var o = {
				"M+" : this.getMonth() + 1, //月份 
				"d+" : this.getDate(), //日 
				"h+" : this.getHours(), //小时 
				"m+" : this.getMinutes(), //分 
				"s+" : this.getSeconds(), //秒 
				"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
				"S" : this.getMilliseconds()	//毫秒 
			};
			if (/(y+)/.test(fmt))
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
						: (("00" + o[k]).substr(("" + o[k]).length)));
			return fmt;
		}
	});
	//轉換日期的小程式 結束
  </script>
  <style>

.content-panel{
	background-color: #F2F2F2;
}

.table {
  	background-color: #E0E0E0;
	border-radius: 20px;
}

.table>tbody>tr>td{
	vertical-align: middle;
	text-align: center;
	width:100px;
	height:100px;
}

th{
	vertical-align: middle;
	text-align: center;
}

#creProdBtn{
  	margin-bottom: 10px;
 }  

.sb-search{ 
 	margin-top: -1px;
 } 

#myModalLabel1, #myModalLabel2{
	text-align: center;
}

  </style>
  </head>

<body>
<!-- 每頁不同內容   開始 -->
  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		
	<div class="row mt">
		<div class="col-md-2 col-xs-2"></div>
    	<div class="col-md-8 col-xs-8">
        	<div class="content-panel">

			<div class="row">
				<div class="col-md-10 col-xs-10">
		<button type="button" id="creProdBtn" class="btn btn-round alv-primary btn-lg btn-1g" data-toggle="modal" data-target="#new_products">  
  		<i class="fa fa-plus-square" aria-hidden="true"></i>
  		</button>
				</div>

				<div class="col-md-2 col-xs-2">
					<div id="sb-search" class="sb-search">
						<form>
							<input id="tablesearchinput" class="sb-search-input" placeholder="關鍵字" type="text" value="" name="search"> 
							<input id='searchId' class="sb-search-submit" type="submit" value=""><span class="sb-icon-search"></span>
						</form>
					</div>
				</div>
			</div>

            <table class="table table-striped table-advance table-hover table-bordered table-striped table-condensed" id="members_table">
		
			<thead>
				<tr class="alv-primary" >
					<th><h3><i class="fa fa-picture-o" aria-hidden="true"></i><strong> 小圖</strong></h3></th>
					<th><h3># 會員ID</h3></th>
					<th><h3><i class="fa fa-snapchat" aria-hidden="true"></i><strong> 暱稱</strong></h3></th>
					<th><h3><i class="fa fa-envelope-o" aria-hidden="true"></i><strong> Email</strong></h3></th>
					<th><h3><i class="fa fa-registered" aria-hidden="true"></i><strong> 註冊日</strong></h3></th>
					<th><h3><i class="fa fa-toggle-on" aria-hidden="true"></i><strong> 狀態</strong></h3></th>
				</tr>
			</thead>
			<tbody id="members_tbody"></tbody>
		
            	</table>
        	</div><!-- /content-panel -->
    	</div> <!-- /col-md-8 xs-8 -->
		<div class="col-md-2  col-xs-2"></div>
	</div><!-- 184 <div class="row mt"> -->
		
		</section> <!-- 182 <section class="wrapper"> -->
      </section> <!-- 181 /MAIN CONTENT -->
      <!-- main content end -->
      
      <!-- footer start -->
      <footer class="site-footer">
          <div class="text-center">
              2016 - C.R.Fitness Co., Ltd.
              <a href="adminMembers.jsp" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
	  <!-- footer end -->		
	  
  </section> <!-- 176 <section id="container" > -->		
<!-- 每頁不同內容   結束 -->

<!-- 所有功能的程式   開始 -->
<script>
	jQuery(function ($) {
		
		new UISearch(document.getElementById('sb-search'));

// 1.顯示會員的程式   開始
	$.ajax({
		url : "${this_contextPath}/CRFSERVICE/memberControllerBE/getAll",
		type : 'get', //get post put delete
		data : {},
		success : function(data) {
			$.each( data,
				function(index) {
					var mdate_int = parseInt(this.registerdate); //轉換成數字
					var mdate_value = new Date(mdate_int);
					var Status="";
					if(this.member_Status == '登錄中'){
						Status=1;
					}else if(this.member_Status == '暫停中'){
						Status=0;
					};
					$('#members_tbody').append('<tr class="'+this.member_Id+'"><td><img src="${this_contextPath}/images/members/'
						 							+ this.member_Id+'.jpg" class="img-circle img-responsive" />'                              
													+ '</td><td><h4>'                              
													+ this.member_Id
													+ '</td><td><h4>'
													+ this.nickname
													+ '&nbsp;&nbsp;&nbsp;<i class="fa fa-weixin" aria-hidden="true"></i></td><td><h4>'
													+ this.e_mail
													+ '</td><td><h4>'
													+ mdate_value.Format("yyyy-MM-dd hh:mm:ss")
													+ '</td><td hidden="hidden">'
									                + this.member_Status
													+ '</td><td><button type="button" class="btn btn-primary btn-round btn-1g 3g" data-toggle="modal" data-target="#change_status"><span class="easyswitch" data-default="'+Status+'" data-label-on="正常" data-label-off="停權"></i>'
													+ '</td></tr>') // end of append
												}) // end of $.each(
					// 會員狀態on&off的程式   開始
					$('.easyswitch').easyswitch();
					// 會員狀態on&off的程式   結束
					// 改變會員狀態的程式 開始
					$('body').on('click', '.3g', function(member_Id, member_Status){
// 					console.log($(this).parent().siblings(":eq(5)").text());
// 					console.log($(this).parent().siblings(":eq(1)").text());
 						var this_memStatus = $(this).parent().siblings(":eq(5)");
						var memberId = $(this).parent().siblings(":eq(1)").text();
						var memberStatus = this_memStatus.text();
						var reversedState = "";
						if(memberStatus=="登錄中"){
							reversedState="暫停中";
						}else{
							reversedState="登錄中";
							}
						 $.ajax({
							    url:"${this_contextPath}/CRFSERVICE/memberControllerBE/changeStatus",
						        type:'post',  //get post put delete
					    		data: {'member_Id': memberId,
										'member_Status': reversedState}, //
						    	success:function(data){
						    		this_memStatus.text(reversedState)
						        } // end of success:function(data)	 
						 }) // end of  $.ajax({  	    	   
					}); // end of 	$('.3g').click(function () {
					// 改變會員狀態的程式 結束
			$("#members_table").searcher({
		    	inputSelector: "#tablesearchinput"
		    })						
		} // end of success : function(data) 
	}) // end of $.ajax({
// 1.顯示會員的程式   結束			

}); // end 155 jQuery(function ($)
</script>

	</body>
</html>
