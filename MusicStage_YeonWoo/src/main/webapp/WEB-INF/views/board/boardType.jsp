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
/* 유튜브 한칸div */
.main_div {
	border: 1px solid red;
	margin: 0 auto;
	height: auto;
}


.board_div {
	width: 305px; /* centerWrap 가로에 맞춤. */
	padding: 0px 10px 15px 10px;
	float: left;
	/* border: 1px solid green; */
	/* border: 1px solid orange; */
}
/* 썸네일 div */
.thumbnail {
	margin-bottom: 10px;
	width: 280px;
	height: 180px;
	/* border: 1px solid blue; */
}
/* 썸네일 img */
.thumbnail img {
	width: 100%;
	height: 100%;
}
/* 프로필, 제목 div */
.board_profile_div {
	height: 45px;
	/* border: 3px solid orange; */
}
/* 프로필 div */
.profile_link {
	float: left;
	/* border: 2px solid red; */
}
/* 프로필 img */
.profile_link img {
	width: 40px;
	height: 40px;
	border-radius: 70px;
}
/* 제목 div */
.title_link {
	padding: 0px 0px 0px 10px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	/* border: 2px solid green; */
}
/* 작성자 div */
.writer {
	/* height: 15px; */
	padding-left: 50px;
	/* border: 1px solid blue; */
}
/* 조회수 div */
.views {
	/* height: 15px; */
	padding-left: 50px;
	/* border: 1px solid purple; */
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<section class="section">

		<%@ include file="../common/section_menubar.jsp"%>

		<div id="centerWrap">
			<!-- 여기에다가 넣으면 됩니다 시작 -->
			
			<div class="main_div">
			<!-- start -->
			<div class="board_div">
				<!-- 1.썸네일 div -->
				<!-- ////////// -->
				<div class="thumbnail">
					<a href=""><img class="" src="<c:url value="/resources/images/image1.jpeg"/>"></a>
				</div>

				<!-- 2. 프로필, 제목 div -->
				<!-- //////////////// -->
				<div class="board_profile_div">
					<div class="profile_link">
						<a href=""><img class=""
							src="<c:url value="/resources/images/profile_ddobi.png"/>"></a>
					</div>
					<div class="title_link">
						<a href="" class="">제목이 들어가는 자리입니다.제목이 들어가는 제목이 들어가는 자리입니다.제목이
							들어가는</a>
					</div>
				</div>

				<!-- 3. 작성자, 조회수 div -->
				<!-- ///////////////// -->
				<div class="writer">ddobi</div>
				<div class="views">조회수 30</div>
			</div>
			<!-- end -->

			<!-- start -->
			<div class="board_div">
				<!-- 1.썸네일 div -->
				<!-- ////////// -->
				<div class="thumbnail">
					<a href=""><img class="" src="<c:url value="/resources/images/image1.jpeg"/>"></a>
				</div>

				<!-- 2. 프로필, 제목 div -->
				<!-- //////////////// -->
				<div class="board_profile_div">
					<div class="profile_link">
						<a href=""><img class=""
							src="<c:url value="/resources/images/profile_ddobi.png"/>"></a>
					</div>
					<div class="title_link">
						<a href="" class="">제목이 들어가는 자리입니다.제목이 들어가는 제목이 들어가는 자리입니다.제목이
							들어가는</a>
					</div>
				</div>

				<!-- 3. 작성자, 조회수 div -->
				<!-- ///////////////// -->
				<div class="writer">ddobi</div>
				<div class="views">조회수 30</div>
			</div>
			<!-- end -->

			<!-- start -->
			<div class="board_div">
				<!-- 1.썸네일 div -->
				<!-- ////////// -->
				<div class="thumbnail">
					<a href=""><img class="" src="<c:url value="/resources/images/image1.jpeg"/>"></a>
				</div>

				<!-- 2. 프로필, 제목 div -->
				<!-- //////////////// -->
				<div class="board_profile_div">
					<div class="profile_link">
						<a href=""><img class=""
							src="<c:url value="/resources/images/profile_ddobi.png"/>"></a>
					</div>
					<div class="title_link">
						<a href="" class="">제목이 들어가는 자리입니다.제목이 들어가는 제목이 들어가는 자리입니다.제목이
							들어가는</a>
					</div>
				</div>

				<!-- 3. 작성자, 조회수 div -->
				<!-- ///////////////// -->
				<div class="writer">ddobi</div>
				<div class="views">조회수 30</div>
			</div>
			<!-- end -->

			<!-- start -->
			<div class="board_div">
				<!-- 1.썸네일 div -->
				<!-- ////////// -->
				<div class="thumbnail">
					<a href=""><img class="" src="<c:url value="/resources/images/image1.jpeg"/>"></a>
				</div>

				<!-- 2. 프로필, 제목 div -->
				<!-- //////////////// -->
				<div class="board_profile_div">
					<div class="profile_link">
						<a href=""><img class=""
							src="<c:url value="/resources/images/profile_ddobi.png"/>"></a>
					</div>
					<div class="title_link">
						<a href="" class="">제목이 들어가는 자리입니다.제목이 들어가는 제목이 들어가는 자리입니다.제목이
							들어가는</a>
					</div>
				</div>

				<!-- 3. 작성자, 조회수 div -->
				<!-- ///////////////// -->
				<div class="writer">ddobi</div>
				<div class="views">조회수 30</div>
			</div>
			<!-- end -->

			<!-- start -->
			<div class="board_div">
				<!-- 1.썸네일 div -->
				<!-- ////////// -->
				<div class="thumbnail">
					<a href=""><img class="" src="<c:url value="/resources/images/image1.jpeg"/>"></a>
				</div>

				<!-- 2. 프로필, 제목 div -->
				<!-- //////////////// -->
				<div class="board_profile_div">
					<div class="profile_link">
						<a href=""><img class=""
							src="<c:url value="/resources/images/profile_ddobi.png"/>"></a>
					</div>
					<div class="title_link">
						<a href="" class="">제목이 들어가는 자리입니다.제목이 들어가는 제목이 들어가는 자리입니다.제목이
							들어가는</a>
					</div>
				</div>

				<!-- 3. 작성자, 조회수 div -->
				<!-- ///////////////// -->
				<div class="writer">ddobi</div>
				<div class="views">조회수 30</div>
			</div>
			<!-- end -->

			<!-- start -->
			<div class="board_div">
				<!-- 1.썸네일 div -->
				<!-- ////////// -->
				<div class="thumbnail">
					<a href=""><img class="" src="<c:url value="/resources/images/image1.jpeg"/>"></a>
				</div>

				<!-- 2. 프로필, 제목 div -->
				<!-- //////////////// -->
				<div class="board_profile_div">
					<div class="profile_link">
						<a href=""><img class=""
							src="<c:url value="/resources/images/profile_ddobi.png"/>"></a>
					</div>
					<div class="title_link">
						<a href="" class="">제목이 들어가는 자리입니다.제목이 들어가는 제목이 들어가는 자리입니다.제목이
							들어가는</a>
					</div>
				</div>

				<!-- 3. 작성자, 조회수 div -->
				<!-- ///////////////// -->
				<div class="writer">ddobi</div>
				<div class="views">조회수 30</div>
			</div>
			<!-- end -->

			<!-- start -->
			<div class="board_div">
				<!-- 1.썸네일 div -->
				<!-- ////////// -->
				<div class="thumbnail">
					<a href=""><img class="" src="<c:url value="/resources/images/image1.jpeg"/>"></a>
				</div>

				<!-- 2. 프로필, 제목 div -->
				<!-- //////////////// -->
				<div class="board_profile_div">
					<div class="profile_link">
						<a href=""><img class=""
							src="<c:url value="/resources/images/profile_ddobi.png"/>"></a>
					</div>
					<div class="title_link">
						<a href="" class="">제목이 들어가는 자리입니다.제목이 들어가는 제목이 들어가는 자리입니다.제목이
							들어가는</a>
					</div>
				</div>

				<!-- 3. 작성자, 조회수 div -->
				<!-- ///////////////// -->
				<div class="writer">ddobi</div>
				<div class="views">조회수 30</div>
			</div>
			<!-- end -->

			<!-- start -->
			<div class="board_div">
				<!-- 1.썸네일 div -->
				<!-- ////////// -->
				<div class="thumbnail">
					<a href=""><img class="" src="<c:url value="/resources/images/image1.jpeg"/>"></a>
				</div>

				<!-- 2. 프로필, 제목 div -->
				<!-- //////////////// -->
				<div class="board_profile_div">
					<div class="profile_link">
						<a href=""><img class=""
							src="<c:url value="/resources/images/profile_ddobi.png"/>"></a>
					</div>
					<div class="title_link">
						<a href="" class="">제목이 들어가는 자리입니다.제목이 들어가는 제목이 들어가는 자리입니다.제목이
							들어가는</a>
					</div>
				</div>

				<!-- 3. 작성자, 조회수 div -->
				<!-- ///////////////// -->
				<div class="writer">ddobi</div>
				<div class="views">조회수 30</div>
			</div>
			<!-- end -->

			<!-- start -->
			<div class="board_div">
				<!-- 1.썸네일 div -->
				<!-- ////////// -->
				<div class="thumbnail">
					<a href=""><img class="" src="<c:url value="/resources/images/image1.jpeg"/>"></a>
				</div>

				<!-- 2. 프로필, 제목 div -->
				<!-- //////////////// -->
				<div class="board_profile_div">
					<div class="profile_link">
						<a href=""><img class=""
							src="<c:url value="/resources/images/profile_ddobi.png"/>"></a>
					</div>
					<div class="title_link">
						<a href="" class="">제목이 들어가는 자리입니다.제목이 들어가는 제목이 들어가는 자리입니다.제목이
							들어가는</a>
					</div>
				</div>

				<!-- 3. 작성자, 조회수 div -->
				<!-- ///////////////// -->
				<div class="writer">ddobi</div>
				<div class="views">조회수 30</div>
			</div>
			<!-- end -->

			<!-- start -->
			<div class="board_div">
				<!-- 1.썸네일 div -->
				<!-- ////////// -->
				<div class="thumbnail">
					<a href=""><img class="" src="<c:url value="/resources/images/image1.jpeg"/>"></a>
				</div>

				<!-- 2. 프로필, 제목 div -->
				<!-- //////////////// -->
				<div class="board_profile_div">
					<div class="profile_link">
						<a href=""><img class=""
							src="<c:url value="/resources/images/profile_ddobi.png"/>"></a>
					</div>
					<div class="title_link">
						<a href="" class="">제목이 들어가는 자리입니다.제목이 들어가는 제목이 들어가는 자리입니다.제목이
							들어가는</a>
					</div>
				</div>

				<!-- 3. 작성자, 조회수 div -->
				<!-- ///////////////// -->
				<div class="writer">ddobi</div>
				<div class="views">조회수 30</div>
			</div>
			<!-- end -->

			</div>
			
		</div>

	</section>
</body>
</html>