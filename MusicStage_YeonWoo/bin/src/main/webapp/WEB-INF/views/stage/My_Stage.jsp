<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>My_Stage</title>
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
  	#b_management{ width: 60px; margin-left: 10px; border: 1px solid #DBDBDB; }
	#b_follow{ width: 120px; border:none; background: #521110; color: white; font-size: 12px; margin-left: 10px; }
	#b_follow, #b_management:hover{ cursor: pointer; }
		
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
	.c_list{ display:none; width: 950px; min-height: 280px; margin: 5px 0px; overflow: auto;}
	.c_list.current{display: inherit; height: 590px; width: auto;}
	#c_button{ display: inline-block; list-style: none; margin-left: 55px;}
	#c_button li {  width: 90px; height: 50px; float: left; margin-right: 30px;
					text-align: center; line-height: 50px; font-size: 15px; }
	#c_button li:hover{ cursor: pointer; }
	#c_button li.current { border-top: 3px solid gray; border-radius: 1px; font-weight: bold; transition: .3s; } /* 선택하는 탭만나오게 */
	hr{ display: block !important; border: 1px solid #DBDBDB; background: #DBDBDB;}
	.c_post{ width: 280px; height: 280px;  display: inline-block; margin-left: 23px; position: relative;}
	/* 게시물이 없을경우 */
	#no_list{ height: 500px; font-size: 20px; text-align: center; line-height: 170px; }
	#no_img{ width: 130px; height: 130px; position: relative; top: 50px;}
	/* 게시물이 있을경우 */
	.c_post:hover{ cursor: pointer; }
	.c_text{ width: 150px; display: inline-block; text-align: right;
			white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
			position: relative; bottom: 20px; left: 125px;}
	.c_img{ width: 100%; height: 100%; vertical-align: middle; display: inline-block;
			border: 1px solid #DBDBDB; overflow: hidden; position: relative;}
	.img_content{ width: 100%; display: inline-block; position: absolute; margin: auto;
				top: 0; bottom: 0; left: 0; right: 0;}
	
	/* 팔로우모달 */
	#modal { position:relative; width:100%; height:100%; z-index:1; display:none; }
	#follow_list{ width: 400px; height: 500px; border: 1px solid #DBDBDB; border-radius: 10px; background: white;
					position: fixed; left: 600px; bottom: 100px;}
	#follow_title{ height: 50px; }
	#list_title{ width: 80%; display: inline-block; position: relative; left: 40px; top: 13px; }
	#xButton{ border: none; font-size: 20px; font-weight: bold; background: none; 
			  position: relative; left: 40px; top: 13px; }
	/* 1) 팔로워 팔로우탭 */
	#f_tab1, #f_tab2{ width: 195px; text-align:center; padding: 15px 0px 15px 0px;
					  display: inline-block; cursor: pointer;}
	.f_tab.current { border-bottom: 2px solid gray; transition: .3s; } /* 선택하는 탭만나오게 */
	.f_list{ display:none; height: 400px; overflow: hidden;}
	.f_list.current{display: inherit; overflow-y: auto;}
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
	
	#modal .modal_layer { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5);
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
					<c:set var="fullPath" value="${contextPath}/resources/userProfile/${loginUser.userId}/${loginUser.profile_pic}"/>
					<c:choose>
						<c:when test="${not empty loginUser.profile_pic }">
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
					<c:if test="${loginUser.authority eq 2}">
						<span id="expartMark"><img id="e_mark" src="<%= request.getContextPath() %>/resources/images/전문가등록된-표시.png"></span>
					</c:if>
						<span id="nickName">${loginUser.nickName}</span>
						<span>
							<input class="p_button" id="b_management" type="button" value="계정관리" onclick="location.href='goStage.st'">
							<input class="p_button" id="b_follow" type="button" value="팔로워 / 팔로우보기">
						</span>
					</span>
					<br>
					<ul id="follow">
						<li class="f_title">게시물</li>
						<li class="f_content">${boardCount}</li>
						<li class="f_title">팔로워</li>
						<li class="f_content">${followerAllCount}</li>
						<li class="f_title">팔로우</li>
						<li class="f_content">${followingAllCount}</li>
					</ul>
					<br>
					<div id="introduce">
					<!-- 전문가 경우 -->
						<c:if test="${loginUser.authority eq 2}">
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
							${loginUser.introduce}
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
								<div class="c_img"><img class="img_content" src="${contextPath}/${fn:substring(fullPath, index, length)}"></div>
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
								<div class="c_img"><img class="img_content" src="${contextPath}/${fn:substring(fullPath, index, length)}"></div>
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
								<div class="c_img"><img class="img_content" src="${contextPath}/${fn:substring(fullPath, index, length)}"></div>
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
								<div class="c_img"><img class="img_content" src="${contextPath}/${fn:substring(fullPath, index, length)}"></div>
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
		
	</section>
	
		
		<!-- 나를 팔로잉하는목록 >> 팔로워 -->
		<!-- 내가 팔로잉하는목록 >> 팔로우 -->
		<div id="modal">
			<%@ include file="follow_modal.jsp" %>
		</div>
		
	<!-- 모달창 script -->
	<script>
		$(document).ready(function(){
			
			// 모달창 띄우기
			$("#b_follow").click(function(){
				$("#modal").fadeIn("fast").css({"display":"block"});
				$("body").css("overflow", "hidden");
			});
			
			// 모달아닌 다른곳 클릭하면 닫기
			$(".modal_layer").click(function(){
				$("#modal").fadeOut("fast").css({"display":"none"});
				$("body").css("overflow", "auto");
			});
			
			$("#xButton").click(function(){
				$("#modal").fadeOut("fast").css({"display":"none"});
				$("body").css("overflow", "auto");
			});
			
			
			// 모달창 내 탭
			$('div.f_tab').click(function(){
				var tab_id = $(this).attr('data-tab');

				$('div.f_tab').removeClass('current');
				$('div.f_list').removeClass('current');

				$(this).addClass('current');
				$("#"+tab_id).addClass('current');
			});
			
				
		});		
		
		/* $(".c_list").on("mouseover", function(){
			$("body").css("overflow", "hidden");
			$(".c_list").css("overflow", "auto");
		});
		
		$(".c_list").on("mouseout", function(){
			$("body").css("overflow", "auto");
			$(".c_list").css("overflow", "hidden");
		}); */
		
		
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
		$(".c_list.current").scroll(function(){
			
			var boardCount = $(".c_list.current").find(".hidden_boardCount:last").val();
			var boardCategory = $(".c_list.current").find(".hidden_category:last").val();
			
			var data = {
						"userId" : "${loginUser.userId}",
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
	
	<!-- 탭넘기기 스크립 -->
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
									"userId" : "${loginUser.userId}",
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
			
			
	        $(".c_img").on("click", function(){
	            var bNum = $(this).next().next().next().val();
	            
	            location.href="bDetail.bo?bNum="+bNum;
	            
	         });
		</script>
</body>
</html>