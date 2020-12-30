<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Header_SignupModal</title>
	<link href="<c:url value="/resources/css/membership.css?after"/>" rel="stylesheet">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
    
    .modal-btn3{
        display: none;
    }

    .modal-bg3{
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

    .bg-active3{
        visibility: visible;
        opacity: 1;
    }

    .modal3{
        position:relative;
        background-color: white;
        width:350px;
        height:350px;
        display: flex;
        align-items:center;
        border-radius: 10px;
    }

</style>
</head>
<body>
    <input type="button" class="modal-btn3">

    <div class="modal-bg3">
        <div class="modal3">
            
     		<div class="div_main_frame"> 
        <div class="headpoint">
            <span class="backbutton">
                <img src="${pageContext.request.contextPath}/resources/images/back.png" style="width: 15px;">
            </span>
            <span class="headpoint_dot">
                <img src="${pageContext.request.contextPath}/resources/images/gg.png " style="width: 5px;">
            </span>
            <span class="headpoint_dot">
                <img src="${pageContext.request.contextPath}/resources/images/gg.png " style="width: 5px;">
            </span>
            <span class="headpoint_dot">
                <img src="${pageContext.request.contextPath}/resources/images/gg.png " style="width: 5px;">
            </span>
            <span class="headpoint_dot">
                <img src="${pageContext.request.contextPath}/resources/images/gg.png " style="width: 5px;">
            </span>
            <p style="font-size: 4px;">마지막 단계입니다! 전문가이신가요?<br>
            전문가 등록을 하시면 다양한 혜택을 누리세요!</p>
        </div>
      
        <div style="margin-bottom: 20px; margin-top: 20px; text-align: center;" >        
            <button class="button_css5"><p class="text_p" ><a href="${pageContext.request.contextPath}/final2.fo">전문가 등록</a></p></button>
        </div>
        <div style="margin-bottom: 20px;  text-align: center;">
        <p class="text_pp">음악을 즐기러 가볼까요?</p>
        </div>
        <div style=" text-align: center;">        
            <button class="button_css5" id="regiFinal"><p class="text_p">완료</p></button>
        </div>
    </div>
     		
</div>
</div>
    <script>

        var modalBg_signup = document.querySelector('.modal-bg3');

        $(document).ready(function(){
            modalBg_signup.classList.add('bg-active3');
        });

        $(".text_p").click(function(){
        	modalBg_signup.classList.remove('bg-active3');
        });
        
        $("#regiFinal").on("click", function(){
        	location.href="regiFinal.me";
        });
    </script>
</body>
</html>
    
