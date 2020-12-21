<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Section_MenuBar</title>
<style>
	/* 메뉴바 */
	.category_bar {
		height: 70px; /* 실 60 */
		text-align: center;
	}
	.category_button {
		width: 70px;
		/* background: transparent; */ /* 버튼 배경색 없애기 */
		background: white;
		border: 1px solid #DBDBDB;
		outline: 0; /* 클릭했을 때 테두리 색 바뀌는 거 끄기 */
		border-radius: 5px;
		padding: 5px 10px;
		cursor: pointer;
	}
	.category_bar button:hover {
		background: #DBDBDB
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<aside>
		<div class="category_bar" align="center">
			<button class="category_button" onclick="location.href='${contextPath}/socialFeed.bo'"># 소셜</button>&nbsp;
			<%-- <button class="category_button" onclick="location.href='${contextPath}/socialBoard.bo'"># 소셜</button>&nbsp; --%>
			<button class="category_button" onclick="location.href='${contextPath}/findFeed.bo'"># 찾아요</button>&nbsp;
			<%-- <button class="category_button" onclick="location.href='${contextPath}/findBoard.bo'"># 찾아요</button>&nbsp; --%>
			<button class="category_button" onclick="location.href='${contextPath}/columnFeed.bo'"># 컬럼</button>&nbsp;
			<%-- <button class="category_button" onclick="location.href='${contextPath}/columnBoard.bo'"># 컬럼</button>&nbsp; --%>
			<button class="category_button" onclick="location.href='${contextPath}/reviewFeed.bo'"># 리뷰</button>
			<%-- <button class="category_button" onclick="location.href='${contextPath}/reviewBoard.bo'"># 리뷰</button> --%>
		</div>
	</aside>
</body>
</html>