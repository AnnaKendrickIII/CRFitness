<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<jsp:include page="/CRFitness.jsp" />
<title>健康日誌</title>

<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/Journal_component.css" />
<link rel="stylesheet" type="text/css" href="${this_contextPath}/css/SimpleSlider.css" />
<script src="${this_contextPath}/js/modernizr.custom.js"></script>
<style type="text/css">
.Emoticons{
width: 40px;
height: 36px;
float:left;
}
a{
text-decoration: none !important;
}
.a_img_p{
font-size: 24px;
color:blue;

}
.message_div{
margin:5px; 
}
.name_p:HOVER{
font-size: 24px;
color:#66B3FF;
}
.time_p{
margin: 0px;
}
.message_img{
margin-right:0px;
width: 36px;
height: 32px;
}
.message_name_span{
font-size: 16px;
color:blue;
margin-right: 5px;
}
.message_name_span:HOVER {
font-size: 16px;
color:#66B3FF;
}
.messge_div{
margin: 2px;
}
.message_inner_div_css{
display: inline;
}
.innercontent_div{
display:inline-table;
}
.out_message_div{
border-top:1px solid #C4E1FF;
background-color:#F0F0F0;
margin:0px;
}
.messge_header_body{
height:500px;
overflow-x:hidden;
overflow-y:auto !important; 
margin:0px; 
}
.header_div{
margin:3%; 
}
.inner_img_div{
display: inline;
margin-right: 0px;
}
.message_submit_button{
background-color:#5599FF; 
}
.message_submit_button:HOVER{
background-color:#66B3FF; 
}
textarea{
	resize: none;
}
.PersonalJournal_contents_p{
margin-bottom: 0px;
}
.time_p{
margin: 0px;
font-size: smaller;
color:	#9D9D9D;
}
._soakw{
display:block;
overflow:hidden;
text-indent:25%;
white-space:nowrap;
}

.coreSpriteHeartOpen{
background-image:url(${this_contextPath}/images/c97b56.png);
background-repeat:no-repeat;
background-position:-579px -321px;
height:24px;
width:24px;
}
.coreSpriteHeartFull{
background-image:url(${this_contextPath}/images/c97b56.png);
background-repeat:no-repeat;
background-position:-93px -582px;
height:24px;
width:24px;
}

.down_arrow {
    display: inline-block;
    width: 0;
    height: 0;
    margin-left: 2px;
    vertical-align: middle;
    border-top: 6px dashed;
    border-top: 4px solid\9;
    border-right: 6px solid transparent;
    border-left: 6px solid transparent;
}
</style>
</head>

<body >
<aside>

	  <ul class="grid effect-7 " id="grid"  ></ul>

