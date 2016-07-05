<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>賽事</title>
<jsp:include page="/CRFitness.jsp" />

<link rel="stylesheet" type="text/css" href="css/search.default.css" />
<!-- 按鈕 -->
<link rel="stylesheet" type="text/css" href="css/component1.css" />

<script src="${this_contextPath}/js/jquery.searcher.js"></script>


<style type="text/css">
body{
background-color:#E0E0E0;
}
.table{
background-color:white;
}
.table thead tr{
background-color:#46A3FF;

}


 .table thead th:nth-child(1){
	border-radius:20px 0px 0px 0px;
    -moz-border-radius: 20px 0px 0px 0px; /* Firefox */
    -webkit-border-radius:20px 0px 0px 0px; /* Safari, Chrome */
 }
 .table thead th:nth-child(5){
	border-radius:0px 20px 0px 0px;
    -moz-border-radius: 0px 20px 0px 0px; /* Firefox */
    -webkit-border-radius:0px 20px 0px 0px; /* Safari, Chrome */
 } 
  .table {
	border-radius:20px 20px 0px 0px;
    -moz-border-radius: 20px 20px 0px 0px; /* Firefox */ 
    -webkit-border-radius:20px 20px 0px 0px; /* Safari, Chrome */
 } 

.table tbody a{
color:#F75000;
text-decoration: none;
}
.table tbody a:hover{
color:black;
}
/* #tablesearchinput{ */
/* margin-top:55px; */
/* margin-bottom:3px; */
/* } */
.sb-search{
margin-top:55px;
margin-bottom:3px;
}
.year_td{
background-color:	#EA7500;
text-align: center;
color:white;
}
</style>
 
<script src="js/search.custom.js"></script>


</head>
<body>

		<div class="row">
			<div class="col-md-1 "></div>
			<div class="col-md-10 col-xs-12 ">
			<div class="">
<!-- 				<input type="text" id="tablesearchinput" required="required" placeholder="請輸入關鍵字"  /> -->
<!-- 				<input type="button" value='查詢' /> -->
					<div id="sb-search" class="sb-search">
						<form >
							<input id="tablesearchinput" class="sb-search-input" placeholder="請輸入關鍵字" type="text" value="" name="search" id="search">
							<input id='searchId' class="sb-search-submit" type="submit" value="">
							<span class="sb-icon-search"></span>
						</form>
					</div>
			</div>
				<table id="games_talbe" class="table" >
					<thead>
						<tr>
							<th><h3>日期</h3></th>
							<th><h3>賽事名稱</h3></th>
							<th><h3>縣市 </h3></th>
							<th><h3>地點</h3></th>
							<th><h3>報名時間</h3></th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		<div class="col-md-1"></div>
		</div>
		
		<script src="js/search.classie.js"></script>
		<script src="js/search.uisearch.js"></script>

	<script>
		new UISearch( document.getElementById( 'sb-search' ) );
    $(function () {
    	
            $.ajax({
                url:"${this_contextPath}/CRFSERVICE/Games/getAllGames",
                type:'get',  //get post put delete
                data:{},
                success:function(data){
                	var month=null;
                	var year=2016;
                	$.each(data,function(){   
                		if(month!=this.gamesDate.substr(0,2)){
                			month=this.gamesDate.substr(0,2);
                			$('.table tbody').append("<tr><td class='year_td' colspan='5'><h4>"+year+"年/"+month+"月</h4></td></tr>")
                			if(month=='12'){
                				year=year+1;
                			}
                		}                		
    	        		 $('.table tbody').append(
    	        	'<tr><td><p class="">'+this.gamesDate+'</p></td><td><a href="'
    	        			  +this.gamesUrl+'"><p class="">'
    	        		 	  +this.gamesName+'</p></a></td><td><p class="">'
    	        			  +this.counties+'</p></td><td><p class="">'
    	        			  +this.location+'</p></td><td><p class="">'
    	        			  +this.registrationTime+'</p></td></tr>').css({'color':'black'});        		 
                    })
                   
    	          }        	
                      	 
            })
//             $('#searchId').click(function(){
            $("#games_talbe").searcher({
                inputSelector: "#tablesearchinput"
                
//             });
    	})

    })
	</script>

</body>
</html>