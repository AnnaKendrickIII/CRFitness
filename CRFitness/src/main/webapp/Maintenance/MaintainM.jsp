<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="google-signin-client_id"
	content="826213451911-6rpb37oapsg46p3ao0mhv6ks9orcja5h.apps.googleusercontent.com" />
<jsp:include page="/Maintenance/AdF.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON"> 
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jquery.easyswitch.css" /> <!-- switch button -->
<script type="text/javascript" src="${this_contextPath}/js/jquery.easyswitch.js"></script> <!-- switch button -->

<title>MaintainMembers</title>


<style>
body {
	background-color: #E0E0E0;
}

.table {
	background-color: white;
	border-radius: 20px;
}

.table thead tr {
	background-color: #46A3FF;
}
/* .table thead th:nth-child(1){ */

/* } */
/* .table thead th:nth-child(5){ */

/* } */
.table tbody a {
	color: #F75000;
	text-decoration: none;
}

.table tbody a:hover {
	color: black;
}

.table {
/* 	background-color: white; */
	border-radius: 20px;
}

.table>tbody>tr>td{
	vertical-align: middle;
	width:50px;
	height:50px;
}

#top{
	height:75px;
}

</style>
</head>
<body>

<!-- 頁面部分 開始-->
	<div class="row">
		<div class="col-md-2 "></div>
		<div class="col-md-8 col-xs-12 ">
		
		<div id="top"></div>
<!-- 資料表格 開始 -->
	
		<table id="games_talbe" class="table">
			<thead>
				<tr>
					<th><h3>大頭照</h3></th>
					<th><h3>會員ID</h3></th>
					<th><h3>暱稱</h3></th>
					<th><h3>Email</h3></th>
					<th><h3>註冊日</h3></th>
					<th><h3>會員狀態</h3></th>
				</tr>
			</thead>
			<tbody id="members_tbody"></tbody>
		</table>	
		</div> <!-- end of class="col-md-8 col-xs-12" -->
		<div class="col-md-2"></div>
<!-- 資料表格 結束 -->

<script>
// 轉換日期的小程式 開始
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
					fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
							.substr(4 - RegExp.$1.length));
				for ( var k in o)
					if (new RegExp("(" + k + ")").test(fmt))
						fmt = fmt.replace(RegExp.$1,
								(RegExp.$1.length == 1) ? (o[k])
								: (("00" + o[k]).substr(("" + o[k]).length)));
				return fmt;
			}
// 轉換日期的小程式 結束


// 所有功能的程式   開始
	jQuery(function ($) {	  
// 1.顯示會員的程式   開始
	$.ajax({
		url : "${this_contextPath}/CRFSERVICE/memberControllerBE/getAll",
		type : 'get', //get post put delete
		data : {},
		success : function(data) {
// 			console.log(data);
			$.each( data,
				function(index) {
					var mdate_int = parseInt(this.registerdate); //轉換成數字
					var mdate_value = new Date(mdate_int);
// 					console.log(this.member_Status);
					var Status="";
					if(this.member_Status == '登錄中'){
						Status=1;
					}else if(this.member_Status == '暫停中'){
						Status=0;
					};
					$('#members_tbody').append('<tr class="'+this.member_Id+'"><td><img src="${this_contextPath}/CRFSERVICE/memberController/photo/'
						 							+ this.member_Id+'.jpg" class="img-thumbnail img-responsive" />'                              
													+ '</td><td>'                              
													+ this.member_Id
													+ '</td><td>'
													+ this.nickname
													+ '</td><td>'
													+ this.e_mail
													+ '</td><td>'
													+ mdate_value.Format("yyyy-MM-dd hh:mm:ss")
													+ '</td><td hidden="hidden">'
									                + this.member_Status
													+ '</td><td><button type="button" class="btn btn-primary btn-1g 3g" data-toggle="modal" data-target="#change_status"><span class="easyswitch" data-default="'+Status+'" data-label-on="正常" data-label-off="停權"></i>'
													+ '</td></tr>') // end of append
												}) // end of $.each(
					// 會員狀態on&off的程式   開始
					$('.easyswitch').easyswitch();
					// 會員狀態on&off的程式   結束
					// 改變會員狀態的程式 開始
					$('body').on('click', '.3g', function(member_Id, member_Status){
// 					console.log($(this).parent().siblings(":eq(5)").text());
// 					console.log($(this).parent().siblings(":eq(1)").text());
 						var this_memStatus = $(this).parent().siblings(":eq(5)"); //要改
						var memberId = $(this).parent().siblings(":eq(1)").text(); //要改
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
		} // end of success : function(data) 
	}) // end of $.ajax({
// 1.顯示會員的程式   結束			

}); // end of jQuery(function ($)
</script>

</div> <!-- end of <div class="row"> -->
	<!--  頁面部分 結束 -->
</body>
</html>