<!-- 	新增留言結束 -->
	<script type="text/javascript">
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
	
	jQuery(function ($) {	
		$('.logo_here').append('<img  class="img-responsive logo_css" src="${this_contextPath}/images/logo/Journal.png">')
		var theMessageDetailObj;
		var likenum=null;
	        $.ajax({
	            url:"${this_contextPath}/CRFSERVICE/commonJournalController/commonJournalOne",
	            type:'get',  //get post put delete
	            data:{},
	            success:function(data){          	
	            	$.each(data,function(){
	            		var likenum = this[3];
	            		var jdate_int = parseInt(this[0].publishTime);                          //轉換成數字
						  	var jdate_value = new Date(jdate_int); 
		        		  	var journalId=this[0].journal_Id
		        		  	var contet='<p hidden="hidden">'+this[0].journal_Id+'</p>'
			        		 +'<a class="a_img_p" href="${this_contextPath}/PersonalJournal.jsp?'+this[0].member_Id+'">'
			        		 +'<img class="Emoticons" src="${this_contextPath}/CRFSERVICE/memberController/photo/'+this[2]+'" /><p class="name_p">'
			        		 +this[1]+'</p></a><p class="time_p">'
			        		 +jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</p><p class="PersonalJournal_contents_p">'
							 +this[0].contents+'</p>'
							 
		        		 $('#grid').append(
		        		 '<li  id="'+this[0].journal_Id+'" class="gallery-img">'
        			 +'<a title="移除此篇日誌" class="close fa-2x removeJournal" ><span class="down_arrow" aria-hidden="true"></span></a>'
        			 +'<ul class="dropdown-menu" role="menu"><li><a href="#">檢舉此篇</a></li></ul>'         			     
					 +contet
		        		 +'<img class="img-thumbnail" src="${this_contextPath}/CRFSERVICE/commonJournalController/photo/'+this[0].journal_Id+'" />'	 
		        		 +'<div data-desc=""></div>'
		        		 +'</li>') 
		        		  $.ajax({
	           				 url:"${this_contextPath}/CRFSERVICE/messageDetailController/getMessageDetailAll",
	            			 type:'get',  //get post put delete
	          			     data:{journal_Id:journalId},
	            			 success:function(data){ 
	            				 var message="";			 
	            				 $.each(data,function(){    
	            					 var jdate_int2 = parseInt(this[0].messageTime);                          //轉換成數字
		   						  	 var jdate_value2 = new Date(jdate_int2); 
										var arraythecontent= this[0].content.split("</br>")
										var thecontent="";
										$.each(arraythecontent,function(index){
											var thecontent2=this.replace(/\</g,'&lt').replace(/\>/g,'&gt')
											if(index==0){		
												thecontent+='<span class="span_contet">'+thecontent2+'</span>'
											}else{
												thecontent+='<br><span class="span_contet">'+thecontent2+'</span>'					
											}
										})
	            					 message+='<div class="message_div"><div class="inner_img_div"><a href="${this_contextPath}/PersonalJournal.jsp?'+this[0].member_Id+'">'
	            					 +'<img class="message_img img-circle" src="${this_contextPath}/CRFSERVICE/memberController/photo/'+this[0].member_Id+'" /></div><div class="message_inner_div_css">'
	            					 +'<span class="message_name_span">'+this[1]+'</span></a><div class="innercontent_div">'
	            					 +thecontent+'<p class="time_p">'+jdate_value2.Format("yyyy-MM-dd hh:mm:ss")+'</p></div></div></div>'
	            				 })//留言明細迴圈     	    				
	            				 $("#"+journalId+' div[data-desc]').attr('data-desc',
	            				'<div class="messge_header_body"><div class="header_div">'+contet
	            				+'<a type="button" class="btn btn-link"><i class="fa fa-tag fa-2x" aria-hidden="true"></i></a>'
					   			+'<a type="button" class="btn btn-link likethis"><span class="_soakw coreSpriteHeartOpen "></span></a>'
					   			+ '<a><span class="badge countLike">'+likenum+'</span></a>'
	            				+'</div><div class="out_message_div">'+message+'</div></div><div class="texthere message_div">'	
					   			+ '<textarea maxlength="30" class="form-control" cols="30" rows="1"  placeholder="留言最大30字數....."></textarea>'
					   			+ '<button type="button" class="btn btn-info pull-right message_submit_button" >送出 </button>'
					   			+ '</div>')
	            			 }//留言success結束
	           			 })//留言ajax結束	                
	            	})// each end          	     	
	                new AnimOnScroll(document.getElementById('grid'), {
	                    minDuration: 0.4,
	                    maxDuration: 0.6,
	                    viewportFactor: 0.2
	                });//瀑布流 new   
	            	$.ajax({
	    	            url:"${this_contextPath}/CRFSERVICE/commonJournalController/commonJournalTwo",
	    	            type:'get',  //get post put delete
	    	            data:{},
	    	            success:function(data){
    	       
	    	            	$.each(data,function(){
	    	            		var likenum = this[3];
	    	            		var jdate_int = parseInt(this[0].publishTime);                          //轉換成數字
	   						  	var jdate_value = new Date(jdate_int); 
	   		        		  	var journalId=this[0].journal_Id
	   		        		  	var contet='<p hidden="hidden">'+this[0].journal_Id+'</p>'
	   			        		 +'<a class="a_img_p" href="${this_contextPath}/PersonalJournal.jsp?'+this[0].member_Id+'">'
	   			        		 +'<img class="Emoticons" src="${this_contextPath}/CRFSERVICE/memberController/photo/'+this[2]+'" /><p class="name_p">'
	   			        		 +this[1]+'</p></a><p class="time_p">'
	   			        		 +jdate_value.Format("yyyy-MM-dd hh:mm:ss")+'</p><p class="PersonalJournal_contents_p">'
	   							 +this[0].contents+'</p>'
	   							 
	   		        		 $('#grid').append(
	   		        		 '<li  id="'+this[0].journal_Id+'" class="gallery-img">'
	            			 +'<a title="移除此篇日誌" class="close fa-2x removeJournal" ><span class="down_arrow" aria-hidden="true"></span></a>'
	            			 +'<ul class="dropdown-menu" role="menu"><li><a href="#">檢舉此篇</a></li></ul>'         			     
							 +contet
	   		        		 +'<img class="img-thumbnail" src="${this_contextPath}/CRFSERVICE/commonJournalController/photo/'+this[0].journal_Id+'" />'	 
	   		        		 +'<div data-desc=""></div>'
	   		        		 +'</li>') 
	   		        		  $.ajax({
	   	           				 url:"${this_contextPath}/CRFSERVICE/messageDetailController/getMessageDetailAll",
	   	            			 type:'get',  //get post put delete
	   	          			     data:{journal_Id:journalId},
	   	            			 success:function(data){ 
	   	            				 var message="";			 
	   	            				 $.each(data,function(){    
	   	            					 var jdate_int2 = parseInt(this[0].messageTime);                          //轉換成數字
	   		   						  	 var jdate_value2 = new Date(jdate_int2); 
	   										var arraythecontent= this[0].content.split("</br>")
	   										var thecontent="";
	   										$.each(arraythecontent,function(index){
	   											var thecontent2=this.replace(/\</g,'&lt').replace(/\>/g,'&gt')
	   											if(index==0){		
	   												thecontent+='<span class="span_contet">'+thecontent2+'</span>'
	   											}else{
	   												thecontent+='<br><span class="span_contet">'+thecontent2+'</span>'					
	   											}
	   										})
	   	            					 message+='<div class="message_div"><div class="inner_img_div"><a href="${this_contextPath}/PersonalJournal.jsp?'+this[0].member_Id+'">'
	   	            					 +'<img class="message_img img-circle" src="${this_contextPath}/CRFSERVICE/memberController/photo/'+this[0].member_Id+'" /></div><div class="message_inner_div_css">'
	   	            					 +'<span class="message_name_span">'+this[1]+'</span></a><div class="innercontent_div">'
	   	            					 +thecontent+'<p class="time_p">'+jdate_value2.Format("yyyy-MM-dd hh:mm:ss")+'</p></div></div></div>'
	   	            				 })//留言明細迴圈     	    				
	   	            				 $("#"+journalId+' div[data-desc]').attr('data-desc',
	   	            				'<div class="messge_header_body"><div class="header_div">'+contet
	   	            				+'<a type="button" class="btn btn-link"><i class="fa fa-tag fa-2x" aria-hidden="true"></i></a>'
	   					   			+'<a type="button" class="btn btn-link likethis"><span class="_soakw coreSpriteHeartOpen "></span></a>'
	   					   			+ '<a><span class="badge countLike">'+likenum+'</span></a>'
	   	            				+'</div><div class="out_message_div">'+message+'</div></div><div class="texthere message_div">'	
	   					   			+ '<textarea maxlength="30" class="form-control" cols="30" rows="1"  placeholder="留言最大30字數....."></textarea>'
	   					   			+ '<button type="button" class="btn btn-info pull-right message_submit_button" >送出 </button>'
	   					   			+ '</div>')
	   	            			 }//留言success結束
	   	           			 })//留言ajax結束	                                                   	                
		            	})// each end
		            	 $.ajax({
								url:"${this_contextPath}/CRFSERVICE/laudationcontroller/laudationjournalnumber",
									type:"get",
									data:{lauded_Id:'${LoginOK.member_Id}'},
	   								success:function(data){
	   								$.each(data,function(){
	   									var journal_attr=$('#'+this.journal_Id+' div[data-desc]').attr('data-desc')	
	   									if(journal_attr){
										journal_attr=journal_attr.replace('coreSpriteHeartOpen','coreSpriteHeartOpen coreSpriteHeartFull')
	   									$('#'+this.journal_Id+' div[data-desc]').attr('data-desc',journal_attr)
	   									
	   									}
	   								})
	   							}
	   						})
						
		            	
	    	                new AnimOnScroll(document.getElementById('grid'), {
	    	                    minDuration: 0.4,
	    	                    maxDuration: 0.6,
	    	                    viewportFactor: 0.2
	    	                });//瀑布流 new 
	    	            	$('.gallery-img').Am2_SimpleSlider();    
	    	 	          }//第2次撈資料  success結束  	 
	    	        })//第2次ajax結束	           
	            }//第1次撈資料  success結束      
	        })//第1次ajax結束    
	      // enter換行變成shift enter ,enter變送出
			$('body').on('keydown', 'textarea', function (event) {
				if (event.keyCode == 13 && !event.shiftKey) {
					var theJournal_Id = $(this).parents().siblings(".messge_header_body").find(".header_div>p:nth-child(1)").text();
					var val = $(this).val();
					if(val.trim().length != 0){
						val = val.replace(/\r?\n/g, '</br> ');
						addMessageDetail($(this), theJournal_Id, "${LoginOK.member_Id}", "${LoginOK.nickname}", val, new Date().getTime());
						$(this).val('')
					}
					return false;
				}
			})
	        //右下腳按鈕 送出
			$('body').on('click', '.message_submit_button', function (event) {
				var theJournal_Id = $(this).parents().siblings(".messge_header_body").find(".header_div>p:nth-child(1)").text();
				var val = $(this).prev().val()
				if(val.trim().length != 0){
					val = val.replace(/\r?\n/g, '</br> ')
					addMessageDetail($(this), theJournal_Id, "${LoginOK.member_Id}", "${LoginOK.nickname}", val, new Date().getTime());
					$(this).prev().val('');
				}
			})  
			var addMessageDetail = function(theObj, theJournal_Id, theMember_Id, theNickname, val, theMessageTime){
				var messageDiv =  theObj.parents().siblings(".messge_header_body").find(".out_message_div")
				$.ajax({
	            	url : "${this_contextPath}/CRFSERVICE/messageDetailController/addMessageDetail",
					type : 'post', //get post put delete
					data : {'journal_Id':theJournal_Id,
							'member_Id':theMember_Id,
							'content':val},
					success : function(data) {
						if(data){	
							var theContentArray=val.split("</br>")
							$.each(theContentArray,function(index){
								if(index==0){					
									messageDiv.append(
											'<div class="message_div"><div class="inner_img_div"><a href="${this_contextPath}/PersonalJournal.jsp?'+theMember_Id+'">'
		 	            					 +'<img class="message_img img-circle" src="${this_contextPath}/CRFSERVICE/memberController/photo/'
		 	            					 +theMember_Id+'" /></div><div class="message_inner_div_css"><span class="message_name_span">'
		 	            					 +theNickname+'</span></a><div class="innercontent_div"><span class="span_contet"></span>'
		 	            					 +'</div></div></div>').find('.message_div:last .span_contet').text(this)
								}else{
									messageDiv.find('.message_div:last .innercontent_div').append('<br><span class="span_contet"></span>')
									.find('.span_contet:last').text(this)
								}
							})
							messageDiv.find('.message_div:last .innercontent_div').append('<p class="time_p"></p>')
						.find('.time_p:last').text( new Date(theMessageTime).Format('yyyy-MM-dd hh:mm:ss'))
						
						$('#'+theJournal_Id+' div[data-desc]').attr('data-desc',$('.product-desc').html())					
						}
					}
	            })
			}
	       $("body").on("focusin","textarea",function(e){
	        	$(document).off('keyup')  	
	        })
	      $("body").on("focusout","textarea",function(e){
		        	   $(document).on('keyup', function (e) {
		                   e.preventDefault();
		                   //Close popup on esc
		                   if (e.keyCode === 27) { $('.product-gallery-popup').fadeOut(500); $('body').css({ 'overflow': 'initial' }); }
		                   //Next Img On Right Arrow Click
		                   if (e.keyCode === 39) {  if ($nextElm.length === 1) {
		                       $NewCurrent = $nextElm;
		                       $PreviousElm = $NewCurrent.prev();
		                       $nextElm = $NewCurrent.next();
		                       $('.product-popup-content .product-image img').clearQueue().animate({ opacity: '0' }, 0).attr('src', $NewCurrent.find('img:eq(1)').attr('src')).animate({ opacity: '1' }, 500);
		                       $('.product-popup-content .product-information div').html($NewCurrent.find('div').attr('data-desc'));
		                       if ($PreviousElm.length === 0) { $('.nav-btn.prev').css({ 'display': 'none' }); }
		                       else { $('.nav-btn.prev').css({ 'display': 'block' }); }
		                       if ($nextElm.length === 0) { $('.nav-btn.next').css({ 'display': 'none' }); }
		                       else { $('.nav-btn.next').css({ 'display': 'block' }); }
		                   } }
		                   //Prev Img on Left Arrow Click
		                   if (e.keyCode === 37) {  if ($PreviousElm.length === 1) {
		                       $NewCurrent = $PreviousElm;
		                       $PreviousElm = $NewCurrent.prev();
		                       $nextElm = $NewCurrent.next();
		                       $('.product-popup-content .product-image img').clearQueue().animate({ opacity: '0' }, 0).attr('src', $NewCurrent.find('img:eq(1)').attr('src')).animate({ opacity: '1' }, 500);
		               
		                       $('.product-popup-content .product-information div').html($NewCurrent.find('div').attr('data-desc'));
		                       if ($PreviousElm.length === 0) { $('.nav-btn.prev').css({ 'display': 'none' }); }
		                       else { $('.nav-btn.prev').css({ 'display': 'block' }); }
		                       if ($nextElm.length === 0) { $('.nav-btn.next').css({ 'display': 'none' }); }
		                       else { $('.nav-btn.next').css({ 'display': 'block' }); }
		                   } }
		               });
		        })
	        
	})//jQuery end  	
	</script>
