<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center;">
		<h1>Error</h1>
		<h2 style="color: red;">${ message }</h2>
		<h2 style="color: red;">${ requestScope['javax.servlet.error.message'] }</h2>
	</div>
</body>
</html>