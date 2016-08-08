<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <jsp:include page="/CRFitness.jsp" />
	<link href="${this_contextPath}/css/bootstrap-switch.min.css" rel="stylesheet">
    <title>Directions service</title>
    <style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
	background-color: #D2E9FF;
}

#map {
	height: 100%;
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
#sports_itemsId>label{
	display: block;
}
</style>
<script src="${this_contextPath}/js/bootstrap-switch.min.js"></script>
  </head>
  <body>
  <aside>
<div class="row">
    <div class="col-lg-3 col-md-3 col-xs-3">
	    <input type="checkbox" name="my-checkbox" data-size="mini">
		<div hidden="hidden" id='sports_itemsDiv'>
			<form action="" id='sports_itemsId'>
				<label><input type="text" id='weight' name="weight" value="">體重(kg)</label>
				<label><input type="radio" name="sports_items" value="walking">走路</label>
				<label><input type="radio" name="sports_items" value="brisk_walking">快步走</label>
				<label><input type="radio" name="sports_items" value="jogging">慢跑</label>
				<label><input type="radio" name="sports_items" value="running">快跑</label>
				<label><input type="radio" name="sports_items" value="slow_cycling">騎自行車(慢)</label>
				<label><input type="radio" name="sports_items" value="fast_cycling">騎自行車(快)</label>
			</form>
		</div>
    </div>
    <div id="floating-panel" class="col-lg-5 col-md-5 col-xs-5">
    
     <div class="row ">
	    <div class="col-lg-12 col-md-12 col-xs-12 form-group form-group-sm">
	    <label class="col-sm-2 control-label label_div" for="start "> <strong>Start: </strong></label>    
	    <div class="col-sm-10 label_input_div">
	    <input class="form-control" id="start" type="text" >
	    </div>
		</div>
		<div class="col-lg-12 col-md-12 col-xs-12 form-group form-group-sm">
	    <label class="col-sm-2 control-label label_div" for="end "> <strong>End: </strong></label>    
	    <div class="col-sm-10 label_input_div">
	    <input class="form-control" id="end" type="text" >
	    </div>
		</div>
	    <div class="col-lg-12 col-md-12 col-xs-12">   
		<input class="" id='submitPath' type="button"  value='提交'>
		</div>
	</div> 
	
	   <div class="col-lg-12 col-md-12 col-xs-12">   
    		<div class="distance" ></div>
    	</div>
  </div>
</div>
    
    <div class="col-lg-4 col-md-4 col-xs-4"> 
    </div>
    
</aside>
<!--     <div><br/></div> -->
    <div id="map"></div>
    
    <!--海拔高低圖放在這，求神人幫忙-->
    
<!--     歷史路徑	 -->
<div class="row">
<div class="col-lg-10 col-md-10 col-xs-10"></div>
    <div class='historyz col-lg-2 col-md-2 col-xs-2 '><p>歷史路徑</p>
      <table class="talbe table-hover historyPath" id='table_PathId'>
      </table>
	</div>
</div>



<script>
$("#switch-one").bootstrapSwitch();
$("[name='my-checkbox']").bootstrapSwitch();

	$('input[name="my-checkbox"]').on('switchChange.bootstrapSwitch', function(event, state) {
		console.log(this); // DOM element
		console.log(event); // jQuery event
		console.log(state); // true | false
		$('#sports_itemsDiv').toggle('show')
	});
	
	$('#sports_itemsId>label>input[type="radio"]').on('change', function(){
		var option = this.value;
		console.log(option)
		var h = document.getElementById('weight').value;
		console.log(h)
		var calorie = 0;
		var dist = 36;
		if(h.length>0){
			switch(option){
			case 'walking':
				calorie = (dist/4)*h*3.1;
				break;
			case 'brisk_walking':
				calorie = (dist/6)*h*4.4;
				break;
			case 'jogging':
				calorie = (dist/8.7)*h*9.4;
				break;
			case 'running':
				calorie = (dist/16)*h*13.2;
				break;
			case 'slow_cycling':
				calorie = (dist/8.8)*h*3;
				break;
			case 'fast_cycling':
				calorie = (dist/20.9)*h*9.7;
				break;
			}
			console.log(calorie.toFixed(2));
		}

	})
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
                    
//                     if()
//                     	calorie_consumption_calculation(dist);
                    
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

		// 熱量消耗計算 Calorie consumption calculation
		function calorie_consumption_calculation(dist, option){
    		var h = document.getElementById('weight').value;
    		var calorie = 0;
    		switch(option){
    		case walking:
    			calorie = (dist/4)*h*3.1;
    			break;
    		case brisk_walking:
    			calorie = (dist/6)*h*4.4;
    			break;
    		case jogging:
    			calorie = (dist/8.7)*h*9.4;
    			break;
    		case running:
    			calorie = (dist/16)*h*13.2;
    			break;
    		case slow_cycling:
    			calorie = (dist/8.8)*h*13.2;
    			break;
    		case fast_cycling:
    			calorie = (dist/20.9)*h*13.2;
    			break;
    		}
    		console.log(calorie);
    	}
        /*
        計算公式：體重 x消耗熱量 = 每小時可消耗的大卡數 
例如 60 公斤成人跑步1小時消耗 = 60 x 13.2 = 792大卡

走路(4公里/小時)	3.1
快步走(6.0公里/小時)	4.4
慢跑(145公尺/每分鐘)	9.4
跑步(16公里/小時)	13.2

騎腳踏車(8.8公里/小時)	3
騎腳踏車(20.9公里/小時)	9.7

Walking (4 km / h) 3.1
Brisk walking (6.0 km / h) 4.4
Jogging (145 m / min) 9.4
Running (16 km / h) 13.2

Slow cycling (8.8 km / h) 3
Fast cycling (20.9 km / h) 9.7
        */
        
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
</body>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCdVhZR-wdOPj-O6nMCAdicPp9UpktHTUE&signed_in=true&callback=initMap" async defer></script>
</html>