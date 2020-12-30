<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>My_Stage</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/default.css"/>" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
	background: #FAFAFA !important;
}

header {
	z-index: 1;
	height: 50px;
	position: fixed;
}

#centerWrap {
	margin: 30px 280px;
	min-height: 800px;
	border: 1px solid #DBDBDB;
	width: 940px;
	background: white;
}

#left_div {
	display: inline-block;
	width: 50%;
	height: 500px;
	float: left;
}

#center_div {
	position: relative;
	top: 150px;
	height: 300px;
	margin: 0 20px;
}

#quick_menu {
	display: flex;
	font-size: 0;
	padding: 0;
	margin: 20px auto;
}

#quick_menu li {
	display: inline-block;
	width: 25%;
	font-size: 12px;
	list-style: none;
	text-align: center;
}

#quick_menu img {
	max-width: 80%;
	max-height: 50%;
}

#right_div {
	display: inline-block;
	width: 50%;
	height: 500px;
	float: left;
}

#main_img {
	height: 100%;
	object-fit: cover;
	-webkit-filter: grayscale(100%);
	filter: gray;
	opacity: 0.2;
	max-width: -webkit-fill-available;
	max-height: 100%;
}

#slide_menu {
	display: inline-block;
	width: 100%;
	height: 350px;
	border: 1px solid brown;
	margin-top: 20px;
}

.section {
	width: 100%;
	height: 100vh;
	margin-top: 50px;
	z-index: 1;
}

/* 여기서부터 서영. */
/* //////////// */
.main_div {
	margin: 0 auto;
	width: 600px;
	/* height: auto; */
	/* border: 1px solid red; */
}

/* 하나의 피드. */
.main_feed_table {
	width: 600px;
	height: 900px; /* ?어떻게 해야하지? auto? */
	border-spacing: 0px;
	border: 1px solid #DBDBDB;
}

/* 프로필 사진, 닉네임 td */
.feedType_profile_td {
	padding: 15px;
	border-bottom: 1px solid #DBDBDB;
}

.feedType_profile_td img {
	vertical-align: middle; /* 프로필사진, 닉네임 세로 가운데 정렬. table이랑 td에는 안먹히고 여기에만 먹힘. 이해x */
	width: 45px;
	height: 45px;
	border-radius: 50px;
}

.nickname_link {
	text-decoration: none;
	color: black;
	font-weight: bold;
	font-size: 18px;
		
}

/* 이미지 td */
.feedType_img_td {
	height: 600px;
}

.feedType_img_td img {
	width: 100%;
}

/* 좋아요 ~ 보관함 ~ 좋아요 수 */
.feedType_icon_td {
	color: #4B4B4B;
	font-size: 14px;
	padding: 5px 15px 5px 15px;
}
.feedType_icon {
	width: 30px;
	height: 30px;
}

#feedType_keep {
	float: right; /* 아이콘 오른쪽 정렬 */
}

/* 글내용 td */
.feedType_content_td {
	padding: 5px 15px 5px 15px;
}

.feedType_title_div {
	font-weight: 700;
	font-size: 20pt;
}

.feedType_content_div {	
	width: 566px;
	padding-top: 10px;
	/* 여러줄 ... 처리 start */
	white-space: normal;
	overflow: hidden;
	text-overflow: ellipsis;
	line-height: 20px; height: 70px;
	display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;
	/* end */
}

/* 댓글 td */
.feedType_comment_td {
	padding: 5px 15px 5px 15px;
	border-bottom: 1px solid #DBDBDB;
}

/* 댓글 더보기 */
.feedType_comment_plus {
	color: #4B4B4B;
	font-size: 14px;
	padding-bottom: 10px;
}

.feedType_comment_plus a {
	color: black;
	text-decoration: none;
}

/* 하나의 댓글 전체 div */
.feedType_comment {
	font-size: 15px;
}

/* 작성자 */
.comment_writer {
	float: left;
	font-weight: 650;
}

.feedType_comment a {
	color: black;
	text-decoration: none;
}

/* 댓글 내용 */
.comment_content {
	display: inline-block;
	padding-left: 10px;
	/* 한줄 ... 처리 start*/
	width: 500px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	/* end */
}

/* 댓글 달기 td */
.feedType_comment_input_td {

}

.feedType_comment_input_td input[type="text"] {
	border: none;
	outline: none;
	width: 560px;
	padding: 15px;
}

