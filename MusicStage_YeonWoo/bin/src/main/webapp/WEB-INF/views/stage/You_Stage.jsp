<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>You_Stage</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/default.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>

	body{font-family: 'Nanum Gothic', sans-serif; background: #FAFAFA !important;}
	
	header{z-index: 1; height:50px; position: fixed;}
    #centerWrap{margin:auto; min-height: 800px; border: 1px solid #DBDBDB; width: 940px; background: white;}
    #left_div{display: inline-block; width:50%; height:500px; float: left;}
    #center_div{position: relative; top:150px; height:300px; margin:0 20px;}
    #quick_menu{display: flex; font-size: 0; padding:0; margin:20px auto;}
    #quick_menu li{display: inline-block; width: 25%; font-size: 12px; list-style: none; text-align: center;}
    #quick_menu img{max-width: 80%; max-height: 50%;}
    #right_div{display: inline-block; width:50%; height:500px; float: left;}

    #main_img{
        height: 100%;
        object-fit: cover;
        -webkit-filter: grayscale(100%);
        filter: gray;
        opacity: 0.2;
        max-width: -webkit-fill-available;
        max-height: 100%;
    }

    #slide_menu{
    	display: inline-block;
    	width:100%;
    	height:350px;
    	border: 1px solid brown;
    	margin-top:20px;
    }

	.section{
	  width: 100%;
	  height: 100vh;
	  margin-top: 50px;
	  z-index: 1;
	}
	
	
	
	/* 전체 stage */
	.infomation{ width: 100%; min-height: 350px;}
	
	/* 1. 프로필사진 */
	#profile_img{ width: auto; height: 240px; float: left; margin-left: 20px;}
	#p_img{width: 180px; height: 180px; display: inline-block; margin-top: 25px; border-radius: 50%; 
			margin-left: 50px; margin-right: 50px; overflow: hidden; position: relative;}
	#p_img img { height: 100%; position: absolute; display: block; margin: 0 auto;}
	
	/* 2. 닉네임 + 버튼 */
	/* 프로필 */
	#profile{ width: 600px; height: auto; margin-left: 270px; margin-top: 5px; }
	#profileInfo{ display: inline-block; margin-top: 30px;}
	#expartMark{ width: 28px; height: 28px; display: inline-block; vertical-align: top;
				position: relative; left: 20px; top: 5px;}
	#e_mark{ width: 100%; height: 100%; vertical-align: middle;}
	#nickName{ display: inline-block; width: 300px; height: 30px; white-space: nowrap; overflow: hidden;
  				text-overflow: ellipsis; line-height: 22px; margin-left: 20px;
  				font-size: 25px; font-weight: bold; padding-top: 7px;}
  	.p_button{ height: 37px; border-radius: 6px; border: none; background: none; vertical-align: top;}
  	#b_messeage{ width: 90px; margin-left: 10px; border: 1px solid #DBDBDB; cursor: pointer; }
	#b_follow{ width: 70px; border: none; background-color: #521110; color: white; margin-left: 10px;
				cursor: pointer;}
	#b_more{ border: none; background:none; height: 25px; font-size: 20px; font-weight: bold; margin-left: 10px;
			cursor: pointer;}
	
	
	/* 3. 게시물 + 팔로워 + 팔로우 */
	#follow{ display: inline-block; margin-top: 25px; margin-left: 38px; list-style: none; padding: 0px; }
	#follow li{ float: left; font-size: 15px;}
	.f_title{ padding-right: 5px; }
	.f_content{ padding-right: 15px; font-weight: bold; }
	
	/* 4. 전문가소개 + 자기소개 */
	#introduce{ height: auto; display: inline-block; margin-top: 40px; margin-left: 38px;}
	#introduce span{ width: 520px; height: 130px; display: inline-block; word-wrap: break-word; 
					overflow-y: auto; padding: 7px; padding-left: 10px; font-size: 13px; }
	#introduce span::-webkit-scrollbar { width: 5px; height: auto; background: none;}
	#introduce span::-webkit-scrollbar-thumb{ background: #DBDBDB; border-radius: 10px; }
	
	/* 5. 게시물버튼 + 내가쓴 게시물 */
	/* .c_list{ display:none; width: 950px; min-height: 240px; margin: 5px 0px;}
	.c_list.current{display: inherit;} */
	.c_list{ display:none; width: 950px; min-height: 280px; margin: 5px 0px; overflow: auto;}
	.c_list.current{display: inherit; height: 590px; width: auto;}
	#c_button{ display: inline-block; list-style: none; margin-left: 55px;}
	#c_button li {  width: 90px; height: 50px; float: left; margin-right: 30px;
					text-align: center; line-height: 50px; font-size: 15px; cursor: pointer;}
	#c_button li.current { border-top: 3px solid gray; border-radius: 1px; font-weight: bold; transition: .3s; } /* 선택하는 탭만나오게 */
	hr{ display: block !important; border: 1px solid #DBDBDB; background: #DBDBDB;}
	.c_post{ width: 280px; height: 280px;  display: inline-block; margin-left: 23px; position: relative;}
	/* 게시물이 없을경우 */
	#no_list{ height: 500px; font-size: 20px; text-align: center; line-height: 170px; }
	#no_img{ width: 130px; height: 130px; position: relative; top: 50px;}
	/* 게시물이 있을경우 */
	.c_text{ width: 150px; display: inline-block; text-align: right;
			white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
			position: relative; bottom: 20px; left: 125px;}
	.c_img{ width: 100%; height: 100%; vertical-align: middle; display: inline-block;
			border: 1px solid #DBDBDB; overflow: hidden; position: relative;}
	.img_content{ width: 100%; display: inline-block; position: absolute; margin: auto;
				top: 0; bottom: 0; left: 0; right: 0;}
	
	
	
	
	
	/* 더보기 modal-popup */
	#modal1 { position:relative; width:100%; height:100%; z-index:1; display:none; }
	#moreModal{ position: fixed; left: 600px; bottom: 300px;}
	#m_area { width: 400px; height: 100px; border: 2px solid #DBDBDB; background: white; border-radius: 13px; }
	.modi_button{ width: 100%; height: 50%; border: none; background: none;}
	#m_notify{ border-bottom: 1px solid #DBDBDB; }
	#m_cancel{ border-top: 1px solid #DBDBDB; }
	
	/* 신고 modal-popup */
	#modal2 { position:relative; width:100%; height:100%; z-index:1; display:none; }
	#notify{ position: fixed; left: 450px; bottom: 45px; }
	#n_area{ width: 700px; height: 430px; background: white; border:2px solid #DBDBDB; border-radius: 15px;}
	#n_letter{ margin-top: 10px; margin-left: 25px; font-weight: bold; }
	#n_select{ width: 130px; height: 25px; border: 2px solid #DBDBDB; border-radius: 4px; margin-left: 25px; margin-top: 20px;}
	#n_text{ width: 640px; height: 270px; border: 2px solid #DBDBDB; border-radius: 4px; position: relative; top: 20px; left: 25px; resize: none;}
	#n_notify{ width: 80px; height: 30px; border-radius: 6px; border: none; background: #521110; color: white;
				position: relative; top: 35px; left: 250px; }
	#n_cancel{ width: 50px; height: 30px; border-radius: 6px; border: none; background: gray; color: white;
				position: relative; top: 35px; left: 265px; }
	.modal_layer{ position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5);
	 				z-index:-1; } 
	
	/* 다른사람팔로우목록 */
	#modal3 { position:relative; width:100%; height:100%; z-index:1; display:none; }
	#follow_list{ width: 400px; height: 500px; border: 1px solid #DBDBDB; border-radius: 10px; background: white;
					position: fixed; left: 600px; bottom: 100px;}
	#follow_title{ height: 50px; }
	#list_title{ width: 80%; display: inline-block; position: relative; left: 40px; top: 13px; }
	#xButton{ border: none; font-size: 20px; font-weight: bold; background: none; 
			  position: relative; left: 40px; top: 13px; }	
	/* 1) 팔로워 팔로우탭 */
	#f_tab2{text-align:center; padding: 15px 0px 15px 0px; cursor: pointer;}
	.f_list{height: 400px; overflow-y: auto; }
	#f_list::-webkit-scrollbar { width: 5px; height: auto; background: none; border: 1px solid #DBDBDB; }
	#f_list::-webkit-scrollbar-thumb{ background: #DBDBDB; border-radius: 10px; }
	.member{ height: 50px; vertical-align: middle; }
	.member:hover{ background: lightgray; }
	.img_area{ width: 40px; height: 40px; border-radius: 100px; display: inline-block; 
				overflow: hidden; margin-top: 6px; margin-left: 20px; }
	.f_img{ max-height:100%; min-width: auto; margin-left: auto; } /* 가로세로 비율 >> js여기서 참고하기 https://codepen.io/feeva/pen/ApneC */
	.m_nick{ width: 200px; height: 25px; display: inline-block; vertical-align: top; margin-top: 14px; margin-left: 15px; 
			font-weight: bold; font-size: 14px; white-space: nowrap; overflow: hidden;
  				text-overflow: ellipsis; }
  	.m_button{ width: 80px; height: 30px; margin: 10px 0px 0px 15px; border: 1px solid #DBDBDB; border-radius: 4px; 
  				background: white; display: inline-block; position: relative; vertical-align: top; }
	
	#modal3 .modal_layer { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5);
	 						 z-index:-1; }  
	#xButton{cursor: pointer}
	/* 팔로워 팔로우가 없을경우 */
	.no_follow{ width: 400px; height: auto; }
	.no_f_img{ width: 80px; height: 80px; margin: 100px 0 50px 0; }
