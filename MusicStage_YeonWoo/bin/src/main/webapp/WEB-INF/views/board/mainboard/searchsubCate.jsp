<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
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
	min-height: auto; 
}

header {
	z-index: 1;
	height: 50px;
	position: fixed;
}

#centerWrap {
	padding-top: 15px;
	margin: auto;
	min-height: 800px;
	height: auto;
	/* border: 1px solid #DBDBDB; */
	width: 940px;
	/* background: white; */
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
	/* margin: 0 auto; */
	height: auto;
}

.board_div {
	width: 280px; /* centerWrap 가로에 맞춤. */
	/* padding: 0px 0px 15px 25px; */
	/* margin: 0px 10px 15px 10px; */
	margin: 0px 16px 35px 16px;
	float: left;
}
/* 썸네일 div */
.thumbnail {
	margin-bottom: 10px;
	width: 280px;
	height: 180px;
	display: flex;
	overflow: hidden;
	justify-content:center;
	align-items: center;
}

.thumbnail:hover .f_thumbnail{
	transform:scale(1.4);
	transition: 1s all;
}

.thumbnail a{
	width: 100%;
}

/* 썸네일 img */
.thumbnail img {
	width: 100%;
}
/* 프로필, 제목 div */
.board_profile_div {
	height: 45px;
}
/* 프로필 div */
.profile_link {
	float: left;
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
	width: 240px;
	/* 여러줄 ... 처리 start */
	white-space: normal;
	overflow: hidden;
	text-overflow: ellipsis;
	line-height: 20px; height: 40px;
	display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;
	/* end */
}

.title_link a {
	text-decoration: none;
	color: black;
}
/* 작성자 div */
.writer {
	/* height: 15px; */
	padding-left: 50px;
}
/* 조회수 div */
.views {
	/* height: 15px; */
	padding-left: 50px;
}

/* 리스트가 없을경우 */
#no_board_div{
	line-height: 200px;
	font-size: 20px;
	font-weight: bold;
	padding-top: 20px;
}

#no_board_div img{
	width: 150px;
	height: 150px;
}


