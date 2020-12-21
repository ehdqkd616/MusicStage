<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("replace", "\n"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Detail</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	c9bc97c8ab03830ce16b818faae5fb6d&libraries=services"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/default.css"/>" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
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

/* 신고 modal-popup */
#notify_modal { position:relative; width:100%; height:100%; z-index:1; display:none;}
#notify{ position: fixed; left: 450px; bottom: 45px; }
#n_area{ width: 700px; height: 430px; background: white; border:2px solid #DBDBDB; border-radius: 15px;}
#n_letter{ margin-top: 10px; margin-left: 25px; font-weight: bold; }
#n_select{ width: 130px; height: 25px; border: 2px solid #DBDBDB; border-radius: 4px; margin-left: 25px; margin-top: 20px;}
#n_text{ width: 640px; height: 270px; border: 2px solid #DBDBDB; border-radius: 4px; position: relative; top: 20px; left: 25px; resize: none; 
    	padding-top: 10px;}
#n_notify{ width: 80px; height: 30px; border-radius: 6px; border: none; background: #521110; color: white;
			position: relative; top: 35px; left: 250px; }
#n_cancel{ width: 50px; height: 30px; border-radius: 6px; border: none; background: gray; color: white;
			position: relative; top: 35px; left: 265px; }
.modal_layer{ position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5);
 				z-index:-1; } 

#centerWrap {
	margin: auto;
	min-height: 800px;
	width: 940px;
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

/* //////////// */
.detail_main_div {
	width: 937px; /* centerWrap 가로에 맞춤. */
}

#deTailCategory{
	font-size: 13px;
    font-weight: bold;
    padding-left: 10px;
}

#deTailCategory span{
	display: inline-block;
	transition: .2s all;
	cursor: pointer;
}

#deTailCategory span:hover{
	text-decoration: underline;
	transform:scale(1.1);
}

#deTailCategory span[id=nonehover]{
	cursor: auto;
}

#deTailCategory span[id=nonehover]:hover{
	text-decoration: none;
	transform: none;
}

/* 1. 썸네일, 프로필 영역 */
.detail_top_div {
	height: 550px;
}
/* 썸네일 div */
.detail_thumbnail {
	width: 550px;
	height: 550px;
	float: left; /* display: inline-block 과 짝꿍. */
	overflow: hidden;
	text-align: center;
	border-radius: 15px;
	border: 2px solid #DBDBDB;
}
/* 썸네일 div의 img */
/* ////////////// (확인할 것1) */ 
.detail_thumbnail img {
	height: 100%;
}
/* 썸네일 옆 제목, 프로필 영역 */
.detail_profile {
	width: 377px; /* border 지우고 370으로 바꾸기. */
	height: 550px;
	display: inline-block; /* float: left 와 짝꿍. */
	border: 2px solid #DBDBDB;
	border-radius: 15px;
	margin-left: 10px;
	background: white;
}
/* 제목 ~ 작성일자, 조회수 영역 */
.detail_title_div {
	/* border: 3px solid purple; */
	padding: 25px 20px 10px 20px;
	/* line-height: 70px; */
}
/* 제목 */
.detail_title {
	padding-bottom: 10px;
	font-size: 24px;
	/* font-weight: 700; */
}
/* 작성일자, 조회수 */
.detail_title2 {
	padding-top: 10px;
	border-top: 1px solid #DBDBDB;
	font-size: 14px;
	/* font-weight: 600; */
}
/* 프로필 영역 */
.detail_profile_div {
	padding: 5px 10px 10px 20px;
	/* border: 3px solid gold; */
	width: 370px;
/* 	width: 70px;
	height: 70px; */
	/* padding-left: 15px;
	padding-top: 15px; */
	/* float: left; */
}
/* 프로필 사진 */
.detail_profile_div img {
	width: 50px;
	height: 50px;
	border-radius: 50px; /* 프로필 동그랗게. */
}
/* 닉네임 a태그 */
.nickname_link {
	margin-left: 15px;
	text-decoration: none; /* 밑줄 쳐져있는 거 없애기. */
	font-size: 16px;
	font-weight: 600;
	color: #727272;
	/* font-weight: 600;
	font-size: 20pt; */
}
/* 버튼 영역 */
.button_div {
	/* border: 2px solid purple; */
	/* padding-top: 50px; */
	margin: 40px 10px 0px 10px;
	text-align: center;
}
/* 버튼 */
.button_div button {
	border: 1px solid #DBDBDB;
	background: transparent;
	padding: 5px 10px;
}

.b_report, .b_delete{
	background-color: #521110 !important;
	color: white;
}

/* 상세내용 전체 영역 */
.bottom_div {
	/* height: 1000px; */
	margin-top: 30px;
	padding: 30px 15px;
	border: 1.5px solid #DBDBDB;
	border-radius: 15px;
	background: white;
}
/* bottom_div의 소제목 */
.bottom_div p {
	font-weight: 600;
	font-size: 13pt;
	text-align: left;
	padding-left: 10px;
}

.bottom_div div {
	text-align: center;
}

.bottom_div img {
	width: auto;
	max-width: 700px;
}


.detail_list_button {
	/* border: 1px solid red; */
	text-align: center;
	margin: 50px 0px;
}

.detail_list_button button {
	/* border: 1px solid #DBDBDB; */
	/* background: transparent; */
	border: none;
	border-radius: 5px;
	background: #521110;
	font-weight: 700;
	font-size: 14px;
	color: white;
	padding: 5px 10px;
	width: 80px;
	height: 30px;
}

.hr{
	display: block;
	border: 0.5px solid #DBDBDB;
	width: 95%;
	margin: 0 20px;
}

/* 지도,커리큘럼,제공형식 */
.sub_div{
	padding: 30px 15px;
	border: 1.5px solid #DBDBDB;
	border-radius: 15px;
	background: white;
}

.sub_div p {
	padding-left: 10px;
	font-weight: 600;
	font-size: 13pt;
}


.format_div{
	display: inline-block;
	background: #833821;
	color: white;
	border-radius: 8px;
	min-width: 50px;
    max-width: 140px;
    height: 25px;
    margin-left: 10px;
    text-align: center;
    line-height: 25px;
    padding: 0 5px;
    font-size: 13px;
}
#map{
	display: inline-block !important;
	width: 860px;
	height: 400px;
	margin-left: 20px;
}