</style>
</head>
<body>
 	<%@ include file="../common/header.jsp"%>

	<section class="section">

		<%@ include file="../common/section_menubar.jsp"%>
		<div id="centerWrap"> <!-- 여기에다가 넣으면 됩니다 시작 -->
            <div class="infomation">
			<div id="profile_img">
				<c:set var="fullPath" value="${contextPath}/resources/userProfile/${member.userId}/${member.profile_pic}"/>
				<c:choose>
					<c:when test="${not empty member.profile_pic }">
						<div id=p_img><img src="${fullPath}"></div>
					</c:when>
					<c:otherwise>
						<div id=p_img><img src="<%= request.getContextPath() %>/resources/images/profileDefault.png"></div>
					</c:otherwise>
					</c:choose>
			</div>
			<div id="profile">
				<span id="profileInfo">
						<!-- 등급이 전문가이면 전문가 표시 -->
					<c:if test="${member.authority eq 2}">
						<span id="expartMark"><img id="e_mark" src="${ pageContext.request.contextPath }/resources/images/전문가등록된-표시.png"></span>
					</c:if>
						<span id="nickName">${member.nickName}</span>
						<span>
							<input id="hidden_id" type="hidden" value="${member.userId}">
							<input class="p_button" id="b_messeage" type="button" value="메세지보내기">
								<c:if test="${followCheck eq '1' }">
									<input class="p_button" id="b_follow" type="button" value="팔로우 취소">
								</c:if>
								<c:if test="${followCheck eq '0'}">
									<input class="p_button" id="b_follow" type="button" value="팔로우">
								</c:if>
								<c:if test="${empty followCheck}">
									<input class="p_button" id="b_follow" type="button" value="팔로우">
								</c:if>
							<input class="p_button" id="b_more" type="button" value="...">
						</span>
					</span>
				<br>
				<ul id="follow">
					<li class="f_title">게시물</li>
					<li class="f_content">${boardCount}</li>
					<li class="f_title">팔로워</li>
					<li class="f_content">${member.follower_count}</li>
					<li class="f_title">팔로우</li>
					<li class="f_content">${member.following_count}</li>
				</ul>
				<br>
				<div id="introduce">
					<!-- 전문가 경우 -->
						<c:if test="${member.authority eq 2}">
							<span id="introduce_p">
								전문분야 : <c:out value="${proInfo.specialrt_field}" /><br>
								학력 : ${proInfo.school_name} ${proInfo.major}<br>
								경력 : ${proInfo.career}<br>
								카테고리 : ${proInfo.top_special_category} / ${proInfo.middle_special_category}
							</span>
							<br>
						</c:if>
						<!-- 기본으로 나옴 -->
						<span id="introduce_i">
							${member.introduce}
						</span>
					</div>
			</div>
		</div>
		
		<hr>
		
		<!-- 메뉴는 누르면 다른곳으로 넘어감 -->
			<div class="content">
				<div id="c_area1" align="center">
					<ul id="c_button">
						<li id="social" class="tab-link current" data-tab="tab-1">#소셜</li>
						<li id="find" class="tab-link" data-tab="tab-2">#찾아요</li>
						<li id="column" class="tab-link" data-tab="tab-3">#칼럼</li>
						<li id="review" class="tab-link" data-tab="tab-4">#리뷰</li>	
					</ul>
				</div>
				
				<br>
				
				<!-- 게시물없을때는 올린게시물이 없습니다 -->
				<!-- 게시물이미지를 누르면 상세페이지로 넘어가게 하기 -->
				<div class="c_list current" id="tab-1">
					<!-- 내가 쓴 게시물이 없을 경우 -->
					<c:if test="${empty socialList}"> 
						<div id="no_list">
							<img id="no_img" src="<%= request.getContextPath() %>/resources/images/검색아이콘.png"><!-- 이미지 나중에 바꾸기 --><br>
							작성한 게시물이 없습니다
						</div>
					</c:if>
					<!-- 내가 쓴 게시물이 있는 경우 -->
					<c:if test="${not empty socialList}">
						<c:forEach var="social" items="${socialList}" varStatus="status">
							<c:forEach var="file" items="${social.boardFile}">
							<c:set var="fullPath" value="${file.file_path}/${file.file_change_name}"/>
							<c:set var="index" value="${fn:indexOf(fullPath, '/resources')}"/>
							<c:set var="length" value="${fn:length(fullPath)}"/>
							<div class="c_post">
								<c:if test="${ file.file_change_name ne '썸네일-기본이미지.gif' }">
								<div class="c_img"><img class="img_content" src="${contextPath}/${fn:substring(fullPath, index, length)}"></div>
								</c:if>
								<c:if test="${ file.file_change_name eq '썸네일-기본이미지.gif' }">
								<div class="c_img"><img class="img_content" src="${contextPath}/resources/images/썸네일-기본이미지.gif"></div>
								</c:if>
								<div class="c_text">${social.board_title}</div>
								<input type="hidden" class="hidden_boardCount" value="${status.index}">
								<input type="hidden" class="hidden_boardNum" value="${social.board_number}">
								<input type="hidden" class="hidden_category" value="${social.board_category}">
							</div>
							</c:forEach>
						</c:forEach>
					</c:if>
				</div>
				
				<div class="c_list" id="tab-2" >
					<!-- 내가 쓴 게시물이 없을 경우 -->
					<c:if test="${empty searchList}">
						<div id="no_list">
							<img id="no_img" src="<%= request.getContextPath() %>/resources/images/검색아이콘.png"><!-- 이미지 나중에 바꾸기 --><br>
							작성한 게시물이 없습니다
						</div>
					</c:if>
					<!-- 내가 쓴 게시물이 있는 경우 -->
					<c:if test="${not empty searchList}">
						<c:forEach var="search" items="${searchList}" varStatus="status">
							<c:forEach var="file" items="${search.boardFile}">
							<c:set var="fullPath" value="${file.file_path}/${file.file_change_name}"/>
							<c:set var="index" value="${fn:indexOf(fullPath, '/resources')}"/>
							<c:set var="length" value="${fn:length(fullPath)}"/>
							<div class="c_post">
								<c:if test="${ file.file_change_name ne '썸네일-기본이미지.gif' }">
								<div class="c_img"><img class="img_content" src="${contextPath}/${fn:substring(fullPath, index, length)}"></div>
								</c:if>
								<c:if test="${ file.file_change_name eq '썸네일-기본이미지.gif' }">
								<div class="c_img"><img class="img_content" src="${contextPath}/resources/images/썸네일-기본이미지.gif"></div>
								</c:if>
								<div class="c_text">${search.board_title}</div>
								<input type="hidden" class="hidden_boardCount" value="${status.index}">
								<input type="hidden" class="hidden_boardNum" value="${search.board_number}">
								<input type="hidden" class="hidden_category" value="${search.board_category}">
							</div>
							</c:forEach>
						</c:forEach>
					</c:if>
				</div>

				<div class="c_list" id="tab-3">
					<!-- 내가 쓴 게시물이 없을 경우 -->
					<c:if test="${empty columnList}">
						<div id="no_list">
							<img id="no_img" src="<%= request.getContextPath() %>/resources/images/검색아이콘.png"><!-- 이미지 나중에 바꾸기 --><br>
							작성한 게시물이 없습니다
						</div>
					</c:if>
					<!-- 내가 쓴 게시물이 있는 경우 -->
					<c:if test="${not empty columnList}">
						<c:forEach var="column" items="${columnList}" varStatus="status">
							<c:forEach var="file" items="${column.boardFile}">
							<c:set var="fullPath" value="${file.file_path}/${file.file_change_name}"/>
							<c:set var="index" value="${fn:indexOf(fullPath, '/resources')}"/>
							<c:set var="length" value="${fn:length(fullPath)}"/>
							<div class="c_post">
								<c:if test="${ file.file_change_name ne '썸네일-기본이미지.gif' }">
								<div class="c_img"><img class="img_content" src="${contextPath}/${fn:substring(fullPath, index, length)}"></div>
								</c:if>
								<c:if test="${ file.file_change_name eq '썸네일-기본이미지.gif' }">
								<div class="c_img"><img class="img_content" src="${contextPath}/resources/images/썸네일-기본이미지.gif"></div>
								</c:if>
								<div class="c_text">${column.board_title}</div>
								<input type="hidden" class="hidden_boardCount" value="${status.index}">
								<input type="hidden" class="hidden_boardNum" value="${column.board_number}">
								<input type="hidden" class="hidden_category" value="${column.board_category}">
							</div>
							</c:forEach>
						</c:forEach>
					</c:if>
				</div>
				
				<div class="c_list" id="tab-4">
					<!-- 내가 쓴 게시물이 없을 경우 -->
					<c:if test="${empty reviewList}">
						<div id="no_list">
							<img id="no_img" src="<%= request.getContextPath() %>/resources/images/검색아이콘.png"><!-- 이미지 나중에 바꾸기 --><br>
							작성한 게시물이 없습니다
						</div>
					</c:if>
					<!-- 내가 쓴 게시물이 있는 경우 -->
					<c:if test="${not empty reviewList}">
						<c:forEach var="review" items="${reviewList}" varStatus="status">
							<c:forEach var="file" items="${review.boardFile}">
							<c:set var="fullPath" value="${file.file_path}/${file.file_change_name}"/>
							<c:set var="index" value="${fn:indexOf(fullPath, '/resources')}"/>
							<c:set var="length" value="${fn:length(fullPath)}"/>
							<div class="c_post">
								<c:if test="${ file.file_change_name ne '썸네일-기본이미지.gif' }">
								<div class="c_img"><img class="img_content" src="${contextPath}/${fn:substring(fullPath, index, length)}"></div>
								</c:if>
								<c:if test="${ file.file_change_name eq '썸네일-기본이미지.gif' }">
								<div class="c_img"><img class="img_content" src="${contextPath}/resources/images/썸네일-기본이미지.gif"></div>
								</c:if>
								<div class="c_text">${review.board_title}</div>
								<input type="hidden" class="hidden_boardCount" value="${status.index}">
								<input type="hidden" class="hidden_boardNum" value="${review.board_number}">
								<input type="hidden" class="hidden_category" value="${review.board_category}">
							</div>
							</c:forEach>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		<!-- 더보기 modal-popup >> 나중에 display: none해줘야함-->
		<div id="modal1">
			<div id=moreModal>
				<div id=m_area>
					<input type="button" class="modi_button" id="m_notify" value="신고하기">
					<input type="button" class="modi_button" id="m_cancel" value="취소">
				</div>
			</div>
			
			<div class="modal_layer"></div>
		</div>
		
		<div id="modal2">	
			<!-- 신고하기modal-popup >> 나중에 display: none해줘야함 
				value는 중에 값넣기-->
			<div id=notify>
				<form>
					<div id="n_area">
						<div id="n_letter">신고하기</div>
						<select id="n_select">
							<option>신고내용</option>
							<option value="1">사칭/도용</option>
							<option value="2">욕설</option>
							<option value="3">스팸/광고</option>
							<option value="4">허위사실유포</option>
							<option value="5">저작권 침해</option>
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
	</section>
	<script>
			$(document).ready(function(){
				// 모달창띄우기
				$("#b_more").click(function(){
					$("#modal1").fadeIn("fast").css("display","block");
				});
				// 두번째 모달창 띄우기 >> 신고하기 누르면
				$("#m_notify").click(function(){
					$("#modal1").fadeOut("fast").css("display","block");
					$("#modal2").fadeIn("fast").css("display","block");
				});
				
				// 모달아닌 다른곳 클릭하면 닫기
				$(".modal_layer").click(function(){
					$("#modal1").fadeOut("fast").css({"display":"none"});
				});
				
				$(".modal_layer").click(function(){
					$("#modal2").fadeOut("fast").css({"display":"none"});
				});
				
				// 취소 누르면 돌아가기
				$("#m_cancel").click(function(){
					$("#modal1").fadeOut("fast").css("display","block");
				});
				$("#n_cancel").click(function(){
					$("#modal2").fadeOut("fast").css("display","block");
				});
			});
			
			$("#b_follow").on("click", function(){
				
				var text = $("#b_follow").val();
				var userId = $("#hidden_id").val();
				var data = {"userId" : userId};
				
				var alarm_receiver_nickName = "${member.nickName}";
				var alarm_sender = "${loginUser.userId}";
				var alarm_sender_nickName = "${loginUser.nickName}";
				
				if(text === "팔로우"){
					$.ajax({
						type: "post",
						url: "follow.st",
						data: JSON.stringify(data),
						contentType: "application/json; charset=utf-8",
						success: function(data){
							
							if(data === "ok"){
								$("#b_follow").val("팔로우 취소");
								
					 	 	 	var AlarmData = {
					 	 	 			"alarm_sender" : alarm_sender,
					 	 	 			"alarm_receiver" : userId,
					 	 	 			"alarm_type" : "Follow",
					 	 	 			"alarm_title" : "<b>"+alarm_sender_nickName+"</b>님이 회원님을 팔로우하기 시작했습니다.",
					 	 	 			"alarm_content" : "<b>"+alarm_sender_nickName+"</b>님이 회원님을 팔로우하기 시작했습니다.",
					 	 	 	};
					 	 	 	
					 	 	 	console.log(AlarmData);

					 	 	 	// 알림 DB저장
					 	 	 	$.ajax({
					 	 	 		type : 'post',
					 	 	 		url : 'saveAlarm.ws',
					 	 	 		data : JSON.stringify(AlarmData),
					 	 	 		contentType: "application/json; charset=utf-8",
					 	 	 		dataType : 'text',
					 	 	 		success : function(data){
					 	 	 			console.log(data);
					 	 	 			if(data == 1){
						 	 	 			if(socket){
						 	 	 				let socketMsg = "Follow," + alarm_sender + "," + userId + "," + "null"; // 소켓에 보낼 메세지
						 	 	 				console.log("msgmsg : " + socketMsg); // 소켓 메세지 확인 콘솔
						 	 	 				socket.send(socketMsg); // 소켓에 메세지를 보낸다.				 	 	 				
												
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
								
								
							} else if(data === "fail"){
								return false;
							}
						}
					});
				} else if(text === "팔로우 취소"){
					$.ajax({
						type: "post",
						url: "cancleFollow.st",
						data: JSON.stringify(data),
						contentType: "application/json; charset=utf-8",
						success: function(data){
							
							if(data === "ok"){
								$("#b_follow").val("팔로우");
								
					 	 	 	var AlarmData = {
					 	 	 			"alarm_sender" : alarm_sender,
					 	 	 			"alarm_receiver" : userId,
					 	 	 			"alarm_type" : "Follow"
					 	 	 	};
					 	 	 	
					 	 	 	console.log(AlarmData);

					 	 	 	// 알림 DB 삭제
					 	 	 	$.ajax({
					 	 	 		type : 'post',
					 	 	 		url : 'deleteFollowAlarm.ws',
					 	 	 		data : JSON.stringify(AlarmData),
					 	 	 		contentType: "application/json; charset=utf-8",
					 	 	 		dataType : 'text',
					 	 	 		success : function(data){
					 	 	 			console.log(data);
					 	 	 			if(data == 1){	 	 				
					 	 	 				console.log("알람 삭제에 성공했습니다");
						 	 	 		}else if(data == 0){
						 	 	 			console.log("알람 삭제에 실패했습니다");
					 	 	 			}

					 	 	 		},
					 	 	 		error : function(err){
					 	 	 			console.log(err); 
					 	 	 		}

								});
								
								
							} else if(data === "fail"){
								return false;
							}
						}
					});
				}
			});
			
			$("#n_notify").on("click", function(){
				
					var member_report_category = $("#n_select").val();
					var report_content = $("#n_text").val();
					var data = {"category" : member_report_category,
								"content" : report_content,
								"report_from" : "${loginUser.userId}",
								"report_to" : "${member.userId}"
								};
					
				$.ajax({
					type: "post",
					url: "reportMember.st",
					data: JSON.stringify(data),
					contentType: "application/json; charset=utf-8",
					success: function(data){
						
						if(data === "ok"){
							alert("정상적으로 신고되었습니다");
							$("#modal2").fadeOut("fast").css("display","none");
						} else{
							alert("오류가 발생했습니다. 다시 신고해주세요");
						}
					}
				});
			});
			
			var socialCount = ${socialCount};
			var searchCount = ${searchCount};
			var columnCount = ${columnCount};
			var reviewCount = ${reviewCount};
			
			var currentCategoryCount = 0;
			$(".c_list.current").on("mouseover", function(){
				var boardCategory = $(".c_list.current").find(".hidden_category:last").val();
				
				switch(boardCategory){
				case "1" : currentCategoryCount = socialCount; break;
				case "2" : currentCategoryCount = searchCount; break;
				case "3" : currentCategoryCount = columnCount; break;
				case "4" : currentCategoryCount = reviewCount; break;
				}
			});
			
			// 클릭하지않은 탭 스크롤
			$(".c_list.current").scroll(function(){
				
				var boardCount = $(".c_list.current").find(".hidden_boardCount:last").val();
				var boardCategory = $(".c_list.current").find(".hidden_category:last").val();
				
				var data = {
							"userId" : "${member.userId}",
							"boardCount" : boardCount,
							"boardCategory" : boardCategory};
				
				var currentScrollTop = $(this).scrollTop();
				
				console.log("currentScrollTop : " + currentScrollTop);
				
				var list_height = $(this).height();
				
				console.log("list_height : " + list_height);
							
				var board_height = Math.ceil((parseInt(boardCount)+1)/3) * 295;
				
				console.log("board_height : " + board_height);
				
				var stand = board_height - list_height;
				
				
				if(currentScrollTop >= stand && currentCategoryCount > (parseInt(boardCount)+1)){
					/* if(currentScrollTop >= stand + 4 && currentCategoryCount > (parseInt(boardCount)+1)){ */

					$.ajax({
						type: "post",
						url: "getBoardList.st",
						contentType: "application/json; charset=utf-8",
						data: JSON.stringify(data),
						success: function(data){
							var str = "";
							if(data != ""){
								$(data).each(function(){
									
									str += "<div class=" + "'c_post'" + ">";
									str += "<div class=" + "'c_img'" + "><img class=" + "'img_content'" + "src=" + this.file_path + "></div>";
									str += "<div class=" + "'c_text'" + ">" + this.board_title + "</div>";
									str += "<input type=" + "'hidden'" + "class=" + "'hidden_boardCount'" + "value=" + this.index + ">";
									str += "<input type=" + "'hidden'" + "class=" + "'hidden_boardNum'" + "value=" + this.board_number + ">";
									str += "<input type=" + "'hidden'" + "class=" + "'hidden_category'" + "value=" + this.board_category + ">";
									str += "</div>";
								});
								
								$(".c_list.current").find(".c_post:last").after(str);
							}
						}
					});
				} else if((parseInt(boardCount)+1) >= currentCategoryCount){
					return false;
				}
			});
			
			
		</script>
		
		<!-- 탭 넘기기 스크립트  -->
		<script>
		$(document).ready(function(){
			
			$('ul#c_button li').click(function(){
				var tab_id = $(this).attr('data-tab');

				$('ul#c_button li').removeClass('current');
				$('.c_list').removeClass('current');

				$(this).addClass('current');
				$("#"+tab_id).addClass('current');
				
				var socialCount = ${socialCount};
				var searchCount = ${searchCount};
				var columnCount = ${columnCount};
				var reviewCount = ${reviewCount};
				
				var currentCategoryCount = 0;
				$(".c_list.current").on("mouseover", function(){
					var boardCategory = $(".c_list.current").find(".hidden_category:last").val();
					
					switch(boardCategory){
					case "1" : currentCategoryCount = socialCount; break;
					case "2" : currentCategoryCount = searchCount; break;
					case "3" : currentCategoryCount = columnCount; break;
					case "4" : currentCategoryCount = reviewCount; break;
					}
				});
				
				// 스크롤
				$("#"+tab_id).scroll(function(){
					
					var boardCount = $(".c_list.current").find(".hidden_boardCount:last").val();
					var boardCategory = $(".c_list.current").find(".hidden_category:last").val();
					
					var data = {
								"userId" : "${member.userId}",
								"boardCount" : boardCount,
								"boardCategory" : boardCategory};
					
					var currentScrollTop = $(this).scrollTop();
					
					console.log("currentScrollTop : " + currentScrollTop);
					
					var list_height = $(this).height();
					
					console.log("list_height : " + list_height);
								
					var board_height = Math.ceil((parseInt(boardCount)+1)/3) * 295;
					
					console.log("board_height : " + board_height);
					
					var stand = board_height - list_height;
					
					
					if(currentScrollTop >= stand && currentCategoryCount > (parseInt(boardCount)+1)){
						/* if(currentScrollTop >= stand + 4 && currentCategoryCount > (parseInt(boardCount)+1)){ */

						$.ajax({
							type: "post",
							url: "getBoardList.st",
							contentType: "application/json; charset=utf-8",
							data: JSON.stringify(data),
							success: function(data){
								var str = "";
								if(data != ""){
									$(data).each(function(){
										
										str += "<div class=" + "'c_post'" + ">";
										str += "<div class=" + "'c_img'" + "><img class=" + "'img_content'" + "src=" + this.file_path + "></div>";
										str += "<div class=" + "'c_text'" + ">" + this.board_title + "</div>";
										str += "<input type=" + "'hidden'" + "class=" + "'hidden_boardCount'" + "value=" + this.index + ">";
										str += "<input type=" + "'hidden'" + "class=" + "'hidden_boardNum'" + "value=" + this.board_number + ">";
										str += "<input type=" + "'hidden'" + "class=" + "'hidden_category'" + "value=" + this.board_category + ">";
										str += "</div>";
									});
									
									$(".c_list.current").find(".c_post:last").after(str);
								}
							}
						});
					} else if((parseInt(boardCount)+1) >= currentCategoryCount){
						return false;
					}
				});
				
				
				
				
			})

		});
		
		//게시글넘기기
        $(".c_img").on("click", function(){
            var bNum = $(this).next().next().next().val();
            
            location.href="bDetail.bo?bNum="+bNum;
            
         });
		</script>
</body>
</html>