<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<!-- <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
<!-- <!-- 可選的Bootstrap主題文件（一般不用引入） -->
<!-- <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"> -->
<!-- jQuery文件。務必在bootstrap.min.js 之前引入 -->
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<!-- <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->

  <link href="${this_contextPath}/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${this_contextPath}/css/jquery-ui.theme.css" rel="stylesheet" />
<link href="${this_contextPath}/css/jquery.ui.chatbox.css" rel="stylesheet" />
<script src="${this_contextPath}/js/sockjs-1.0.3.js"></script>
 <script src="${this_contextPath}/js/jquery-2.2.4.min.js"></script>  
 <script src="${this_contextPath}/js/jquery-ui.min.js"></script>	
 <script src="${this_contextPath}/js/bootstrap.min.js"></script>
  <script src="${this_contextPath}/js/jquery.ui.chatbox.js"></script>
 
       
<title>webSocket測試</title>
<script type="text/javascript">
	$(function() {
		var websocket;
		if ('WebSocket' in window) {
			var url = 'ws://' + window.location.host + '${this_contextPath}/CRFSERVICE/echo';
			websocket = new WebSocket(url);
			//websocket = new WebSocket("ws://127.0.0.1:8080/SSMTest/echo");
		} 
		websocket.onopen = function(evnt) {
			$("#tou").html("連線成功")
		};
		websocket.onerror = function(evnt) {
		};
		websocket.onclose = function(evnt) {
			$("#tou").html("斷線了")
		}
// 		$('#send').bind('click', function() {
// 			send();
// 		});
		function send() {
			if (websocket != null) {
				var message = document.getElementById('message').value;
				websocket.send(message);
			} else {
				alert('還沒連線到');
			}
		}
          var box = null;
          $("input[type='button']").click(function(event, ui) {
              if(box) {
                  box.chatbox("option", "boxManager").toggleBox();
              }
              else {
                  box = $("#chat_div").chatbox(
                		  {id:"${LoginOK.nickname}", 
                           user:{key : "value"},
                           title : "test chat",
                           messageSent : function(id, user, msg) {       	 
                        	  websocket.send(id+":"+msg);
                        	  websocket.onmessage = function(evnt) {
                         			$("#chat_div").chatbox("option", "boxManager").addMsg(evnt.data);
                         		};             
                                                }});
              }
          });
      });
    </script>
  </head>
  <body>
    <p>It will not work untill necessary scripts and stylesheets are
    properly loaded, check out the code.</p>  <input type="button"
    name="toggle" value="toggle" />
    <div id="chat_div">
    </div>
    <hr />
<!--     <div id="log"> -->
<!--     </div> -->

	<div class="page-header" id="tou">webSocket即時聊天</div>
<!-- 	<div class="well" id="msg"></div> -->
<!-- 	<div class="col-lg"> -->
<!-- 		<div class="input-group"> -->
<!-- 			<input type="text" class="form-control" placeholder="發送信息..." -->
<!-- 				id="message"> <span class="input-group-btn"> -->
<!-- 				<button class="btn btn-default" type="button" id="send">發送</button> -->
<!-- 			</span> -->
<!-- 		</div> -->
<!-- 		<!-- /input-group --> 
	</div>
	
</body>
</html>