#map_result{
	display: inline-block;
	border: 1px solid black;
	width: 250px;
	height: 400px;
	margin-left: 10px;
	vertical-align: top;
}

.list_video{
	widht: 720px; 
	height: 480px;
	background: black;
	border-radius: 4px;
}

.list_music{
	width: 600px;
	height: 600px;
	background-image: url('resources/images/audioBackground.gif');
	border: 1px solid #DBDBDB;
	border-radius: 10px;
}


/* 댓글 start */
.detail_comment_div {
	padding: 30px 15px;
	border: 1.5px solid #DBDBDB;
	border-radius: 15px;
	background: white;
}

.detail_comment_div p {
	padding-left: 10px;
	font-weight: 600;
	font-size: 13pt;
}

.comment_write_box {
	margin: 20px 0px;
}

.comment_write_box input[type ="text"] {
	width: 860px;
	height: 35px;
	text-indent: 10px;
}

.comment_write_box input[type ="submit"] {
	border: none;
	background: none;
	outline: none;
	cursor: pointer;
	font-weight: bolder !important;
	color: #A7543A;
	padding-left: 10px;
	font-size: 14px;
}

.parent_comment_box {
	border-spacing: 0px;
}

.parent_comment_box tr {
	vertical-align: top;
}

.

.children_box{
	padding-bottom: 20px;
}

.child_comment_write {
	padding-top: 5px; padding-left: 100px;
	color: #A7543A;
}

.child_comment_write_box {
	margin-left: 55px;
	display: block;
}

.child_comment_write_box input[type ="text"] {
	width: 800px;
	height: 30px;
	text-indent: 10px;
}

.child_comment_write_box input[type ="submit"] {
	border: none;
	background: none;
	outline: none;
	cursor: pointer;
	font-weight: bolder !important;
	color: #A7543A;
	padding-left: 15px;
	font-size: 12px;
}

.child_comment_content{ widht:620px; }

.comment_profile_img{
	width: 30px;
	height: 30px;
	margin-right: 5px;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 100px;
}

.child_comment_img, .parent_comment_img{
	width: 100%;
	height: 100%;
}

.comment_writer{ width: 100px; vertical-align: middle; font-weight: bolder; font-size: 13px !important; }
.parent_writer, child_writer{ width: 95px; height: 30px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; line-height: 30px;}
.comment_content, .child_comment_content { margin-right: 15px; font-size: 13px; line-height: 27px;}
.comment_content{ width: 730px; }
.comment_date {width: 55px; text-align: right;}
.comment_delete{ vertical-align: text-top; border: none; background: none; color: #A7543A; }

.comment_writer_img{
	width: 30px;
	height: 30px;
}

.comment_plus_div {
	width: 200px;
	height: 30px;
	margin-left: 50px; 
	margin-top: 5px;
	font-weight: bolder;
}

.child_comment_box {
	width: 820px;
	border-spacing: 0px;
	margin-left: 60px;
	margin-bottom: 10px;
}

.child_comment_box tr {
	vertical-align: top;
	border-bottom: 10px solid #fff;
}

}
/* 댓글 end */

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