.feedType_comment_input_td input[type="submit"] {
	border: none;
	background: none;
	outline: none;
	cursor: pointer;
	font-weight: 600;
	color: #A7543A;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<section class="section">

		<%@ include file="../common/section_menubar.jsp"%>

		<div id="centerWrap">
			<!-- 여기에다가 넣으면 됩니다 시작 -->
			
			<!-- start -->
			<div class="main_div">
				<table class="main_feed_table">
					<tr>
						<td class="feedType_profile_td">
							<a href=""><img class="" src="<c:url value="/resources/images/profile_ddobi.png"/>"></a>&nbsp;
							<a href="" class="nickname_link">ddobi</a>
						</td>
					</tr>
					<tr>
						<td class="feedType_img_td">
							<!-- 이미지 슬라이드 -->
							<img src="<c:url value="/resources/images/죠지.png"/>">
						</td>
					</tr>
					<tr>
						<td class="feedType_icon_td">
							<div class="">
								<img class="feedType_icon" src="<c:url value="/resources/images/8분음표.png"/>">&nbsp;&nbsp;
								<img class="feedType_icon" src="<c:url value="/resources/images/댓글버튼.png"/>">&nbsp;&nbsp;
								<img class="feedType_icon" src="<c:url value="/resources/images/메세기.png"/>">
								<img class="feedType_icon" id="feedType_keep" src="<c:url value="/resources/images/보관함버튼.png"/>">
							</div>
							
							<br>
							
							<div class="">
								<span> 좋아요 <span>55</span>개</span>
							</div>
						</td>
					</tr>
					<tr>
						<td class="feedType_content_td">
							<div class="feedType_title_div">
								<span>죠지 최고 아입니까 - ? ♬</span>
							</div>
						<div class="feedType_content_div">
							내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고
							<!-- 한줄로 ... 해야하나? 지금 상태로는 더보기 버튼을 어따두지. -->
						</div>
						</td>
					</tr>
					<tr>
						<td class="feedType_comment_td">
							<div class="feedType_comment_plus">
								<a href="">댓글 <span>5</span>개 모두 보기</a>
							</div>
							<div class="feedType_comment">
								<div class="comment_writer">
									<a href="">duddldi</a>
								</div>
								<div class="comment_content">
									죠지 음악 쌉인정이요 ~
								</div>
							</div>
							<div class="feedType_comment">
								<div class="comment_writer">
									<a href="">duddldi</a>
								</div>
								<div class="comment_content">
									죠지 음악 쌉인정이요 ~
								</div>
							</div>
							<div class="feedType_comment">
								<div class="comment_writer">
									<a href="">duddldidi</a>
								</div>
								<div class="comment_content">
									죠지 음악 쌉인정이요 ~죠지 음악 쌉인정이요 ~죠지 음악 쌉인정이요 ~죠지 음악 쌉인정이요 ~
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="feedType_comment_input_td">
							<input type="text" placeholder="댓글 달기 ...">
							<input type="submit">
						</td>
					</tr>
				</table>
				
				
				<br><br><br>
				
				
				<!-- end -->
				
				
				<table class="main_feed_table">
					<tr>
						<td class="feedType_profile_td">
							<a href=""><img class="" src="<c:url value="/resources/images/profile_ddobi.png"/>"></a>&nbsp;
							<a href="" class="nickname_link">ddobi</a>
						</td>
					</tr>
					<tr>
						<td class="feedType_img_td">
							<!-- 이미지 슬라이드 -->
							<img src="<c:url value="/resources/images/죠지.png"/>">
						</td>
					</tr>
					<tr>
						<td class="feedType_icon_td">
							<div class="">
								<img class="feedType_icon" src="<c:url value="/resources/images/8분음표.png"/>">&nbsp;&nbsp;
								<img class="feedType_icon" src="<c:url value="/resources/images/댓글버튼.png"/>">&nbsp;&nbsp;
								<img class="feedType_icon" src="<c:url value="/resources/images/메세기.png"/>">
								<img class="feedType_icon" id="feedType_keep" src="<c:url value="/resources/images/보관함버튼.png"/>">
							</div>
							
							<br>
							
							<div class="">
								<span> 좋아요 <span>55</span>개</span>
							</div>
						</td>
					</tr>
					<tr>
						<td class="feedType_content_td">
							<div class="feedType_title_div">
								<span>죠지 최고 아입니까 - ? ♬</span>
							</div>
						<div class="feedType_content_div">
							내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고내용이 쭈르륵 나오고
							<!-- 한줄로 ... 해야하나? 지금 상태로는 더보기 버튼을 어따두지. -->
						</div>
						</td>
					</tr>
					<tr>
						<td class="feedType_comment_td">
							<div class="feedType_comment_plus">
								<a href="">댓글 <span>5</span>개 모두 보기</a>
							</div>
							<div class="feedType_comment">
								<div class="comment_writer">
									<a href="">duddldi</a>
								</div>
								<div class="comment_content">
									죠지 음악 쌉인정이요 ~
								</div>
							</div>
							<div class="feedType_comment">
								<div class="comment_writer">
									<a href="">duddldi</a>
								</div>
								<div class="comment_content">
									죠지 음악 쌉인정이요 ~
								</div>
							</div>
							<div class="feedType_comment">
								<div class="comment_writer">
									<a href="">duddldidi</a>
								</div>
								<div class="comment_content">
									죠지 음악 쌉인정이요 ~죠지 음악 쌉인정이요 ~죠지 음악 쌉인정이요 ~죠지 음악 쌉인정이요 ~
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="feedType_comment_input_td">
							<input type="text" placeholder="댓글 달기 ...">
							<input type="submit">
						</td>
					</tr>
				</table>
				
				<br><br><br>
				
				
			</div>
		</div>
		
	</section>
</body>
</html>