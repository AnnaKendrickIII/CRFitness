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

	<title>MaintainJournals</title>
    
    <jsp:include page="${this_contextPath}/admin/adminFrame.jsp"/>
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
		<button type="button" id="creProdBtn" class="btn btn-round btn-primary btn-lg btn-1g" data-toggle="modal" data-target="#new_products">  
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

            <table class="table table-striped table-advance table-hover table-bordered table-striped table-condensed" id="journals_table">
		
			<thead>
				<tr class="btn-primary" >
					<th><h3><i class="fa fa-picture-o" aria-hidden="true"></i><strong> 小圖</strong></h3></th>
					<th><h3># 日誌編號</h3></th>
					<th><h3># 會員ID</h3></th>
					<th><h3><i class="fa fa-pencil-square-o" aria-hidden="true"></i><strong> 日誌內容</strong></h3></th>
					<th><h3><i class="fa fa-calendar" aria-hidden="true"></i><strong> 發表時間</strong></h3></th>
					<th><h3><i class="fa fa-toggle-on" aria-hidden="true"></i><strong> 狀態</strong></h3></th>
				</tr>
			</thead>
			<tbody id="journals_tbody"></tbody>
		
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
              <a href="MaintainJournals.jsp" class="go-top">
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
						+ '<td><h4>'+ this.journal_Id+'</td>'
						+ '<td><h4>'+ this.member_Id+ '</td>'
						+ '<td><a href="#" title="'+this.contents+'"><h4>'+this.contents.substring(0,6)+'...</a></td>'
						+ '<td><h4>'+ jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</td>'
//	 					+ '<td><button type="button" class="btn btn-primary btn-1g 3g" data-toggle="modal" data-target="#change_status"><span class="easyswitch" data-default="'+Status+'" data-label-on="公開" data-label-off="隱藏"></td>'
						+ '<td>'
						+ '<div class="radio"><label><input type="radio" name="'+this.journal_Id+'" value="4" >封鎖</label><br/><label><input type="radio" name="'+this.journal_Id+'" value="1" >開放</label></div>'
						+ '</td>'
						+ '</tr>') // end of append
						}) // end of $.each(

		$('#journals_table').on('change', '.radio>label>input', function(){
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
		
		// 封鎖或開放日誌狀態的程式
		function updateFlagJournal(theJournal_Id, theJournalStatus, this_memStatus){
			 $.ajax({
			    url:"${this_contextPath}/CRFSERVICE/commonJournalControllerBE/updateFlagJournal",
		        type:'post',  //get post put delete
	    		data: {'journal_Id': theJournal_Id,
						'publicStatus': theJournalStatus},
		    	success:function(data){
		    		console.log(data)
					// this_memStatus.text(theJournalStatus)
		        } 
			 }) // end $.ajax({
		} // end function updateFlagJournal
		
		
			} // end of success : function(data) 
		}) // end of $.ajax({
			
		// contents hidden
		$('#journals_table').on('hover', 'td:nth-child(4)' ,function(){
			$(this).tooltip();
		})
	
	$("#journals_table").searcher({
		inputSelector: "#tablesearchinput"
	})		
	
}); // end 153 jQuery(function ($) 
</script>

	</body>
</html>
