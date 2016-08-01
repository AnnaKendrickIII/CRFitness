<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="google-signin-client_id" content="826213451911-6rpb37oapsg46p3ao0mhv6ks9orcja5h.apps.googleusercontent.com" />
    <link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
    <!-- Bootstrap Core CSS -->
    <link href="${this_contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${this_contextPath}/css/simple-sidebar.css" rel="stylesheet" />
    <link href="${this_contextPath}/css/login.css" rel="stylesheet" />
    <link href="${this_contextPath}/font-awesome/css/font-awesome.css" rel="stylesheet" />
    
    <link href="${this_contextPath}/css/lrtk.css" rel="stylesheet" />
    <link href="${this_contextPath}/css/custombox.css" rel="stylesheet" />
    <link href="${this_contextPath}/css/ChatMessage.css" rel="stylesheet" />
    <link href="${this_contextPath}/css/friend.css" rel="stylesheet" />
     <!-- Bootstrap Core JavaScript -->
    <script src="${this_contextPath}/js/jquery-2.2.4.min.js"></script>  

    <script src="${this_contextPath}/js/jquery-ui.min.js"></script>	
    <script src="${this_contextPath}/js/custombox.js"></script>	
    <script src="${this_contextPath}/js/legacy.js"></script>	
    <script src="${this_contextPath}/js/lrtk.js"></script>	
    <script type="text/javascript" src="${this_contextPath}/js/jquery.timeago.js"></script>
    <script type="text/javascript" src="${this_contextPath}/js/jquery.searchable-1.0.0.min.js"></script>
      <!-- GoogleLogin-->  
      <!-- bootstrap.min.js  開始-->
  <script src="${this_contextPath}/js/bootstrap.min.js"></script> 
    <script src="https://apis.google.com/js/platform.js"></script>	
    <!-- FBLogin JavaScript -->
    <script type="text/javascript" src="http://connect.facebook.net/zh_TW/all.js"></script>
    <script src="${this_contextPath}/js/fb-intit.js"></script>	
<%--     <script src="${this_contextPath}/js/sockjs-1.0.3.js"></script> --%>
    <!-- 左側清單 開始 -->
    <div id="wrapper">
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">           
                <li class="sidebar-brand">
                     <span>
                    <a href="${this_contextPath}/index.jsp" >                               
                        <i class="fa fa-home fa-2x "></i>                                
                    </a>
                   </span>
                </li>            
                <li>
                    <div class="dropdown">    
                        <a href="#"><i class="fa fa-book"></i>日誌<span class="downc caret"></span></a>
                        <ul class="wrapper_dropdown_ul">
                            <li><a href="${this_contextPath}/Journal.jsp">健康日誌</a></li>
                            <li><a href="${this_contextPath}/PersonalJournal.jsp?${LoginOK.member_Id}">個人日誌</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="dropdown">
                        <a href="#"  class="dropdown-toggle"><i class="fa fa-shopping-cart"></i>商品<span class="downc caret"></span></a>
                        <ul class="wrapper_dropdown_ul">
                            <li><a href="${this_contextPath}/Products.jsp?category=cmens-tops&page=1">上裝</a></li>
                            <li><a href="${this_contextPath}/Products.jsp?category=cmens-bottoms&page=1">下裝</a></li>
                            <li><a href="${this_contextPath}/Products.jsp?category=cmens-accessories&page=1">配件</a></li>
                            <li><a href="${this_contextPath}/Products.jsp?category=cmens-footwear&page=1">鞋類</a></li>
                        </ul>
                    </div>
                </li>
                <li>  
                 <a href="${this_contextPath}/activitys.jsp"><i class="fa fa-users" ></i>揪團專區</a>
                </li>             
                <li>
                    <a href="${this_contextPath}/Games.jsp"><i class="fa fa-flag-checkered"></i>賽事</a>
                </li>
                 <li>
                    <a href="#"><i class="fa fa-road" ></i>路線規劃</a>
                </li>                    
            </ul>
        </div>
    </div>
    <!-- 左側清單 結束 -->

    <!-- 標頭區塊 開始-->
    <header class="row header_css">
        <div class="col-lg-12 col-md-12 col-xs-12">
            <div class="btn-toolbar col-lg-5 col-md-5 col-xs-5">
                <div class="btn-group ">    
                    <a href="#menu-toggle" id="menu-toggle">
                         <i id="header_list" class="fa fa-bars fa-2x" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-xs-3 logo_here">
                
            </div>
            
            <div class="col-lg-4 col-md-4 col-xs-4">
                <c:choose>
                <c:when test="${! empty LoginOK }">
                <div id="header_email_dropdown_div" class="user_login_div dropdown">
                 		<a id="maildLabel" data-target="#"  data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                  			<i id="header_email" class="fa fa-envelope fa-2x" ><span class="badge num_mail"></span></i>
                  		</a>
                  		
                </div>                  
               	<div class="user_login_div dropdown">
                        <a id="dLabel" data-target="#"  data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img id="user_btn"  src="${this_contextPath}/images/members/${LoginOK.member_Id}.jpg" class="img-responsive user_login_css " /></a>
                        <ul class="user_login_down_div dropdown-menu " aria-labelledby="dLabel"> 
                            <li><a href="${this_contextPath}/PersonalJournal.jsp?${LoginOK.member_Id}">${LoginOK.nickname}的個人日誌</a></li>
                            <li><a data-toggle="modal" class="container_a_css" href="#myfriend">好友</a></li> 
                            <li><a  href="${this_contextPath}/activitydetail.jsp?${LoginOK.member_Id}" data-toggle="modal" class="container_a_css" href="#myactivitys">揪團紀錄</a></li>
                             <li><a href="${this_contextPath}/Order.jsp?${LoginOK.member_Id}" data-toggle="modal" class="container_a_css">訂單查詢</a></li>    
                        	<li><a  class="container_a_css">編輯個人資料</a></li>                          
                            <li><a href="${this_contextPath}/Logout/logout.jsp" class="logout_css_souket" >登出</a></li>                        
                        </ul>
                </div>
                </c:when>
                <c:otherwise>
                 <a id="login_go" href="#login-box" class="login-window">
              <img id="Img1" src="${this_contextPath}/icon/user.ico" class="img-responsive user_css " />
              	</a>
                </c:otherwise>
                	</c:choose>                           
            </div>
        </div>
    </header>
    <!-- 標頭區塊 結束-->
  
    <!-- 好友區塊 開始-->
    <c:if test="${! empty LoginOK }">
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myfriend" class="modal fade ">
                    <div class="modal-dialog">
                        <div class="modal-content">                 
            <div class="panel panel-default">
                <div class="panel-heading c-list modal-header friend_header">
                
                    <span class="title">${LoginOK.nickname}的好友</span>
                    <ul class="pull-right c-controls">
                        <li><a href="#" class="hide-search" data-command="toggle-search" data-toggle="tooltip" data-placement="top" title="Toggle Search"><i class="fa fa-ellipsis-v"></i></a></li>
                    </ul>
                </div>
                
                <div class="row" style="display: none;">
                    <div class="col-xs-12">
                        <div class="input-group c-search">
                            <input type="text" class="form-control" id="contact-list-search" />
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search text-muted"></span></button>
                            </span>
                        </div>
                    </div>
                </div>
                
                <ul class="list-group " id="contact-list">
                                
                </ul>
            </div>
        </div>
	</div>
  </div>
  
 
