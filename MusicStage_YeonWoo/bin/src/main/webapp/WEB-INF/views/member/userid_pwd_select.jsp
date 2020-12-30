<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="/resources/css/membership.css?after"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/default.css?after"/>" rel="stylesheet">
<style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
    </style>
</head>
<body>
<body class="div_main_frame" style="width: 450px; height: 800px;">
    <div>
        <div class="div_main_frame" style="margin-top: 50px;">
            <p style="background-color: e4e5ed; margin: 0px; border-top-left-radius:8px; border-top-right-radius: 8px; height: 40px; line-height: 40px; padding-left: 10px; font-size: 16px; font-weight: bolder; ">아이디 찾기</p>
            <div style="text-align: center;">
                <input type="text" id="userName" placeholder="  본명" style=" width: 300px; height: 40px; margin-top: 20px; border-radius: 5px; border-style: solid; border-width: 1px; border-color: e4e5ed;">
                <input type="text" id="emailAdress" placeholder="  이메일 주소" style=" width: 300px; height: 40px; margin-top: 20px; border-radius: 5px; border-style: solid; border-width: 1px; border-color: e4e5ed;">
                <p style="font-size: 6px;padding-left:25px; text-align: left; width: 300px; height: 40px; margin-top: 20px;">스테이지 가입 인증시 등록하셨던 이메일 입력부탁드립니다.</p>
                <input type="button" id="userid" onclick="userId_select()" value="SMS로 이메일 주소 전송" style="width: 300px; height: 40px; margin-top: 20px;  background-color: rgba(230, 36, 36, 0.644); border-color: rgba(230, 36, 36, 0.644); border-radius: 5px; color: white;">
                <input type="button" id="view" onclick="userId_select()" value="비밀번호 변경 URL 전송" style="display:none; width: 300px; height: 40px; margin-top: 20px;  background-color: rgba(230, 36, 36, 0.644); border-color: rgba(230, 36, 36, 0.644); border-radius: 5px; color: white;">
            </div>    
        </div>

        <div class="div_main_frame" style="margin-top: 30px; height: 280px;">
            <p style="background-color: e4e5ed; margin: 0px; border-top-left-radius:8px; border-top-right-radius: 8px; height: 40px; line-height: 40px; padding-left: 10px; font-size: 16px; font-weight: bolder; ">비밀번호 찾기</p>
            <div style="text-align: center;">
          		 <span id="timewrite"></span>
                <input type="text" id="id" placeholder=" 아이디" style=" width: 300px; height: 40px; margin-top: 20px; border-radius: 5px; border-style: solid; border-width: 1px; border-color: e4e5ed;">
                <input type="text" id="userEmail" placeholder=" 이메일" style=" width: 300px; height: 40px; margin-top: 20px; border-radius: 5px; border-style: solid; border-width: 1px; border-color: e4e5ed;">
                <p id="inpo" style="font-size: 6px;padding-left:25px; text-align: left; width: 300px; height: 40px; margin-top: 20px;">스테이지 가입 시 등록했던 이메일 입력시, 인증번호가 전송됩니다.</p>
                <input type="button" id="final_con" onclick="send_mail()" value="비밀번호 변경 URL 전송" style="width: 300px; height: 40px;   background-color: rgba(230, 36, 36, 0.644); border-color: rgba(230, 36, 36, 0.644); border-radius: 5px; color: white;">
                 <input type="text"  id="count_view" class="input_frame_t" style=" width: 300px; height: 40px; display: none;">
                 <input type="button" id="comm"  value="확인" style="width: 300px; height: 40px; display: none;  background-color: rgba(230, 36, 36, 0.644); border-color: rgba(230, 36, 36, 0.644); border-radius: 5px; color: white;">
            </div>    
        </div>
        <div>
            <span id="login" style="margin-left: 50px; margin-top: 20px; width: 100px;  display: inline-block; color:  rgba(230, 36, 36, 0.644); font-weight: bold;"><%@ include file="/WEB-INF/views/common/header_login_modal.jsp" %></span>
            <span  id="member"style=" display: inline-block; width: 250px; text-align: right; color:  rgba(230, 36, 36, 0.644); font-weight: bold;"><%@ include file="/WEB-INF/views/common/header_signup_modal.jsp" %></span>
        </div>
    </div>    

	
	

</body>
<script type="text/javascript">


function userId_select(){
		var userName = $('#userName').val();
		var emailAdress = $('#emailAdress').val();
		console.log(userName);
		console.log(emailAdress);
				$.ajax({
						url:'userSelect.fo',
						type: 'GET',
						data:{userName:userName,emailAdress:emailAdress},
						dataType:'json',
						success:function(data){
							console.log(data);
							console.log(typeof(data));
							$('#userid').css('display','none');
							$('#view').css('display','inline-block');
							$('#view').attr('type','text');
							$('#view').val(" 아이디는  : "+ data.id);
							$('#view').onclick=null;
							
						}			
					})
}
function send_mail(){
	$("#id").css('display','none');
	$("#count_view").css('display','inline-block');
	$("#final_con").css('display','none');
	$("#timewrite").css('display','inline-block');
	$("#userEmail").css('display','none');
	$("#inpo").html("인증번호를 입력해주세요");
	$("#comm").css('display','inline');
	alert("이메일을 확인해주세요");
	send_s();
}
function send_s(){
	var id=	$("#id").val();
	var gg=	$("#userEmail").val();
	console.log(gg);
		$.ajax({
			url:'userpwd.xo',
			type:'GET',
			dataType:'json',
			data:{userEmail : gg, userid:id},
			success:function(data){
				console.log(data.num);
				console.log(data.secret);
				if(data.num == '1'){
					 Timer()
					$('#comm').on('click',function(){
							if($('#count_view').val() == data.secret){
									alert("인증에 성공하였습니다.")
										$('#comm').attr('type','text');
										$('#comm').val("임시비밀번호는 : "+ data.Pwd+" 입니다.");
										$('#comm').off();
									return true;
								}else{
							alert("인증에 실패하였습니다.")
							return false;
									}
							
						})
					}
 				}
		});
}
var titi = null;
 	function Timer(){
		var SetTime = 180; 
		timecal();
		titi = setInterval(timecal,1000);
		var dd =	 timecal();
		if(dd == false){
		
			}

			function timecal(){
				var timecount = 	Math.floor(SetTime/60)+"분"+(SetTime%60)+"초";
				$("#timewrite").html(timecount);
				SetTime--;

					if(SetTime == -1){
					alert("시간 초과 되었습니다.");
					clearInterval(titi);

					$("#id").css('display','inline-block');
					$("#count_view").css('display','none');
					$("#final_con").css('display','inline-block');
					$("#timewrite").css('display','none');
					$("#userEmail").css('display','inline-block');
					$("#comm").css('display','none');

						return false;
					}

				}
			
				}
	 </script>
</html>