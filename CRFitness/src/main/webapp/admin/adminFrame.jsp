<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="this_contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>AdminFrame</title>
	
	<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
    <!-- Bootstrap core CSS -->
    <link href="${this_contextPath}/admin/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
<!--     <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" /> -->
    <link href="${this_contextPath}/admin/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${this_contextPath}/admin/assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="${this_contextPath}/admin/assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="${this_contextPath}/admin/assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="${this_contextPath}/admin/assets/css/style.css" rel="stylesheet">
    <link href="${this_contextPath}/admin/assets/css/style-responsive.css" rel="stylesheet">
	<!-- upload files -->
	<link href="${this_contextPath}/admin/assets/css/fine-uploader-new.css" rel="stylesheet" />
	<!-- switch button -->
	<link rel="stylesheet" type="text/css" href="${this_contextPath}/admin/assets/css/jquery.easyswitch.css" />
	<!-- search button -->
	<link rel="stylesheet" type="text/css" href="${this_contextPath}/admin/assets/css/expandingsearch.css" />
	<!-- login dialog -->
	<link rel="stylesheet" type="text/css" href="${this_contextPath}/admin/assets/css/custombox.css" />
	
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- js placed at the end of the document so the pages load faster -->
<!--     <script src="assets/js/jquery.js"></script> -->
    <script src="${this_contextPath}/admin/assets/js/jquery-1.8.3.min.js"></script>
    <script src="${this_contextPath}/admin/assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="${this_contextPath}/admin/assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="${this_contextPath}/admin/assets/js/jquery.scrollTo.min.js"></script>
    <script src="${this_contextPath}/admin/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${this_contextPath}/admin/assets/js/jquery.sparkline.js"></script>

    <script src="${this_contextPath}/admin/assets/js/chart-master/Chart.js"></script>

    <!--common script for all pages-->
    <script src="${this_contextPath}/admin/assets/js/common-scripts.js"></script>
    <script type="text/javascript" src="${this_contextPath}/admin/assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="${this_contextPath}/admin/assets/js/gritter-conf.js"></script>

    <!--script for this(Index) page-->
    <script src="${this_contextPath}/admin/assets/js/sparkline-chart.js"></script>    
	<script src="${this_contextPath}/admin/assets/js/zabuto_calendar.js"></script>	

	<!-- upload files -->
	<script src="${this_contextPath}/admin/assets/js/jquery.fine-uploader.js"></script>
	<!-- switch button -->
	<script type="text/javascript" src="${this_contextPath}/admin/assets/js/jquery.easyswitch.js"></script>
	<!-- search button -->
    <script src="${this_contextPath}/admin/assets/js/jquery.searcher.js"></script>
    <script src="${this_contextPath}/admin/assets/js/search.custom.js"></script>
    <script src="${this_contextPath}/admin/assets/js/search.classie.js"></script>
	<script src="${this_contextPath}/admin/assets/js/search.uisearch.js"></script>
	<!-- login dialog -->
	<script src="${this_contextPath}/admin/assets/js/custombox.js"></script>
	
	<style>
 	.alv-primary { 
 		color: #fff; 
 		background-color: #00b3a3; 
 		border-color: #357edb;
 	} 
 	
 	.alv-secondary { 
 		color: #fff; 
 		background-color: #b18f6a; 
 		border-color: #357edb;
 		border: #A67A6F;
 	}
 	
 	.pagination > li > a, .pagination > li > span {
 		color: #00b3a3;
 	}
 	
 	.pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
 		background-color: #00b3a3;
		border-color: #00b3a3;
 	}
	</style>
	
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="${this_contextPath}/admin/adminIndex.jsp" class="logo"><b>C.R.F<small>itness</small> Administration</b></a>
            <!--logo end-->
