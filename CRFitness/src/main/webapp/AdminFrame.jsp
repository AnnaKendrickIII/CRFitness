<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
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
     <!-- Bootstrap Core JavaScript -->
    <script src="${this_contextPath}/js/jquery-2.2.4.min.js"></script>  

    <script src="${this_contextPath}/js/jquery-ui.min.js"></script>	
    <script src="${this_contextPath}/js/custombox.js"></script>	
    <script src="${this_contextPath}/js/legacy.js"></script>	
      <script src="${this_contextPath}/js/lrtk.js"></script>	
      <!-- GoogleLogin-->   
    <script src="https://apis.google.com/js/platform.js"></script>	
    <!-- FBLogin JavaScript -->

    <!-- 左側清單 開始 -->
    <div id="wrapper">
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">           
                <li class="sidebar-brand">
                     <span>
<!-- 這裡要改 --> 	    <a href="${this_contextPath}/Admin.jsp" >                               
                        <i class="fa fa-home fa-2x "></i>                                
                    </a>
                   </span>
                </li>            
                <li>
                    <div class="dropdown">    
<!-- 這裡要改 -->         <a href="#"><i class="fa fa-book"></i>維護日誌<span class="caret"></span></a>
                        <ul class="wrapper_dropdown_ul">
<!-- 這裡要改 -->             <li><a href="${this_contextPath}/Journal.jsp">維護健康日誌</a></li>
<!-- 這裡要改 -->             <li><a href="${this_contextPath}/PersonalJournal.jsp?${LoginOK.member_Id}">維護個人日誌</a></li>
                            <li><a href="#">累積紀錄</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="dropdown">
<!-- 這裡要改 -->          <a href="#"  class="dropdown-toggle"><i class="fa fa-shopping-cart"></i>維護商品<span class="caret"></span></a>
                        <ul class="wrapper_dropdown_ul">
<!-- 這裡要改 -->             <li><a href="${this_contextPath}/Maintenance/MaintainEquipment.jsp">維護運動器材</a></li>
<!-- 這裡要改 -->             <li><a href="${this_contextPath}/Maintenance/MaintainClothing.jsp">維護服飾類</a></li>
<!-- 這裡要改 -->             <li><a href="${this_contextPath}/Maintenance/MaintainAccessories.jsp">維護運動用品</a></li>
<!-- 這裡要改 -->             <li><a href="${this_contextPath}/Maintenance/MaintainShoes.jsp">維護鞋類</a></li>
                        </ul>
                    </div>
                </li>
                <li>  
