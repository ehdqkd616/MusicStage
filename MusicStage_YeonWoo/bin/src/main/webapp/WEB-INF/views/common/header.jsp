<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Header</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
   	<%-- <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/default.css" type="text/css"> --%>
   	<link rel="stylesheet" href="${ contextPath }/resources/css/default.css" type="text/css">
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<script src="resources/js/push.js"></script>
	<script src="resources/js/serviceWorker.min.js"></script>
</head>
<style>
    .header_content{
        display: flex;
        position: fixed;
        height: 60px;
        box-sizing: border-box;
        justify-content: space-between;
        top: 0;
	    right: 0;
	    width: 100%;
	    z-index: 3;
	    background: #fff;
    }

    .header_logo{
        width:100px;
    }
	
	.nav_links{
		display:flex;
		justify-content: space-around;
		width: 250px;
		height: 60px;
	}
	
	.header_logo_btn{
		display: flex;
    	width: 90px;
    	height: 55px;
    	overflow: hidden;
    	position: relative;
    	left: -30px;
        align-items: center;
        justify-content: center;
	}
	
	.logo_img{
		width:100%;
	}
	
    .header_search{
        width: 600px;
        padding-top: 12px;
        vertical-align: middle;
        position: relative;
        left: 110px;
    }

    .header_btns{
        width: 300px;
	    height: 60px;
	    text-align: center;
	    z-index: 2;
    }
    
    .header_btns ul{
    	height: 100%;
    	/* line-height: 55px; */
    }

    .header_content div ul li{
        display: inline-block;
    }
	
</style>

<body>
	
    <nav class="header_content">
        <div class="header_logo">
            <ul class="nav_links">
            	
            	 <!-- 로그인시 나오는 검색창 -->
            	<c:if test="${ !empty sessionScope.loginUser }">
            		<li><%@ include file="header_side_menubar.jsp" %></li>
            	</c:if>
            	
            	<!-- 항상 나와야함 -->
            	<!-- 로그인이 되어있는 경우 -->
            	<c:if test="${ !empty sessionScope.loginUser }">
                <li><a href="allFeed.bo" class="header_logo_btn"><img class="logo_img" src="<%= request.getContextPath() %>/resources/images/logo.png" alt="logo" onclick="goHome1();"></a></li>
            	</c:if>
            	<!-- 로그인이 안되어있는 경우 -->
            	<c:if test="${ empty sessionScope.loginUser }">
                <li><a href="home.do" class="header_logo_btn"><img class="logo_img" src="<%= request.getContextPath() %>/resources/images/logo.png" alt="logo" onclick="goHome2();"></a></li>
            	</c:if>
            </ul>
        </div>
       	<div class="header_search">
       	
			<!-- 로그인시 나오는 검색창 -->
       		<c:if test="${ !empty sessionScope.loginUser }">
				<%@ include file="header_searchbar.jsp" %>
			</c:if>
			
        </div>
        <div class="header_btns">
        
            <!-- 로그인시 나오는 기능버튼 -->
        	<c:if test="${ !empty sessionScope.loginUser }">
            	<%@ include file="header_menubtns.jsp" %>
            </c:if>
            	
            <!-- 로그아웃 상태 일떄 아래 부분이 나온다-->
            <c:if test="${ empty sessionScope.loginUser }">
            <ul>
            	<!-- 로그인버튼 -->
            	 <li><%@ include file="header_login_modal.jsp" %></li>
            	 <!-- 회원가입버튼 -->
          		 <li><%@ include file="header_signup_modal.jsp" %></li>
            </ul>
            </c:if>
            <!-- 회원가입시 나오는 모달 -->
            <c:if test="${ param.open == 1 }">
				<%@ include file="/WEB-INF/views/member/membership_check_modal_1.jsp" %>
			</c:if>
			<c:if test="${ param.open == 2 }">
				<%@ include file="/WEB-INF/views/member/membership_check_modal_2.jsp" %>
			</c:if>
        </div>
        
        
    </nav>
     <c:if test="${ !empty loginUser }">
 					<%@ include file="friend.jsp" %>
	</c:if>
<script>
        function goHome1(){
            location.href="<%=request.getContextPath()%>";
        }
        
        function goHome2(){
            location.href="<%=request.getContextPath()%>/allFeed.bo";
        }
        
        
    	$(function() { // 모달 닫기
			
    		$("input:checkbox[class='chk']").click(function(e) {
            	e.stopPropagation();
                var num = $(this).index();
                $("input:checkbox[class='chk'] li").eq(num).show();
            });
    		
    		
		    $(document).click(function(event) {
		    	
		    	var $target = $(event.target);
		    	
		    	if($target.is("#social_alarm_tab") || $target.is("#system_alarm_tab")){
		    		$("input:checkbox[id='alarm_chk']").prop("checked", true);
		    	} else{
		    		$("input:checkbox[class='chk']").prop("checked", false);
		    	}
		    		
		    }); 
	    });
		

</script>
<script>
	var socket = null;
	var chatSocket = null;
	var loginUser = "${loginUser.userId}";
	
	$(document).ready(function() {
		if(loginUser != ""){
			connectWs();		
		}
	});

	function connectWs() {
		
		var sock = new WebSocket("ws://"+location.host+"/spring/echo/websocket");
		
		socket = sock;

		sock.onopen = function() {
			console.log('info: connection opened.');
		};

		sock.onmessage = function(evt) {
			var data = evt.data;
			console.log("ReceiveMessage : " + data + "\n");
			
			if(data.substring(0, 5) == '[chat]'){
				$.ajax({
					url : 'countUnReadChat.ct',
					type : 'POST',
					dataType : 'text',
					success : function(data) {
						if (data == '0') {
						} else {
							$('#messageCountSpan').addClass('bell-badge-danger bell-badge');
							$('#messageCountSpan').text(data);
						}
					},
					error : function(err) {
						alert('err');
					}
				});
			} else{
				$.ajax({
					url : 'countUnReadAlarm.ws',
					type : 'POST',
					dataType : 'text',
					success : function(data) {
						if (data == '0') {
						} else {
							$('#alarmCountSpan').addClass('bell-badge-danger bell-badge');
							$('#alarmCountSpan').text(data);
						}
					},
					error : function(err) {
						alert('err');
					}
				});
			}
			
			var urlAndcontent = data.split(',');
			var alarm_content = urlAndcontent[0];
			var url_address = urlAndcontent[1];

			// 채팅방에 있지 않을때 알림
			if(!chatSocket){
				Push.create("MusicStage", {
					body: alarm_content,
					icon: "<%=request.getContextPath()%>/resources/images/8분음표.png",
					onClick: function() {
						if(url_address != null){
							location.href=url_address;
						}else{
							$("#drop_btn_label").click();
						}
					}
				});
			}
		};

		sock.onclose = function() {
			console.log('connect close');
// 			setTimeout(function(){conntectWs();} , 1000);
		};

		sock.onerror = function(err) {
			console.log('Errors : ', err);
		};

	}
</script>
</body>
</html>