<!--             <div class="nav notify-row" id="top_menu"> -->
<!--                  notification start -->
<!--                 <ul class="nav top-menu"> -->
<!--                     settings start -->
<!--                     <li class="dropdown"> -->
<%--                         <a data-toggle="dropdown" class="dropdown-toggle" href="${this_contextPath}/admin/adminIndex.jsp"> --%>
<!--                             <i class="fa fa-tasks"></i> -->
<!--                             <span class="badge bg-theme">4</span> -->
<!--                         </a> -->
<!--                         <ul class="dropdown-menu extended tasks-bar"> -->
<!--                             <div class="notify-arrow notify-arrow-green"></div> -->
<!--                             <li> -->
<!--                                 <p class="green">You have 4 pending tasks</p> -->
<!--                             </li> -->
<!--                             <li> -->
<%--                                 <a href="${this_contextPath}/admin/adminIndex.jsp"> --%>
<!--                                     <div class="task-info"> -->
<!--                                         <div class="desc">DashGum Admin Panel</div> -->
<!--                                         <div class="percent">40%</div> -->
<!--                                     </div> -->
<!--                                     <div class="progress progress-striped"> -->
<!--                                         <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%"> -->
<!--                                             <span class="sr-only">40% Complete (success)</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </a> -->
<!--                             </li> -->
<!--                             <li> -->
<%--                                 <a href="${this_contextPath}/admin/adminIndex.jsp"> --%>
<!--                                     <div class="task-info"> -->
<!--                                         <div class="desc">Database Update</div> -->
<!--                                         <div class="percent">60%</div> -->
<!--                                     </div> -->
<!--                                     <div class="progress progress-striped"> -->
<!--                                         <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%"> -->
<!--                                             <span class="sr-only">60% Complete (warning)</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </a> -->
<!--                             </li> -->
<!--                             <li> -->
<%--                                 <a href="${this_contextPath}/admin/adminIndex.jsp"> --%>
<!--                                     <div class="task-info"> -->
<!--                                         <div class="desc">Product Development</div> -->
<!--                                         <div class="percent">80%</div> -->
<!--                                     </div> -->
<!--                                     <div class="progress progress-striped"> -->
<!--                                         <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%"> -->
<!--                                             <span class="sr-only">80% Complete</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </a> -->
<!--                             </li> -->
<!--                             <li> -->
<%--                                 <a href="${this_contextPath}/admin/adminIndex.jsp"> --%>
<!--                                     <div class="task-info"> -->
<!--                                         <div class="desc">Payments Sent</div> -->
<!--                                         <div class="percent">70%</div> -->
<!--                                     </div> -->
<!--                                     <div class="progress progress-striped"> -->
<!--                                         <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%"> -->
<!--                                             <span class="sr-only">70% Complete (Important)</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </a> -->
<!--                             </li> -->
<!--                             <li class="external"> -->
<!--                                 <a href="#">See All Tasks</a> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </li> -->
<!--                     settings end -->
<!--                     inbox dropdown start -->
<!--                     <li id="header_inbox_bar" class="dropdown"> -->
<%--                         <a data-toggle="dropdown" class="dropdown-toggle" href="${this_contextPath}/admin/adminIndex.jsp"> --%>
<!--                             <i class="fa fa-envelope-o"></i> -->
<!--                             <span class="badge bg-theme">5</span> -->
<!--                         </a> -->
<!--                         <ul class="dropdown-menu extended inbox"> -->
<!--                             <div class="notify-arrow notify-arrow-green"></div> -->
<!--                             <li> -->
<!--                                 <p class="green">You have 5 new messages</p> -->
<!--                             </li> -->
<!--                             <li> -->
<%--                                 <a href="${this_contextPath}/admin/adminIndex.jsp"> --%>
<!--                                     <span class="photo"><img alt="avatar" src="assets/img/ui-zac.jpg"></span> -->
<!--                                     <span class="subject"> -->
<!--                                     <span class="from">Zac Snider</span> -->
<!--                                     <span class="time">Just now</span> -->
<!--                                     </span> -->
<!--                                     <span class="message"> -->
<!--                                         Hi mate, how is everything? -->
<!--                                     </span> -->
<!--                                 </a> -->
<!--                             </li> -->
<!--                             <li> -->
<%--                                 <a href="${this_contextPath}/admin/adminIndex.jsp"> --%>
<!--                                     <span class="photo"><img alt="avatar" src="assets/img/ui-divya.jpg"></span> -->
<!--                                     <span class="subject"> -->
<!--                                     <span class="from">Divya Manian</span> -->
<!--                                     <span class="time">40 mins.</span> -->
<!--                                     </span> -->
<!--                                     <span class="message"> -->
<!--                                      Hi, I need your help with this. -->
<!--                                     </span> -->
<!--                                 </a> -->
<!--                             </li> -->
<!--                             <li> -->
<%--                                 <a href="${this_contextPath}/admin/adminIndex.jsp"> --%>
<!--                                     <span class="photo"><img alt="avatar" src="assets/img/ui-danro.jpg"></span> -->
<!--                                     <span class="subject"> -->
<!--                                     <span class="from">Dan Rogers</span> -->
<!--                                     <span class="time">2 hrs.</span> -->
<!--                                     </span> -->
<!--                                     <span class="message"> -->
<!--                                         Love your new Dashboard. -->
<!--                                     </span> -->
<!--                                 </a> -->
<!--                             </li> -->
<!--                             <li> -->
<%--                                 <a href="${this_contextPath}/admin/adminIndex.jsp"> --%>
<!--                                     <span class="photo"><img alt="avatar" src="assets/img/ui-sherman.jpg"></span> -->
<!--                                     <span class="subject"> -->
<!--                                     <span class="from">Dj Sherman</span> -->
<!--                                     <span class="time">4 hrs.</span> -->
<!--                                     </span> -->
<!--                                     <span class="message"> -->
<!--                                         Please, answer asap. -->
<!--                                     </span> -->
<!--                                 </a> -->
<!--                             </li> -->
<!--                             <li> -->
<%--                                 <a href="${this_contextPath}/admin/adminIndex.jsp">See all messages</a> --%>
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </li> -->
<!--                     inbox dropdown end -->
<!--                 </ul> -->
<!--                  notification end -->
<!--             </div> 115 <div class="nav notify-row" id="top_menu"> -->
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li id="admin_logout"><a class="logout" href="${this_contextPath}/admin/adminLogout.jsp">Logout</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
             	<c:if test="${! empty adminOK }">  	  
             		<script type="text/javascript">
             			$('.sidebar-menu').prepend('<p class="centered"><a href="${this_contextPath}/admin/adminIndex.jsp"><img src="${this_contextPath}/CRFSERVICE/memberController/photo/${adminOK.member_Id}" class="img-circle" width="60"></a></p>'
         	 			+'<h5 class="centered">${adminOK.nickname}</h5>')
             		</script >
              	</c:if>
                  <li class="mt">
                      <a class="active" href="${this_contextPath}/admin/adminIndex.jsp">
                          <i class="fa fa-dashboard"></i>
                          <span><strong>主控台</strong></span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-book"></i>
                          <span><strong>維護健康日誌</strong></span>
                      </a>
                       <ul class="sub">
                          <li><a href="adminJournals.jsp">健康日誌</a></li>
                      </ul>                      
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-shopping-cart"></i>
                          <span><strong>維護商品專區</strong></span>
                      </a>
                      <ul class="sub">
                          <li><a href="adminProducts.jsp?category=cmens-tops&page=1">上裝</a></li>
                          <li><a href="adminProducts.jsp?category=cmens-bottoms&page=1">下裝</a></li>
                          <li><a href="adminProducts.jsp?category=cmens-accessories&page=1">配件</a></li>
                          <li><a href="adminProducts.jsp?category=cmens-footwear&page=1">鞋類</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-users"></i>
                          <span><strong>維護揪團專區</strong></span>
                      </a>
                       <ul class="sub">
                          <li><a href="adminActivities.jsp">揪團專區</a></li>
                      </ul>                      
                  </li>
                  
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="li_user"></i>
                          <span><strong>維護會員資訊</strong></span>
                      </a>
                       <ul class="sub">
                          <li><a href="adminMembers.jsp">會員資訊</a></li>
                      </ul>
                  </li>
                  
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="li_banknote" aria-hidden="true"></i>
                          <span><strong>維護訂單專區</strong></span>
                      </a>
                      <ul class="sub">
                          <li><a href="adminOrders.jsp">訂單專區</a></li>
                      </ul>
                  </li>

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
<!-- 登入對話方塊   開始 -->   
    <c:if test="${empty adminOK}">
      	<script type="text/javascript"> 	 
        	$(function () {
            	Custombox.open({
                	target: '#login-box',
                    effect: 'Sign'
                });
                console.log('success');
                $('.okay').click(function () {	
                	Custombox.close('#login-box') 
                }) 
            });
       	</script>

	<div id="login-box" class="login-popup">
		<form name="member" class="form-login"
			action="${this_contextPath}/CRF/member!loginAdmin.do" method="post">
			<div id="login_div">
				<h2 class="form-login-heading">Administration</h2>
				<div class="login-wrap">
					<input required="required" type="email" name="memberVO.e_mail"
						class="form-control" placeholder="E-Mail" autofocus="autofocus"
						value="${param['memberVO.e_mail']}" /> <br /> 
					<input required="required" type="password" name="memberVO.password"
						class="form-control" placeholder="Password"
						value="${param['memberVO.password']}" /> 
					<label class="checkbox">
					</label>
					<button name="member_action" class="btn btn-theme btn-block okay"
						    type="submit" value="SIGN_IN">
							<i class="fa fa-lock"></i>&nbsp;&nbsp;SIGN IN
					</button>
					<div class="error_div">${adminLoginError}</div>
				</div>
			</div>
		</form>
	</div> <!-- end 357 -->
	</c:if > <!-- end 307 -->