<!-- 這裡要改 -->     <a href="${this_contextPath}/activitys.jsp"><i class="fa fa-users" ></i>維護揪團專區</a>                </li>             
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
    <header class="header_css">
        <div class="row">
            <div class="btn-toolbar col-xs-5">
                <div class="btn-group ">    
                    <a href="#menu-toggle" id="menu-toggle">
                         <i id="header_list" class="fa fa-bars fa-2x" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <div class="col-xs-3">
                <img  class="img-responsive logo_css" src="${this_contextPath}/images/logo.png">
            </div>
            
            <div class="col-xs-4">
                <i id="header_email" class="fa fa-envelope fa-2x" ></i> 
                <c:choose>
                <c:when test="${! empty LoginOK }">
               	<div class="user_login_div dropdown">
                        <a id="dLabel" data-target="#"  data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img id="user_btn" src="${this_contextPath}/CRFSERVICE/memberController/photo/${LoginOK.member_Id}" class="img-responsive user_login_css " /></a>
                        <ul class="user_login_down_div dropdown-menu " aria-labelledby="dLabel">                          
                            <li><a href="${this_contextPath}/PersonalJournal.jsp?${LoginOK.member_Id}">${LoginOK.nickname}&nbsp個人日誌</a></li>
                            <li><a data-toggle="modal" class="container_a_css" href="#myfriend">好友</a></li> 
                            <li><a data-toggle="modal" class="container_a_css" href="#myactivitys">揪團紀錄</a></li>  
                            <li><a href="${this_contextPath}/Logout/logout.jsp" >登出</a></li>                        
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
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myfriend" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header friend_header ">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h2 class="modal-title">${LoginOK.nickname}的好友</h2>
                            </div>
                            <div class="modal-body">
                                <div id="show">                 
						<table class="friend_table">
							<thead>
								<tr>
						<th></th>
						<th>Name</th>
						<th>Email</th>
						<th></th>
						<th></th>
								</tr>
							</thead>
							<tbody id="friend_tbody">
						</tbody>
					</table>
						</div>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
                 <script type="text/javascript">
                     $(function () {
                         $.ajax({
                             url:"${this_contextPath}/CRFSERVICE/friendships/${LoginOK.member_Id}",
                             type:'get',  //get post put delete
                             data:{},
                             success:function(data){
                                 $.each(data,function(){
                                     $('#friend_tbody').append('<tr><td><a href="${this_contextPath}/PersonalJournal.jsp?'+this.member_Id+'" ><img src="data:image/png;base64,'+this.photo+'" class="img-circle friend_photo" alt="Responsive image" /></a><td class="friend_Name">'+  this.nickname +'</td><td>'+  this.e_mail +'</td>')  
                                 })
                             }          	 
                         })
                     })
                 </script > 
                </c:if>              
        <!-- 好友區塊 結束-->
        
        <!-- 揪團區塊 開始-->
    <c:if test="${! empty LoginOK }">
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myactivitys" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header friend_header ">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h2 class="modal-title">${LoginOK.nickname}的揪團紀錄</h2>
                            </div>
                            <div class="modal-body">
                                <div id="show">                 
					<table class="myactivity_create">
						<thead>
								<tr>
						<th></th>
						<th>建立的揪團</th>
						<th></th>
						<th></th>
						<th></th>
								</tr>
						</thead>
						<tbody id="myactivity_create_tbody">
						</tbody>
					</table>
					
					<table class="myactivity_join">
							<thead>
								<tr>
						<th></th>
						<th>參與的揪團</th>
						<th></th>
						<th></th>
						<th></th>
								</tr>
						</thead>
							<tbody id="myactivity_join_friend_tbody">
						</tbody>
					</table>
						</div>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
                 <script type="text/javascript">
                     $(function () {
                         $.ajax({
                             url:"${this_contextPath}/CRFSERVICE/activitysController/${LoginOK.member_Id}",
                             type:'get',  //get post put delete
                             data:{},
                             success:function(data){
                                 $.each(data,function(){
                                     $('#myactivity_create_tbody').append('<tr><td><a href="${this_contextPath}/activitydetail.jsp?'+this.member_Id+'" ><img src="data:image/png;base64,'+this[0].photo1+'" class="img-circle friend_photo" alt="Responsive image" /></a><td class="myactivity_class">'+  this[0].activity_Class +'</td><td>'+  this[0].activity_Area +'</td>')  
                                 })
                             }          	 
                         })
                     })
                 </script > 
                </c:if>              
        <!-- 揪團區塊 結束-->
        
        <!-- 登入對話方塊 開始-->
        <div  class="container"> 
         <c:if test="${!empty LoginErrorMessage}">
            <script type="text/javascript"> 	 
                $(function () {
                  
                        Custombox.open({
                            target: '#login-box',
                            effect: 'door'
                        });
                        $('#create_account').click(function () {	
                        	  Custombox.close('#login-box') 
                        }) 
                         $('.container_a_css').click(function () {	
                        	  Custombox.close('#login-box') 
                          })     
                });
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
		<form  name="member" class="form-login" action="${this_contextPath}/CRF/member!registered.action" method="post" >
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
  
<div style="display:none;" id="rocket-to-top">
	<div style="opacity:0;display:block;" class="level-2"></div>
	<div class="level-3"></div>
</div>
<!-- bootstrap.min.js  開始-->
  <script src="${this_contextPath}/js/bootstrap.min.js"></script>
<!--  判斷註冊是否成功  結束-->  
    <script type="text/javascript"> 
   
            //登入顯示
          jQuery(function($){
            
//             $('a.login-window').click(function () {//點擊右上角人頭小圖示
//                 var loginBox = $(this).attr('href');//讀取$('a.login-window')屬性href的值存入loginBox變數裡
                
                $('a.login-window').on('click', function (e) {
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
                    e.preventDefault();
                });

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
    
