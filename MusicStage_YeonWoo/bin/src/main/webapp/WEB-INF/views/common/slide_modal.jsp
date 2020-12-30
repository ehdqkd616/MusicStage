<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HashMap<String, String[]> list = new HashMap<>();
	String[] name = {"소셜", "전문가 찾아요", "학생 찾아요", "연습실", "컬럼", "유저 사용기", "악기관련", "음악장비"};
	String[] path = {"social.jpeg", "find.jpeg", "column.jpeg", "review.jpeg", "vocal.jpeg", "guitar.jpeg", "band.jpeg"};
	
		list.put("name", name);
		list.put("path", path);
	
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>SlideModal</title>
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>
	.slideWrap_title{
		max-width: 960px;
        width:90%;
        margin: 0 auto;
        position: relative;
        padding: 20px 0;
	}
	
	.slideWrap_title h2{
		font-size:30px;
		color: #000;
	}
	
    div[id*=slideWrap]{
        max-width: 960px;
        width:90%;
        margin: 0 auto;
        position: relative;
        padding: 20px 0;
    }

    .bx-wrapper{
        box-shadow:none;
        max-width: 960px;
    }

    .prev{
        position: absolute;
        top:40%;
        transform: translateY(-50%);
        color: black;
        font-size: 30px;
        left:-20px;
    }

    .next{
        position: absolute;
        top:40%;
        transform: translateY(-50%);
        right: 0%;
        color: black;
        font-size: 30px;
        right: -20px;
    }

    .modal-img-slide{
        width: 100%;
        height: 350px;
        border-radius: 5px;
    	border: 1px solid lightgray;
    }

    .modal-bg-slide{
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
        z-index:3;
    }

    .bg-active{
        visibility: visible;
        opacity: 1;
    }

    .modal-slide{
        position:relative;
        width:300px;
        height:500px;
        background-size: cover;
    }

    .modal-content{
        position: absolute;
        width:100%;
        height: 100%;                                                                 
        color: white;
        z-index: 2;
        text-align: center;
        display: flex;
        justify-content: space-around;
        align-items:center;
        flex-direction: column;
    }

	.basic_btn{
        background-color: #833821;
        color: #fff;
        height: 30px;
        border-radius: 5px;
        cursor: pointer;
    }
    
	.slide_btn{
        padding: 10px 30px;
        z-index:2;
        outline:none;
    }

    .modal-close_slide{
        position:absolute;
        top:10px;
        right:10px;
        font-weight: bold;
        cursor: pointer;
        color: #010101;
        z-index:2;
    }

    .img-cover{
        position: absolute;
        height: 100%;
        width: 100%;
        background-color: rgba(0, 0, 0, 0.2);                                                                 
        z-index:1;
        background-size:cover;
        border-radius:7px;
    }
    
    #multiple_slider li p{ text-align: center; margin-top: 10px; font-size: 16px;}
    
    .modal-content > h1,  .modal-content > h2{z-index: 2; color: #010101;}
    
    .modal-content > h1{font-size: 35px;}
    
    .modal-content > h2{font-size: 30px;}
    
</style>
</head>
<body>
	<div class="slideWrap_title">
    	<h2>STAGE 인기 서비스</h2>
    </div>
	    <div id="slideWrap multipleWrap">
			<ul id="multiple_slider">
	    		<c:forEach var="path" items="${list.path}" varStatus="status">
	    				<li><img class="modal-img-slide" src="${contextPath}/resources/images/main_slide/${path}">
	    				<input type="hidden" class="hidden_index" value="${status.index}">
	    			<c:forEach var="name" items="${list.name[status.index]}">
	    				<p>${name}</p></li>
	    			</c:forEach>
	           	</c:forEach>
	        </ul>
	        <div class="multiple_controls">
				<span class="prev"><i class="fas fa-chevron-left"></i></span>
				<span class="next"><i class="fas fa-chevron-right"></i></span>
			</div>
	    </div>

    <div class="modal-bg-slide">
        <div class="modal-slide">
            <div class="modal-content">
	                <h1>title</h1>
	                <h2>content</h2>
                <button class="slide_btn basic_btn">버튼</button>
                <span class="modal-close_slide">X</span>
                <div class="img-cover"></div>
            </div>
        </div>
    </div>
    
    <script>
        $(function(){
            var slider = $('#multiple_slider').bxSlider({
                            minSlides:3,
                            maxSlides:3,
                            moveSlides:1,
                            slideWidth:300,
                            slideMargin:30,
                            pager:false,
                            controls:false,
                            touchEnabled:false
                            });

                            $('.multiple_controls span').click(function(){
                                if($(this).hasClass('prev')){
                                    slider.goToPrevSlide();
                                } else{
                                    slider.goToNextSlide();
                                }
                             });
                     });
                     
            var modalImgList = document.querySelectorAll('.modal-img-slide');
            var modalBg = document.querySelector('.modal-bg-slide');
            var modalClose = document.querySelector('.modal-close_slide');
      
            $(modalImgList).each(function(){
                    
                    $(this).click(function(){
                    		
                    		var index = parseInt($(this).next().val());
                    	
                    		var	title = ["소셜", "전문가 찾아요", "학생 찾아요", "연습실", "컬럼", "유저 사용기", "악기관련", "음악장비"];
                    		var	content = ["자유롭게 이야기 하는 소셜 공간 입니다", "선생님과 학생을 찾는 공간 입니다", "전문적인 음악 이야기는 써내려가는 컬럼 공간 입니다", "음악 경험을 자유롭게 이야기하는 리뷰 공간 입니다", "노래와 보컬에 관한 글이 있는 공간 입니다", "기타와 베이스에 관한 글이 있는 공간 입니다", "밴드와 합주에 관한 글이 있는 공간 입니다"];
                    		var path = ["socialFeed.bo", "searchType.bo?searchType%5B%5D=ft", "searchType.bo?searchType%5B%5D=fs", "searchType.bo?searchType%5B%5D=fp", "columnFeed.bo", "searchCate.bo?subCate%5B%5D=유저사용기&detailSearch=", "searchCate.bo?subCate%5B%5D=악기관련&detailSearch=", "searchCate.bo?subCate%5B%5D=음악장비&detailSearch="];
                    		var realPath = path[index];
                    		console.log(realPath);
                    		
							$(".img-cover").css("background-image", "url("+this.src+")");
							$(document).find(".modal-bg-slide").find("h1").text(title[index]);
							$(document).find(".modal-bg-slide").find("h2").text(content[index]);
							$(document).find(".modal-bg-slide").find(".slide_btn").click(function(){
								location.href= realPath;
							})
                            $(modalBg).addClass('bg-active');
                            
                         });
                    
                    $(modalClose).click(function(){

                        $(modalBg).removeClass('bg-active');
                    });
                    
                  });
           
    </script>
</body>
</html>