<!-- 登入對話方塊   結束 -->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->

      <!--main content end-->
      <!-- footer start -->
<!--       <footer class="site-footer"> -->
<!--           <div class="text-center"> -->
<!--               2016 - C.R.Fitness Co., Ltd. -->
<!--               <a href="${this_contextPath}/admin/adminIndex.jsp" class="go-top"> -->
<!--                   <i class="fa fa-angle-up"></i> -->
<!--               </a> -->
<!--           </div> -->
<!--       </footer> -->
      <!-- footer end -->
  </section> <!-- 75 <section id="container" > -->		
<!-- 每頁不同內容   結束 -->

	<script type="text/javascript">
//         $(document).ready(function () {
//         var unique_id = $.gritter.add({
//             // (string | mandatory) the heading of the notification
//             title: 'Welcome to Dashgum!',
//             // (string | mandatory) the text inside the notification
//             text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo. Free version for <a href="http://blacktie.co" target="_blank" style="color:#ffd777">BlackTie.co</a>.',
//             // (string | optional) the image to display on the left
//             image: 'assets/img/ui-sam.jpg',
//             // (bool | optional) if you want it to fade out on its own or just sit there
//             sticky: true,
//             // (int | optional) the time you want it to be alive for before fading out
//             time: '',
//             // (string | optional) the class name you want to apply to that specific message
//             class_name: 'my-sticky-class'
//         });