</aside>
<script type="text/javascript">
		jQuery(function($){

			$("body").on("click",'.likethis',function(){
				var theclick = $(this);	
				var likenum = $(this).siblings("a").find(".countLike");
				var count = parseInt(likenum.text());
				var likenumcount=likenum.text()
				var thisID=$(this).siblings("p[hidden]").text();
				var tset= theclick.find('span').hasClass("coreSpriteHeartFull");
				if(!tset){
					$.ajax({
						url:"${this_contextPath}/CRFSERVICE/laudationcontroller/laudationjournal",
						type: "post",
						data:{
							journal_Id:thisID,
							lauded_Id:'${LoginOK.member_Id}'
						},
						success:function(data){		

							var journal_attr=$('#'+thisID+' div[data-desc]').attr('data-desc')	
							journal_attr=journal_attr.replace('coreSpriteHeartOpen','coreSpriteHeartOpen coreSpriteHeartFull')
	   						var attr_conunt=journal_attr.indexOf('countLike')+11;
	   						var new_journal_attr=journal_attr.substr(0,attr_conunt)+data+journal_attr.substr((attr_conunt+likenumcount.length))	
	   						$('#'+thisID+' div[data-desc]').attr('data-desc',new_journal_attr)
							theclick.find('span').toggleClass("coreSpriteHeartFull"),
							
							count+=1
							likenum.text(count)							
						}				
					})						
				}else{
					$.ajax({
						url:"${this_contextPath}/CRFSERVICE/laudationcontroller/laudationjournalcancel",
						type: "post",
						data:{
							journal_Id:$(this).siblings("p[hidden]").text(),
							lauded_Id:'${LoginOK.member_Id}'
						},
						success:function(data){
						
							var journal_attr=$('#'+thisID+' div[data-desc]').attr('data-desc')	
							journal_attr=journal_attr.replace('coreSpriteHeartOpen coreSpriteHeartFull','coreSpriteHeartOpen ')
	   						
							var attr_conunt=journal_attr.indexOf('countLike')+11;
	   						var new_journal_attr=journal_attr.substr(0,attr_conunt)+data+journal_attr.substr((attr_conunt+likenumcount.length))   						   						
							$('#'+thisID+' div[data-desc]').attr('data-desc',new_journal_attr)
	   						theclick.find('span').toggleClass("coreSpriteHeartFull"),
							count-=1
							likenum.text(count)							
						}				
					})						
				}
			})		
		})
</script>
<script src="${this_contextPath}/js/masonry.pkgd.mis.js"></script>    
<script src="${this_contextPath}/js/classie.js"></script>
<script src="${this_contextPath}/js/imagesloaded.js"></script>
<script src="${this_contextPath}/js/AnimOnScroll.js"></script>	
<script src="${this_contextPath}/js/Am2_SimpleSlider.js"></script>  
</body>
</html>