</style>
</head>
<body>	
	<%@ include file="../common/header.jsp"%>

	<section class="section">

		<%@ include file="../common/section_menubar.jsp"%>

		<div id="centerWrap">
			<!-- 여기에다가 넣으면 됩니다 시작 -->
			
			<c:if test="${ empty loginUser.userId }">
			
				<div id="no_board_div" align="center">
					<img src="<%= request.getContextPath() %>/resources/images/profileDefault.png">
				</div>
			
			</c:if>
			
			<script>
			$(document).ready(function(){
				
				//로그인 안되어있을 시 모달창 오픈
				var modalBg_login = document.querySelector('.modal-bg-login');
				var modalClose_login = document.querySelector('.modal-close');
				
				if(${loginUser.userId == null}){
					alert("회원만 볼 수 있는 게시글 입니다. \n 로그인 후 더 많은 STAGE를 즐기세요");
					$(modalBg_login).addClass('bg-active');
				}
				// 모달창 닫기
				$(modalClose_login).click(function(){
				
				    $(modalBg_login).removeClass('bg-active');
				    location.href="home.do";
				});
			});
			</script>
			
			<c:if test="${ !empty loginUser.userId }">
			<input type="hidden" id="boardNum" value="${ board.board_number }">
			<div class="detail_main_div">
				
				<div id="deTailCategory">
				<c:if test="${ board.board_category eq 1 }">
				<span onclick="location.href='socialFeed.bo'">소셜</span>
				</c:if>
				
				<c:if test="${ board.board_category eq 2 }">
					<span onclick="location.href='findFeed.bo'">찾아요</span>&nbsp; &gt; &nbsp;
					<c:if test="${ board.search_type eq 'fs' }">
						<span onclick="location.href='searchType.bo?searchType%5B%5D=fs'">학생 찾아요</span>
					</c:if>
					<c:if test="${ board.search_type eq 'ft' }">
						<span onclick="location.href='searchType.bo?searchType%5B%5D=ft'">전문가 찾아요</span>
					</c:if>
					<c:if test="${ board.search_type eq 'fp' }">
						<span onclick="location.href='searchType.bo?searchType%5B%5D=fp'">연습실</span>
					</c:if>
				</c:if>
				
				<c:if test="${ board.board_category eq 3 }">
				<span onclick="location.href='columnFeed.bo'">컬럼</span>
				</c:if>
				
				<c:if test="${ board.board_category eq 4 }">
				<c:set var="subCate" value="${ board.sub_category }"/>
				<c:set var="subCate1" value="${fn:split(subCate,' / ')[0]}"/>
				<span onclick="location.href='reviewFeed.bo'">리뷰</span>&nbsp; &gt; &nbsp;
				<!-- 앞부분 -->
				 <span onclick="location.href='searchCate.bo?subCate%5B%5D='+ '${fn:split(subCate,' / ')[0]}' +'&detailSearch='+''">${fn:split(subCate,' / ')[0]}</span>
				<!-- 뒷부분 -->
				<c:if test="${ fn:split(subCate,' / ')[1] ne null}">
					&nbsp; &gt; &nbsp;<span id="nonehover">${fn:split(subCate,' / ')[1]}</span>
				</c:if>
				</c:if>
				
				</div>
				<br>
			
				<!-- 1. 썸네일, 프로필 영역 -->
				<!-- ////////////////// -->
				<div class="detail_top_div">
					<div class="detail_thumbnail">
						<c:if test="${ board.boardFile[0].file_change_name ne '썸네일-기본이미지.gif' }">
						<img src="<%= request.getContextPath() %>/resources/boardImageFile/${ board.boardFile[0].file_change_name }">
						</c:if>
						<c:if test="${ board.boardFile[0].file_change_name eq '썸네일-기본이미지.gif' }">
						<img style=" position: relative; right: 27%;" src="<%= request.getContextPath() %>/resources/images/썸네일-기본이미지.gif">
						</c:if>
					</div>
					<div class="detail_profile">
						<div class="detail_title_div">
							<div class="detail_title">${ board.board_title }</div>
							<div class="detail_title2" align="left"><fmt:formatDate value="${ board.b_write_date}" pattern="yy-MM-dd HH:mm"/>&nbsp;&nbsp;|&nbsp;&nbsp;조회수 ${ board.read_count }</div>
						</div>
						<br>
						<div class="detail_profile_div">
							<a href="">
								<!-- 등록된 프로필 사진이 없을 경우 -->
								<c:if test="${ empty board.member.profile_pic }">
									<img class="" src="<%= request.getContextPath() %>/resources/images/profileDefault.png">
								</c:if>
								<c:if test="${ !empty board.member.profile_pic }">
								<img class="" src="<%= request.getContextPath() %>/resources/userProfile/${ board.b_writer }/${ board.member.profile_pic }">
								</c:if>
							</a>
							<a href="" class="nickname_link">${ board.member.nickName }</a>
						</div>
						<br>
						<!-- 내가쓴 글이 아닐경우 -->
						<c:if test="${ loginUser.userId ne board.b_writer }">
						<div class="button_div">
							<button class="" onclick="">메세지 보내기</button>&nbsp;&nbsp;&nbsp;
							<button class="b_report" onclick="notifyBoard();">신고하기</button>
							<br><br>
							<input type="hidden" value="${ board.b_writer }">
							<button class="gostage">
								<span>${ board.member.nickName }</span>님의 YOUSTAGE
							</button>
						</div>
						</c:if> 
						
						<!-- 내가 쓴 글일 경우 -->
						<c:if test="${ loginUser.userId eq board.b_writer }">
							<div class="button_div">
							<button class="b_modify" onclick="modifyBoard();">수정하기</button>&nbsp;&nbsp;
							<c:url var="deleteBoard" value="deleteBoard">
							<c:param value="bNum" name="${ board.board_number }"/>
							</c:url>
							<button class="b_delete" onclick="deleteBoard();">삭제하기</button>
							<br><br>
							<button class="" onclick="location.href='goMyStage.st'">
								MYSTAGE로 이동하기
							</button>
						</div>
						</c:if>
					</div>
				</div>

				<!-- 2. 상세 내용 영역 -->
				<!-- ////////////// -->
				<div class="bottom_div">
					<div class="dlatl">
						<p>설명</p>
						<br>
						<br>
						<div style="text-align:left; padding-left: 20px; font-size: 13px;">
							${ fn:replace(board.board_content, replace, "<br/>") }
						</div>
					</div>
					
					<br><br>
					
					<!-- file_change_name이 있고 file_Type이 1(IMG)이면서 썸네일이 아니면 가져오기 -->
					<c:if test="${ !empty image }">
					<hr class="hr">
					<br><br>
					<div class="detail_img">
					<p>이미지</p>
					<br>
					<br>
						<c:forEach  var="image" items="${ image }">
						<img src="<%= request.getContextPath() %>/resources/boardImageFile//${ image.file_change_name }"><br><br>
						</c:forEach>
					</div>
					<br><br>
					</c:if>
					
					
					<c:if test="${ !empty music }">
					<!-- file_change_name이 있고 file_Type이 3(Audio)이면 가져오기 -->
					<hr class="hr"><br><br>
					<div class="dlatl">
					<p>음악</p>
					<br>
					<br>
					<c:forEach var="music" items="${ music }">
						<audio class="list_music" src="<%= request.getContextPath() %>/resources/boardAudioFile/${ music.file_change_name }" controls ></audio>
						<br><br><br><br>
					</c:forEach>
					</div>
					<br><br>
					</c:if>
					
					
					<c:if test="${ !empty video }">
					<!-- file_change_name이 있고 file_Type이 2(video)이면 가져오기 -->
					<hr class="hr"><br><br>
					<div class="dlatl">
					<p>영상</p>
					<br>
					<br>
					<c:forEach var="video" items="${ video }">
						<video class="list_video" src="<%= request.getContextPath() %>/resources/boardVideoFile/${ video.file_change_name }" controls></video><br><br>
					</c:forEach>
					</div>
					</c:if>
				</div>
				
				<br>
				<br>
				
				<!-- 선택적으로 넣는 지도(위치)/커리큘럼/제공형식 -->
				<div class="sub_div">
					<c:if test="${ !empty board.sub_curriculum }">
					<!-- 커리큘럼 -->
					<div class="dlatl">
						<p>커리큘럼</p>
						<br>
						<br>
						<div style="text-align:left; padding-left: 15px; font-size: 13px;">
							${ fn:replace(board.sub_curriculum, replace, "<br/>") }
						</div>
					<br><br>
					</div>
					<hr class="hr"><br><br>
					</c:if>
					
					<c:if test="${ !empty board.sub_address }">
					<!-- 장소 -->
					<div class="dlatl">
						<p>장소</p>
						<br>
						<br>
						<div id="map"></div>
					</div>
					<br><br>
					<hr class="hr"><br><br>
					</c:if>
					
					<c:if test="${ !empty board.sub_delivery_format }">
					<!-- 제공형식 -->
					<div class="dlatl">
						<p>제공형식</p>
						<br>
						<div style="margin-left: 15px; margin-top: 10px;">
							<c:forEach var="deliveryFormat" items="${ deliveryFormat }">
							<div class="format_div">${ deliveryFormat }</div>
							</c:forEach>
						</div>
					</div>
					</c:if>
				</div>
				
				<br>
				<br>
				
				<!-- 댓글 -->
				<div class="detail_comment_div">
					<p>댓글</p>
					<div class="comment_write_box">
					<input type="text" id="reply_in" placeholder="댓글 달기 ..." autocomplete="off">
					<input type="submit" value="등록" onclick="insertreply()">
					</div>
					
					
					<div class="comment_box">
						<table class="parent_comment_box">
							<tr>
								<td class="comment_writer_img">
									<input type="hidden" value=""> <!-- 부모댓글번호 -->
									<div class="comment_profile_img">
									<img class="child_comment_img" src="<%= request.getContextPath() %>/resources/images/profileDefault.png">								
									</div>
								</td>
								<td class="comment_writer">
									<div class="parent_writer">작성자닉네임</div>
								</td>
								<td class="comment_content">
									댓글내용 &nbsp;&nbsp;&nbsp;&nbsp;
									<input class="comment_delete" id="parent_delete" type="button" value="삭제">
								</td>
								<td class="comment_date">
									<fmt:formatDate value="" pattern="yy/MM/dd HH:mm"/>
								</td>
							</tr>
						</table>
						
						
						<div class="comment_plus_div">
							<span>- 댓글</span> <span class="child_comment_count">갯수</span>개 <span>더보기</span>
							<input type="hidden" value=""><!-- 부모댓글번호 -->
						</div>
						
						<div class="children_box">
						
							<div class="child_comment_write_box">
							<input type="text" placeholder="댓글 달기 ...">
							<input type="submit" value="등록">
							</div>
							
							<br>
							
							
							<table class="child_comment_box">
								<tr>
									<td class="comment_writer_img">
										<div class="comment_profile_img">
										<img class="child_comment_img" src="">
										</div>
									</td>
									<td class="comment_writer">
										<div class="child_writer">작성자</div>
									</td>
									<td class="child_comment_content">
										<input type="hidden" value="">
										내용 &nbsp;&nbsp;&nbsp;&nbsp;
										<input class="comment_delete" id="child_delete" type="button" value="삭제">
									</td>
									<td class="comment_date">
										<fmt:formatDate value="" pattern="yy/MM/dd HH:mm"/>
									</td>
								</tr>
							</table>
						</div>
					</div>
					
				</div>
			</div>
			</c:if>
		</div>
		
		<!-- 게시글 신고하기 모달 -->
		<div id="notify_modal">	
			<!-- 신고하기modal-popup >> 나중에 display: none해줘야함 
				value는 중에 값넣기-->
			<div id=notify>
				<form>
					<div id="n_area">
						<div id="n_letter">게시글 신고하기</div>
						<select id="n_select" onchange="changeselect()">
							<option selected>신고내용</option>
							<option value="1">개인정보유출</option>
							<option value="2">비방/비하/욕설</option>
							<option value="3">스팸/광고</option>
							<option value="4">음란성</option>
							<option value="5">불법성</option>
							<option value="6">부적절한 광고</option>
							<option value="7">악성코드 유포</option>
						</select>
						<br>
						<textarea id="n_text" placeholder="신고내용을 입력해주세요."></textarea>
						<input class="n_button" id="n_notify" type="button" value="신고하기">
						<input class="n_button" id="n_cancel" type="button" value="취소">
					</div>
				</form>
			</div>
			
			<div class="modal_layer"></div>
			
		</div>
		
	<script>
		window.onload = function(){
			
			// 모달창 닫기
			$(modalClose_login).click(function(){
		
		        $(modalBg_login).removeClass('bg-active');
		    });
			
			if('${ board.sub_address }' != ""){
				//카카오 지도
				var mapContainer = document.getElementById('map');
				var options = {
						center : new kakao.maps.LatLng(37.499016, 127.032897), // 지도의 좌표
						level: 4 // 확대크기(처음보일때 확대)
				};
				
				var map = new kakao.maps.Map(mapContainer, options); // 지도를 생성
				var geocoder = new daum.maps.services.Geocoder(); // 주소-좌표 변환 객체 생성
				var marker = new kakao.maps.Marker({ 
					// 마커미리생성
					position: new kakao.maps.LatLng(37.499016, 127.032897),
					map: map
				});
				
				// 임시로 넣음(주소값)
				var addr = "${ board.sub_address }";
				
				// 주소로 상세 정보를 검색
				geocoder.addressSearch(addr, function(results, status){
					// 검색값이 있으면
					if(status === daum.maps.services.Status.OK){
						var result = results[0]; // 첫번째 결과값
						
						/* console.log(result); // List로 검색한 주소에 대한 정보 전체 가져오기
						console.log(result.road_address.address_name); // 도로명 주소만 가져오기(String)
						console.log(result.road_address.zone_no); // 우편번호 */
						
						// 해당주소에 대한 좌표받기
						var coords = new daum.maps.LatLng(result.y, result.x);
						// 지도에 보여주기
						mapContainer.style.display = "block";
						map.relayout();
						// 지도 중심을 변경
						map.setCenter(coords);
						// 마커를 결과값으로 받는 위치를 옮긴다
						marker.setPosition(coords);
						
						var addArray = addr.split(' / ');
						
						console.log(addArray[0]);
						console.log(addArray[1]);
						
						
						if(addArray.length > 1){
							
							var resultAdd = '<div style="width:150px; height: 50px; text-align:center; margin:6px 6px;">' + addArray[0] + '<br>' + addArray[1] + '</div>';
							
							var infowindow = new kakao.maps.InfoWindow({
							
							content: resultAdd
						
			        		});
						} else {
							
							var resultAdd = '<div style="width:150px; height: 50px; text-align:center; margin:6px 6px;">' + addArray[0] + '</div>';
							
							var infowindow = new kakao.maps.InfoWindow({
								
							content: resultAdd
						
			        		});
						}
						infowindow.open(map, marker);
					}
				});
			}
			
		}
		
		
		$(document).ready(function(){
			// 게시글에 맞는 카테고리 선택(css변경) >> 나중에 서영씨하고 색이야기해보기
			var category = "<c:out value='${ board.board_category }'/>";
			if(category == 1){
				$("#social").css({"border" : "none", "background" : "#521110", "color": "white"});
			} else if(category == 2){
				$("#find").css({"border" : "none", "background" : "#521110", "color": "white"});
			} else if(category == 3){
				$("#column").css({"border" : "none", "background" : "#521110", "color": "white"});
			} else if(category == 4){
				$("#review").css({"border" : "none", "background" : "#521110", "color": "white"});
			}
			
			// 부모댓글 가져오기
			var bno = $("#centerWrap").children("#boardNum").val();
			
			$.ajax({
				type: "post",
				url : "selectParentreply",
				dataType: "JSON",
				data : {bno : bno},
				success : function(data){
					
					var comment_box = $(".detail_comment_div").children(".comment_box");
					$(comment_box).html("");
					
					if(data.length != 0){
												
						for(i in data){
							var parent_comment_box = document.createElement("table");
							$(parent_comment_box).addClass("parent_comment_box");
							var table_tr = document.createElement("tr");
							
							/* 프로필 이미지넣기 */
							var comment_writer_img = document.createElement("td");
							$(comment_writer_img).addClass("comment_writer_img");
							var comment_profile_img = document.createElement("div");
							$(comment_profile_img).addClass("comment_profile_img");
							var parent_comment_img = document.createElement("img");
							$(parent_comment_img).addClass("parent_comment_img");
							if(data[i].profile_pic == null){
								$(parent_comment_img).attr("src","<%= request.getContextPath() %>/resources/images/profileDefault.png");
							} else {
								$(parent_comment_img).attr("src", "<%= request.getContextPath() %>/resources/userProfile/" + data[i].r_writer + "/" + data[i].profile_pic);
							}
							
							// + 부모댓글번호 등록
							var reply_num = document.createElement("input");
							$(reply_num).attr({ type: "hidden", value: data[i].parent_number });
							
							$(comment_profile_img).append(parent_comment_img);
							$(comment_writer_img).append(reply_num);
							$(comment_writer_img).append(comment_profile_img);
							
							/* 작성자 닉네임 */
							var comment_writer = document.createElement("td");
							$(comment_writer).addClass("comment_writer");
							var parent_writer = document.createElement("div");
							$(parent_writer).addClass("parent_writer");
							
							$(parent_writer).append(data[i].r_writer_nickName);
							$(comment_writer).append(parent_writer);
							
							/* 댓글내용 */
							var comment_content = document.createElement("td");
							$(comment_content).addClass("comment_content");
							// loginUser
							var loginUser = "<c:out value='${loginUser.userId}'/>";
							if(loginUser == data[i].r_writer){
								$(comment_content).append(data[i].reply_content + "&nbsp;&nbsp;&nbsp;&nbsp;");
								var comment_delete = document.createElement("input");
								$(comment_delete).addClass("comment_delete");
								$(comment_delete).attr({"value":"삭제", "type":"button","id":"parent_delete"});
								$(comment_content).append(comment_delete);
							} else {
								$(comment_content).append(data[i].reply_content);
								var comment_delete = document.createElement("input").classList.add("comment_delete");
								$(comment_content).append(comment_delete);
								
							}
							
							/* 작성날짜 */
							var comment_date = document.createElement("td");
							$(comment_date).addClass("comment_date");
							// 날짜 fomat변경
							var originDate = new Date(data[i].r_write_date);
							var year = originDate.getFullYear();
							var month = originDate.getMonth()+1;
							var day = originDate.getDate();
							var hour = originDate.getHours();
							var min = originDate.getMinutes();
							
							var date = (year.toString()).slice(-2) + "/" + ("00"+month.toString()).slice(-2) + "/" + ("00"+day.toString()).slice(-2)
										+ " " + ("00"+hour.toString()).slice(-2) + ":" + ("00"+min.toString()).slice(-2);
							
							$(comment_date).append(date);
							
							
							$(table_tr).append(comment_writer_img);
							$(table_tr).append(comment_writer);
							$(table_tr).append(comment_content);
							$(table_tr).append(comment_date);
							$(parent_comment_box).append(table_tr);
							
							
							
							/* 대댓글갯수더보기 or 대댓글 */
							var comment_plus_div = document.createElement("div");
							$(comment_plus_div).addClass("comment_plus_div");
							
							if(data[i].childCount == 0){
								var span1 = document.createElement("span");
								$(span1).html("- 댓글등록 ");
								$(comment_plus_div).append(span1);
							} else {
								var span1 = document.createElement("span");
								$(span1).html("- 댓글 ");
								var child_comment_count = document.createElement("span");
								$(child_comment_count).addClass("child_comment_count");
								$(child_comment_count).html(data[i].childCount+"개 ");
								var span2 = document.createElement("span");
								$(span2).html(" 더보기");
								
								$(comment_plus_div).append(span1);
								$(comment_plus_div).append(child_comment_count);
								$(comment_plus_div).append(span2);
								
							}
							
							var parent_num = document.createElement("input");
							$(parent_num).attr({
								type: "hidden",
								value: data[i].parent_number
							});
							$(comment_plus_div).append(parent_num);
							
							/* 대댓글 입력부분 */
							var children_box = document.createElement("div");
							$(children_box).addClass("children_box");
							
							var child_comment_write_box = document.createElement("div");
							$(child_comment_write_box).addClass("child_comment_write_box");
							var parent_writer = document.createElement("input");
							$(parent_writer).attr({"type":"hidden","value":data[i].r_writer_nickName});
							var parent_nick = document.createElement("input");
							$(parent_nick).attr({"type":"hidden", "value":data[i].r_writer});
							var child_text = document.createElement("input");
							$(child_text).attr({type: "text", placeholder: "댓글 달기...."});
							$(child_text).addClass("r_reply_content");
							var child_submit = document.createElement("input");
							$(child_submit).attr({type: "submit", value: "등록"});
							$(child_submit).addClass("r_reply_submit");
							
							$(child_comment_write_box).append(parent_writer);
							$(child_comment_write_box).append(parent_nick);
							$(child_comment_write_box).append(child_text);
							$(child_comment_write_box).append(child_submit);
							$(child_comment_write_box).append($("<br>"));
							$(child_comment_write_box).append($("<br>"));
							
							$(children_box).append(child_comment_write_box);
							
							// 댓글 더보기부분 처음에 display none으로 진행
							$(children_box).css({display:"none"}); 
							
							// 대댓글 table
							var child_comment_box = document.createElement("table");
							$(child_comment_box).addClass("child_comment_box");
							
							$(children_box).append(child_comment_box);
							
							
							
							$(comment_box).append(parent_comment_box);
							$(comment_box).append(comment_plus_div);
							$(comment_box).append(children_box);
							
							
						} 
						
						<!-- 댓글 더보기 script -->
						$(".comment_plus_div").click(function(){
							var submenu = $(this).next(".children_box");
							
							// 부모번호
							var parent_num = $(this).children("input[type=hidden]").val();
							
							if( submenu.is(":visible") ){
								submenu.slideUp();
							}else{
																
								submenu.slideDown();
								
								
								// 댓글 더보기누르면 대댓글 나오게 하기
								// 대댓글 불러오기
								$.ajax({
									type: "POST",
									url: "childReply",
									data: {parent_num : parent_num},
									async: false,
									success: function(data){
										
										var childReply = $(submenu).children("table");
										$(childReply).html("");
										
										for(i in data){
										
											var childReply_tr = document.createElement("tr");
											
											/* 대댓글 작성자 프로필사진 */
											var img_td = document.createElement("td");
											$(img_td).addClass("comment_writer_img");
											var pro_img = document.createElement("div");
											$(pro_img).addClass("comment_profile_img");
											if(data[i].profile_pic == null){
												var img = $("<img>").addClass("child_comment_img").attr("src", "<%= request.getContextPath() %>/resources/images/profileDefault.png");
											} else {
												var img = $("<img>").addClass("child_comment_img").attr("src", "<%= request.getContextPath() %>/resources/userProfile/" + data[i].r_writer + "/" + data[i].profile_pic);
											}
											
											$(pro_img).append(img);
											$(img_td).append(pro_img);
											
											/* 대댓글 작성자 */
											var writer_td = document.createElement("td");
											var child_writer = document.createElement("div");
											$(child_writer).addClass("child_writer");
											$(writer_td).addClass("comment_writer");
											$(child_writer).append(data[i].r_writer_nickName);
											$(writer_td).append(child_writer);
											
											/* 대댓글내용 */
											var content_td = document.createElement("td");
											$(content_td).addClass("child_comment_content");
											var child_Num = document.createElement("input");
											$(child_Num).attr("type","hidden");
											$(child_Num).attr("value",data[i].reply_number);
											$(content_td).append(child_Num);
											$(content_td).append(data[i].reply_content+ "&nbsp;&nbsp;&nbsp;&nbsp;");
											
											/* 삭제 버튼 */
											var delete_b = document.createElement("input");
											$(delete_b).attr({"type":"button", "value":"삭제","id":"child_delete"});
											$(delete_b).addClass("comment_delete");
										
											
											/* 로그인유저(사용자) 하고 대댓글 작성자가 같을경우 >> loginUser들어오면 진행 */
											var loginUser = "<c:out value='${loginUser.userId}'/>"
											if(loginUser == data[i].r_writer){
												$(content_td).append(delete_b);
											}
											
											/* 날짜 */
											var date_td = document.createElement("td");
											$(date_td).addClass("comment_date");
											var timestamp = new Date(data[i].r_write_date);
											var y = timestamp.getFullYear();
											var M = timestamp.getMonth()+1;
											var d = timestamp.getDate();
											var H = timestamp.getHours();
											var m = timestamp.getMinutes();
											
											// 20/11/16 14:24 << 형변환 (slice(-2)는 뒤에서 두번째글자까지 가져오는것)
											var date = (y.toString()).slice(-2)+"/"+(("00"+M.toString()).slice(-2))+"/"+(("00"+d.toString()).slice(-2))+" "+
														(("00"+H.toString()).slice(-2))+":"+(("00"+m.toString()).slice(-2));
											$(date_td).append(date);
											
											$(childReply_tr).append(img_td);
											$(childReply_tr).append(writer_td);
											$(childReply_tr).append(content_td);
											$(childReply_tr).append(date_td);
											$(childReply).append(childReply_tr);
										}
										
										$(submenu).append(childReply);
										submenu.slideDown();
										
									}
									
								});
								
	
								
								// 대댓글 등록하기
								var cEnrollReply = $(this).next(".children_box").children(".child_comment_write_box").children("input[type=submit]");
								// 댓글등록or 댓글n개 더보기 
								var reply_count_text = $(this);
								
								$(cEnrollReply).on("click", function(){
									
									// 대댓글 내용
									var cReplyContent = $(this).prev("input[type=text]").val();
									// 게시글번호
									var board_num = $("#boardNum").val();
									var boardWriter = "${board.b_writer}"; //게시글작성자ID
						   			var boardNick = "${board.member.nickName}"; // 게시글작성자닉네임
						   			
						   			//부모댓글번호은 위에 선언되어있기때문에 가져올수 있음 >> parent_num
						   			var replyWriter = $(this).prev().prev().val();// 댓글작성자ID
						   			var replyNick = $(this).prev().prev().prev().val();// 댓글작성자닉네임
						   			
						   			console.log("게시글번호 : " + board_num);
						   			console.log("게시글작성자ID : " + boardWriter);
						   			console.log("게시글작성자Nick : " + boardNick);
						   			
						   			console.log("부모댓글번호 : " + parent_num);
						   			console.log("댓글작성자ID : " + replyWriter);
						   			console.log("댓글작성자NCIK : " + replyNick);
									
	
									if(cReplyContent == ""){
										alert("내용을 입력해주세요");
										$(this).prev("input[type=text]").focus();
									} else {
										$.ajax({
											type: "POST",
											url : "childreplyInsert",
											data : {cReplyContent : cReplyContent, parent_num : parent_num, board_num : board_num},
											dataType: "JSON",
											async: false,
											success : function(data){
												
												if(data != 0){
													
													
													alert("댓글등록 성공");
													var childReply = $(submenu).children("table");
													
													$(".r_reply_content").val("");
													
													
													for(i in data){
														
														// 댓글나오는 부분
														var childReply_tr = document.createElement("tr");
														
														/* 대댓글 작성자 프로필사진 */
														var img_td = document.createElement("td");
														$(img_td).addClass("comment_writer_img");
														var pro_img = document.createElement("div");
														$(pro_img).addClass("comment_profile_img");
														if(data[i].profile_pic == null){
															var img = $("<img>").addClass("child_comment_img").attr("src", "<%= request.getContextPath() %>/resources/images/profileDefault.png");
														} else {
															var img = $("<img>").addClass("child_comment_img").attr("src", "<%= request.getContextPath() %>/resources/userProfile/" + data[i].r_writer + "/" + data[i].profile_pic);
														}
														
														$(pro_img).append(img);
														$(img_td).append(pro_img);
														
														/* 대댓글 작성자 */
														var writer_td = document.createElement("td");
														var child_writer = document.createElement("div");
														$(child_writer).addClass("child_writer");
														$(writer_td).addClass("comment_writer");
														$(child_writer).append(data[i].r_writer_nickName);
														$(writer_td).append(child_writer);
														
														/* 대댓글 내용 */
														var content_td = document.createElement("td");
														$(content_td).addClass("child_comment_content");
														var child_Num = document.createElement("input");
														$(child_Num).attr("type","hidden");
														$(child_Num).attr("value",data[i].reply_number);
														$(content_td).append(child_Num);
														$(content_td).append(data[i].reply_content+ "&nbsp;&nbsp;&nbsp;&nbsp;");
														
														/* 삭제 버튼 */
														var delete_b = document.createElement("input");
														$(delete_b).attr({"type":"button", "value":"삭제", "id":"child_delete"});
														$(delete_b).addClass("comment_delete");
														
														/* 로그인유저(사용자) 하고 대댓글 작성자가 같을경우 >> loginUser들어오면 진행 */
														var loginUser = "<c:out value='${loginUser.userId}'/>"
														/* if(loginUser == data[i].r_writer){ */
															$(content_td).append(delete_b);
														/* } */
														
														/* 날짜 */
														var date_td = document.createElement("td");
														$(date_td).addClass("comment_date");
														var timestamp = new Date(data[i].r_write_date);
														var y = timestamp.getFullYear();
														var M = timestamp.getMonth()+1;
														var d = timestamp.getDate();
														var H = timestamp.getHours();
														var m = timestamp.getMinutes();
														
														// 20/11/16 14:24 << 형변환 (slice(-2)는 뒤에서 두번째글자까지 가져오는것)
														var date = (y.toString()).slice(-2)+"/"+(("00"+M.toString()).slice(-2))+"/"+(("00"+d.toString())).slice(-2)+" "+
																	(("00"+H.toString()).slice(-2))+":"+(("00"+m.toString()).slice(-2));
														$(date_td).append(date);
														
													}
													
													$(childReply_tr).append(img_td);
													$(childReply_tr).append(writer_td);
													$(childReply_tr).append(content_td);
													$(childReply_tr).append(date_td);
													$(childReply).append(childReply_tr);
													
													// 댓글등록or 댓글n개 더보기 바꿔주기
													$(reply_count_text).children("span").remove();
													// 대댓글갯수+"더보기"
													var span1 = document.createElement("span");
													$(span1).html("- 댓글 ")
													var child_count = document.createElement("span");
													$(child_count).addClass("child_comment_count");
													$(child_count).append(data[0].childCount + "개");
													var span2 = document.createElement("span");
													$(span2).html(" 더보기");
													$(reply_count_text).append(span1);
													$(reply_count_text).append(child_count);
													$(reply_count_text).append(span2);
													
													$(submenu).append(childReply);
													
												} else {
													alert("댓글등록 실패");
												}
												
												
											}
										});
									}
									
								});
								
								
							}
							
						});
						
						
					} else {
						var div = document.createElement("div");
						$(div).append("등록된 댓글이 없습니다.");
						$(comment_box).append(div);
					}
					
					
					// 부모댓글 삭제하기
					// 삭제버튼
					var delete_button =$(comment_box).children(".parent_comment_box").children().children().children(".comment_content").children("#parent_delete");
					$(delete_button).click(function(){
						// 부모댓글은 parent_num이 같은것들은 다 0으로 바꿔주기
						var parent_num = $(this).parent().prevAll(".comment_writer_img").children("input[type=hidden]").val();
						// 클릭한 버튼이 해당하는 table삭제 >> 부모댓글삭제 + 대댓글쪽도 삭제
						var parent_tr = $(this).closest(".parent_comment_box");
						var child_count = $(this).closest(".parent_comment_box").next(".comment_plus_div");
						var child_content = $(this).closest(".parent_comment_box").next().next(".children_box");
						
						var check = confirm("댓글을 삭제하겠습니까?");
						
						if(check == true){
							$.ajax({
								url: "deleteParentReply",
								data: {bno:bno , parent_num : parent_num},
								success: function(data){
									
									if(data > 0) {
										alert("댓글을 삭제했습니다.");
										$(parent_tr).remove();
										$(child_count).remove();
										$(child_content).remove();
									} else {
										alert("댓글 삭제에 실패하였습니다.");
									}
								}
							});
						} else {
							alert("취소했습니다.");
						}
						
					});
					
					// 대댓글 삭제
					$(document).on("click", "#child_delete", function(){
						
						var parent_num = $(this).parents(".children_box").prev(".comment_plus_div").children("input[type=hidden]").val();
						var child_num = $(this).prev().val();
						var check = confirm("댓글을 삭제 하시겠습니까?");
						
						// 클릭한 버튼이 포함된 tr >> 삭제할 대댓글
						var click_tr = $(this).parent(".child_comment_content").parent();
						
						// 대댓글 갯수바꿔줘야함
						var child_count = $(this).closest(".children_box").prev(".comment_plus_div").children(".child_comment_count");
						// 대댓글 갯수가 0개일때는 댓글 등록으로 바꿔주기
						var child_count_div = $(this).closest(".children_box").prev(".comment_plus_div");
						
						if(check == true){
							$.ajax({
								url: "deleteChildReply",
								type: "post",
								async: false,
								data: {child_num : child_num, parent_num : parent_num},
								success: function(data){
										alert("댓글 삭제에 성공했습니다.");
										$(click_tr).remove();
										if(data > 0){
											$(child_count).html(data+"개");	
										} else if(data == 0) {
											$(child_count_div).empty();
											var span = document.createElement("span");
											$(span).html("- 댓글등록 ");
											$(child_count_div).append(span);
										}
																						
								},
								error : function(){
									alert("댓글 삭제에 실패하였습니다.");
								} 
							});	 
						} else {
							alert("취소하셨습니다.");
						}
					});
					
				}
			});
		});
		
		
		
		/* 댓글달기 */
		function insertreply(){
			var replycontent = $(".comment_write_box #reply_in").val();
			var boardnum = $("#boardNum").val(); // 게시글번호
			var boardWriter = "${ board.b_writer }"; //게시글작성자
			var boardNick = "${ board.member.nickName }"; //게시글작성자닉네임
   			var alarm_sender = "${loginUser.userId}";
   			var alarm_sender_nickName = "${loginUser.nickName}";
			
			console.log("게시글번호 : " + boardnum);
   			console.log("게시글작성자ID : " + boardWriter);
   			console.log("게시글작성자Nick : " + boardNick);
   			
			
			if(replycontent == ""){
				alert("내용을 입력해 주세요");
				document.getElementById("reply_in").focus();
			} else {
				$.ajax({
					type: "POST",
					url: "insertreply",
					data: {replycontent : replycontent, boardnum : boardnum },
					success: function(data){
						
			 	 	 	var AlarmData = {
			 	 	 			"alarm_sender" : alarm_sender,
			 	 	 			"alarm_receiver" : boardWriter,
			 	 	 			"alarm_type" : "BoardReply",
			 	 	 			"alarm_title" : "<b>"+alarm_sender_nickName+"</b>님이 회원님의 게시글에 댓글을 남겼습니다: "+ replycontent,
			 	 	 			"alarm_content" : replycontent,
			 	 	 			"board_no" : boardnum
			 	 	 	};

			 	 	 	//스크랩 알림 DB저장
			 	 	 	$.ajax({
			 	 	 		type : 'post',
			 	 	 		url : 'saveAlarm.ws',
			 	 	 		data : JSON.stringify(AlarmData),
			 	 	 		contentType: "application/json; charset=utf-8",
			 	 	 		dataType : 'text',
			 	 	 		success : function(data){
			 	 	 			if(data == 1){
				 	 	 			if(socket){
				 	 	 				let socketMsg = "BoardReply," + alarm_sender + "," + boardWriter + "," + boardnum; // 소켓에 보낼 메세지
				 	 	 				console.log("msgmsg : " + socketMsg); // 소켓 메세지 확인 콘솔
				 	 	 				socket.send(socketMsg); // 소켓에 메세지를 보낸다.
				 	 	 				
										alert("댓글등록완료");	
										location.reload();
										
				 	 	 			}else{
				 	 	 				alert("소켓이 열려있지 않습니다.");
				 	 	 			}
				 	 	 		}else if(data == 0){
			 	 	 				alert("알람 저장에 실패했습니다");
			 	 	 			}

			 	 	 		},
			 	 	 		error : function(err){
			 	 	 			console.log(err); 
			 	 	 		}

						});  

					}	
				});	
			}
			
		};
		
				
		
		/* 게시글 신고 모달 */
		function notifyBoard(){
			$("#notify_modal").fadeIn("fast").css("display", "block");
		}
		
		// DB로 넘길 옵션값 가져오기
		var target = null;
		var op_val = null;
		function changeselect(){
			// selected되게 onchange함수 등록 + selected된 value가져오기
			target = document.getElementById("n_select");
			op_val = target.options[target.selectedIndex].value;				
		}
		
		// 신고하기 버튼
		var report_b = document.getElementById("n_notify");
		report_b.addEventListener('click', function(){
			// 신고하기 했을때 값들이 넘어갈 수 있게(신고내용(report_c)/신고할게시글번호(bno)/신고카테고리(op_val)/신고자(report_f))
			var report_c = $("#n_text").val();
			var bno = $("#centerWrap").children("#boardNum").val();
			
			// select option이 신고내용으로 되어있을경우(== null)
			if(op_val == null){
				alert("신고내용을 선택해주세요.");
			} else if(report_c == ""){
				alert("신고내용을 입력해주세요.");
			} else {
				$.ajax({
					url: "notifyboard",
					type: "POST",
					data: {op_val: op_val, report_c : report_c, bno : bno},
					success: function(data){
						if(data == 1){
							alert("게시물신고에 성공하셨습니다.");
							history.back(-1); // 게시물뒤로가기
						} else {
							alert("게시물신고에 실패하였습니다.");
						}
					}
				});
			}
				
		});
		
		// 모달밖이나 취소버튼눌렀을때 이전화면 나오게
		$(".modal_layer").on('click',function(){
			$("#notify_modal").fadeOut("slow").css("display", "none");
		});
		$("#n_cancel").on('click',function(){
			$("#notify_modal").fadeOut("slow").css("display", "none");
		});
		
		// 게시글 수정
		function modifyBoard(){
			location.href="modifyBoard.bo?bNum=" + ${ board.board_number };
		}
		
		
		
		// 게시글 삭제
		function deleteBoard(){
			var bno = document.getElementById("boardNum").value;
			
			var check = confirm("게시글을 삭제하시겠습니까?");
			
			if(check == true){
				location.href="deleteBoard?bNum=" + bno;
				alert("게시물이 삭제 되었습니다.");
			} else {
				alert("취소되었습니다.");
			}
				
		}
		
		$(".gostage").on("click", function(){
			
			var targetId = $(this).prev().val();
			
			var path = "goYouStage.st?targetId=" + targetId;
			location.href = path;
		});
		
	</script>
	</section>
</body>
</html>