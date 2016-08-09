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

    <title>C.R.Fitness 管理者系統</title>
<style type="text/css">

</style>	
    <jsp:include page="/admin/adminFrame.jsp"/>
    	
  </head>

  <body>
<!-- 每頁不同內容   開始 -->
  <section id="container" >
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">

              <div class="row">
                  <div class="col-lg-9 main-chart">
                  
                  	<div class="row mtbox">
                  		<div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                  			<div class="box1">
					  			<span class="li_like"></span>
					  			<h3>+ ${tatalMems}</h3>
                  			</div>
					  			<p>${tatalMems} 位會員喜歡您的網站！</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="li_photo"></span>
					  			<h3>+ ${tatalActs}</h3>
                  			</div>
					  			<p>目前有 ${tatalActs} 個新揪團活動</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="li_truck"></span>
					  			<h3>+ ${totalShips}</h3>
                  			</div>
					  			<p>目前有 ${totalShips} 件商品等待出貨</p>
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="li_note"></span>
					  			<h3>+ ${totalJons}</h3>
                  			</div>
					  			<p>目前有 ${totalJons} 篇新的健康日誌</p>
                  		</div>
                  		<a data-toggle="modal" class="col-md-2 col-sm-2 box0" href="#notifaction">
                  			<div class="box1">
					  			<span class="li_megaphone"></span>
					  			<h3>PUSH</h3> <!-- <span class="badge bg-theme">1</span> -->
                  			</div>	  			
                  		</a>	
                  	</div> <!-- 33 row mtbox -->
                  	
<!--                   	公告開始	 -->
                   <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="notifaction" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header notifaction_modal_header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3 class="modal-title">公   告   訊   息</h3>
                            </div>
                            <div class="modal-body">
                                <textarea   id="notifactionMessage" placeholder="公告訊息"  class="form-control" >
                           		</textarea>
                            </div>
                            <div class="modal-footer">
                                <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>                    
                                <button class="btn alv-secondary submit_Notice_btn" type="button">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
<!--                   	公告結束	 -->
                  
                 <!-- PANEL STARTS -->     
                      <div class="row mt"> <!-- FIRST ROW -->
                      
                      <!-- SERVER STATUS PANELS -->
                      	<div class="col-md-4 col-sm-4 mb">
                      		<div class="white-panel pn donut-chart">
                      			<div class="white-header">
						  			<h5>SERVER LOAD</h5>
                      			</div>
								<div class="row">
									<div class="col-sm-6 col-xs-6 goleft">
										<p><i class="fa fa-database"></i> 70%</p>
									</div>
	                      		</div>
								<canvas id="serverstatus01" height="120" width="120"></canvas>
								<script>
									var doughnutData = [
											{
												value: 70,
												color:"#68dff0"
											},
											{
												value : 30,
												color : "#fdfdfd"
											}
										];
										var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
								</script>
	                      	</div>
                      	</div><!-- /col-md-4-->
                      	
                      	
						<div class="col-md-4 col-sm-4 mb">
							<!-- REVENUE PANEL -->
							<div class="darkblue-panel pn">
								<div class="darkblue-header">
									<h5>收益</h5>
								</div>
								<div class="chart mt">
									<div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,464,655]"></div>
								</div>
								<p class="mt"><b>NT$ 817,980</b><br/>月收入</p>
							</div>
						</div><!-- /col-md-4 -->

                      	
						<div class="col-md-4 mb">
							<!-- WHITE PANEL - TOP USER -->
							<div class="white-panel pn">
								<div class="white-header">
									<h5><strong>頂級會員</strong></h5>
								</div>
								<p><img src="${this_contextPath}/images/members/member1011.jpg" class="img-circle" width="80"></p>
								<p><b>Rose</b></p>
								<div class="row">
									<div class="col-md-6">
										<p class="small mt">MEMBER SINCE</p>
										<p>2012</p>
									</div>
									<div class="col-md-6">
										<p class="small mt">TOTAL SPEND</p>
										<p>$ 27,260</p>
									</div>
								</div>
							</div>
						</div><!-- /col-md-4 -->
						
                    </div> <!-- END FIRST ROW -->
                    
                    
					<div class="row"> <!-- SECOND ROW -->

						<div class="col-lg-4 col-md-4 col-sm-4 mb">
							<div class="content-panel pn">
								<div id="profile-04">
								</div>
								<div class="pr2-social centered">
									<h5><strong>熱門日誌&nbsp;&nbsp;&nbsp;<i class="fa fa-comment"></i>6 | <i class="fa fa-heart"></i>9</strong></h5>
								</div>
							</div> <!--/panel -->
						</div> <!--/ col-md-4 -->
						
						<div class="col-lg-4 col-md-4 col-sm-4 mb">
							<div class="content-panel pn">
								<div id="profile-03">
								</div>
								<div class="pr2-social centered">
									<h5><strong>熱門揪團&nbsp;&nbsp;&nbsp;<i class="fa fa-user"></i>Jason</strong></h5>
								</div>
							</div> <!--/panel -->
						</div> <!--/ col-md-4 -->
						
						<div class="col-lg-4 col-md-4 col-sm-4 mb">
							<div class="product-panel-2 pn">
								<div class="badge badge-hot">HOT</div>
								<img src="${this_contextPath}/images/products/prodDetail5020_1.png" width="125" alt="">
								<h5 class="mt">男子UA Curry 2.5籃球鞋</h5>
								<h6>單價：NT$3,650</h6>
								<button class="btn btn-small btn-theme04">熱銷商品</button>
							</div>
						</div> <!--/col-md-4 -->						
						
						
					</div> <!-- END SECOND ROW -->
					
					