<script type="text/javascript">
//WebSocket 
//  function start() 
//     {
//         if(userID != '')
//         {
//             var msg = JSON.stringify({'userID':userID, 'type':'1'});  
//             ws.send(msg);
//         }
//     }
 Date.prototype.Format = function (fmt) {  
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, ( this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
    function sendMessage( friendId , val, Time,friendName)
    {
        if(val != '')
        {
            var msg = JSON.stringify({'userID':userID,'friendId':friendId, 'type':'2', 'data': val,'Time':Time,'friendName':friendName});  
            ws.send(msg);    
        }
    }
    
	//未讀ajax
    function NoReadAppend(userID){
    	$.ajax({
	          url:"${this_contextPath}/CRFSERVICE/chatController/select_NoReade_Friends_message",
	          type:'get',  //get post put delete
			  data:{ member_Id:'${LoginOK.member_Id}', friend_Id:userID},
			  success:function(data){
				 $.each(data,function(index){	
					var jdate_int = parseInt(this.chatTime);                          //轉換成數字
		 		   var jdate_value = new Date(jdate_int);
		 		  if('${LoginOK.member_Id}'==this.member_Id){	
						$('#'+userID+' .msg_container_base ').prepend(
	 	 								'<div class="row msg_container base_sent ">'
	 	 								+'<div class=" col-md-1 col-xs-1 message_div"></div>'
	 	 			 		            +'<div class=" col-md-9 col-xs-9 message_div">'
	 	 			 		            +'<div class="messages msg_sent">'
	 	 			 		            +'<p>'+this.chat_Detail+'</p>'         
	 	 			 		            +'<time datetime="">'+ jdate_value.Format("MM-dd hh:mm:ss")+'</time>'
	 	 			 		            +'</div>'
	 	 			 		            +'</div>'
	 	 			 		            +'<div class="col-md-2 col-xs-2 message_div avatar">'
	 	 			 		            +'<img class="msimg" src="${this_contextPath}/images/members/'+this.member_Id+'.jpg" class=" img-responsive ">'
	 	 			 		            +'</div>'
	 	 			 		            +'</div>' 				 
	 							 )
					}else{
						$('#'+userID+' .msg_container_base ').prepend(
	 								'<div class="row msg_container base_receive ">'
	 			 		            +'<div class="col-md-2 col-xs-2 message_div avatar">'
	 			 		            +'<img class="msimg" src="${this_contextPath}/images/members/'+this.member_Id+'.jpg" class=" img-responsive ">'
	 			 		            +'</div>'     
	 			 		            +'<div class=" col-md-9 col-xs-9 message_div">'
	 			 		            +'<div class="messages msg_sent">'
	 			 		            +'<p>'+this.chat_Detail+'</p>'         
	 			 		            +'<time datetime="">'+ jdate_value.Format("MM-dd hh:mm:ss")+'</time>'
	 			 		            +'</div>'
	 			 		            +'</div>'
	 			 		        	+'<div class=" col-md-1 col-xs-1 message_div"></div>'
	 			 		            +'</div>' 		         	
							 )							
					}
				 })
			   }		  
		   })
       }
     //增加聊天室
   	function bodyappend(userID,friendName){ 	
   		$('body').append(
				'<div id='+userID+' class="row chat-window col-xs-5 col-md-3"  style="margin-left:10px;">'
				+'<div class="col-xs-12 col-md-12">'
				+'<div class="panel panel-default">'
				+'<div class="panel-heading top-bar">'
					+'<div class="col-md-6 col-xs-6">'
				+'<h3 class="panel-title"><span class="glyphicon glyphicon-comment comment_css"></span>'+friendName+'</h3>'
					+'</div>'
					+'<div class="col-md-6 col-xs-6" style="text-align: right;">'
					+'<a href="#"><span  class="glyphicon glyphicon-minus icon_minim"></span></a>'
					+' <a href="#"><span class="glyphicon glyphicon-remove icon_close" ></span></a>'
					+'</div>'
					+'</div>'
					+'<div class="panel-body msg_container_base">'     
					+'</div>'
					+'<div class="panel-footer">'
				+'<div class="input-group">'
				+'<textarea maxlength="180" class="form-control input-sm chat_input" cols="15" rows="1"  placeholder="Write your message here..."></textarea>'
				+'<span class="input-group-btn">'
				+'<button class="btn btn-primary btn-sm" >Send</button>'
				+'</span><span class="friendId_Here" hidden="hidden">'+userID+'</span>' 
				+'</div>'
				+'</div>'
				+'</div>'
				+'</div>')
				//未讀
				NoReadAppend(userID)
				$( ".chat-window" ).draggable();
    	 //變為已讀
    	 $.ajax({
	          url:"${this_contextPath}/CRFSERVICE/chatController/update_NoReade_Friends_message",
	          type:'post',  //get post put delete
			  data:{ member_Id:userID, friend_Id:'${LoginOK.member_Id}'},
			  success:function(data){
				
			 	 }
			 })
   	}
   //增加已讀3則
    function IsReadThree(friendId){ 	
    	$.ajax({
	          url:"${this_contextPath}/CRFSERVICE/chatController/selectFriendMessage",
	          type:'get',  //get post put delete
			  data:{ member_Id:'${LoginOK.member_Id}', friend_Id:friendId},
			  success:function(data){
				 			
				 $.each(data,function(){	
					var jdate_int = parseInt(this.chatTime);                          //轉換成數字
		 		   var jdate_value = new Date(jdate_int);
					 if('${LoginOK.member_Id}'==this.member_Id){
						$('#'+friendId+' .msg_container_base').prepend(
								'<div class="row msg_container base_sent ">'
								+'<div class=" col-md-1 col-xs-1 message_div"></div>'
			 		            +'<div class=" col-md-9 col-xs-9 message_div">'
			 		            +'<div class="messages msg_sent">'
			 		            +'<p>'+this.chat_Detail+'</p>'         
			 		            +'<time datetime="">'+ jdate_value.Format("MM-dd hh:mm:ss")+'</time>'
			 		            +'</div>'
			 		            +'</div>'
			 		            +'<div class="col-md-2 col-xs-2 message_div avatar">'
			 		            +'<img class="msimg" src="${this_contextPath}/images/members/'+this.member_Id+'.jpg" class=" img-responsive ">'
			 		            +'</div>'
			 		            +'</div>' 
	 							 
						 )
					
					 }else{
						$('#'+friendId+' .msg_container_base').prepend(
								'<div class="row msg_container base_receive ">'
			 		            +'<div class="col-md-2 col-xs-2 message_div avatar">'
			 		            +'<img class="msimg" src="${this_contextPath}/images/members/'+this.member_Id+'.jpg" class=" img-responsive ">'
			 		            +'</div>'     
			 		            +'<div class=" col-md-9 col-xs-9 message_div">'
			 		            +'<div class="messages msg_sent">'
			 		            +'<p>'+this.chat_Detail+'</p>'         
			 		            +'<time datetime="">'+ jdate_value.Format("MM-dd hh:mm:ss")+'</time>'
			 		            +'</div>'
			 		            +'</div>'
			 		        	+'<div class=" col-md-1 col-xs-1 message_div"></div>'
			 		            +'</div>' 		         	
						 )				
					 } 
				 })
				 //捲軸置底  	
				var basecon = $('#'+friendId+' .msg_container_base');
				basecon.scrollTop(basecon.prop("scrollHeight")-basecon.prop("clientHeight")); 
			  } 			
		})
    	
    }
    var userID = '${LoginOK.member_Id}';
    var ws = new WebSocket('ws://' + window.location.host + '${this_contextPath}/CRFSERVICE/echo');
 
    ws.onerror = function(event)
    {
    	alert(event);
    };
 
    ws.onopen = function(event) 
    {
    	console.log('打開了')
//         start() ;
    };
     
    ws.onclose = function(event) { 
        var msg = JSON.stringify({'userID':userID, 'type':'3'});//3  關  
        ws.send(msg);
		console.log('關了')
    }; 
 
    $('body').on('click','.logout_css_souket',function(){
    	 var msg = JSON.stringify({'userID':userID, 'type':'3'});//3  關  
         ws.send(msg);
         console.log('關了,登出')
    })   
    ws.onmessage = function(event) 
    {	
        var data = JSON.parse(event.data);
        if(data.type == '2')
        {
        	var jdate_int = parseInt(data.Time);                          //轉換成數字
 		   var jdate_value = new Date(jdate_int);
            if('${LoginOK.member_Id}'==data.userID){
            	
					$('#'+data.friendId+' .msg_container_base').append(
							'<div class="row msg_container base_sent ">'
							+'<div class=" col-md-1 col-xs-1 message_div"></div>'
		 		            +'<div class=" col-md-9 col-xs-9 message_div">'
		 		            +'<div class="messages msg_sent">'
		 		            +'<p>'+data.data+'</p>'         
		 		            +'<time datetime="">'+jdate_value.Format("MM-dd hh:mm:ss")+'</time>'
		 		            +'</div>'
		 		            +'</div>'
		 		            +'<div class="col-md-2 col-xs-2 message_div avatar">'
		 		            +'<img class="msimg" src="${this_contextPath}/images/members/'+data.userID+'.jpg" class=" img-responsive ">'
		 		            +'</div>'
		 		            +'</div>' 
							 
					 )
				 }else{
					if(!($('#'+data.userID).html())){	
						bodyappend(data.userID,data.friendName)
						IsReadThree(data.userID)//增加已讀3則訊息	
					}else{	
					$('#'+data.userID+' .msg_container_base').append(
							'<div class="row msg_container base_receive ">'
		 		            +'<div class="col-md-2 col-xs-2 message_div avatar">'
		 		            +'<img class="msimg" src="${this_contextPath}/images/members/'+data.userID+'.jpg" class=" img-responsive ">'
		 		            +'</div>'     
		 		            +'<div class=" col-md-9 col-xs-9 message_div">'
		 		            +'<div class="messages msg_sent">'
		 		            +'<p>'+data.data+'</p>'         
		 		            +'<time datetime="">'+jdate_value.Format("MM-dd hh:mm:ss")+'</time>'
		 		            +'</div>'
		 		            +'</div>'
		 		        	+'<div class=" col-md-1 col-xs-1 message_div"></div>'
		 		            +'</div>' 		         	
					 )
					}
				 } 
        	var basecon = $('.msg_container_base');
				basecon.scrollTop(basecon.prop("scrollHeight")-basecon.prop("clientHeight")); 
        }
        else if(data.type == '1')
        {
        	console.log('111')
//             render_data(data.username + "上線 <br> ");
            
        }
        else if(data.type == '4'){
        	if(!$('#header_email_dropdown_div ul').html()){
        			$('#header_email_dropdown_div').append('<ul class=" dropdown-menu " aria-labelledby="maildLabel"></ul>')
        	}
        	$('#header_email_dropdown_div ul').append(
        			'<li><div class="addfid" hidden="hidden">'+data.userID+'</div><div class="addfname" hidden="hidden">'+data.myName+'</div>'
						+'<div class="row chatmessage_two"><div  class="col-xs-1 col-sm-1"></div>'
						+'<div  class="col-xs-1 col-sm-1 chat_icon_div"><i class="fa fa-user-plus o-chat" aria-hidden="true"></i></div>'
						+'<div  class="col-xs-1 col-sm-1"><a href="${this_contextPath}/PersonalJournal.jsp?'+data.userID+'">'
						+'<img class="img-responsive" src="${this_contextPath}/images/members/'+data.userID+'.jpg"></a></div>'
						+'<div  class="col-xs-6 col-sm-6 div_chat_message">'
						+data.myName+'想加你為好友</div>'
						+'<div  class="col-xs-3 col-sm-3 ">'
						+'<i class="fa fa-check check_fr_ok" aria-hidden="true"></i>'
						+'<i class="fa fa-times check_fr_No" aria-hidden="true"></i></div></div><li>')
        	
        	 var mail=$('span.num_mail');
			 if(mail.text()!=""){
					var mail_text=parseInt(mail.text());
					 mail_text=mail_text+1
					 mail.text(mail_text) 		
			}else{
				 mail.text('1') 
			}
        }else if(data.type == '5'){
        	$('#contact-list').append(
               	 '<li class="list-group-item">'
               	 +' <div class="col-xs-6 col-sm-2"><a href="${this_contextPath}/PersonalJournal.jsp?'+data.userID+'" >'
               	 +' <img src="${this_contextPath}/images/members/'+data.userID+'.jpg" class="img-responsive img-circle" />'
               	 +'</a></div>'
               	 +'<div class="col-xs-6 col-sm-3 friend_name_div">'
               	 +'<span class="name">'+data.myName+'</span>'
               	 +'</div>'
               	 +'<div class="col-xs-12 col-sm-7 freind_icon_div">'
               	 +'<span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title=""></span>'
               	 +'<span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title=""></span>'
               	 +'<span class="fa fa-comments text-muted c-info chat_icon_css" data-toggle="tooltip" title=""><span hidden="hidden">'+data.userID+'</span></span>'
               	 +'</div>'
               	 +'<div class="clearfix"></div>'
               	 +'</li> '	 
				) 
				alertify.notify('你已和'+data.myName+'成為好友', 'success', 5);
        	$('.canceladdfriend').attr('class','profile-btn btn btn-primary chat_for_friend').text('傳送訊息給他')
        }
    };
    (function(){
        if(userID == '')
        {
            alert('你未登入');
            $('#send-box').hide();
        }
    })();
 
   
    // enter換行變成shift enter ,enter變送出
	$('body').on('keydown', '.chat_input', function (event) {
		if (event.keyCode == 13 && !event.shiftKey) {
			var friendName='${LoginOK.nickname}'
			var val = $(this).val();
			var friendId=$(this).siblings(".friendId_Here").text()
			if(val.trim().length != 0){
				val = val.replace(/\r?\n/g, '</br> ');
				sendMessage( friendId, val,(new Date().getTime()).toString(),friendName);
				$(this).val('')
			}
			return false;
		}
	})
    //右下腳按鈕 送出
	$('body').on('click', '.input-group-btn', function (event) {
		event.preventDefault();
		var val = $(this).prev().val()
		var friendName='${LoginOK.nickname}'
		var friendId=$(this).siblings(".friendId_Here").text()
		if(val.trim().length != 0){
			val = val.replace(/\r?\n/g, '</br> ')
			sendMessage(friendId, val, (new Date().getTime()).toString(),friendName);
			$(this).prev().val('');
		}
	})  
    </script>
    <!-- web聊天 -->
 <script>     
 		$('body').on('dblclick', '.panel-heading ', function (e) {
     	var $this = $(this).find('span.icon_minim');
     	if (!$this.hasClass('panel-collapsed')) {
         	$this.parents('.panel').find('.panel-body').slideUp();
         	$this.addClass('panel-collapsed');
         	$this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
    	 } else {
         	$this.parents('.panel').find('.panel-body').slideDown();
         	$this.removeClass('panel-collapsed');
         	$this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
    	 }
 		});
 		$('body').on('click', '.panel-heading span.icon_minim', function (e) {
            var $this = $(this);
            if (!$this.hasClass('panel-collapsed')) {
                $this.parents('.panel').find('.panel-body').slideUp();
                $this.addClass('panel-collapsed');
                $this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
            } else {
                $this.parents('.panel').find('.panel-body').slideDown();
                $this.removeClass('panel-collapsed');
                $this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
            }
        });
 		$('body').on('focus', '.chat_input', function (e) {
            var $this = $(this);
           
            if ($('#minim_chat_window').hasClass('panel-collapsed')) {
                $this.parent().parent().siblings('.panel-body').slideDown();
                $this.parent().parent().siblings('.panel-body').find('span.icon_minim').removeClass('panel-collapsed');
                $this.parent().parent().siblings('.panel-body').find('span.icon_minim').addClass('glyphicon-minus');
            }
        });
 		
 		
 		$('body').on('click', '.chat_icon_css', function (e) {
 			var friendId=$(this).find('span[hidden]').text()
 			var WhoName=$(this).parent().siblings('.friend_name_div').find('.name').text();	
 			if(!($('#'+friendId).html())){
 				$('#myfriend').modal('hide')
 				 bodyappend(friendId,WhoName)//增加聊天框 		 
 				 IsReadThree(friendId)//增加已讀3則訊息		
			}		
        });
 		$('body').on('click', '.icon_close', function (e) {
           $(this).parent().parent().parent().parent().parent().parent().remove();
        });
        
    </script>
    
                    
    <script>
    //搜尋用
    $(function () {
        /* BOOTSNIPP FULLSCREEN FIX */
        if (window.location == window.parent.location) {
            $('#back-to-bootsnipp').removeClass('hide');
        }
        $('[data-toggle="tooltip"]').tooltip();
        $('[data-command="toggle-search"]').on('click', function (event) {
            event.preventDefault();
            $(this).toggleClass('hide-search');

            if ($(this).hasClass('hide-search')) {
                $('.c-search').closest('.row').slideUp(100);
            } else {
                $('.c-search').closest('.row').slideDown(100);
            }
        })  
    });

</script>
                 <script type="text/javascript">
				//找出全部好友
                   jQuery(function ($) {
                         $.ajax({
                             url:"${this_contextPath}/CRFSERVICE/friendships/${LoginOK.member_Id}",
                             type:'get',  //get post put delete
                             data:{},
                             success:function(data){
                                 $.each(data,function(){
                                	 $('#contact-list').append(
                                	 '<li class="list-group-item">'
                                	 +' <div class="col-xs-6 col-sm-2"><a href="${this_contextPath}/PersonalJournal.jsp?'+this[0]+'" >'
                                	 +' <img src="${this_contextPath}/images/members/'+this[0]+'.jpg" class="img-responsive img-circle" />'
                                	 +'</a></div>'
                                	 +'<div class="col-xs-6 col-sm-3 friend_name_div">'
                                	 +'<span class="name">'+this[2]+'</span>'
                                	 +'</div>'
                                	 +'<div class="col-xs-12 col-sm-7 freind_icon_div">'
                                	 +'<span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title=""></span>'
                                	 +'<span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title=""></span>'
                                	 +'<span class="fa fa-comments text-muted c-info chat_icon_css" data-toggle="tooltip" title=""><span hidden="hidden">'+this[0]+'</span></span>'
                                	 +'</div>'
                                	 +'<div class="clearfix"></div>'
                                	 +'</li> '	 
										) 
                                 })
         $('#contact-list').searchable({
            searchField: '#contact-list-search',
            selector: 'li',
            childSelector: '.friend_name_div',
            show: function (elem) {
                elem.slideDown(100);
            },
            hide: function (elem) {
                elem.slideUp(100);
            }
        })
                             }          	 
                         }) 
                         
                        // 在mail圖示上顯示好友申請提示的個數
						$.ajax({
							url:"${this_contextPath}/CRFSERVICE/chatController/select_NoRead_Friends_Allmessage",
							type:'get',
							data:{'member_Id': "${LoginOK.member_Id}"},
							success: function(data){
								var count=0;
								var mail=$('span.num_mail');				
								if(data!=""){
								$('#header_email_dropdown_div').append('<ul class=" dropdown-menu " aria-labelledby="maildLabel"></ul>')
								$.each(data,function(){
									
									if(this[0]=='0'){
									$('#header_email_dropdown_div ul').append(
												'<li class="message_li_outer"><div class="chat_this_id_div" hidden="hidden">'+this[1]+'</div><div class="chat_this_name_div" hidden="hidden">'
												+this[2]+'</div>'
												+'<div class="row chatmessage"><div  class="col-xs-1 col-sm-1"></div>'
												+'<div  class="col-xs-1 col-sm-1 chat_icon_div"><i class="fa fa-comments-o o-chat" aria-hidden="true"></i></div>'
												+'<div  class="col-xs-1 col-sm-1"><img class="img-responsive" src="${this_contextPath}/images/members/'+this[1]+'.jpg"></div>'
												+'<div  class="col-xs-8 col-sm-8 div_chat_message">'
												+this[2]+'有對你留言</div></div><li>')							
										count++;
									}else if(this[0]=="2"){
										$('#header_email_dropdown_div ul').append(
												'<li><div class="addfid" hidden="hidden">'+this[1]+'</div><div class="addfname" hidden="hidden">'+this[2]+'</div>'
												+'<div class="row chatmessage_two"><div  class="col-xs-1 col-sm-1"></div>'
												+'<div  class="col-xs-1 col-sm-1 chat_icon_div"><i class="fa fa-user-plus o-chat" aria-hidden="true"></i></div>'
												+'<div  class="col-xs-1 col-sm-1"><a href="${this_contextPath}/PersonalJournal.jsp?'+this[1]+'">'
												+'<img class="img-responsive" src="${this_contextPath}/images/members/'+this[1]+'.jpg"></a></div>'
												+'<div  class="col-xs-6 col-sm-6 div_chat_message">'
												+this[2]+'想加你為好友</div>'
												+'<div  class="col-xs-3 col-sm-3 ">'
												+'<i class="fa fa-check check_fr_ok" aria-hidden="true"></i>'
												+'<i class="fa fa-times check_fr_No" aria-hidden="true"></i></div></div><li>')	
										count++;
									}else if(this[0]=="3"){
										$('#header_email_dropdown_div ul').append(
												'<li><div class="addfid" hidden="hidden">'+this[1]+'</div><div class="addfname" hidden="hidden">'+this[2]+'</div>'
												+'<div class="row chatmessage_two"><div  class="col-xs-1 col-sm-1"></div>'
												+'<div  class="col-xs-1 col-sm-1 chat_icon_div"><i class="fa fa-user-plus o-chat" aria-hidden="true"></i></div>'
												+'<div  class="col-xs-1 col-sm-1"><a href="${this_contextPath}/PersonalJournal.jsp?'+this[1]+'">'
												+'<img class="img-responsive" src="${this_contextPath}/images/members/'+this[1]+'.jpg"></a></div>'
												+'<div  class="col-xs-6 col-sm-6 div_chat_message">'
												+this[2]+'想加你為好友</div>'
												+'<div  class="col-xs-3 col-sm-3 ">'
												+'<i class="fa fa-check check_fr_ok" aria-hidden="true"></i>'
												+'<i class="fa fa-times check_fr_No" aria-hidden="true"></i></div></div><li>')
									}	
								})				
								if(mail.text()==""){
									if(count==0){
										mail.text('');
									}else{
										mail.text(count);
									}				
								}		
							}
								$('#header_email_dropdown_div').click(function(){
									$.ajax({
										url:"${this_contextPath}/CRFSERVICE/chatController/update_AddFriends_ChatStuts",
										type:'post',
										data:{'member_Id': "${LoginOK.member_Id}"},
										success: function(data){
														
											if(mail.text()!=""){
												var mail_text=parseInt(mail.text());
												 mail_text=mail_text-data
												 if(mail_text==0){
												 mail.text('')
												 }else{
												 mail.text(mail_text) 
												 }
											}	
										}
									})
								})	
								
						}
					})
						//點擊好友留言訊息跑出聊天室並-1
						$('body').on('click', '.message_li_outer', function () {
							 var thisid=$(this).find('.chat_this_id_div').text()
							 var thisName=$(this).find('.chat_this_name_div').text()
							 var mail=$('span.num_mail');
							 bodyappend(thisid,thisName);//用框架裡bodyappend 增加聊天室
							 IsReadThree(thisid)//用框架裡IsReadThree 增加已讀三則
							 if(mail.text()!=""){
									var mail_text=parseInt(mail.text());
									 mail_text=mail_text-1
									 if(mail_text==0){
									 mail.text('')
									 }else{
									 mail.text(mail_text) 
									 }
							}
							 $(this).remove();
                		});
					
					$('body').on('click', '.check_fr_ok', function () {
						  var whichthis = $(this);
						  var fid=$(this).parent().parent().siblings(".addfid").text()
						  var fname=$(this).parent().parent().siblings(".addfname").text()
						$.ajax({
							url:"${this_contextPath}/CRFSERVICE/friendships/acceptFriend",
							type:'post',
							data:{'member_Id': "${LoginOK.member_Id}",friend_Id:fid},
							success: function(data){				 
								 whichthis.parent().parent().parent().remove();
								$('#contact-list').append(
	                                	 '<li class="list-group-item">'
	                                	 +' <div class="col-xs-6 col-sm-2"><a href="${this_contextPath}/PersonalJournal.jsp?'+fid+'" >'
	                                	 +' <img src="${this_contextPath}/images/members/'+fid+'.jpg" class="img-responsive img-circle" />'
	                                	 +'</a></div>'
	                                	 +'<div class="col-xs-6 col-sm-3 friend_name_div">'
	                                	 +'<span class="name">'+fname+'</span>'
	                                	 +'</div>'
	                                	 +'<div class="col-xs-12 col-sm-7 freind_icon_div">'
	                                	 +'<span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title=""></span>'
	                                	 +'<span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title=""></span>'
	                                	 +'<span class="fa fa-comments text-muted c-info chat_icon_css" data-toggle="tooltip" title=""><span hidden="hidden">'+fid+'</span></span>'
	                                	 +'</div>'
	                                	 +'<div class="clearfix"></div>'
	                                	 +'</li> '	 
									) 
									
								var msg = JSON.stringify({'userID':"${LoginOK.member_Id}",'friendId':fid, 'type':'5','myName':"${LoginOK.nickname}"});  
						         ws.send(msg);
							}
							
						})
			        });
					
                    $('body').on('click', '.check_fr_No', function (e) {
                             var whichthis = $(this);
                             var fid=$(this).parent().parent().siblings(".addfid").text()
                             $.ajax({
     							url:"${this_contextPath}/CRFSERVICE/friendships/deleteFriend",
     							type:'post',
     							data:{'member_Id': "${LoginOK.member_Id}",friend_Id:fid},
     							success: function(data){             
							 whichthis.parent().parent().parent().remove();
							 
                            }
                          })
                     });
					
                  })
              
                 </script > 
                </c:if>              
        <!-- 好友區塊 結束-->
        
      
        <!-- 登入對話方塊 開始-->
        <div  class="container"> 
         <c:if test="${!empty LoginErrorMessage}">
            <script type="text/javascript"> 	 
               jQuery(function ($) {
                  
                        Custombox.open({
                            target: '#login-box',
                            effect: 'rotatedown'
                        });
                        $('#create_account').click(function () {	
                        	  Custombox.close('#login-box') 
                        }) 
                         $('.container_a_css').click(function () {	
                        	  Custombox.close('#login-box') 
                          })  
                                	 //google 開始
      	 
            gapi.load('auth2', function () {
                auth2 = gapi.auth2.init({
                    client_id: '826213451911-6rpb37oapsg46p3ao0mhv6ks9orcja5h.apps.googleusercontent.com',
                    cookiepolicy: 'single_host_origin',
                    scope: 'profile'
                });

                auth2.attachClickHandler( document.getElementById('googleSignIn'), {},
                  function (googleUser) {       	
                	 var ImageUrl;
                     if (googleUser.getBasicProfile().getImageUrl() == undefined) {
                         ImageUrl = null;
                     } else {
                         ImageUrl = googleUser.getBasicProfile().getImageUrl()
                     }
                      $.ajax({
           		          url:"${this_contextPath}/CRFSERVICE/memberController/Login",
           		          type:'post',  //get post put delete
           		          data:{nickname:googleUser.getBasicProfile().getName(),
           		        	  	e_mail:googleUser.getBasicProfile().getEmail(),
           		        	  	photoUrl:ImageUrl 
           		          },
           		          success:function(){
           		        	  location.href ='${pageContext.request.requestURI}';
           		          }          	 
           		      })
           		  
                  }, function (error) {       	  
                      console.log('Sign-in error', error);
                  }                    
                   );
            });     
      	 $("#googleSignIna").click(function(e){
    		 e.preventDefault(); 
    	 })  
    	 //google 結束
                });
       </script>
     </c:if >
     <c:if test="${empty LoginErrorMessage}">
       <script type="text/javascript">
       jQuery(function ($) {
      $('a.login-window').click( function (e) {
                    Custombox.open({
                        target: '#login-box',
                        effect: 'fall'
                    });
                    $('#create_account').click(function () {	
                    	  Custombox.close('#login-box') 
                    }) 
                    $('.container_a_css').click(function () {	
                        	  Custombox.close('#login-box') 
                         })     	 
      	 //google 開始	 
            gapi.load('auth2', function () {
                auth2 = gapi.auth2.init({
                    client_id: '826213451911-6rpb37oapsg46p3ao0mhv6ks9orcja5h.apps.googleusercontent.com',
                    cookiepolicy: 'single_host_origin',
                    scope: 'profile'
                });

                auth2.attachClickHandler( document.getElementById('googleSignIn'), {},
                  function (googleUser) {     	
                	 var ImageUrl;
                     if (googleUser.getBasicProfile().getImageUrl() == undefined) {
                         ImageUrl = null;
                     } else {
                         ImageUrl = googleUser.getBasicProfile().getImageUrl()
                     }
                      $.ajax({
           		          url:"${this_contextPath}/CRFSERVICE/memberController/Login",
           		          type:'post',  //get post put delete
           		          data:{nickname:googleUser.getBasicProfile().getName(),
           		        	  	e_mail:googleUser.getBasicProfile().getEmail(),
           		        	  	photoUrl:ImageUrl 
           		          },
           		          success:function(){
           		        	  location.href ='${pageContext.request.requestURI}';
           		          }          	 
           		      })
           		  
                  }, function (error) {       	  
                      console.log('Sign-in error', error);
                  }                    
                   );
            });     
      	 $("#googleSignIna").click(function(e){
    		 e.preventDefault(); 
    	 })  
    	 //google 結束
    	    e.preventDefault();
     }); 
    })
      </script>
        </c:if >
     </div>
   
<!--      <div class="col-lg-8 col-md-4  col-sm-6 col-xs-3"></div> -->
<div id="login-box" class="login-popup ">
		<form  name="member" class="form-login"
			action="${this_contextPath}/CRF/member!login.do" method="post">
			<div id="login_div">
				<h2 class="form-login-heading">登入</h2>
				<div class="login-wrap">
					<input required="required" type="email" name="memberVO.e_mail"
						class="form-control" placeholder="E-Mail" autofocus="autofocus"
						value="${param['memberVO.e_mail']}" /> <br /> <input
						required="required" type="password" name="memberVO.password"
						class="form-control" placeholder="Password"
						value="${param['memberVO.password']}" /> <label class="checkbox">
						<span class="pull-right"> <a data-toggle="modal"
							class="container_a_css" href="#myModal">需要協助?</a>
					</span>
					</label>
					<button name="member_action" class="btn btn-theme btn-block"
						type="submit" value="SIGN_IN">
						<i class="fa fa-lock"></i>SIGN IN
					</button>
					<div class="error_div">${LoginErrorMessage}</div>
					<hr />
					<div class="login-social-link centered">
						<div>
							<small>你也可以使用以下的社群網站登入</small>
						</div>
						<a id='fblogina' href='javascript: void(0);' title='login'
							onclick='javascript:fblogin();return false;'>
							<button class="btn btn-facebook">
								<i class="fa fa-facebook"></i>Facebook
							</button>
						</a> <span id="googleSignIna"><button id="googleSignIn"
								class="btn btn-google">
								<i class="fa fa-google-plus-square"></i>Google
							</button></span>
					</div>
					<div class="registration">
						Don't have an account yet?<br /> <a id="create_account"
							data-toggle="modal" class="container_a_css" href="#my_create">Create
							an account </a>
					</div>
				</div>
			</div>
		</form>
	</div>
<!-- 	<div class=" col-md-4 col-sm-2 col-xs-3"></div> -->

<!-- 登入對話方塊 結束-->
     	<!-- 忘記密碼需要協助方塊 開始-->
                 <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header login_header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Forgot Password ?</h4>
                            </div>
                            <div class="modal-body">
                                <p>請輸入你的信箱</p>
                                <input  type="text" name="email" placeholder="Email" autocomplete="off" class="form-control" />
                            </div>
                            <div class="modal-footer">
                                <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>                    
                                <button  class="btn btn-theme" type="button" >Submit</button>
                            </div>
                        </div>
                    </div>
                </div>              
                <!-- 忘記密碼需要協助方塊 結尾-->         
<!-- 註冊帳號 開始-->
		<form  name="member" class="form-login" action="${this_contextPath}/CRF/member!registered.do" method="post" >
                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="my_create" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header login_header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3 class="login_h3 modal-title">註冊</h3>
                            </div>
                            <div class="modal-body">
                                <p>請輸入暱稱&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.nickname_error}</span></p>
                                <input required="required" type="text" name="memberVO.nickname" placeholder="Name" autocomplete="off" class="form-control" value="${param['memberVO.nickname']}" />                                                
                                <p>請輸入信箱 &nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.e_mail_error}</span></p>
                                <input required="required" type="Email" name="mail" placeholder="Email" autocomplete="off" class="form-control" value="${param['mail']}"/>
                                 <p>請輸入密碼&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.password_error}</span></p>
                                <input required="required" type="password" name="memberVO.password" class="form-control" autocomplete="off" placeholder="Password" />
                                 <p>再次輸入密碼&nbsp&nbsp&nbsp<span style="color:red">${ErrorMessage.checkpassword_error}</span></p>
                                <input required="required" type="password" name="password"  class="form-control" autocomplete="off" placeholder="Password" />
                            </div>
                            <div class="modal-footer">
                             <h4 style="color:red;float:left" >${ErrorMessage.registered_error}</h4>
                                <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                                <button name="member_action" class="btn btn-theme" type="submit" value="INSERT_MEMBER">送出</button>                       
                            </div>
                        </div>
                    </div>
                </div>
                   <!-- 註冊帳號 結尾-->
		</form>
