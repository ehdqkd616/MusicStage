<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림 디테일 뷰</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
   	<%-- <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/default.css" type="text/css"> --%>
   	<link rel="stylesheet" href="${ contextPath }/resources/css/default.css" type="text/css">
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
	
	body{
		background: #f7f7f7;
	}
	
    .alarm_icon{
        margin-right: 16px;;
        width: 40px;
        height: 40px;
    }
    
	.alarm_detail_section {
		display: block;
		padding: 30px;
		margin-top: 10px;
		margin-left: 30px;
		width: 350px;
		height: 500px;
		border: solid 1px;
	}
	
	.alarm_detail_head_div {
		display: flex;
		flex-direction: row;
		align-items: center;
		padding-bottom: 20px;		
		margin-bottom: 20px;
		font-size: 13px;
		font-weight: bold;
	}
	
	.alarm_detail_title_area{
		display: block;
	}
	
	.alarm_detail_title_icon {
		display: block;
	}
	
	.alarm_detail_title_div {
		display: block;
	}
	
	.alarm_detail_title_text_div {
		display: block;
	}
	
	.alarm_detail_title_time_div {
		font-size: 11px;
		color: gray;
		font-weight: normal;
		display: block;
	}
	
	#detailView{
		color: orange;
	}
	
	
	
</style>



</head>
<body>
	<section class="alarm_detail_section">
		<div class="alarm_detail_head_div">
			<div class="alarm_detail_title_icon">
				<img src="<%=request.getContextPath()%>/resources/images/fresh.png" class="alarm_icon">
			</div>
			<div class="alarm_detail_title_area">
				<div class="alarm_detail_title_text_div">${alarm.alarm_title}</div>
				<div class="alarm_detail_title_time_div"><fmt:formatDate value="${alarm.alarm_date}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
			</div>
		</div>
		<div calss="alarm_detail_content_div">
			${alarm.alarm_content}
			
			<br><br>			
			<c:if test="${alarm.alarm_type eq 'RegisterNo'}">
				<a href="<%= request.getContextPath() %>/registerDetail?register_no=${alarm.register_no}" id="detailView">게시글로 이동</a>
			</c:if>
			<c:if test="${alarm.alarm_type eq 'BoardApproveYes' || alarm.alarm_type eq 'BoardApproveNo'}">
				<a href="<%= request.getContextPath() %>/bDetail.bo?bNum=${alarm.board_no}" id="detailView">게시글로 이동</a>
			</c:if>
		</div>
	</section>
	
	
	
</body>
</html>