<!-- 					<div class="row mt"> -->
<!--                       CUSTOM CHART START -->
<!--                       <div class="border-head"> -->
<!--                           <h3>VISITS</h3> -->
<!--                       </div> -->
<!--                       <div class="custom-bar-chart"> -->
<!--                           <ul class="y-axis"> -->
<!--                               <li><span>10.000</span></li> -->
<!--                               <li><span>8.000</span></li> -->
<!--                               <li><span>6.000</span></li> -->
<!--                               <li><span>4.000</span></li> -->
<!--                               <li><span>2.000</span></li> -->
<!--                               <li><span>0</span></li> -->
<!--                           </ul> -->
<!--                           <div class="bar"> -->
<!--                               <div class="title">JAN</div> -->
<!--                               <div class="value tooltips" data-original-title="8.500" data-toggle="tooltip" data-placement="top">85%</div> -->
<!--                           </div> -->
<!--                           <div class="bar "> -->
<!--                               <div class="title">FEB</div> -->
<!--                               <div class="value tooltips" data-original-title="5.000" data-toggle="tooltip" data-placement="top">50%</div> -->
<!--                           </div> -->
<!--                           <div class="bar "> -->
<!--                               <div class="title">MAR</div> -->
<!--                               <div class="value tooltips" data-original-title="6.000" data-toggle="tooltip" data-placement="top">60%</div> -->
<!--                           </div> -->
<!--                           <div class="bar "> -->
<!--                               <div class="title">APR</div> -->
<!--                               <div class="value tooltips" data-original-title="4.500" data-toggle="tooltip" data-placement="top">45%</div> -->
<!--                           </div> -->
<!--                           <div class="bar"> -->
<!--                               <div class="title">MAY</div> -->
<!--                               <div class="value tooltips" data-original-title="3.200" data-toggle="tooltip" data-placement="top">32%</div> -->
<!--                           </div> -->
<!--                           <div class="bar "> -->
<!--                               <div class="title">JUN</div> -->
<!--                               <div class="value tooltips" data-original-title="6.200" data-toggle="tooltip" data-placement="top">62%</div> -->
<!--                           </div> -->
<!--                           <div class="bar"> -->
<!--                               <div class="title">JUL</div> -->
<!--                               <div class="value tooltips" data-original-title="7.500" data-toggle="tooltip" data-placement="top">75%</div> -->
<!--                           </div> -->
<!--                       </div> -->
                      <!--custom chart end-->