//         return false;
//         });
	</script>

	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>
    <c:if test="${!empty adminOK}">
  <script type="text/javascript">
  
  var userID = '${adminOK.member_Id}';
  var ws = new WebSocket('ws://' + window.location.host + '${this_contextPath}/CRFSERVICE/echo');
  ws.onerror = function(event)
  {
  	alert(event);
  };

  ws.onopen = function(event) 
  {
  	 var msg = JSON.stringify({'userID':userID, 'type':'0'});  
       ws.send(msg);   
  };
   
  ws.onclose = function(event) { 
      var msg = JSON.stringify({'userID':userID, 'type':'3'});//3  關  
      ws.send(msg);
  }; 
  ws.onmessage = function(event) {
	  
  }
  $('body').on('click','#admin_logout',function(){
	  var msg = JSON.stringify({'userID':userID, 'type':'3'});//3  關  
      ws.send(msg);
  })
  $('body').on('click','.notifaction_Submit',function(){
	  
	  var val=$('#notifactionMessage').val();
	  val = val.replace(/\r?\n/g, '</br> ');
	  var msg = JSON.stringify({'userID':userID,'type':'6','notifaction':val});//3  關  
      ws.send(msg);
      $('#notifactionMessage').val('');
      $('#notifaction').modal('hide');
  })
  </script> 
  </c:if>
  </body>
</html>
