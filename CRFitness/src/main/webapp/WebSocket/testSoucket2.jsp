<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>1
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>动弹列表</title>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
 <script type="text/javascript" src="${this_contextPath}/js/jquery.timeago.js"></script>
<style type="text/css">
    .jz {
        margin: 0 auto; 
        text-align: center;
    }
    .tw {
        border:1px dotted red;
        height: 60px;
        width:600px;
        margin:0px auto;
        padding-left:10px;
        padding-top:10px;
        margin-top:5px;
    }
    .top {
         
    }
    .buttom {
        padding-top:10px;
    }
    #send-box {
        margin-top:10px;
    }
</style>
</head>
<body>
<div class="jz" style="font-size:30px;">动弹列表</div>
<div class="jz" style="font-size:20px;">欢迎回来：${LoginOK.nickname}<b id="pcount"></b></div>
<div class="jz" id="err-box"></div>
<div id="msg-box">
    <div class="tw">
        <div class="top">admin  2015-07-05</div>
        <div class="buttom">请大家随意畅谈</div>
    </div>
</div>
<div id="send-box" class="jz">
    <input type="text" id="text-msg" style="width:300px;"/>
    <input type="button" onclick="send_msg()" value="发布动弹"/>
</div>
<script type="text/javascript">
	  
    var username = "${LoginOK.nickname}";
    var ws = new WebSocket('ws://' + window.location.host + '${this_contextPath}/CRFSERVICE/echo');
 
    ws.onerror = function(event)
    {
        $('#err-box').html(event);
    };
 
    ws.onopen = function(event) 
    {
        start() ;
    };
     
    ws.onclose = function(event) { 
        var msg = JSON.stringify({'username':username, 'type':'3'});//3關  
        ws.send(msg);
    }; 
 
    ws.onmessage = function(event) 
    {	
    	console.log(event.data)
        var data = JSON.parse(event.data);
        if(data.type == '2')
        {
            render_data(data.username, data.data);
            console.log(data.username)
            console.log(data.data)
        }
        else if(data.type == '1')
        {
           
            render_data(data.username + "上線 <br> ");
        }
    };
 
    function render_data(data)
    {
        var msg = [];
        msg.push('<div class="tw">');
        msg.push('<div class="top">' + username + '</div>');
        msg.push('<div class="buttom"> ' + data +jQuery.timeago(new Date().getTime())+ ' </div>');
        msg.push('</div>');
        $('#msg-box').append(msg.join(''));
    }
     
    function start() 
    {
        if(username != '')
        {
            var msg = JSON.stringify({'username':username, 'type':'1'});  
            ws.send(msg);
        }
    }
 
    function send_msg()
    {
        var text_msg = $('#text-msg').val();
        if(text_msg != '')
        {
            var msg = JSON.stringify({'username':username, 'type':'2', 'data': text_msg});  
            ws.send(msg);
            $('#text-msg').val('');
        }
    }
     
    (function(){
        if(username == '')
        {
            alert('你未登入');
            $('#send-box').hide();
        }
    })();
</script>
</body>
</html>