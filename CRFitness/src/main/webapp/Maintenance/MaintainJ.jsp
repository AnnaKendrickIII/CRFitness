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
<jsp:include page="/AdF.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON"> 
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/jquery.easyswitch.css" /> <!-- switch button -->
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/alertify.css"  />
<script type="text/javascript" src="${this_contextPath}/js/jquery.easyswitch.js"></script> <!-- on & off button -->
<script src="${this_contextPath}/js/alertify.js"></script>
<title>MaintainJournals</title>


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
}
.table tbody a:hover {
	color: black;
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
	
		<table id="games_talbe" class="table ">
			<thead>
				<tr> 
					<th><h3>照片</h3></th>
					<th><h3>日誌編號</h3></th>
					<th><h3>會員編號</h3></th>
					<th><h3>日誌內容</h3></th>
					<th><h3>發表日誌時間</h3></th>
					<th><h3>編輯</h3></th>
				</tr>
			</thead>
			<tbody id="journals_tbody"></tbody>
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
										: (("00" + o[k]).substr(("" + o[k]).length)));
				return fmt;
			}
// 轉換日期的小程式 結束


// 所有功能的程式   開始
	jQuery(function ($) {	  
		
// 3.顯示日誌的程式   開始
	$.ajax({
		url : "${this_contextPath}/CRFSERVICE/commonJournalControllerBE/getAllFlagJournal",
		type : 'get', //get post put delete
		data : {},
		success : function(data) {
			$.each( data, function(index) {
				var jdate_int = parseInt(this.publishTime); //轉換成數字
				var jdate_value = new Date(jdate_int);
					$('#journals_tbody').append('<tr class="'+this.journal_Id+'">'
					+ '<td ><img class="img-thumbnail" src="${this_contextPath}/CRFSERVICE/commonJournalController/photo/'+this.journal_Id+'" /></td>'
					+ '<td>'+ this.journal_Id+'</td>'
					+ '<td>'+ this.member_Id+ '</td>'
					+ '<td><a href="#" title="'+this.contents+'">'+this.contents.substring(0,6)+'...</a></td>'
// 					+ '<td>'+ this.contents+'</td>'
					+ '<td>'+ jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</td>'
// 					+ '<td><button type="button" class="btn btn-primary btn-1g 3g" data-toggle="modal" data-target="#change_status"><span class="easyswitch" data-default="'+Status+'" data-label-on="公開" data-label-off="隱藏"></td>'
					+ '<td>'
					+ '<div class="radio"><label><input type="radio" name="'+this.journal_Id+'" value="4" >封鎖</label><br/><label><input type="radio" name="'+this.journal_Id+'" value="1" >開放</label></div>'
					+ '</td>'
					+ '</tr>') // end of append
					}) // end of $.each(
// 					// 改變日誌狀態的程式 開始

	$('#games_talbe').on('change', '.radio>label>input', function(){
		var JournalStatus = $(this); 
		var this_memStatus = $(this).parents('td').siblings(":eq(5)");
		var journal_Id = $(this).parents('td').siblings(":eq(1)").text();
		if($(this).val() == 4){
			alertify.confirm().set('title', '警告');
			alertify.confirm('確認封鎖此日誌', 
				function(){
					updateFlagJournal(journal_Id, JournalStatus.val(), this_memStatus)
				},function(){
					JournalStatus.prop('checked',false)
				}
			)
		}else{
			updateFlagJournal(journal_Id, JournalStatus.val(), this_memStatus)
		}
	})
	
	// 封鎖或開放 to Controller
	function updateFlagJournal(theJournal_Id, theJournalStatus, this_memStatus){
		 $.ajax({
		    url:"${this_contextPath}/CRFSERVICE/commonJournalControllerBE/updateFlagJournal",
	        type:'post',  //get post put delete
    		data: {'journal_Id': theJournal_Id,
					'publicStatus': theJournalStatus}, //
	    	success:function(data){
	    		console.log(data)
// 	    		this_memStatus.text(theJournalStatus)
	        } // end of success:function(data)	 
		 }) // end of 
	}
		} // end of success : function(data) 
	}) // end of $.ajax({
		
	// contents hidden
	$('#games_talbe').on('hover', 'td:nth-child(4)' ,function(){
		$(this).tooltip();
	})
	

}); // end of jQuery(function ($)
</script>

</div> <!-- end of <div class="row"> -->
	<!--  頁面部分 結束 -->
</body>
</html>
