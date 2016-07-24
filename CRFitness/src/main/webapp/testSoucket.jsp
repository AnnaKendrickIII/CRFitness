<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<script src="${this_contextPath}/js/sockjs-1.0.3.js"></script>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- 可選的Bootstrap主題文件（一般不用引入） -->
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<!-- jQuery文件。務必在bootstrap.min.js 之前引入 -->
    <script src="${this_contextPath}/js/jquery-2.2.4.min.js"></script>  
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>webSocket測試</title>
<script type="text/javascript">
	$(function() {
		var websocket;
		if ('WebSocket' in window) {
// 			alert("WebSocket");
			var url = 'ws://' + window.location.host + '${this_contextPath}/CRFSERVICE/echo';
			websocket = new WebSocket(url);
			//websocket = new WebSocket("ws://127.0.0.1:8080/SSMTest/echo");
		} 
		websocket.onopen = function(evnt) {
			$("#tou").html("鏈接服務器成功!")
		};
		websocket.onmessage = function(evnt) {
			$("#msg").html($("#msg").html() + "<br/>" + evnt.data);
		};
		websocket.onerror = function(evnt) {
		};
		websocket.onclose = function(evnt) {
			$("#tou").html("與服務器斷開了鏈接!")
		}
		$('#send').bind('click', function() {
			send();
		});
		function send() {
			if (websocket != null) {
				var message = document.getElementById('message').value;
				websocket.send(message);
			} else {
				alert('未與服務器鏈接.');
			}
		}
	});
</script>

</head>
<body>

	<div class="page-header" id="tou">webSocket及時聊天Demo程序</div>
	<div class="well" id="msg"></div>
	<div class="col-lg">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="發送信息..."
				id="message"> <span class="input-group-btn">
				<button class="btn btn-default" type="button" id="send">發送</button>
			</span>
		</div>
		<!-- /input-group -->
	</div>
	<!-- /.col-lg-6 -->
	</div>
	<!-- /.row -->
</body>
</html>