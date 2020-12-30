<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="<c:url value="/resources/css/membership.css"/>" rel="stylesheet">

<style>
   @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
   
   .hidden_div{
   		display:none;
   }
   
   input[id*="registrationNumber1"]{
   		width:40% !important;
   }
   
   input[id*="registrationNumber2"]{
   		width:5% !important;
   }
   
   #check_id{
   		cursor: pointer;
   }
   
   .registration{margin-bottom: 10px;}
   
   #ok-eamil{color:red;}
   
</style>
</head>
<body>
 <div>
        <!-- 로고 상단 부분 -->
        <div>
			<%@ include file="../common/header.jsp" %>
        </div>
        <!-- 컨텐츠 내용 부부 -->
        <div >
         
           <span id="content_frame">
                 <form method="post" style="padding-left:100px; padding-right: 100px; padding-top:100px;">
                    <div style="text-align: left;">
                        <img src="${pageContext.request.contextPath }/resources/images/check_2.PNG" style="width: 150px;">
                    </div>  
                    <h1 style="margin-bottom: 50px;"><b style="color: black; font-size: 1.5em; font-family: 'Nanum Gothic', sans-serif ;">이것만 입력하면 회원가입 완료!!</b></h1>

                    <h4>*아이디(사용자 ID는 6~20자 사이의 영문+숫자로 이루어져야 하며 영문으로 시작되어야 합니다)</h4>
                   	<c:if test="${not empty kakaoToken}">
                   		<input type="text" name="userId" id="userId" placeholder="" class="input_frame"  placeholder="아이디를 입력해주세요" value="${registerUser.userId}" readonly>
                   		<input type="button" value="아이디 중복확인" id="check_id" class="button_css2" disabled>
                   		<input  type="hidden" id="hidden_id" class="hidden_class" value="true">
                   	</c:if>
                   	<c:if test="${empty kakaoToken}">
                   		<input type="text" name="userId" id="userId" placeholder="" class="input_frame"  placeholder="아이디를 입력해주세요" value="">
                   		<input type="button" value="아이디 중복확인" id="check_id" class="button_css2">
                   		<input  type="hidden" id="hidden_id" class="hidden_class" value="false">
                   	</c:if>
                    <h4>*비밀번호(사용자 PASSWORD는 8~25자 사이의 최소 하나의 문자 및 하나의 숫자가 있어야합니다)</h4>
                    <input type="password" name="password" id="password" class="input_frame_t" placeholder="비밀번호를 입력해주세요" autocomplete="off">
                    
                    <input type="password" name="re_password" id="re_password" class="input_frame_t" placeholder="비밀번호를 한번더 입력해주세요" autocomplete="off">
                    <input type="hidden" id="hidden_pwd" class="hidden_class" value="false">
                    <h4>*이름</h4>
                    <c:if test="${not empty kakaoToken}">
                    	<input type="text" name="userName" id="userName" class="input_frame_t" value="${registerUser.userName}" readonly>
                    	<input type="hidden" id="hidden_name" class="hidden_class" value="true">
                    </c:if>
                   	<c:if test="${empty kakaoToken}">
                   		<input type="text" name="userName" id="userName" class="input_frame_t" value="">
                    	<input type="hidden" id="hidden_name" class="hidden_class" value="false">
                   	</c:if>
                    <h4>*닉네임</h4>
                    <input type="text" name="nickName" id="nickName" placeholder="   닉네임를 입력해주세요" class="input_frame_t" >
                    <input type="hidden" id="hidden_nickName" class="hidden_class" value="false">
                    <div id="rn_form">
					        <h4>*주민등록번호</h4>
					            <input type="text" name="registrationNumber1" id="registrationNumber1" class="registration" size="6" maxlength="6" onkeyup="checkNext();">
					            <span style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					            <input type="text" name="registrationNumber2" id="registrationNumber2" class="registration" size="1" maxlength="1"><span style="font-size:20px; margin-left: 20px;">*&nbsp;&nbsp;*&nbsp;&nbsp;*&nbsp;&nbsp;*&nbsp;&nbsp;*&nbsp;&nbsp;*</span>
				        		<input type="hidden" id="hidden_jumin" class="hidden_class" value="false">
				        <div class="hidden_div">
					        <h4>생년월일</h4>
					            <input type="text" name="birth_y" id="birth_y" size="4" maxlength="4"> 년  
					            <input type="text" name="birth_m" id="birth_m" size="2" maxlength="2"> 월  
					            <input type="text" name="birth_d" id="birth_d" size="2" maxlength="2"> 일
					        <h4>성별</h4>
					            <input type="radio" name="gender" class="gender" size="4" maxlength="4" value="M">남 
					            <input type="radio" name="gender" class="gender" size="4" maxlength="4" value="W">여
				        </div>
				    </div>
                    <h4>*이메일 인증</h4>
                   	<c:if test="${not empty kakaoToken}">
                   		<input type="email" name="email" id="email"  class="input_frame_t" value="${registerUser.userId}">
	                    <input type="text" id="auth" class="input_frame" placeholder="인증번호를 입력해주세요" readonly>
	                    <button type="button" id="btn-email" class="button_css2" disabled>이메일 인증</button>
	                    <div id="ok-eamil">인증이 완료되었습니다</div>
	                    <input type="hidden" id="random">
                   	</c:if>
                   	<c:if test="${empty kakaoToken}">
                   		<input type="email" name="email" id="email"  class="input_frame_t" value="">
	                    <input type="text" id="auth" class="input_frame" placeholder="인증번호를 입력해주세요">
	                    <button type="button" id="btn-email" class="button_css2">이메일 인증</button>
	                    <div id="ok-eamil"></div>
	                    <input type="hidden" id="random">
                   	</c:if>
                    <h4>*핸드폰</h4>
                    <input type="text" name="phone" id="phone" class="input_frame_t" placeholder="01012345678(-생략)">
                    <input type="hidden" id="hidden_phone" class="hidden_class" value="false">
                    <h4>*주소</h4>
                    <input type="text" name="address" id="address" class="input_frame_t">
                    <input type="hidden" id="hidden_address" class="hidden_class" value="false">
                    <h4>URL</h4>
                   <input type="url" name="url_address" id="url_address" class="input_frame_t">
                    <input type="hidden" id="hidden_url" class="hidden_class" value="true">
                    <div style="text-align: center;">
                    </div>
                </form>
                	<button id="btn-save" class="button_css4">다음</button>
            </span>
        </div>  
    </div>
