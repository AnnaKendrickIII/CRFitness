<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
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
                	$.each(data,function(){    		  
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

=======
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>賽事</title>
<jsp:include page="/CRFitness.jsp" />

<!-- 按鈕 -->
<link rel="stylesheet" type="text/css" href="css/component1.css" />

<script src="${this_contextPath}/js/jquery.searcher.js"></script>


<style type="text/css">
body {
	background-color: #9D9D9D;
}

#games_talbe {
	background-color: white;
	border-radius: 20px 20px 0px 0px;
	-moz-border-radius: 20px 20px 0px 0px; /* Firefox */
	-webkit-border-radius: 20px 20px 0px 0px; /* Safari, Chrome */
}

#games_talbe thead tr {
	background-color: #46A3FF;
}

/* #games_talbe thead th:nth-child(1) { */
/* 	border-radius: 20px 0px 0px 0px; */
/* 	-moz-border-radius: 20px 0px 0px 0px; /* Firefox */ */
/* 	-webkit-border-radius: 20px 0px 0px 0px; /* Safari, Chrome */ */
/* } */

/* #games_talbe thead th:nth-child(5) { */
/* 	border-radius: 0px 20px 0px 0px; */
/* 	-moz-border-radius: 0px 20px 0px 0px; /* Firefox */ */
/* 	-webkit-border-radius: 0px 20px 0px 0px; /* Safari, Chrome */ */
/* } */

.lead{
	color: #8E8E8E;
}

#games_talbe tbody a {
	color: #F75000;
	text-decoration: none;
}

#games_talbe tbody a:hover {
	color: black;
}
.sb-search {
	margin-bottom: 3px;
}

.year_td {
	background-color: #FF5809;
	text-align: center;

	padding: 0px;
}

.year_h3 {
	color: white;
}
#games_div{
background-color: white;
padding: 0px;
}
#img_run{
float:right;
}
#games_h1{
float:right;
color:blue
}
</style>
 
<script src="${this_contextPath}/js/search.custom.js"></script>

</head>
<body>
<aside>
		<div class="row">
			<div class="col-md-2 col-xs-1"></div>
			<div id="games_div" class="col-md-8 col-xs-10 ">
			
				<img src="${this_contextPath}/images/run2.png"
						class="img-responsive" alt="Responsive image">
				<div class="row">
					<div class="col-md-7 col-xs-7">
						<h1 id="games_h1">熱門賽事</h1>
					</div>
					<div class="col-md-5 col-xs-5">
						<div id="sb-search" class="sb-search ">
							<form>
								<input id="tablesearchinput" class="sb-search-input"
									placeholder="請輸入關鍵字" type="text" value="" name="search"
									id="search"> <input id='searchId'
									class="sb-search-submit" type="submit" value=""> <span
									class="sb-icon-search"></span>
							</form>
						</div>
					</div>
				</div>
				<table id="games_talbe" class="table">

					<thead>
						<tr>
							<th><h3 class="text-center">
									<strong>日期</strong>
								</h3></th>
							<th><h3 class="text-center">
									<strong>賽事名稱</strong>
								</h3></th>
							<th><h3 class="text-center">
									<strong>縣市</strong>
								</h3></th>
							<th><h3 class="text-center">
									<strong>地點</strong>
								</h3></th>
							<th><h3 class="text-center">
									<strong>報名時間</strong>
								</h3></th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
			<div class="col-md-2 col-xs-1"></div>
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
                			$('.table tbody').append("<tr><td class='year_td' colspan='5'><h3 class='year_h3'>"+year+"年/"+month+"月</h3></td></tr>")
                			if(month=='12'){
                				year=year+1;
                			}
                		}                		
    	        		 $('.table tbody').append(
    	        	'<tr><td><p class="text-center lead ">'+this.gamesDate+'</p></td><td><a href="'
    	        			  +this.gamesUrl+'"><p class="text-center lead ">'
    	        		 	  +this.gamesName+'</p></a></td><td><p class="text-center lead ">'
    	        			  +this.counties+'</p></td><td><p class="text-center lead ">'
    	        			  +this.location+'</p></td><td><p class="text-center lead ">'
    	        			  +this.registrationTime+'</p></td></tr>').css({'color':'black'});        		 
                    })
                   
    	          }        	
                      	 
            })

            $("#games_talbe").searcher({
                inputSelector: "#tablesearchinput"
                
    	})

    })
	</script>
</aside>
>>>>>>> branch 'master' of https://github.com/AnnaKendrickIII/CRFitness.git
</body>
</html>