<!--  判斷註冊是否成功  開始-->
 <c:if test="${!empty ErrorMessage.registered_error}">
  <script type="text/javascript">
 $('#my_create').toggleClass('in').css({ 'display': 'block' }).modal();
  </script>
  </c:if>
<!--  火箭  -->
<div style="display:none;" id="rocket-to-top">
	<div style="opacity:0;display:block;" class="level-2"></div>
	<div class="level-3"></div>
</div>
<!--  判斷註冊是否成功  結束-->  
    <script type="text/javascript"> 
    var Islogin='${pageContext.request.queryString}'
		if(Islogin=='NoLogin'){
			Custombox.open({
                target: '#login-box',
                effect: 'rotate'
            });
	      	 //google 開始	      	 
            gapi.load('auth2', function () {
                auth2 = gapi.auth2.init({
                    client_id: '826213451911-6rpb37oapsg46p3ao0mhv6ks9orcja5h.apps.googleusercontent.com',
                    cookiepolicy: 'single_host_origin',
                    scope: 'profile'
                });
                auth2.attachClickHandler( document.getElementById('googleSignIn'), {},
                  function (googleUser) {
       	
                	 var ImageUrl;
                     if (googleUser.getBasicProfile().getImageUrl() == undefined) {
                         ImageUrl = null;
                     } else {
                         ImageUrl = googleUser.getBasicProfile().getImageUrl()
                     }
                      $.ajax({
           		          url:"${this_contextPath}/CRFSERVICE/memberController/Login",
           		          type:'post',  //get post put delete
           		          data:{nickname:googleUser.getBasicProfile().getName(),
           		        	  	e_mail:googleUser.getBasicProfile().getEmail(),
           		        	  	photoUrl:ImageUrl 
           		          },
           		          success:function(){
           		        	  location.href ='${pageContext.request.requestURI}';
           		          }          	 
           		      })
           		  
                  }, function (error) {       	  
                      console.log('Sign-in error', error);
                  }                    
                   );
            });     
      	 $("#googleSignIna").click(function(e){
    		 e.preventDefault(); 
    	 })  
    	 //google 結束
		}
    
    //fb javascript 開始
    function fblogin(){     // facebook 登入
               FB.login(function(response){
            	 
                   if (response.authResponse){// 登入成功             	
                   			FB.api('/me', { fields: 'name,email,picture' }, function (response) {     
                   		           $.ajax({
                   		          url:"${this_contextPath}/CRFSERVICE/memberController/Login",
                   		          type:'post',  //get post put delete
                   		          data:{nickname:response.name,
                   		        	  	e_mail:response.email,
                   		        	  	photoUrl: response.picture.data.url 
                   		          },
                   		          success:function(data){
                  		        	  location.href ='${pageContext.request.requestURI}';
                  		      $('aside').append('<img src="'+data+'">')
                   		          }          	 
                   		      })
                   	 })
               } else{ // 登入失敗
           alert('登入失敗。');
           }
           },{       
               scope:'email'
           });
           }	
      	 $("#fblogina").click(function(e){
    		 e.preventDefault(); 
    	 })  	     
      	 //fb javascript 結束 
     	
      jQuery(function ($) {	      	        
            $("#menu-toggle").click(function () {//點擊左上角小圖 
                $("#wrapper").addClass("toggled");//讓清單加入class toggled 使其寬度由0增加到235px 呈現由左到右效果 
                $('body').append('<div id="list_mask"></div>');//產成id=list_mask的div元素加在整塊body中
                $('#list_mask').fadeIn(500);//黑屏由右淡入
                //清單隱藏 左右遮蔽
                $('#list_mask').bind('click', function () {//點擊黑屏部分
                    $("#wrapper").removeClass("toggled");//移除清單class toggled 使其寬度變為0 呈現由右到左效果
                    $('#list_mask').css({ 'animation': 'bounce2 0.5s' })//黑屏設定動畫bounce2 呈現由左到右效果
                    .fadeOut(300, function () {//黑屏淡出
                    	$(this).remove();//黑屏移除
                    });
                    return false;
                });
            });
            //登入顯示       
            //------------------------------------------------------------
            //左側清單下拉功能
            $('.sidebar-nav>li').click(function () {
                if ($(this).find('ul').css('display') == 'block') {
                    $(this).find('ul').slideUp(400);
                    $(this).find('div').removeClass('dropup').addClass('dropdown')
                }
            })
            $('.sidebar-nav>li').bind('click', function () {//下拉選項
                if ($(this).find('ul').css('display') == 'none') {
                    $('.sidebar-nav>li').find('ul').slideUp(400)
                    $('.sidebar-nav>li').find('div').removeClass('dropup').addClass('dropdown')
                    $(this).find('ul').slideDown(400);
                    $(this).find('div').removeClass('dropdown').addClass('dropup')
                }
            })
        });
</script>
    

