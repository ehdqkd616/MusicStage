<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
<style>
	.myPage_btn_ul{
		width: 220px;
    	display: flex;
    	justify-content: flex-end;
    	margin-left: 80px;
   	    padding-top: 15px;
	}
	
	.myPage_btn_ul li{
		margin-left: 35px;
		width: 35px;
        height: 35px;
	}

    .myPage_btn .icon {
        width: 27px;
        height: 27px;
    }

    .myPage_btn {
        display: inline-block;
        transition: 0.5s;
    }

    .myPage_btn:hover > .icon {
    	width: 30px;
    	height: 30px;
    	transition: 0.5s;
    	margin-top: -3px;
    	
        
    }

    .drop_btn{
        cursor: pointer;
    }
    
    .chk{
        display: none;
    }
    	        
	.message-badge{
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
	.message-badge-danger {
	    background-color: #db5565;
	}    
    
</style>
</head>
<body>
	<ul class="myPage_btn_ul">
		<li>
			 <a href="#" class="myPage_btn" onclick="goinsertBoard();"><img src="<%= request.getContextPath() %>/resources/images/글쓰기버튼1.png" class="icon write"></a>
		</li>
		<li>
			<a href="#" class="myPage_btn" onclick="goChat();"><img src="<%= request.getContextPath() %>/resources/images/메세기.png" class="icon"></a>
			<span id="messageCountSpan"></span>
		</li>
		<li>
    		<%@ include file="header_alarm_btn.jsp" %>
		</li>
		<li style="margin-left: 30px; margin-right: 20px;">
			<%@ include file="header_profile_btn.jsp" %>
		</li>
	</ul>
	
	<script>
		function goChat(){
			location.href="chatting.ct?chatRoom_id=0&partnerUserId=";
		}
	
		function goinsertBoard(){	
			location.href="boardWrite.bo";
		}
		
		/* ------------ 알람 갯수 초기화 ----------- */
		$.ajax({
			type: "post",
			url : "countUnReadAllMessage.ct",
			dataType: "JSON",
			success : function(data){
				console.log("countUnReadMessage.ct Ajax Success");
				$('#messageCountSpan').addClass('message-badge message-badge-danger')
				$('#messageCountSpan').text(data);
			},
			error : function(request, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	</script>
</body>
</html>