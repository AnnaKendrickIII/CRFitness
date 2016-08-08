<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="/CRFitness.jsp" />
    <title>Directions service</title>
    <style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
	background-color: #D2E9FF;
}

select {
	font-size: 14px;
}

#floating-panel {
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
	text-align: center;
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}

#map {
	right:12%;
	padding: 1%;
	border-color: blue;
	height: 70%;
	width: 50%;
}

div.distance {
/* 	margin-left: 5%; */
	font-size: 16px;
	color: blue;
}
.historyPath {
	
}
#table_PathId>tbody>tr>td{
	cursor: pointer;
}
.historyz{
position: absolute; 
 	right: 5%; 
 	top:15%;
}
.label_div{
padding: 0;
}
.label_input_div{
padding-left: 0
}
</style>
	</head>
 	<body>
<!-- 	<section id="container" > -->
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
          
		<div class="row">
			<div class="col-lg-3 col-md-3 col-xs-3"> <!-- 3/12 -->
			</div>
    		
			<div id="floating-panel" class="col-lg-5 col-md-5 col-xs-5"> <!-- form start --> <!-- 5/12 -->
			<div class="row ">
				<!--  1st -->
			    <div class="col-lg-12 col-md-12 col-xs-12 form-group form-group-sm">
			    		<label class="col-sm-2 control-label label_div" for="start "> <strong>Start: </strong></label>    
			    		<div class="col-sm-10 label_input_div">
			    			<input class="form-control" id="start" type="text" >
			    		</div>
				</div>
				<!--  2nd -->
				<div class="col-lg-12 col-md-12 col-xs-12 form-group form-group-sm">
			    		<label class="col-sm-2 control-label label_div" for="end "> <strong>End: </strong></label>    
			    		<div class="col-sm-10 label_input_div">
			    			<input class="form-control" id="end" type="text" >
			    		</div>
				</div>
			    <!--  3rd -->
			    <div class="col-lg-12 col-md-12 col-xs-12">   
					<input class="" id='submitPath' type="button"  value='提交'>
				</div>
			</div> <!-- 82 <div class="row "> -->
	
<!--   動態生成距離   開始   -->
			<div class="col-lg-12 col-md-12 col-xs-12">   
    				<div class="distance" ></div>
    			</div>
<!--   動態生成距離   結束  -->
  			
  			</div> <!-- 81 <div id="floating-panel" class="col-lg-5 col-md-5 col-xs-5"> -->
  			
 			<div class="col-lg-4 col-md-4 col-xs-4"> <!-- 4/12 --> 
    			</div>
  			
		</div> <!-- 77 <div class="row"> -->
    
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<!-- 			<p>希望空一行</p> -->
				<br />
			</div>
		</div>
    
<!--   地圖區塊   開始   -->
    <div id="map"></div>
<!--   地圖區塊   結束   -->

      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
    <!--海拔高低圖放在這，求神人幫忙-->
    
<!--   歷史路徑   開始   -->
	<div class="row">
		<div class="col-lg-10 col-md-10 col-xs-10"></div>
    		<div class='historyz col-lg-2 col-md-2 col-xs-2 '><h4><strong>歷史路徑</strong></h4>
    			<table class="talbe table-hover historyPath" id='table_PathId'>
    			
      		</table>
		</div>
	</div> <!-- 120 	<div class="row"> -->
<!--   歷史路徑   結束	  -->

<!-- 	</section>  --> <!-- 70 <section id="container-fluid" > -->
          
          
    
    <script>
        //if (navigator.geolocation) {
        //    var geo = navigator.geolocation;
        //    var option = {
        //        enableAcuracy: false,
        //        maximumAge: 0,
        //        timeout: 600000
        //    };
        //    geo.getCurrentPosition(successCallback,
        //                           errorCallback,
        //                           option
        //                           );
        //}

        	
        var directionsService;
        var directionsDisplay;
    	var startPoint;
    	var endPoint;
    	var dist;
    	
        function initMap() {
            directionsService = new google.maps.DirectionsService;
            directionsDisplay = new google.maps.DirectionsRenderer;
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 18, 
                center: { lat: 25.0367805, lng: 121.5426982 }
            });
            directionsDisplay.setMap(map);

            var onChangeHandler = function () {
                if (document.getElementById('start').value !== document.getElementById('end').value) {
                    calculateAndDisplayRoute(directionsService, directionsDisplay);
                }
            };
            
