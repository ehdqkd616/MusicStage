<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Header_LoginModal</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.modal-btn {
	border: none;
	background-color: transparent;
	outline: none;
	font-size: 20px;
	line-height: 60px;
	padding: 0 10px 0 10px;
}

.modal-bg-login {
	position: fixed;
	width: 100%;
	height: 100vh;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	visibility: hidden;
	opacity: 0;
	transition: visibility 0s opacity 0.5s;
	z-index: 2;
}

.bg-active {
	visibility: visible;
	opacity: 1;
}

.modal {
	position: relative;
	background-color: white;
	width: 60%;
	height: 70%;
	display: flex;
	align-items: center;
	border-radius: 10px;
}

.modal-img {
	width: 60%;
	height: 100%;;
	position: relative;
	border-radius: 10px;
	overflow: hidden
}

.modal-img-word {
	display: block;
	position: absolute;
	right: 0;
	color: #fff;
	top: 10px;
	right: 10px;
}

.modal-img span+span {
	top: 40px;
}

.modal-login {
	background-color: white;
	width: 40%;
	height: 100%;
	position: relative;
	border-radius: 10px;
}

div[class*="modal-flex"] {
	display: flex;
	justify-content: space-around;
	flex-direction: column;
	position: absolute;
}

.modal-login-up {
	top: 10px;
	height: 50%;
}

.modal-login-down {
	top: 60%;
	height: 20%;
}

.modal-flex {
	width: 90%;
	left: 10px;
}

.keep-login {
	float: left;
	position: relative;
	top: 50%;
	transform: translateY(-50%);
}

label.keep-login {
	left: 10px;
}

.find-id {
	float: right;
	position: relative;
}

.modal-close {
	position: absolute;
	top: 10px;
	right: 10px;
	font-weight: bold;
	cursor: pointer;
}

.basic_btn {
	background-color: #833821;
	color: #fff;
	height: 30px;
	border-radius: 5px;
	cursor: pointer;
}

.modal-img-word {
	font-size: 25px;
	font-weight: bold;
}

.kakao_btn {
	width: 100%;
	display: inline-block;
}

.kakao_btn>img {
	width: 100%;
}

#modalImgFile {
	transform: rotate(0deg);
	-moz-transform: scaleX(-1);
	-o-transform: scaleX(-1);
	-webkit-transform: scaleX(-1);
	transform: scaleX(-1);
	filter: FlipH;
	-ms-filter: "FlipH";
}
</style>
</head>
<body>
    <input type="button" class="modal-btn" value="로그인">

    <div class="modal-bg-login">
    	<div class="modal">
            <div class="modal-img">
            	<img id="modalImgFile" src="<%= request.getContextPath() %>/resources/images/headset.jpeg">
                <span class="modal-img-word">음악과 하나되는 공간</span>
                <span class="modal-img-word">STAGE</span>
            </div>
            <div class="modal-login">
            <form class="login_frm" method="post">
                <div class="modal-login-up modal-flex">
                    <span>로그인</span>
                    <input type="text" name="userId" placeholder="이메일을 입력해주세요.">
                    <input type="password" name="password" placeholder="비밀번호를 입력해주세요.">
                    <input type="button" id="login_btn" class="basic_btn" value="로그인">
                    <div>
                        <input type="checkbox" class="keep-login" id="keep-login">
                        <label for="keep-login" class="keep-login">로그인 유지</label>
                       <a href="confrim.fo" id="ggggw" class="find-id"> 아이디 / 비밀번호 찾기</a>
                    </div>
                </div>
            </form>
                <div class="modal-login-down modal-flex">
                    <input type="button" id="signup_btn" class="basic_btn" value="일반회원가입하기">
                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=55976a0aa11f05310aaba03e7fd32700&redirect_uri=http://localhost:8747/spring/callback.me&response_type=code" class="kakao_btn">
                    	<img src="${pageContext.request.contextPath}/resources/images/카카오 회원가입.png">
                    </a>
                </div>
            </div>
            <span class="modal-close">X</span>
        </div>
    </div>

    <script>
        var modalBtn_login = document.querySelector('.modal-btn');
        var modalBg_login = document.querySelector('.modal-bg-login');
        var modalClose_login = document.querySelector('.modal-close');

        /* modalBtn.addEventListener('click', function(){  
            modalBg.classList.add('bg-active');
        });

        modalClose.addEventListener('click', function(){
            modalBg.classList.remove('bg-active');
        }) */
        
        $(modalBtn_login).click(function(){
        	
        	$(modalBg_login).addClass('bg-active');
        });
        
        $(modalClose_login).click(function(){

            $(modalBg_login).removeClass('bg-active');
        });
        
        $(".basic_btn").on("click", function(e){
        	var target = $(e.target);
        	
        	if(target.is("#login_btn")){
        		$(".login_frm").attr("action", "login.me").submit();
        	} else if(target.is("#signup_btn")){
        		$(".login_frm").attr("action", "join1.me").submit();
        	}
        });
        
        $(".login_frm").keypress(function (e){
        	if(e.keyCode == 13){
        		$(".login_frm").attr("action", "login.me").submit();
        	}
        });
        
    </script>
</body>
</html>
    