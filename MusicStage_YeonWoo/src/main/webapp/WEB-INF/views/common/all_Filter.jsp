<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
	color: #4B4B4B !important;
	/* a태그 default css가 black인가봄. 기본색 #4B4B4B으로 바꿔줌. */
}

/* 1. 메인 div */
.filter_main_div {
	border: 1px solid #DBDBDB;
	border-radius: 4px;
	background: white;
	width: 200px;
	float: right;
	margin-top: 30px;
	margin-right: 25px;
}

/* 2. 보드형식, 피드형식 아이콘 div */
.typeSelect_div {
	padding: 7px 0 5px 3px;
	border-bottom: 2px solid #DBDBDB;
}

.typeSelect_div img {
	width: 20px;
	height: 20px;
}

label{
	cursor: pointer;
}

/* 3. 카테고리 */
.filter_title {
	padding: 10px;
	font-size: 16px;
	font-weight: bold !important;
	background: #A7543A;
	color: white;
	border-bottom: 2px solid #DBDBDB;
}

.filter_sub_div {
	line-height: 40px;
    font-size: 14px;
    font-weight: bold;
    color: #4B4B4B !important;
}

#moreFileter{
	display:inline-block;
	width:10px;
	height: 10px;
	margin-left: 80px;
}

#moreImg{
	width: 10px;
	height: 10px;
	margin-top: -20px;x
}


.aTag{
	width: 45px;
    height: 35px;
    display: inline-block;
   	text-align: center;
}

.aTag label{
	/* margin-left: 10px; */
}


</style>
</head>
<body>

	<div class="filter_main_div">
		<div class="typeSelect_div">
			<a href="allFeed.bo"  class="aTag"><img src="resources/images/feed타입.png"><br><label>FEED</label></a>
			<a href="allBoard.bo"  class="aTag"><img src="resources/images/board타입.png"><br><label>BOARD</label></a><!-- 보드형식 아이콘 못찾아서 임시. -->
		</div>
		
	</div>
	
</body>
</html>