/* header-side-menubar *//* 
.main_container .sidebar ul li #button_save{
  border-left: 5px solid #833821 !important;
} */
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<section class="section">

		<%@ include file="/WEB-INF/views/common/section_menubar.jsp"%>
		
		
		<jsp:include page="/WEB-INF/views/common/categoryFilter.jsp"/>
		
		
		<div id="centerWrap">
			<!-- 여기에다가 넣으면 됩니다 시작 -->
			<c:if test="${ empty list }">
				<!-- 리스트가 없을 경우 -->
				<div id="no_board_div" align="center">
					<img src="<%= request.getContextPath() %>/resources/images/profileDefault.png"><br>
					검색된 게시물이 없습니다
				</div>
			
			</c:if>
			
			
			<!-- 리스트가 있을 경우 -->
			<c:if test="${ not empty list }" >
			<c:forEach var="list" items="${ list }"> <!-- saveBoard로 받아온 SAVE_BOARD리스트 -->
			<c:forEach var="boardFile" items="${ list.boardFile }"><!-- 그에맞는 BOARD에 맞는 BOARDFILE들 -->
			<!-- start -->
			<div class="board_div" data-bno="${ list.board_number }" style="margin-top: 50px;">
				<!-- conroller로 값넘기기 -->	
				<c:url var="bdetail" value="bDetail.bo">
					<c:param name="bNum" value="${ list.board_number }"/>
				</c:url>
				
				<!-- 1.썸네일 div -->
				<!-- ////////// -->
				<div class="thumbnail">
					<c:if test="${ boardFile.file_change_name ne '썸네일-기본이미지.gif' }">
						<a href="${ bdetail }">
						<img class="f_thumbnail" src="<%= request.getContextPath() %>/resources/boardImageFile/${ boardFile.file_change_name }">
						</a>
					</c:if>
					<c:if test="${ boardFile.file_change_name eq '썸네일-기본이미지.gif' }">
						<a href="${ bdetail }">
						<img class="f_thumbnail" src="<%= request.getContextPath() %>/resources/images/썸네일-기본이미지.gif">
						</a>
					</c:if>
				</div>

				<!-- 2. 프로필, 제목 div -->
				<!-- //////////////// -->
				<div class="board_profile_div">
					<div class="profile_link">
						<!-- 프로필사진은 member쪽 profile_pic이 어떻게 들어가는지 확인하고 수정하기 -->
						<c:if test="${ empty list.member.profile_pic }"> <!-- 프로필사진이 null일경우 -->
						<img class="f_img" src="<%= request.getContextPath() %>/resources/images/profileDefault.png">
						</c:if>
						
						<c:if test="${ !empty list.member.profile_pic }">
						<img class="f_img" src="<%= request.getContextPath() %>/resources/userProfile/${ list.b_writer }/${ list.member.profile_pic }">
						</c:if>
					</div>
					<div class="title_link">
						<a href="" class="f_title" style="font-size: 13px !important;">${ list.board_title }</a>
					</div>
				</div>

				<!-- 3. 작성자, 조회수 div -->
				<!-- ///////////////// -->
				<div class="writer">${ list.b_writer }</div>
				<div class="views">조회수 ${ list.read_count }</div>
			</div>
			<!-- end -->
			</c:forEach>
			</c:forEach>
			</c:if>
		</div>

	</section>
	
	<script>
		$(document).ready(function(){
			
			$(".filter_sub_div").css({"display":"block"}); 
			
			// 찾아요
			if("${searchType[0]}"=="fs" || "${searchType[1]}"=="fs" || "${searchType[2]}"=="fs"){
				$("#find_student").prop("checked",true);
				$("#find_student").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "#521110", "cursor" : "pointer"});
			} 
			if("${searchType[0]}"=="ft" || "${searchType[1]}"=="ft" || "${searchType[2]}"=="ft"){
				$("#find_teacher").prop("checked",true);
				$("#find_teacher").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "none"});
			} 
			if("${searchType[0]}"=="fp" || "${searchType[1]}"=="fp" || "${searchType[2]}"=="fp"){
				$("#find_place").prop("checked",true);
				$("#find_place").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "none"});
			}
			
			// 컬럼
			$("#searchUserNickName").val("${searchUserNickName}");
			
			// 리뷰
			
			if("${subCate[0]}"=="소프트악기" || "${subCate[1]}"=="소프트악기" || "${subCate[2]}"=="소프트악기" || 
				"${subCate[3]}"=="소프트악기" || "${subCate[4]}"=="소프트악기" || "${subCate[5]}"=="소프트악기" || 
				"${subCate[6]}"=="소프트악기" || "${subCate[7]}"=="소프트악기" || "${subCate[8]}"=="소프트악기"){
				$("#soft").prop("checked",true);
				$("#soft").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "none"});
			} 
			if("${subCate[0]}"=="플러그인" || "${subCate[1]}"=="플러그인" || "${subCate[2]}"=="플러그인" || 
				"${subCate[3]}"=="플러그인" || "${subCate[4]}"=="플러그인" || "${subCate[5]}"=="플러그인" || 
				"${subCate[6]}"=="플러그인" || "${subCate[7]}"=="플러그인" || "${subCate[8]}"=="플러그인"){
				$("#plugin").prop("checked",true);
				$("#plugin").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "none"});
			} 
			if("${subCate[0]}"=="악기관련" || "${subCate[1]}"=="악기관련" || "${subCate[2]}"=="악기관련" || 
				"${subCate[3]}"=="악기관련" || "${subCate[4]}"=="악기관련" || "${subCate[5]}"=="악기관련" || 
				"${subCate[6]}"=="악기관련" || "${subCate[7]}"=="악기관련" || "${subCate[8]}"=="악기관련"){
				$("#play").prop("checked",true);
				$("#play").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "none"});
			}
			if("${subCate[0]}"=="음악장비" || "${subCate[1]}"=="음악장비" || "${subCate[2]}"=="음악장비" || 
				"${subCate[3]}"=="음악장비" || "${subCate[4]}"=="음악장비" || "${subCate[5]}"=="음악장비" || 
				"${subCate[6]}"=="음악장비" || "${subCate[7]}"=="음악장비" || "${subCate[8]}"=="음악장비"){
				$("#musicgear").prop("checked",true);
				$("#musicgear").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "none"});
			} 
			if("${subCate[0]}"=="신디사이저" || "${subCate[1]}"=="신디사이저" || "${subCate[2]}"=="신디사이저" || 
				"${subCate[3]}"=="신디사이저" || "${subCate[4]}"=="신디사이저" || "${subCate[5]}"=="신디사이저" || 
				"${subCate[6]}"=="신디사이저" || "${subCate[7]}"=="신디사이저" || "${subCate[8]}"=="신디사이저"){
				$("#synthesizer").prop("checked",true);
				$("#synthesizer").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "none"});
			} 
			if("${subCate[0]}"=="미디컨트롤러" || "${subCate[1]}"=="미디컨트롤러" || "${subCate[2]}"=="미디컨트롤러" || 
				"${subCate[3]}"=="미디컨트롤러" || "${subCate[4]}"=="미디컨트롤러" || "${subCate[5]}"=="미디컨트롤러" || 
				"${subCate[6]}"=="미디컨트롤러" || "${subCate[7]}"=="미디컨트롤러" || "${subCate[8]}"=="미디컨트롤러"){
				$("#controller").prop("checked",true);
				$("#controller").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "none"});
			}
			if("${subCate[0]}"=="유저사용기" || "${subCate[1]}"=="유저사용기" || "${subCate[2]}"=="유저사용기" || 
				"${subCate[3]}"=="유저사용기" || "${subCate[4]}"=="유저사용기" || "${subCate[5]}"=="유저사용기" || 
				"${subCate[6]}"=="유저사용기" || "${subCate[7]}"=="유저사용기" || "${subCate[8]}"=="유저사용기"){
				$("#userUse").prop("checked",true);
				$("#userUse").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "none"});
			} 
			if("${subCate[0]}"=="작업공간" || "${subCate[1]}"=="작업공간" || "${subCate[2]}"=="작업공간" || 
				"${subCate[3]}"=="작업공간" || "${subCate[4]}"=="작업공간" || "${subCate[5]}"=="작업공간" || 
				"${subCate[6]}"=="작업공간" || "${subCate[7]}"=="작업공간" || "${subCate[8]}"=="작업공간"){
				$("#workPlace").prop("checked",true);
				$("#workPlace").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "none"});
			}
			if("${subCate[0]}"=="프리미엄리뷰" || "${subCate[1]}"=="프리미엄리뷰" || "${subCate[2]}"=="프리미엄리뷰" || 
				"${subCate[3]}"=="프리미엄리뷰" || "${subCate[4]}"=="프리미엄리뷰" || "${subCate[5]}"=="프리미엄리뷰" || 
				"${subCate[6]}"=="프리미엄리뷰" || "${subCate[7]}"=="프리미엄리뷰" || "${subCate[8]}"=="프리미엄리뷰"){
				$("#primer").prop("checked",true);
				$("#primer").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "none"});
			} 
			if("${subCate[0]}"=="etc" || "${subCate[1]}"=="etc" || "${subCate[2]}"=="etc" || 
				"${subCate[3]}"=="etc" || "${subCate[4]}"=="etc" || "${subCate[5]}"=="etc" || 
				"${subCate[6]}"=="etc" || "${subCate[7]}"=="etc" || "${subCate[8]}"=="etc"){
				$("#etc").prop("checked",true);
				$("#etc").parent("label").css({"color" : "white", "font-size" : "12px", "line-height" : "29px", "font-weight" : "bold"})
				.parent("div").css({"background": "#521110","border" : "none"});
			}
			
			$("#detailsearch").val("${detailSearch}");
				
			
		});
		
		
		// 무한 스크롤
		// 이전스크롤 좌표
		var lastScrollTop = 0;
		
		// 1. 스크롤 이벤트 최초 발생
		$(window).scroll(function(){
			
			// 현재 스크롤 좌표
			var currentScrollTop = $(window).scrollTop();
			
			// 다운 스크롤
			if(currentScrollTop - lastScrollTop > 0){
				// 현재 스크롤 좌표를 이전 스크롤 좌표로 할당
				lastScrollTop = currentScrollTop;
				
				// 2. 현재스크롤의 위치가(scrollTop) 화면의 보이는 위치보다 크다면
				// 문서의높이 - 화면의 높이<< 화면보다 스크롤닿는게 짧아서 -1해줌
 				 if(currentScrollTop >= $(document).height() - $(window).height() - 1){
 					 
 					// 현재 뿌려진 게시글의 마지막 게시물번호를 가져온다
 					var lastSbno = $(".board_div:last").attr("data-bno");
 					
 					
 					// 찾아요
 					var searchType = [];
 					$("input[class=searchType]:checked").each(function(i){
 						searchType.push($(this).val());
 					});
 					
 					// 컬럼
 					var searchUserNickName = "${searchUserNickName}";
 					
 					// 리뷰
 					var subCate = [];
 					$("input[class=subCate]:checked").each(function(i){
 						subCate.push($(this).val());
 					})
 					var detailText = "${detailSearch}";
 					
 					$.ajax({
 						type: "get",
 						url : 'scrollsearchType',
 						traditional: true,
 						data : {lastSbno : lastSbno, searchType : searchType, 
 								searchUserNickName : searchUserNickName, subCate : subCate,
 								detailText : detailText},
 						success : function(data){
 							
 							if(data.length != 0){
 								
 								var area = $("#centerWrap");
 								// 각div에 심어주기
	 							for(i in data){
	 								
	 								var num = data[i].board_number;
	 								var title = data[i].board_title;
	 								var writer = data[i].member.nickName;
	 								var change_name = data[i].boardFile[0].file_change_name;
	 								var readcount = data[i].read_count;
	 								var profile_img = data[i].member.profile_pic; 
	 								
	 								// 1. 제일큰 board_div생성 + board_num추가
	 								var board_div = $("<div>");
	 								$(board_div).addClass("board_div");
	 								$(board_div).attr("data-bno",num);
	 			
	 								// 2. 썸네일div
	 								var thumbnail = document.createElement("div");
	 								$(thumbnail).addClass("thumbnail");
	 								var thum_link = document.createElement("a");
	 								var f_thumbnail = document.createElement("img");
	 								if(change_name == "썸네일-기본이미지.gif"){
	 									$(f_thumbnail).addClass("f_thumbnail").attr("src", "<%= request.getContextPath() %>/resources/images/" + change_name);
	 								} else {
	 									$(f_thumbnail).addClass("f_thumbnail").attr("src", "<%= request.getContextPath() %>/resources/boardImageFile/" + change_name);
	 								} 
	 								
	 								$(thumbnail).append(f_thumbnail);
	 								
	 								// 3. 프로필+제목 div
	 								var board_profile_div = document.createElement("div"); // 프로필+제목전체
	 								$(board_profile_div).addClass("board_profile_div");
	 								var profile_link = document.createElement("div"); // 프로필
	 								$(profile_link).addClass("profile_link");
	 								var f_img = document.createElement("img"); // 프로필이미지
	 								if(profile_img != null){
	 									$(f_img).attr("src", "<%= request.getContextPath() %>/resources/userProfile/" + writer + "/" + profile_img);
	 								} else {
	 									$(f_img).attr("src", "<%= request.getContextPath() %>/resources/images/profileDefault.png");
	 								}
	 								var title_link = document.createElement("div"); // 제목area
	 								$(title_link).addClass("title_link");
	 								var f_title = document.createElement("a"); // 제목
	 								$(f_title).addClass("f_title").html(title);
	 								$(title_link).append(f_title);
	 								
	 								$(profile_link).append(f_img);
	 								$(title_link).append(f_title);
	 								
	 								// 4. 작성자+조회수 div
	 								var f_writer = document.createElement("div");
	 								$(f_writer).addClass("writer");
	 								var f_views = document.createElement("div");
	 								$(f_views).addClass("views");
	 								$(f_writer).html(writer);
	 								$(f_views).html("조회수 " + readcount);
	 								
	 								// 합치기
	 								$(board_div).append(thumbnail); // 썸네일div
	 								$(board_profile_div).append(profile_link); // 프로필div추가
	 								$(board_profile_div).append(title_link); // 제목div추가
	 								$(board_div).append(board_profile_div); // 프로필+제목추가
	 								$(board_div).append(f_writer); // 작성자 div
	 								$(board_div).append(f_views); // 
	 								$(area).append(board_div);
								}
 								
	 							// 게시글이동 >> 스크롤로 새로받는 게시물들 넘기기
	 							$(".thumbnail").click(function(){
	 								var bNum = $(this).parent("div").attr("data-bno");
	 								
	 								location.href="bDetail.bo?bNum=" + bNum;
	 							});
 								
 							} else if(data.length == 0) {
 								
 								
 								alert("더이상 표시할 게시물이 없습니다");
 								
 								
 							}
 						}
 					});
 					
 				}
			} 
				
		});
		
	</script>
</body>
</html>