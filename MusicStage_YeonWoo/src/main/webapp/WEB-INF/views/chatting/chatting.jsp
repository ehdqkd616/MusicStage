<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/default.css" />
<style>
.container {
	box-sizing:content-box;
	width: 1100px;
	display: grid;
	grid-template:
	"aside header header header" 77px
	"aside main main main" 450px
	"aside footer footer footer" 70px
	/ 250px 100px 300px 450px;
	border: solid black;
	margin: auto;
}

header { grid-area: header; border-bottom: solid black; position:static; height:auto;}
main   { grid-area: main; overflow-y: scroll;}
aside  { grid-area: aside; border-right: solid black;}
footer { grid-area: footer;}
.direct{ 
    height:77px;
    border-bottom: solid black;
    text-align: center;
    line-height: 77px;}

.member{ height:520px; overflow-y: auto;}

.enter {
    padding:5px 10px;
    margin-left: 10px;
}

.writechat {
    border-top: solid black;
    width:100%;
    height: 70px;
    padding:5px 10px 5px 10px;
    box-sizing: border-box;
}

textarea{
    width:750px;
    height:58px;
    line-height: 20px;
    padding:0;
    border: none;
    outline: none !important;
    resize: none;
    overflow: hidden;
}

.format { display: none; }

.member::-webkit-scrollbar { width: 5px; height: auto; background: none; border: 1px solid #DBDBDB; }
.member::-webkit-scrollbar-thumb{ background: #DBDBDB; border-radius: 10px; }

.chat ul { list-style: none; }
.chat ul li { width: 100%; }
.chat ul li.left { text-align: left; }
.chat ul li.right { text-align: right; flex-direction: row-reverse;}

.messageBox {display: inline-block; padding: 20px 20px 0 20px;}
.sender { margin-bottom: 5px; font-weight: bold; }
.message_div {display: flex; align-items: flex-end;}
.message { display: inline-block; word-break:break-all; max-width: 300px; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
.message_time{margin-bottom: 5px;}
.message_time_h{margin: 0px 5px 0px 5px;}

.container ul {
    -webkit-padding-start: 0px;
    margin: 0;
    margin-bottom: 10px;
}

.memberListDiv{
	padding: 10px;
    border-bottom: 1px solid #e4e5ed;
    display: flex;
    justify-content: space-between;
}

.member_img_wrapper {
	flex-basis: 60px;
    width: 60px;
    height: 60px;
    position: relative;
    display: block;
}

.member_img_wrapper2 {
	flex-basis: 50px;
    width: 50px;
    height: 50px;
    position: relative;
    display: block;
}


.member_img {width:100%; height:100%; border-radius: 50%; vertical-align: middle;}

.member_text_info{
	display: flex;
	flex-basis: calc(100% - 60px);
    width: calc(100% - 60px);
    padding-left: 12px;
    display: block;
}

.member_nick_time{display: flex; }
.member_nick{flex-basis:calc(100% - 60px); display:block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
.member_nick2{flex-basis:calc(100% - 50px); margin-left: 10px; line-height: 50px;}

.member_nick_span{font-size: 14px; font-weight: bold;}
.member_nick_span2{font-size: 14px; font-weight: bold;}
.member_last_message_time{flex-basis: 60px; text-align: right; color: gray;}

.member_last_message_wrapper{display:flex;}

.member_last_message{
	padding-top:10px; 
	display:block; 
	flex-basis: calc(100% - 30px);
	white-space: nowrap; 
	overflow: hidden; 
	text-overflow: ellipsis;
	
	white-space: normal;
	line-height: 1.3;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}
.member_last_message_span{}


.member ul li:hover{background: lightgray; cursor: pointer;}

.header_div{width: 100%; height: 100%;}
.member_info_div{display: flex; padding: 12px;}

.msg_count{margin-left: 5px;}

.msg-badge{
    padding: 3px 5px 2px;
    position: relative;
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
    margin-top: 20px;
}
.msg-badge-danger {
    background-color: #db5565;
}

</style>
</head>
<body>
    <div class="container">
        <header>
        	<div class="header_div">
        		<div class="member_info_div">
        			<!-- 채팅방 선택 안했을때 -->
	        		<c:if test="${joinRoom eq null}"></c:if>
	        		
        			<!-- 채팅방 선택했을때 -->
	        		<c:if test="${joinRoom ne null}">
	        			<c:if test="${joinRoom.join_user_profile_pic eq null}">
	        				<div class="member_img_wrapper2"><img class="member_img" id="member_img" src="<%= request.getContextPath() %>/resources/images/profileDefault.png"></div>
	        			</c:if>
	        			<c:if test="${joinRoom.join_user_profile_pic ne null}">
	        				<div class="member_img_wrapper2"><img class="member_img" id="member_img" src="<%= request.getContextPath() %>/resources/userProfile/${joinRoom.join_userId}/${joinRoom.join_user_profile_pic}"></div>
	        			</c:if>  				
	        			<div class="member_nick2"><span class="member_nick_span2" id="member_nick_span2">${joinRoom.join_user_nickName}</span></div>
	        		</c:if>
        		</div>
        	</div>
        </header>
        <aside>
            <div class="direct">Direct</div>
            <div class="member">
                <ul class="memberlistUl">
                	<c:forEach var="list" items="${joinRoomList}">
		                <li class="memberlistLi">
		                	<input id="partnerUserId" type="hidden" value="${list.join_userId}">
		                	<input id="chatRoom_id" type="hidden" value="${list.chatRoom_id}">
	                		<div class="memberListDiv">
	                			<c:if test="${list.join_user_profile_pic eq null}">
		                			<div class="member_img_wrapper"><img class="member_img" src="<%= request.getContextPath() %>/resources/images/profileDefault.png"></div>               			
	                			</c:if>
	                			<c:if test="${list.join_user_profile_pic ne null}">
		                			<div class="member_img_wrapper"><img class="member_img" src="<%= request.getContextPath() %>/resources/userProfile/${list.join_userId}/${list.join_user_profile_pic}"></div>               			
	                			</c:if>
	                			<div class="member_text_info">
	                				<div class="member_nick_time">
	                					<div class="member_nick"><span class="member_nick_span">${list.join_user_nickName}</span></div>
	               						<div class="member_last_message_time"><fmt:formatDate value="${list.lastMessage_time}" pattern="yy-MM-dd" /></div> 
	                				</div>
	                				<div class="member_last_message_wrapper">
	               						<div class="member_last_message">
	               							<span class="member_last_message_span">${list.lastMessage}</span>
	               						</div>
	               						<div class="msg_count">
	               							<div class="msg-badge msg-badge-danger">${list.unRead_message}</div>
	               						</div>
	               					</div>
	                			</div>
	                		</div>
		                </li>
	                </c:forEach>          
                </ul>
            </div>
        </aside>
        <main>
            <div class="chat">
	            <ul class="messageUl">
	            <!-- 메세지 상대가 없을때 혹은 채팅 페이지 처음 들어갔을때 -->
	            <c:if test="${empty chatRoom_id || empty partnerUserId}">
	            	<div class="empty_message_box">
	            		<h1>대화상대를 선택하세요.</h1>
	            	</div>
	            </c:if>
	            
	            <!-- 채팅방 입장했을때 -->
	            <c:if test="${!empty chatRoom_id && !empty partnerUserId}">
	            	<c:forEach var="list" items="${messageList}">
	            		
	            		<!-- 상대방 메세지 -->
	            		<c:if test="${list.message_sender ne loginUser.userId}">
			                <li class="messageLi left">
			                	<div class="messageBox">
				                    <div class="sender">
				                        <span>${list.message_sender_nickName}</span>
				                    </div>
				                    <div class="message_div">
					                    <div class="message">
					                        <span>${list.message_content}</span>
					                    </div>
					                    <div class="message_time">
					                    	<h6 class="message_time_h"><fmt:formatDate value="${list.message_sendTime}" pattern="yy.MM.dd" /></h6>
					                    	<h6 class="message_time_h"><fmt:formatDate value="${list.message_sendTime}" pattern="HH:mm" /></h6>
					                    </div>
					            	</div>
				            	</div>
			                </li>
			        	</c:if>
			        	
			        	<!-- 내 메세지 -->
	                    <c:if test="${list.message_sender eq loginUser.userId}">      
			                <li class="messageLi right">
			                	<div class="messageBox">
				                    <div class="sender">
				                        <span>${list.message_sender_nickName}</span>
				                    </div>
				                    <div class="message_div right">
					                    <div class="meesage_time">
					                    	<h6 class="message_time_h"><fmt:formatDate value="${list.message_sendTime}" pattern="yy.MM.dd" /></h6>
					                    	<h6 class="message_time_h"><fmt:formatDate value="${list.message_sendTime}" pattern="HH:mm" /></h6>
					                    </div>
					                    <div class="message">
					                        <span>${list.message_content}</span>
					                    </div>
					            	</div>
				            	</div>
			                </li>
			    		</c:if>
			    	</c:forEach> 
	            </c:if>  
	            </ul>
            </div>
        </main>
        <footer>
            <div class="writechat">
                <textarea name="chattxt" id="chattxt" cols="30" rows="10" placeholder="메세지 입력..." onkeyup="enterKey()"></textarea>
                <input type="button" class="enter" value="보내기">
            </div>
        </footer>
        
    </div>

    <script>

		var message_sender = "${loginUser.userId}";
		var message_sender_nickName = "${loginUser.nickName}";
		var partnerUserId = "${partnerUserId}";
		var partnerUserNickName = "${joinRoom.join_user_nickName}";
		var chatRoom_id = "${chatRoom_id}";
		var JoinRoom = null;
		
 		$(document).ready(function() {		
 			connectChatWs();
 			$('main').scrollTop($('main')[0].scrollHeight);
 		});
 		
 		function connectChatWs() {
 			
 			var cSock = new WebSocket("ws://"+location.host+"/spring/chat/websocket");
 			
 			chatSocket = cSock;

 			cSock.onopen = function() {
 				console.log('info: chatSocket connection opened.');
 	 	 	 	
 	 	 	 	var messageVO = {
 	 	 	 			"messageType" : "Enter",
 	 	 	 			"message_sender" : message_sender,
 	 	 	 			"message_sender_nickName" : message_sender_nickName,
 	 	 	 			"partnerUserId" : partnerUserId,
 	 	 	 			"chatRoom_id" : chatRoom_id
 	 	 	 	};
 				chatSocket.send(JSON.stringify(messageVO));
 			};

 			cSock.onmessage = function(evt) {
 				var data = evt.data;
 				var dataArray = data.split(",");
 				
 				// protocal : messageType, chatRoom_id, message_content, message_sender
 				
 				console.log("[채팅메세지] ReceiveMessage : " + data + "\n");
 				console.log("messageType : " + dataArray[0]);
 				console.log("chatRoom_id : " + dataArray[1]);
 				console.log("message_content : " + dataArray[2]);
 				console.log("message_sender : " + dataArray[3]);
 				
				// 정의된 CMD 코드에 따라서 분기 처리
				if(dataArray[0] == 'Chat') {					
					console.log("message_content : " + dataArray[2]);
					var str = "";
					
					// 상대방 메세지 
					if(dataArray[3] != message_sender){
						
						str += "<li class='messageLi left'>";
						str += "<div class='messageBox'>";
						str += "<div class='sender'>";
						str += "<span>"+partnerUserNickName+"</span></div>";
						str += "<div class='message_div'>";
						str += "<div class='message'><span>"+dataArray[2]+"</span></div>";
						str += "<div class='message_time'>";
						str += "<h6 class='message_time_h'>"+getDateStamp()+"</h6>";
						str += "<h6 class='message_time_h'>"+getTimeStamp()+"</h6></div>";
						str += "</div></div></li>";
						
					// 내 메세지 
					}else if(dataArray[3] == message_sender){
						
						str += "<li class='messageLi right'>";
						str += "<div class='messageBox'>";
						str += "<div class='sender'>";
						str += "<span>"+message_sender_nickName+"</span></div>";
						str += "<div class='message_div right'>";
						str += "<div class='message_time'>";
						str += "<h6 class='message_time_h'>"+getDateStamp()+"</h6>";
						str += "<h6 class='message_time_h'>"+getTimeStamp()+"</h6></div>";
						str += "<div class='message'><span>"+dataArray[2]+"</span></div>";
						str += "</div></div></li>";
						
					}
					$(".messageUl").find(".messageLi:last").after(str);
					
				}
				// 입장
				else if(dataArray[0] == 'Enter') {
					console.log("message_content : " + dataArray[2]);
				}
				// 퇴장
				else if(dataArray[0] == 'Leave') {
					console.log("message_content : " + dataArray[2]);
				}

 				console.log("현재 채팅방 정보 : \n " + "chatRoom = " + dataArray[1] + "\n message_content = " + dataArray[2] + "\n message_sender = " + dataArray[3]);
 			};		

 			cSock.onclose = function() {
 				console.log('chatSocket connect close');
// 	 			setTimeout(function(){conntectWs();} , 1000);
 			};

 			cSock.onerror = function(err) {
 				console.log('Errors : ', err);
 			};

 		}	
 		
 		function getDateStamp() {
 			  var d = new Date();
 			  var date = leadingZeros(d.getYear()-100, 2) + '.' + leadingZeros(d.getMonth() + 1, 2) + '.' + leadingZeros(d.getDate(), 2);

 			  return date;
 		}
 		
 		function getTimeStamp() {
			  var d = new Date();
			  var time = leadingZeros(d.getHours(), 2) + ':' + leadingZeros(d.getMinutes(), 2);

			  return time;
		}

 		function leadingZeros(n, digits) {
 			var zero = '';
 			n = n.toString();

 			if (n.length < digits) {
 				for (i = 0; i < digits - n.length; i++){
 			    	zero += '0';
 				}
 			}
 			return zero + n;
 		}	

 		$(".memberlistLi").on("click", function(){
			chatRoom_id = $(this).find("#chatRoom_id").val();
			partnerUserId = $(this).find("#partnerUserId").val();
 			location.href="chatting.ct?chatRoom_id="+chatRoom_id+"&partnerUserId="+partnerUserId;
 		});	
 		
 		function enterKey(){
 			if(window.event.keyCode == 13){
	 			send();
 			}
 		}
 		
 		// 보내기 눌렀을때
 		$(".enter").on("click", function(){
	 		send();
 		});
 		
 		function send() {
 	 	 	var message_content = $("#chattxt").val();
 	 	 	
 	 	 	if(message_content == "" || message_content == null){
 				alert("메세지를 입력해주세요.");
 				$("#chattxt").focus();
 	 	 	}else{
 	 	 		//채팅 메세지 DB저장
 	 	 	 	var messageVO = {
 	 	 	 			"messageType" : "Chat",
 	 	 	 			"message_sender" : message_sender,
 	 	 	 			"message_content" : message_content,
 	 	 	 			"partnerUserId" : partnerUserId,
 	 	 	 			"chatRoom_id" : chatRoom_id
 	 	 	 	};
 	 	 	 	
 	 	 	 	$.ajax({
 	 	 	 		type : 'post',
 	 	 	 		url : 'saveMessage.ct',
 	 	 	 		data : JSON.stringify(messageVO),
 	 	 	 		contentType: "application/json; charset=utf-8",
 	 	 	 		dataType : 'text',
 	 	 	 		success : function(data){
 	 	 	 			if(data){
 	 	 	 	 			if(chatSocket){
 	 	 	 	 				console.log("messageVO : " + messageVO);
 	 	 	 	 				console.log(messageVO);
 	 	 	 	 				chatSocket.send(JSON.stringify(messageVO));
 	 	 	 	 				$("#chattxt").val("");
	 	 	 	 	 			$('main').scrollTop($('main')[0].scrollHeight);
	 	 	 	 	 			$("#chattxt").focus();
 	 	 	 	 			}
 			
 		 	 	 			if(socket){
 		 	 	 				let socketMsg = "Chat," + message_sender + "," + partnerUserId + "," +  chatRoom_id // 헤더 소켓에 보낼 메세지
 		 	 	 				console.log("msgmsg : " + socketMsg); // 소켓 메세지 확인 콘솔
 		 	 	 				socket.send(socketMsg); // 소켓에 메세지를 보낸다.
 		 	 	 			}
 	 	 	 			}

 	 	 	 		},
 	 	 	 		error : function(err){
 	 	 	 			console.log(err); 
 	 	 	 		}
 	 	 	 	});
 	 	 	}
 		}
    </script>
</body>
</html>