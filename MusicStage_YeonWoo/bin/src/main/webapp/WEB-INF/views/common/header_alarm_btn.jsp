<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>alarmButton</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/default.css" type="text/css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <style>
        
        .alarm_drop_area{
            position: absolute;
            /* background: #AF8357; */
            width: 350px;
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
            right: 8px;
            margin-top: 11px;
            display: none;
            background: white;
            /* flex-direction: column; */
        }
        

        .alarm_drop_area a{
            display: flex; 
            align-items: center;
            /* color: #A7543A; */
            line-height: 50px;
            text-decoration: none;
            box-sizing: border-box;
            transition: 0.5s;
            transition-property: background;
        } 

        .alarm_drop_area a:hover {
            background: #A6A3A3;
        }


        #nickName_text{
            flex-grow: 1;
        }

        [id="alarm_chk"]:checked + div.alarm_drop_area{
            display: block;
            transition: 0.5s;
        }

        /* 체크박스 숨김 */
        .chk{ 
            display: none;
        }

        /* 라디오박스 숨김 */
        .rad{
            display: none;
        }

        /* 메뉴탭 설정 */
        .rad + label {
            display: inline-block;
            padding: 10px 0 10px 0;
            /* background: #ccc; */
            color: #999;
            font-size: 14px;
            cursor: pointer;
            line-height: 28px;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
        }

        .rad:checked + label{
            background: #f7f7f7;
            color :#000;
        }

        /* 컨텐츠 영역 설정 */
        .conbox{
            /* width: 100%; */
            width: 350px;
            height: 300px;
            background: #f7f7f7;
            display: none;
            overflow-y: scroll;
            overflow-x:hidden;
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
            border: 1px solid #DBDBDB;
            border-top: none;
        }

        input[id="system_alarm_tab"]:checked ~ .con1{
            display: block;
        }

        input[id="social_alarm_tab"]:checked ~ .con2{
            display: block;
        }
        
        .alarm_icon{
            margin-right: 16px;;
            width: 40px;
            height: 40px;
        }
        
        .alarm_profile{
            margin-right: 16px;;
            width: 40px;
            height: 40px;
            border-radius: 50px;
        }        
        
        .alarm_thumbnail{
        	margin-left: 5px;
            width: 50px;
            height: 50px;
        }        

        .alarm_content_div{
            display: flex;
            align-items: center;
            flex-grow: 1;
            line-height: 50px ;
            padding: 10px;
        }
        
		.alarm_content_icon_div{
		    display: block;
		}

		.alarm_content_text_div{
		    display: block;
		}
		
		.alarm_content_thumbnail_div{
		    display: block;
		}		

        .alarm_message_div{
            display: block;
            text-align: left;
        }
        
        .alarm_time_div{
            display: block;
        	text-align: left;
        }
        
		.alarm_time_span{
			color: gray;
		}
		
        .alarm_date_div{
            display: block;
        	text-align: left;
        }		
		
		.alarm_date_span{
			font-size: 13px;
			font-weight: bold;
			color: gray;
		}

        .alarm_message_span{
            flex-grow: 1;
        }

        .alarm_date_div{
            display: inline-block;
            width: 370px;
            padding: 10px 12px;
            line-height: 20px;
        }

        .alarm_tab{
            width: 175px;
            height: auto;
            float: left;
            text-align: center;
            vertical-align: middle;
            border: 1px solid #DBDBDB;
            border-bottom: none;
        }

        .alarm_content_div{
            line-height: 20px !important;
        }
		        
		.bell-badge{
		    padding: 3px 5px 2px;
		    position: absolute;
		    top: 25px;
		    display: inline-block;
		    min-width: 10px;
		    font-size: 12px;
		    font-weight: bold;
		    color: #ffffff;
		    line-height: 1;
		    vertical-align: baseline;
		    white-space: nowrap;
		    text-align: center;
		    border-radius: 10px;
		}
		.bell-badge-danger {
		    background-color: #db5565;
		}
		
		.unReadStatus {
			background-color: #E6E6E6;
		}
            

    </style>

