<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Directions service</title>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
        select {
            font-size:14px;
        }
#floating-panel {
  position: absolute;
  top: 10px;
  left: 25%;
  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
  text-align: center;
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}
#map {
    margin:5% 25% 0 25%;
    padding:1%;
    border-color:blue;
    height: 70%;
    width:50%;
}
        #floating-panel {
        
        border-color:blue;
        }
        div.distance {
            margin-left: 5%;
        }
    </style>
  </head>
  <body>
    <div id="floating-panel">
    <b>Start: </b>
    <select id="start" >
      <option value="25.033408,121.564099">中正紀念堂</option>
      <option value="25.034712,121.522041">台北101</option>
      <option value="25.1023554,121.5463038">國立故宮博物院</option>
      <option value="25.1174533,121.4622514">關渡碼頭租借站</option>
      <option value="25.0413574,121.4970061">貴陽疏散門</option>
      <option value="gallup, nm">Gallup, NM</option>
      <option value="flagstaff, az">Flagstaff, AZ</option>
      <option value="winona, az">Winona</option>
      <option value="kingman, az">Kingman</option>
      <option value="25.0873617,121.4523007">蘆堤寵物公園</option>
      <option value="25.064171,121.472671">疏洪荷花公園</option>
      <option value="25.0545394,121.479721">幸福水漾公園</option>
    </select>
    <b>End: </b>
    <select id="end" >
      <option value="25.033408,121.564099">中正紀念堂</option>
      <option value="25.034712,121.522041">台北101</option>
      <option value="25.1023554,121.5463038">國立故宮博物院</option>
      <option value="25.1174533,121.4622514">關渡碼頭租借站</option>
      <option value="25.074374, 121.508741">不知道是哪</option>
      <option value="25.0413574,121.4970061">貴陽疏散門</option>
      <option value="flagstaff, az">Flagstaff, AZ</option>
      <option value="winona, az">Winona</option>
      <option value="kingman, az">Kingman</option>
      <option value="25.0873617,121.4523007">蘆堤寵物公園</option>
      <option value="25.064171,121.472671">疏洪荷花公園</option>
      <option value="25.0545394,121.479721">幸福水漾公園</option>
    </select>
    </div>
    <div id="map"></div>
    <div class="distance"></div>
      <!--海拔高低圖放在這-->
      <div></div>
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

        function initMap() {
            var directionsService = new google.maps.DirectionsService;
            var directionsDisplay = new google.maps.DirectionsRenderer;
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
            document.getElementById('start').addEventListener('change', onChangeHandler);
            document.getElementById('end').addEventListener('change', onChangeHandler);
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
                } else {
                    window.alert('Directions request failed due to ' + status);
                }
            });
        }

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


        function Distance(a, b) {
            var start = a;
            var end = b;
            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };
            //宣告
            var directionsService = new google.maps.DirectionsService();
            directionsService.route(request, function (response, status) {
                var strTmp = "";
                if (status == google.maps.DirectionsStatus.OK) {
                    var route = response.routes[0];
                    for (var i = 0; i < route.legs.length; i++) {
                        var routeSegment = i + 1;
                        strTmp += route.legs[i].distance.text;
                    }
                    //取得距離(正整數，公里)
                    var dist = parseFloat(strTmp).toString();
                    $('div.distance').text('總長 '+ dist+' 公里')
                    console.log(new Date().getTime().toString());
                }
            });
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCdVhZR-wdOPj-O6nMCAdicPp9UpktHTUE&signed_in=true&callback=initMap"
        async defer></script>
      <script src="js/jquery-2.2.4.min.js"></script>
  </body>
</html>