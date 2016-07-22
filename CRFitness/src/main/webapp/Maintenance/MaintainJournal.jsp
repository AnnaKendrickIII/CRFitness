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
<jsp:include page="/AdminFrame.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON"> 
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jquery.easyswitch.css" /> <!-- switch button -->
<script type="text/javascript" src="${this_contextPath}/js/jquery.easyswitch.js"></script> <!-- on & off button -->

<title>MaintainJournal</title>


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
.table>tbody>tr>td{
	vertical-align: middle;
	width:72px;
	height:100px;
}
.table tbody a:hover {
	color: black;
}


#trigger-upload {
	color: white;
    background-color: #00ABC7;
    font-size: 14px;
    padding: 7px 20px;
    background-image: none;
}

#fine-uploader-manual-trigger .qq-upload-button, #fine-uploader-manual-trigger2 .qq-upload-button {
	margin-right: 15px;
}

#fine-uploader-manual-trigger .buttons, #fine-uploader-manual-trigger2 .buttons {
	width: 50%;
}

#fine-uploader-manual-trigger .qq-uploader .qq-total-progress-bar-container, #fine-uploader-manual-trigger2 .qq-uploader .qq-total-progress-bar-container {
    width: 60%;
}


#creProdBtn, #modProdBtn{
	margin-top: 55px;
}
.img-thumbnail{
	
}


</style>
</head>
<body>

<!-- 頁面部分 開始-->
	<div class="row">
		<div class="col-md-2 "></div>
		<div class="col-md-8 col-xs-12 ">
		
		<button type="button" id="creProdBtn" class="btn btn-primary btn-1g" data-toggle="modal" data-target="#new_products">  
  		<i class="fa fa-plus" aria-hidden="true"></i> <!-- 新增會員 --> 
  		</button>

<!-- 資料表格 開始 -->
	
		<table id="games_talbe" class="table " border="1">
			<thead>
				<tr> 
					<th><h3>照片</h3></th>
					<th><h3>日誌編號</h3></th>
					<th><h3>會員編號</h3></th>
					<th><h3>日誌內容</h3></th>
					<th><h3>發表日誌時間</h3></th>
					<th><h3>是否公開(狀態)</h3></th>
					<th><h3>編輯</h3></th>
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
					"h+" : this.getHours(), //小? 
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
										: (("00" + o[k])
												.substr(("" + o[k]).length)));
				return fmt;
			}
// 轉換日期的小程式 結束


// 所有功能的程式   開始
	jQuery(function ($) {	  
		  var file;	
		  var count=0;
// 3.顯示會員的程式   開始
	$.ajax({
		url : "${this_contextPath}/CRFSERVICE/commonJournalControllerBE/getAllFlagJournal",
		type : 'get', //get post put delete
		data : {},
		success : function(data) {
		console.log(data)	
		
			$.each( data, function(index) {
				var pdate_int = parseInt(this.publishTime); //轉換成數字
				var pdate_value = new Date(pdate_int);
				var Status="";
				if(this.publicStatus == '5'){
					Status=1;
				}else if(this.publicStatus == '1'){
					Status=0;
				};
					$('#members_tbody').append('<tr class="'+this.member_Id+'">'
					+ '<td ><img class="img-thumbnail" src="${this_contextPath}/CRFSERVICE/commonJournalController/photo/'+this.journal_Id+'" /></td>'
					+ '<td>'+ this.journal_Id+'</td>'
					+ '<td>'+ this.member_Id+ '</td>'
					+ '<td>'+ this.contents+'</td>'
					+ '<td>'+ pdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</td>'
					+ '<td>'+ this.publicStatus+'</td>'
// 					+ '<td><button type="button" class="btn btn-primary btn-1g 3g" data-toggle="modal" data-target="#change_status"><span class="easyswitch" data-default="'+Status+'" data-label-on="公開" data-label-off="隱藏"></td>'
					+ '<td class="">'
					+ '<div class="radio"><label><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>隱藏此日誌(無功能)</label></div>'
					+ '<div class="radio"><label><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>開放此日誌(無功能)</label></div></td>'

//  													+ this[2] // friend_Status
// 													+ '</td><td>'
//  													+ this[3] // blockade_Id
// 													+ '</td><td></i>'
													+ '</tr>') // end of append
												}) // end of $.each(
					// 會員狀態on&off的程式   開始
					$('.easyswitch').easyswitch();
					// 會員狀態on&off的程式   結束
// 					// 改變會員狀態的程式 開始
					$('body').on('click', '.3g', function(){
 						var this_memStatus = $(this).parent().siblings(":eq(5)"); //要改
						var journal_Id = $(this).parent().siblings(":eq(1)").text(); //要改
						console.log(journal_Id)
						var prodStatus = this_memStatus.text();
						var reversedState = "";
						if(prodStatus != 4){
	 						 $.ajax({
							    url:"${this_contextPath}/CRFSERVICE/commonJournalControllerBE/updateFlagJournal",
						        type:'post',  //get post put delete
					    		data: {'journal_Id': journal_Id,
										'publicStatus': 4}, //
						    	success:function(data){
						    		this_memStatus.text(4)
						        } // end of success:function(data)	 
						 	}) // end of 
						}else{
	 						 $.ajax({
								    url:"${this_contextPath}/CRFSERVICE/commonJournalControllerBE/updateFlagJournal",
							        type:'post',  //get post put delete
						    		data: {'journal_Id': journal_Id,
											'publicStatus': 1}, //
							    	success:function(data){
							    		this_memStatus.text(1)
							        } // end of success:function(data)	 
							 	}) // end of 
						}
 	   
					}); // end of 	$('.3g').click(function () {
// 					// 改變會員狀態的程式 結束
		} // end of success : function(data) 
	}) // end of $.ajax({
// 3.顯示會員的程式   結束			

}); // end of jQuery(function ($)
</script>

</div> <!-- end of <div class="row"> -->
	<!--  頁面部分 結束 -->
</body>
</html>