</head>
<body>
   <label for="alarm_chk" class="drop_btn myPage_btn" id="drop_btn_label">
   	<img src="<%= request.getContextPath() %>/resources/images/알람버튼.png" class="icon alarm">
	<span id="alarmCountSpan" class="bell-badge bell-badge-danger"></span>
   </label>
   <input type="checkbox" id="alarm_chk" class="chk">


   <div class="alarm_drop_area">
       <input type="radio" name="tabmenu" id="system_alarm_tab" class="rad" checked>
       <label for="system_alarm_tab" class="alarm_tab" id="system_alarm_tab_label"><span class="alarm_tab_span">시스템 알림</span></label>
       <input type="radio" name="tabmenu" id="social_alarm_tab" class="rad">
       <label for="social_alarm_tab" class="alarm_tab" id="socail_alarm_tab_label"><span class="alarm_tab_span">게시물 알림</span></label>
	
       <div class="conbox con1">
           
           	<div class="alarm_date_div">
            	<span class="alarm_date_span">10.25(일)</span>
           	</div>
           
            <!-- 시스템 알람 불러오기 반복문 -->
	        <c:forEach var="list" items="${systemAlarmList}">
	        	<a href="#" class="alarm_content_a" onClick="window.open('<%= request.getContextPath() %>/AlarmDetail', '_blank', 'width=500, height=600, top=100, left=1200')">
	        		<input type="hidden" class="alarm_no_class" value="">
	            	<div class="alarm_content_div">
	               		<div class="alarm_content_icon_div">
	               			<c:if test="${list.alarm_type eq 'Notice'}">
	                   			<img src="<%= request.getContextPath() %>/resources/images/fresh.png" class="alarm_icon">
	                   		</c:if>
	               			<c:if test="${list.alarm_type eq 'RegisterYes' || list.alarm_type eq 'RegisterNo'}">
	                   			<img src="<%= request.getContextPath() %>/resources/images/전문가등록된-표시.png" class="alarm_icon">
	                   		</c:if>
	               			<c:if test="${list.alarm_type eq 'BoardApproveYes' || list.alarm_type eq 'BoardApproveNo'}">
	                   			<img src="<%= request.getContextPath() %>/resources/images/글쓰기버튼1.png" class="alarm_icon">
	                   		</c:if>
	       	               	<c:if test="${list.alarm_type eq 'MemberReport' || list.alarm_type eq 'BoardReport'}">
	                   			<img src="<%= request.getContextPath() %>/resources/images/신고아이콘.jpg" class="alarm_icon">
	                   		</c:if>  		
		               	</div>
		               	<div class="alarm_content_text_div">    
		                   	<div class="alarm_message_div">
		                       	<span class="alarm_message_span">${list.alarm_title}</span>
		                   	</div>
		                   	<div class="alarm_time_div">
		                   		<span class="alarm_time_span">${list.alarm_date}</span>
		                	</div>
		            	</div>
	            	</div>
	       		</a>
           	</c:forEach>
            <!-- ---------------------- -->
           	
       </div>

       <div class="conbox con2">
           <div class="alarm_date_div">
               <span class="alarm_date_span">10.28(수)</span>
           </div>

			<!-- 소셜  알람 불러오기 반복문 -->
	        <c:forEach var="list" items="${socialAlarmList}">
	           	<a href="${list.alarm_url}" class="alarm_content_a">
	           		<input type="hidden" class="alarm_no_class" value="">
	               	<div class="alarm_content_div">
	               		<div class="alarm_content_icon_div">
	               			<c:if test="${list.alarm_sender_profile_pic ne null}">
	                   			<img src="<%= request.getContextPath() %>/resources/userProfile/${list.alarm_sender}/${list.alarm_sender_profile_pic}" class="alarm_profile">
	                   		</c:if>
	               			<c:if test="${list.alarm_sender_profile_pic eq null}">
	                   			<img src="<%= request.getContextPath() %>/resources/images/profileDefault.png" class="alarm_profile">
	                   		</c:if>                   		
		               	</div>
		               	<div class="alarm_content_text_div">    
		                   	<div class="alarm_message_div">
		                       	<span class="alarm_message_span">${list.alarm_title}</span>
		                   	</div>
		                   	<div class="alarm_time_div">
		                   		<span class="alarm_time_span">${list.alarm_date}</span>
		                	</div>
		           		</div>
		           		<c:if test="${list.board_no ne null}">
			           		<div class="alarm_content_thumbnail_div">
			           			<img src="<%= request.getContextPath() %>${list.board_file_path}${list.board_file_change_name}" class="alarm_thumbnail">
			           		</div>
		           		</c:if>
	               	</div>
	           	</a>
           	</c:forEach>
			<!-- ---------------------- -->
			
       </div>    
    </div>
    
    <script>

    function onclickEvent(alarm_url){
    	window.open(alarm_url, '_blank', 'width=500, height=600, top=100, left=1200');
    }
    
   		$(document).ready(function(){
			/* ------------ 알람 갯수 초기화 ----------- */
			$.ajax({
				type: "post",
				url : "countUnReadAlarm.ws",
				dataType: "JSON",
				success : function(data){
					console.log("countUnReadAlarm.ws Ajax Success");
					$('#alarmCountSpan').addClass('bell-badge-danger bell-badge')
					$('#alarmCountSpan').text(data);
				},
				error : function(request, error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
   			
   			
   			$("#drop_btn_label").click(function(){
   				console.log("알람 버튼 클릭 ");
   				
   				/* ------------ con1 영역 ----------- */
				$.ajax({
					type: "post",
					url : "selectSystemAlarmList.ws",
					dataType: "JSON",
					success : function(data){
						
						console.log("selectSystemAlarmList.ws Ajax Success");
					
						var con1 = $('.con1');
						$(con1).html("");
						
						var dateCheck = false;
						
						if(data.length != 0 ){
							
							/* 날짜 넣기 */
							var alarm_date_div1 = document.createElement("div");
							$(alarm_date_div1).addClass("alarm_date_div");
							var alarm_date_span1 = document.createElement("span");
							$(alarm_date_span1).addClass("alarm_date_span");
							
							$(alarm_date_span1).append(data[0].alarm_date1.substring(5,7)+"월 "+data[0].alarm_date1.substring(8,10)+"일");
							$(alarm_date_div1).append(alarm_date_span1);
							
							$(con1).append(alarm_date_div1);												
							
							for(i in data){
								
								/* 날짜 넣기 */
								if(i > 0){
									if(data[i].alarm_date1.substring(0,10) != data[i-1].alarm_date1.substring(0,10)){
														
										var alarm_date_div1 = document.createElement("div");
										$(alarm_date_div1).addClass("alarm_date_div");
										var alarm_date_span1 = document.createElement("span");
										$(alarm_date_span1).addClass("alarm_date_span");
										
										$(alarm_date_span1).append(data[i].alarm_date1.substring(5,7)+"월 "+data[i].alarm_date1.substring(8,10)+"일");
										$(alarm_date_div1).append(alarm_date_span1);
										
										$(con1).append(alarm_date_div1);	
									}
								}
				
								
								/* a 태그 넣기 */
								var alarm_content_a1 = document.createElement("a");
								var alarm_url = null;
																
								if(data[i].alarm_type1 == "Notice" || data[i].alarm_type1 == "RegisterNo" || data[i].alarm_type1 == "MemberReportYes" || data[i].alarm_type1 == "MemberReportNo" 
										|| data[i].alarm_type1 == "BoardReportYes" || data[i].alarm_type1 == "BoardReportNo" || data[i].alarm_type1 == "BoardApproveNo" || data[i].alarm_type1 == "RegisterYes"){
									alarm_url = "<%= request.getContextPath() %>/"+data[i].alarm_url1+"?alarm_no="+data[i].alarm_no1;
									$(alarm_content_a1).attr("target", "_blank");
								}else if(data[i].alarm_type1 == "BoardApproveYes"){
									alarm_url = "<%= request.getContextPath() %>/"+data[i].alarm_url1+"?bNum"+data[i].alarm_board_no1;
								}
								
// 								var windowOpen = '"'+'window.open('+"'"+alarm_url+"', "+"'"+'_blank'+"', "+"'"+'width=500, height=600, top=100, left=1200'+"')"+'"';
// 								console.log("alarm_url : " + alarm_url);
// 								console.log("windowOpen : " + windowOpen);
								
								if(data[i].alarm_isRead1 == '0'){
									$(alarm_content_a1).addClass("alarm_content_a unReadStatus");									
								}else{
									$(alarm_content_a1).addClass("alarm_content_a");
								}
								$(alarm_content_a1).attr("href", alarm_url);
								
// 								$(alarm_content_a1).attr("onclick", "window.open");
								
								var alarm_no_class = document.createElement("input");
								$(alarm_no_class).attr("type", "hidden");
								$(alarm_no_class).val(data[i].alarm_no1);
								$(alarm_content_a1).append(alarm_no_class);
								
								/* 전체 목록 중 한개 div */
								/* alarm_content_div */
								var alarm_content_div1 = document.createElement("div");
								$(alarm_content_div1).addClass("alarm_content_div");
	
								$(alarm_content_a1).append(alarm_content_div1);
								
								/* 아이콘 이미지 넣기*/
								/* alarm_content_icon_div */
								var alarm_content_icon_div1 = document.createElement("div");
								$(alarm_content_icon_div1).addClass("alarm_content_icon_div");
								var alarm_icon1 = document.createElement("img");
								$(alarm_icon1).addClass("alarm_icon");
								if(data[i].alarm_type1 == 'Notice'){
									$(alarm_icon1).attr("src", "<%= request.getContextPath() %>/resources/images/fresh.png");		
								} else if(data[i].alarm_type1 == 'RegisterYes' || data[i].alarm_type1 == 'RegisterNo'){
									$(alarm_icon1).attr("src", "<%= request.getContextPath() %>/resources/images/전문가등록된-표시.png");										
								} else if(data[i].alarm_type1 == 'BoardApproveYes' || data[i].alarm_type1 == 'BoardApproveNo'){
									$(alarm_icon1).attr("src", "<%= request.getContextPath() %>/resources/images/글쓰기버튼1.png");										
								} else if(data[i].alarm_type1 == 'MemberReportYes' || data[i].alarm_type1 == 'MemberReportNo' 
										|| data[i].alarm_type1 == 'BoardReportYes' || data[i].alarm_type1 == 'BoardReportNo'){
									$(alarm_icon1).attr("src", "<%= request.getContextPath() %>/resources/images/신고아이콘.jpg");
								}
								
								$(alarm_content_div1).append(alarm_content_icon_div1);
								$(alarm_content_icon_div1).append(alarm_icon1);
								
								/* 알람 텍스트 전체 영역 */
								/* alarm_content_text_div */
								var alarm_content_text_div1 = document.createElement("div");
								$(alarm_content_text_div1).addClass("alarm_content_text_div");
								
								$(alarm_content_div1).append(alarm_content_text_div1);
								
								/* 알람 메세지 div*/
								var alarm_message_div1 = document.createElement("div");
								$(alarm_message_div1).addClass("alarm_message_div");
								
								$(alarm_content_text_div1).append(alarm_message_div1);
								
								/* 알람 메세지 span*/
								var alarm_message_span1 = document.createElement("span");
								$(alarm_message_span1).addClass("alarm_message_span");
								
								$(alarm_message_span1).append(data[i].alarm_title1);
								$(alarm_message_div1).append(alarm_message_span1);
								
								/* 알람 시간 div */
								var alarm_time_div1 = document.createElement("div");
								$(alarm_time_div1).addClass("alarm_time_div");
								
								$(alarm_content_text_div1).append(alarm_time_div1);
								
								/* 알람 시간 span */
								var alarm_time_span1 = document.createElement("span");
								$(alarm_time_span1).addClass("alarm_time_span");
								
								$(alarm_time_span1).append(data[i].alarm_date1.substring(11, 13)+"시 " + data[i].alarm_date1.substring(14, 16)+"분");
								$(alarm_time_div1).append(alarm_time_span1);
								
								console.log("data[i].alarm_board_no1 : " + data[i].alarm_board_no1);
								
								/* 썸네일 */
								if(data[i].alarm_board_no1 != 0){
									/* 썸네일 div */
									var alarm_content_thumbnail_div1 = document.createElement("div");
									$(alarm_content_thumbnail_div1).addClass("alarm_content_thumbnail_div");
									/* 썸네일 img */	
									var alarm_thumbnail1 = document.createElement("img");
									$(alarm_thumbnail1).addClass("alarm_thumbnail");
									
									if(data[i].alarm_thumbnail_name2 != "썸네일-기본이미지.gif"){
										$(alarm_thumbnail1).attr("src", "<%= request.getContextPath() %>/resources/boardImageFile/"+data[i].alarm_thumbnail_name1);
									}else {
										$(alarm_thumbnail1).attr("src", "<%= request.getContextPath() %>/resources/images/썸네일-기본이미지.gif");
									}

									$(alarm_content_thumbnail_div1).append(alarm_thumbnail1);
									$(alarm_content_div1).append(alarm_content_thumbnail_div1);
								}
								
								$(con1).append(alarm_content_a1);
								
								
							}
						}		
					},
					error : function(request, error){
    					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    				}
				});
				
				/* ------------ con2 영역 ----------- */	
				$.ajax({
					type: "post",
					url : "selectSocialAlarmList.ws",
					dataType: "JSON",
					success : function(data){
						
						console.log("selectSocialAlarmList.ws Ajax Success");

						var con2 = $('.con2');
						$(con2).html("");
						
						if(data.length != 0 ){
						
							/* 날짜 넣기 */
							var alarm_date_div2 = document.createElement("div");
							$(alarm_date_div2).addClass("alarm_date_div");
							var alarm_date_span2 = document.createElement("span");
							$(alarm_date_span2).addClass("alarm_date_span");
							
							$(alarm_date_span2).append(data[0].alarm_date2.substring(5,7)+"월 "+data[0].alarm_date2.substring(8,10)+"일");
							$(alarm_date_div2).append(alarm_date_span2);
							
							$(con2).append(alarm_date_div2);
							
							for(i in data){
								
								/* 날짜 넣기 */
								if(i > 0){
									if(data[i].alarm_date2.substring(0,10) != data[i-1].alarm_date2.substring(0,10)){
														
										var alarm_date_div2 = document.createElement("div");
										$(alarm_date_div2).addClass("alarm_date_div");
										var alarm_date_span2 = document.createElement("span");
										$(alarm_date_span2).addClass("alarm_date_span");
										
										$(alarm_date_span2).append(data[i].alarm_date2.substring(5,7)+"월 "+data[i].alarm_date2.substring(8,10)+"일");
										$(alarm_date_div2).append(alarm_date_span2);
										
										$(con2).append(alarm_date_div2);	
									}
								}
								
								
								var alarm_url = null;
								
								if(data[i].alarm_type2 == "BoardReply"){
									alarm_url = "<%= request.getContextPath() %>/"+data[i].alarm_url2+"?bNum="+data[i].alarm_board_no2;
								}else if(data[i].alarm_type2 == "ReplyReply"){
									alarm_url = "<%= request.getContextPath() %>/"+data[i].alarm_url2+"?bNum="+data[i].alarm_board_no2;
								}else if(data[i].alarm_type2 == "Like"){
									alarm_url = "<%= request.getContextPath() %>/"+data[i].alarm_url2+"?bNum="+data[i].alarm_board_no2;
								}else if(data[i].alarm_type2 == "Follow"){
									alarm_url = "<%= request.getContextPath() %>/"+data[i].alarm_url2+"?targetId="+data[i].alarm_sender2;
								}
								
								/* a 태그 넣기 */
								var alarm_content_a2 = document.createElement("a");
								
								if(data[i].alarm_isRead2 == '0'){
									$(alarm_content_a2).addClass("alarm_content_a unReadStatus");									
								}else{
									$(alarm_content_a2).addClass("alarm_content_a");
								}
								$(alarm_content_a2).attr("href", alarm_url);
								
								var alarm_no_class = document.createElement("input");
								$(alarm_no_class).attr("type", "hidden");
								$(alarm_no_class).val(data[i].alarm_no2);
								$(alarm_content_a2).append(alarm_no_class);
								
								/* 전체 목록 중 한개 div */
								/* alarm_content_div */
								var alarm_content_div2 = document.createElement("div");
								$(alarm_content_div2).addClass("alarm_content_div");
			
								$(alarm_content_a2).append(alarm_content_div2);
								
								/* 아이콘 이미지(알림 보낸사람 프로필 사진) 넣기*/
								/* alarm_content_icon_div */
								var alarm_content_icon_div2 = document.createElement("div");
								$(alarm_content_icon_div2).addClass("alarm_content_icon_div");
								var alarm_icon2 = document.createElement("img");
								$(alarm_icon2).addClass("alarm_profile");
								if(data[i].alarm_sender_profile_pic2 == null){
									$(alarm_icon2).attr("src", "<%= request.getContextPath() %>/resources/images/profileDefault.png");
								} else {
									$(alarm_icon2).attr("src", "<%= request.getContextPath() %>/resources/userProfile/"+data[i].alarm_sender2+"/"+data[i].alarm_sender_profile_pic2);										
								}
								
								$(alarm_content_div2).append(alarm_content_icon_div2);
								$(alarm_content_icon_div2).append(alarm_icon2);
								
								/* 알람 텍스트 전체 영역 */
								/* alarm_content_text_div */
								var alarm_content_text_div2 = document.createElement("div");
								$(alarm_content_text_div2).addClass("alarm_content_text_div");
								
								$(alarm_content_div2).append(alarm_content_text_div2);
								
								/* 알람 메세지 div*/
								var alarm_message_div2 = document.createElement("div");
								$(alarm_message_div2).addClass("alarm_message_div");
								
								$(alarm_content_text_div2).append(alarm_message_div2);
								
								/* 알람 메세지 span*/
								var alarm_message_span2 = document.createElement("span");
								$(alarm_message_span2).addClass("alarm_message_span");
								
								$(alarm_message_span2).append(data[i].alarm_title2);
								$(alarm_message_div2).append(alarm_message_span2);
								
								/* 알람 시간 div */
								var alarm_time_div2 = document.createElement("div");
								$(alarm_time_div2).addClass("alarm_time_div");
								
								$(alarm_content_text_div2).append(alarm_time_div2);
								
								/* 알람 시간 span */
								var alarm_time_span2 = document.createElement("span");
								$(alarm_time_span2).addClass("alarm_time_span");
								
								$(alarm_time_span2).append(data[i].alarm_date2.substring(11, 13)+"시 " + data[i].alarm_date2.substring(14, 16)+"분");
								$(alarm_time_div2).append(alarm_time_span2);						
								
								/* 썸네일 */								
								if(data[i].alarm_board_no2 != 0){
									/* 썸네일 div */
									var alarm_content_thumbnail_div2 = document.createElement("div");
									$(alarm_content_thumbnail_div2).addClass("alarm_content_thumbnail_div");
									/* 썸네일 img */	
									var alarm_thumbnail2 = document.createElement("img");
									$(alarm_thumbnail2).addClass("alarm_thumbnail");
									
									if(data[i].alarm_thumbnail_name2 != "썸네일-기본이미지.gif"){
										$(alarm_thumbnail2).attr("src", "<%= request.getContextPath() %>/resources/boardImageFile/"+data[i].alarm_thumbnail_name2);
									}else {
										$(alarm_thumbnail2).attr("src", "<%= request.getContextPath() %>/resources/images/썸네일-기본이미지.gif");
									}
									
									$(alarm_content_thumbnail_div2).append(alarm_thumbnail2);
									$(alarm_content_div2).append(alarm_content_thumbnail_div2);
								}
// 								if(data[i].alarm_board_no2 != 0){
// 									var alarm_content_thumbnail_div2 = document.createElement("div");
// 									$(alarm_content_thumbnail_div2).addClass("alarm_content_thumbnail_div");
// 									var alarm_thumbnail2 = document.createElement("img");
// 									$(alarm_thumbnail2).addClass("alarm_thumbnail");
<%-- 									$(alarm_thumbnail2).attr("src", "<%= request.getContextPath() %>/resources/images/샘플이미지1.jpg"); --%>
// 									$(alarm_content_thumbnail_div2).append(alarm_thumbnail2);
// 									$(alarm_content_div2).append(alarm_content_thumbnail_div2);		
									
// 								}
									$(con2).append(alarm_content_a2);
								/* ------------ con2 영역 ----------- */
							}
						}
					},
					error : function(request, error){
    					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    				}
				});
			});	
   			
   		});
   		
   		/* ------------ 알람 읽음 처리 ----------- */
   		$(document).on("click", ".alarm_content_a", function (e) {
   			
			var alarm_no = $(this).find('input').val();
			var userId = "${loginUser.userId}";
			var map = {"alarm_no" : alarm_no, "userId" : userId};
			
			console.log("alarm_no : " + alarm_no, ", userId : " + userId + ", map : " + map);
			
			$.ajax({
				type: "post",
				url : "updateReadCheckAlarm.ws",
		 	 		data : JSON.stringify(map),
		 	 		contentType: "application/json; charset=utf-8",
				dataType: "JSON",
				success : function(data){
					console.log("updateReadCheckAlarm.ws Ajax Success");
					$('#alarmCountSpan').text(data);
				},
				error : function(request, error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
   		
    </script>
    
    
</body>
</html>