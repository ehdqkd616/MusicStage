<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Header_SignupModal</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
    .modal-btn1{
        border:none;
        background-color: transparent;
        outline: none;
        font-size: 20px;
        line-height: 60px;
        padding: 0 10px 0 10px;
    }

    .modal-bg1{
        position: fixed;
        width: 100%;
        height:100vh;
        top:0;
        left:0;
        background-color: rgba(0,0,0,0.5);
        display:flex;
        justify-content: center;
        align-items: center;
        visibility: hidden;
        opacity:0;
        transition: visibility 0s opacity 0.5s;
        z-index: 2;
    }

    .bg-active1{
        visibility: visible;
        opacity: 1;
    }

    .modal1{
        position:relative;
        background-color: white;
        width:60%;
        height:70%;
        display: flex;
        align-items:center;
        border-radius: 10px;
    }

    .modal-img1{
        width:60%;
        height: 100%;;
        position: relative;
        border-radius: 10px;
        overflow: hidden;
    }

    .modal-img-word1{
        display: block;
        position: absolute;
        right: 0;
        color:#fff;
        top:10px;
        right: 10px;
    }
    
    .modal-img span + span{top: 40px;}
    
    .modal-login1{
        background-color: white;
        width:40%;
        height:100%;
        position: relative;
        border-radius: 10px;
    }
    
    div[class*="modal-flex1"]{
        display: flex;
        justify-content: space-around;
        flex-direction: column;
        position: absolute;
    }

    .modal-login-up1{
        top:10px;
        height:50%;
    }

    .modal-login-down1{
        top:60%;
        height: 20%;
    }

    .modal-flex1{
        width:90%;
        left:10px;
    }

    .keep-login1{
        float:left;
        position: relative;
    }

    .find-id1{
        float: right;
        position: relative;
    }
    .modal-close1{
        position:absolute;
        top:10px;
        right:10px;
        font-weight: bold;
        cursor: pointer;
    }

    .basic_btn1{
        background-color: #833821;
        color: #fff;
        height: 30px;
        border-radius: 5px;
        cursor: pointer;
    }

    .modal-img-word1{
        font-size: 25px;
        font-weight: bold;
    }
    
    /* signup 코드 */
    .modal-signup1{
        background-color: white;
        width:40%;
        height:100%;
        position: relative;
        border-radius: 10px;
    }

    .modal-signup-up1{
        position: absolute;
        top: 10%;
        margin: 0 10px;
    }

    .modal-signup-up1 p{
        width: 240px;
        font-size: 30px;
        text-align: left;
    }

    .modal-signup-down1{
        top:60%;
        height: 20%;
    }

	.kakao_btn{
    	width:100%;
    	display:inline-block;
    }
    
    .kakao_btn > img{
    	width:100%;
    }
    
    .modal-img1 span + span {
    	top: 40px;
	}
	
    #modalImgFile{
    	transform:rotate(0deg);
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
    <input type="button" class="modal-btn1" value="회원가입">

    <div class="modal-bg1">
       	<form class="modal1" action="join1.me" method="post">
            <div class="modal-img1">
            	<img id="modalImgFile" src="<%= request.getContextPath() %>/resources/images/headset.jpeg">
                <span class="modal-img-word1">음악과 하나되는 공간</span>
                <span class="modal-img-word1">STAGE</span>
            </div>
            <div class="modal-signup1">
                <div class="modal-signup-up1">
                    <p>1분안에 가입하고 STAGE에 <br> 입성하세요</p>
                </div>
                <div class="modal-signup-down1 modal-flex1">
                    <input type="submit" class="basic_btn1" value="일반회원가입하기">
                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=55976a0aa11f05310aaba03e7fd32700&redirect_uri=http://localhost:8747/spring/callback.me&response_type=code" class="kakao_btn">
                    	<img src="${pageContext.request.contextPath}/resources/images/카카오 회원가입.png">
                    </a>
                </div>
            </div>
            <span class="modal-close1">X</span>
         </form>
    </div>

    <script>

        var modalBtn_signup = document.querySelector('.modal-btn1');
        var modalBg_signup = document.querySelector('.modal-bg1');
        var modalClose_signup = document.querySelector('.modal-close1');

        modalBtn_signup.addEventListener('click', function(){
            modalBg_signup.classList.add('bg-active1');
            
        });

        modalClose_signup.addEventListener('click', function(){
            modalBg_signup.classList.remove('bg-active1');
        });
    
    </script>
</body>
</html>