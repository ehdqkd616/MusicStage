<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
$(function(){
	  $('.bxslider').bxSlider({
	    mode: 'fade', /* 이미지가 교체되는 방식, 수직 수평 .. */
	    pager: false, /* ... 없애기 */
	    slideWidth: 600,
	    infiniteLoop: false, /* 무한 루프 안함. */
	    hideControlOnEnd: true, /* 좌우 화살표의 숨김. */
	    minSlides: 5,
	    maxSlides: 2,
	  });
	});
</script>

<style>
.bx-wrapper {
	border: 1px solid #DBDBDB;
	box-shadow: none;
	background: white;
	padding: 10px;
	margin: 30px 420px 0px 420px;
	width: 1000%;
}

.bx-wrapper img {
	width: 80px; 
	height: 80px;
	border-radius: 50px;
}



.recommend_profile {
	border: 1px solid red;
	width: 80px !important;
	float: right;
}
/* .bxslider img {
	width: 80px; 
	height: 80px;
	border-radius: 50px;
} */
</style>
</head>
<body>
	<div class="bxslider">
		<div class="recommend_profile"><img src="resources/testImage/profile_ddobi.png"></div>
		<div class="recommend_profile"><img src="resources/testImage/profile_ddobi.png"></div>
		<div class="recommend_profile"><img src="resources/testImage/profile_ddobi.png"></div>
		<div class="recommend_profile"><img src="resources/testImage/profile_ddobi.png"></div>
	</div>
</body>
</html>