<script src="resources/js/user.js"></script>
<script>
     
 function checkNext() {

     $front = $("#registrationNumber1");
     $front_length = $front.val().length;
     $back = $("#registrationNumber2");

     if ($front_length >= 6) {
         $back.focus();
     }
 }

	// 이메일
	$(function(){
	 
	 $("#ok-email").hide();
	 
	 $.ajax({
		 url: "random.com",
		 success: function(data){
			 obj = JSON.parse(data);
			 console.log(obj);
			 $("#random").val(obj);
		 }
	 })
 });
 
 $("#btn-email").click(function(){
	 
	 $.ajax({
		 url: "emailCheck.com",
		 data: {email: $("#email").val(), random: $("#random").val()},
		 async:false,
		 success: function(data){
			 
			 if(data == "ok"){
			 	alert("사용가능한 이메일입니다. 인증번호를 입력해주세요");	 
			 } else if(data == "false"){
				 alert("다시 시도해주세요");
			 }
		 },
		 error:function(data){
			 alert("이메일을 확인해주세요");
			 return false;
		 }
	 });
 });
 
 $("#auth").change(function(){
	 
	 if($("#auth").length >= 1){
		 $("#ok-eamil").show();	 
	 }
	 
	 $.ajax({
		 url: "emailAuth.com",
		 data: {random : $("#random").val(), auth : $("#auth").val()},
		 success: function(data){
			
			 if(data == "ok"){
				 $("#ok-eamil").text("인증이 완료되었습니다");
			 } else if(data == "false"){
				 $("#ok-eamil").text("인증번호를 잘못 입력하셨습니다");
			 }
		 },
		 error: function(data){
			 alert("다시 시도해주세요");
		 }
	 });
 });
 
 
 // 주소
 	
	function jusoCallBack(address){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.getElementById("address").value = address;
			
	var address_length = $("#address").val().length;
	
		if(address_length > 0){
			$('#hidden_address').val("true");
		} else{
			$('#hidden_address').val("false");
		}			
	}

</script>
</body>
</html>