//      document.getElementById('submitPath').addEventListener('change', onChangeHandler);
        document.getElementById('submitPath').addEventListener('click', onChangeHandler);

        // click historyPath 
        $('#table_PathId').on('click', 'td', function(){
        	var thePoint = $(this).parent('tr').find('td:first');
        	if(startPoint != thePoint.text() || endPoint != thePoint.next().text()){
            	startPoint = thePoint.text();
            	endPoint = thePoint.next().text();
            	
                directionsService.route({
                    origin: startPoint,
                    destination: endPoint,
                    travelMode: google.maps.TravelMode.WALKING
                }, function (response, status) {
                    if (status === google.maps.DirectionsStatus.OK) {
                        var a = startPoint,
                        b = endPoint;
                        directionsDisplay.setDirections(response);
                        Distance(a, b, 0);
         	   }

                });
        	
        	}
        })
        
        
	}


		
        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
            directionsService.route({
                origin: document.getElementById('start').value,
                destination: document.getElementById('end').value,
                travelMode: google.maps.TravelMode.WALKING
            }, function (response, status) {
                if (status === google.maps.DirectionsStatus.OK) {
                    var a = document.getElementById('start').value,
                    b = document.getElementById('end').value;
                    directionsDisplay.setDirections(response);
                    Distance(a, b);
     	   		}
           })
        }
        
        function Distance(a, b, aa) {
            var start = a;
            var end = b;
            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };
            //宣告
            var directionsService = new google.maps.DirectionsService();
            directionsService.route(request,function (response, status) {
                var strTmp = "";
                if (status == google.maps.DirectionsStatus.OK) {
                    var route = response.routes[0];
                    for (var i = 0; i < route.legs.length; i++) {
                        var routeSegment = i + 1;
                        strTmp += route.legs[i].distance.text;
                    }
                    //取得距離(正整數，公里)
                    dist = parseFloat(strTmp).toString();
                    $('div.distance').text('總長 '+ dist+' 公里')
                    
                    // aa 判斷是否歷史路徑
                    if(aa != 0){
                        // 寫入資料庫
                    	$.ajax({
            				url:'${pageContext.servletContext.contextPath}/CRFSERVICE/routePlanController/addRP',
            				type:'post',
            				data:{'member_Id':'${LoginOK.member_Id}',
            					'startPoint':document.getElementById('start').value,
            					'endPoint':document.getElementById('end').value,
            					'dist':dist,
            					'routePlanStatus':1},
            				success:function(data){
            					if(data != undefined){
            						if(!$('#table_PathId>:first-child').is('tbody')){
            							$('.historyPath').append('<tr><th>起點</th><th>終點</th><th>總里程</th><th>記錄日期</th></tr>')
            						}
            						$('.historyPath>tbody').append('<tr><td>'+data.startPoint+'</td><td>'+data.endPoint+'</td><td>'+data.mileage+'(公里)</td><td>'+new Date(data.route_Plan_Date).Format("yyyy-MM-dd hh:mm:ss")+'</td></tr>')
            					}
            				}
            			});
                    }

                } else {
                	alertify.alert('Directions request failed due to ' + status).set('title', '警告');
                }
            });
         }
        
        
        
    	// form DB load history RP
    	$.ajax({
			url:'${pageContext.servletContext.contextPath}/CRFSERVICE/routePlanController/getRPAll',
			type:'get',
			data:{'member_Id':'${LoginOK.member_Id}'},
			success:function(data){
				if(data.length != 0){
					$.each(data, function(idx){
						if(idx == 0){
							$('.historyPath').append('<tr><th>起點</th><th>終點</th><th>總里程</th><th>記錄日期</th></tr>')
						}
						$('.historyPath>tbody').append('<tr><td>'+this.startPoint+'</td><td>'+this.endPoint+'</td><td>'+this.mileage+'(公里)</td><td>'+new Date(this.route_Plan_Date).Format("yyyy-MM-dd hh:mm:ss")+'</td></tr>')
					})
				}
			}
		})


        
        
        //function successCallback(position) {
        //    theLatitude = position.coords.latitude;
        //    theLongitude = position.coords.longitude;
            
        //}
        //function errorCallback(error) {
        //    var errorTypes = {
        //        0: "不明原因錯誤",
        //        1: "使用者拒絕提供位置資訊",
        //        2: "無法取得位置資訊",
        //        3: "位置查詢逾時"
        //    };
        //    alert(errorTypes[error.code]);
        //    alert("code=" + error.code + " " + error.message); //開發測試時用
        //}
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCdVhZR-wdOPj-O6nMCAdicPp9UpktHTUE&signed_in=true&callback=initMap" async defer></script>
  </body>
</html>