<!-- 					</div>202 /row mt	 -->
					
                  </div><!-- 31 /col-lg-9 END SECTION MIDDLE -->
                  
                  
      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
<!-- 公告開始 -->                    
      <div class="col-lg-3 ds" >
      	<div id="post_notice">
      		<div id="notice_header">
      	  		<h3><strong>公   告   訊   息</strong></h3>
      	  	</div>
      	</div>


<%--              	<c:if test="${! empty chatVO }"> --%>
             	
	<script>
		jQuery(function ($) {
		    // 轉換日期的小程式 開始
			Date.prototype.Format = function(fmt) {
				var o = {
					"M+" : this.getMonth() + 1, //月份 
					"d+" : this.getDate(), //日 
					"h+" : this.getHours(), //小时 
					"m+" : this.getMinutes(), //分 
					"s+" : this.getSeconds(), //秒 
					"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
					"S" : this.getMilliseconds()	//毫秒 
				};
				if (/(y+)/.test(fmt))
					fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
							.substr(4 - RegExp.$1.length));
				for ( var k in o)
					if (new RegExp("(" + k + ")").test(fmt))
						fmt = fmt.replace(RegExp.$1,
						(RegExp.$1.length == 1) ? (o[k])
						: (("00" + o[k]).substr(("" + o[k]).length)));
				return fmt;
			}
			//轉換日期的小程式 結束
			
		// 顯示已貼公告
			$.ajax({
				url : "${this_contextPath}/CRFSERVICE/chatControllerBE/showThreeNotices",
				type : 'get', //get post put delete
				data : {},
				success : function(data) {
// 		 			console.log(data);
					$.each(data, function(index) {		
							var ndate_int = parseInt(this[0].chatTime); //轉換成數字
							var ndate_value = new Date(ndate_int);
// 		 			console.log(this[0]);
// 		 			console.log(this[1]);
							$('#post_notice').append(
								'<div class="desc" id="this[0].chat_Id">'+
			                      	'<div class="thumb">'+
			                      		'<img class="img-circle" src="${this_contextPath}/images/members/'+ this[0].member_Id +'.jpg" width="35px" height="35px" align="">'+
			                      	'</div>'+
			                      	'<div class="details">'+
			                      		'<p>發布者：<muted>'+ this[1] +'</muted><br/>'
			                      			+ ndate_value.Format("yyyy-MM-dd hh:mm:ss") +'<br/>'
			                      		    + this[0].chat_Detail +
			                      		'</p>'+
			                      	'</div>'+
			                     '</div>'				
							);
					}) // end $.each(
				} // end success : function(data) 
			}) // end $.ajax({
	}); // end jQuery(function ($) {
	</script>
                      
<%--               	</c:if> --%>

<!-- 公告結束 -->                 
   
        	<!-- CALENDAR-->
                        <div id="calendar" class="mb">
                            <div class="panel green-panel no-margin">
                                <div class="panel-body">
                                    <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                        <div class="arrow"></div>
                                        <h3 class="popover-title" style="disadding: none;"></h3>
                                        <div id="date-popover-content" class="popover-content"></div>
                                    </div>
                                    <div id="my-calendar"></div>
                                </div>
                            </div>
                        </div><!-- / calendar -->
                        
                  </div> <!-- 257 /col-lg-3 -->
              </div> <!-- 30 /row -->
              
          </section> <!-- 28 <section class="wrapper"> -->
      </section> <!-- 27 /MAIN CONTENT -->
      <!--main content end-->

      <!-- footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2016 - C.R.Fitness Co., Ltd.
              <a href="${this_contextPath}/admin/adminIndex.jsp" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!-- footer end-->
      
  </section> <!-- 21 <section id="container" > -->		
<!-- 每頁不同內容   結束 -->
	
	
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
  
  
  </body>
</html>
