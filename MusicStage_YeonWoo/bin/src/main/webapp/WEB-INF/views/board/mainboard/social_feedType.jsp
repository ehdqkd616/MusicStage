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
<title></title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/default.css"/>" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/seoyoung/feedType.css" type="text/css">
<link rel="stylesheet" href="resources/css/seoyoung/modalPage.css" type="text/css">
<style>
* {box-sizing: border-box}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container { max-width: 500px; position: relative; margin: auto;}

/* next & previous buttons */
.prev, .next { cursor: pointer; position: absolute; top: 50%; width: auto;
            padding: 16px; margin-top: -22px; transition: 0.6s ease; }

/* Position the "next button" to the right */
.next { right: 0; }

/* Number text (1/3 etc) */
.numbertext { color: #f2f2f2; font-size: 12px; padding: 8px 12px;
           position: absolute; top: 0; }

/* The dots/bullets/indicators */
.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  /* -webkit-animation-name: fade; */
  /* -webkit-animation-duration: 1.5s; */
  /* animation-name: fade; */
  /* animation-duration: 1.5s; */
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

.modalType_modal_layer {
position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5);
             z-index:-1;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<section class="section">

		<%@ include file="/WEB-INF/views/common/section_menubar.jsp"%>

		<%-- <%@ include file="../common/recommend.jsp" %> --%>
		<!-- 슬라이더 문제 있어서 잠시 주석처리 했습니다. -->

		<%@ include file="/WEB-INF/views/common/categoryFilter.jsp"%>

			<!-- centerWrap start -->
		<div id="centerWrap">    
		<!-- 여기에다가 넣으면 됩니다 시작 -->
		<!-- start -->
		<!-- 리스트가 없을 경우 -->
		<c:if test="${ empty list }">
		<div id="no_board_div" align="center">
			<img src="<%= request.getContextPath() %>/resources/images/profileDefault.png"><br>
			등록된 게시물이 없습니다
		</div>
		</c:if>
		<!-- 리스트가 있을 경우 -->
		<c:if test="${ not empty list }">
			<div class="main_div">
				<c:forEach items="${ list }" var="list">
					<input class="wpqkf" type="hidden" value="${ list.board_number}" >  
					<table class="main_feed_table">
						<tr>
							<td class="feedType_profile_td">
								<!-- 프로필 사진이 없을 경우 -->
								<c:if test="${ empty list.member.profile_pic }">
									<img class="" src="<%= request.getContextPath() %>/resources/images/profileDefault.png">&nbsp;
								</c:if>
								<!-- 프로필 사진이 있을 경우 -->
								<c:if test="${ !empty list.member.profile_pic }">
									<img class="" src="<%= request.getContextPath() %>/resources/userProfile/${ list.b_writer }/${ list.member.profile_pic }">&nbsp;
								</c:if>
                                 
								<a class="nickname_link" style="vertical-align: middle"><c:out value="${ list.member.nickName }" /></a>
                                 
                                <input class="only_class_bWriter" type="hidden" value="${ list.b_writer }" >  
								<input class="only_class_bNo" type="hidden" value="${ list.board_number }" >    
								<input class="only_class_bWriter_nickName" type="hidden" value="${ list.member.nickName }" >								
								<button class="modal_button">···</button>
							</td>		
						</tr>
						<tr>
							<td class="feedType_img_td">
								<!-- 이미지 슬라이드 -->
								<!-- 파일리스트가 하나일 경우 >> 썸네일은 무조건 들어가야하기때문에 다른파일들을 안넣었다면 썸네일만 들어가있을것 -->
								<c:if test="${ fn:length(list.boardFile) == 1 }">
									<c:forEach items="${ list.boardFile }" var="file">
									<c:if test="${ file.file_thumbnail eq '1'.charAt(0) }">
									<c:if test="${ file.file_change_name eq '썸네일-기본이미지.gif' }">
										<div style="width: 600px; height: 600px; overflow:hidden; display: flex; align-items: center;"><img class="onlyThumbnail" src="<%= request.getContextPath() %>/resources/images/썸네일-기본이미지.gif"></div>
										</c:if>
										<c:if test="${ file.file_change_name ne '썸네일-기본이미지.gif' }">
										<div style="width: 600px; height: 600px; overflow:hidden; display: flex; align-items: center;"><img class="onlyThumbnail" src="<%= request.getContextPath() %>/resources/boardImageFile/${ file.file_change_name }"></div>
									</c:if>
									</c:if>
									</c:forEach>
								</c:if>
								
								<!-- 파일리스트가 두개이상일경우 >> 썸네일 + 자기가 직접넣은파일 -->
								<c:if test="${ fn:length(list.boardFile) > 1 }">
								<div class="bxslider only_class_slider">
									<c:forEach items="${ list.boardFile }" var="file">
										<c:if test="${ file.file_thumbnail eq '1'.charAt(0) }">
											<!-- 기존 코드 -->
											<%-- <div><img src="<%= request.getContextPath() %>${ file.file_path }${ file.file_change_name}"></div> --%>
											<!-- 바꾼거(12/10) -->
											<c:if test="${ file.file_change_name eq '썸네일-기본이미지.gif' }">
											<div style="width: 600px; height: 600px; overflow:hidden;"><img class="sliderImages" src="<%= request.getContextPath() %>/resources/images/썸네일-기본이미지.gif"></div>
											</c:if>
											<c:if test="${ file.file_change_name ne '썸네일-기본이미지.gif' }">
											<div style="width: 600px; height: 600px; overflow:hidden;"><img class="sliderImages" src="<%= request.getContextPath() %>/resources/boardImageFile/${ file.file_change_name }"></div>
											</c:if>
										</c:if>
									</c:forEach>
									
									<c:forEach items="${ list.boardFile }" var="file">
										<c:if test="${file.file_thumbnail eq '0'.charAt(0) }">
											<c:choose>
												<c:when test="${ file.file_type eq 1 }"><div style="width: 600px; height: 600px; overflow:hidden;"><img class="sliderImages" src="<%= request.getContextPath() %>/resources/boardImageFile/${ file.file_change_name }"></div></c:when>
												<c:when test="${ file.file_type eq 2 }"><div style="width: 600px; height: 600px; overflow:hidden;"><video class="list_video" controls src="<%= request.getContextPath() %>/resources/boardVideoFile/${ file.file_change_name}"></video></div></c:when>
												<c:when test="${ file.file_type eq 3 }"><div style="width: 600px; height: 600px; overflow:hidden;"><audio class="list_music" style="background-image: url('resources/images/audioBackground.gif');" controls src="<%= request.getContextPath() %>/resources/boardAudioFile/${ file.file_change_name}"></audio></div></c:when>
											</c:choose>
										</c:if>
									</c:forEach>
								</div>
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="feedType_icon_td">
								<div class="">
									<!-- 좋아요 한 게시물 넘버 -->
                                	<input class="only_class_bWriter" type="hidden" value="${ list.b_writer }" >  
									<input class="only_class_bWriter_nickName" type="hidden" value="${ list.member.nickName }" >									
									<input type="hidden" class="boardNum" value="${list.board_number }">
									<button class="like_btn">
											<img class="feedType_icon likeIcon likeIcon${ list.board_number }" src="resources/images/unlike.png">
									</button>
									&nbsp;&nbsp;

									<button class="go_modalPage_button open_modalType">
										<img class="feedType_icon" src="resources/images/댓글버튼.png">
									</button>
                              		&nbsp;&nbsp;
                              
									<button>
										<img class="feedType_icon" src="resources/images/메세기.png">
									</button>
									
									<!-- 보관한 게시글 넘버 -->
									<input type="hidden" value="${list.board_number }">
									<button class="keep_btn">
										<img class="feedType_icon keepIcon keepIcon${list.board_number }" id="feedType_unkeep" src="resources/images/unkeep.png">
									</button>
								</div>
                           
								<br>
                           
								<div class="">
									<span>좋아요 <span id="${ list.board_number }_like_count">${ list.like_count }</span>개</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="feedType_content_td">
								<div class="feedType_title_div open_modalType2">
									<span><c:out value="${ list.board_title }" /></span>
								</div>
								<div class="feedType_content_div" style="background-color: white;">
									${ fn:replace(list.board_content, replace, "<br/>") }
								</div>
                           
								<button class="moreContent">더보기</button>
								<input type="hidden" value="${ list.member.profile_pic }">
								<input type="hidden" value="${ list.like_count }">
							</td>
						</tr>
						<tr>
							<td class="feedType_comment_td">
								<div class="feedType_comment_plus open_modalType3">
									댓글 <span>${ list.reply_count }</span>개 모두 보기
								</div>
								
								
								<div class="fd_comment_box">
									<c:forEach items="${ list.reply}" var="reply"> 
										<table class="fd_parent_comment_box">
											<tr>
												<td class="fd_comment_writer">
													<input type="hidden" value="${ reply.reply_number }"> <!-- 부모댓글번호 -->
													<div class="fd_parent_writer"><c:out value="${reply.r_writer_nickName }"/></div>
												</td>
												<td class="fd_comment_content">
													<c:out value="${reply.reply_content }"/>
													<c:if test="${loginUser.userId eq reply.r_writer }">
													<input type="hidden" value="${ reply.reply_number }"/>
													<input type="hidden" value="${ list.board_number }"/>
													<input class="fd_comment_delete" id="fd_parent_delete" type="button" value="삭제">
													</c:if>
												</td>
											</tr>
										</table>
									</c:forEach>
								</div>	
							</td>
						</tr>
						<tr>
							<td class="feedType_comment_input_td">
								<div class="comment_write_box">
									<input type="text" class="reply_in" placeholder="댓글 달기 ...">
									<input type="submit" onclick="insertreply(this)" value="등록">
								</div>
							</td>
						</tr>
					</table>
					<br><br><br>
					
				</c:forEach>
			</div>
		</c:if>
	</div>
	<!-- end -->
	<!-- centerWrap end -->
	</section>
   

   <!-- 1. ···버튼 눌렀을 때 나오는 모달 start-->
    <div id="modal1">
    <div id="my_plus_list">
       <div style="border-bottom: 1px solid #DBDBDB"><button class="report_modal_button">신고</button></div>
       <div style="border-bottom: 1px solid #DBDBDB"><button>링크 복사</button></div>
       <div><button class="modal_cancel">취소</button></div>
    </div>
    </div>
   	
   <!-- 작성자가 게시글을 볼 때 -->
   <div id="modal2">
   <div id="my_plus_list">
         <div style="border-bottom: 1px solid #DBDBDB"><button id="modifyBoard">수정</button></div>
         <div style="border-bottom: 1px solid #DBDBDB"><button id="deleteBoard">삭제</button></div>
         <div><button class="modal_cancel">취소</button></div>
    </div>
    </div>

   <!-- 1-1. ···버튼에서의 신고하기 모달 start -->
   <div id="report_modal">
      <div id="n_area">
         <div id="n_letter">
            <!-- 신고하기 <br> -->
            <select id="n_select" onchange="changeselect(this);">
               <option id="n_option_default" selected>신고내용</option>
               <option value="1">음란성</option>
               <option value="2">개인정보 노출</option>
               <option value="3">스팸/광고</option>
               <option value="4">악성코드 유포</option>
               <option value="5">저작권침해</option>
               <option value="6">불법성</option>
               <option value="7">부적절한 광고</option>
            </select><br>
         </div>
         <textarea id="n_text" placeholder="신고내용을 입력해주세요."></textarea>
         <div class="n_button">
            <input id="report" type="hidden" value="">
            <input id="n_notify" type="button" value="신고하기">
            <input id="n_cancel" type="button" value="취소">
         </div>
      </div>
   </div>

   <script>
         $(document).ready(function(){
        	 
        	 
        	// 첫번째 모달창 띄우기
             $(".modal_button").click(function(){
            	 
            	// 로그인 안되어있을 시 모달창 오픈
           		var modalBg_login = document.querySelector('.modal-bg-login');
           		var modalClose_login = document.querySelector('.modal-close');
           	
         			if(${loginUser.userId == null}){
         				alert("회원만 볼 수 있는 게시글 입니다. \n 로그인 후 더 많은 STAGE를 즐기세요");
         				$(modalBg_login).addClass('bg-active');
         				
         				// 모달창 닫기
                 		$(modalClose_login).click(function(){

                             $(modalBg_login).removeClass('bg-active');
                             location.href="home.do";
                         });
         				
         			} else {
	 	                var reportBno = $(this).prev().val();
	 	                var boardWriter = $(this).prev().prev().prev().val();
		               $('#reportBno').val(reportBno);
		               
		               console.log(boardWriter);
		               
		               if("${loginUser.userId}" == boardWriter){
		            	   $("#modal2").fadeIn("fast").css({"display":"block"});
		            	   
		           	   		$("#modifyBoard").on("click", function(){
		           	   			location.href="modifyBoard.bo?bNum=" + reportBno;
		           	   		});
		                	   
		                	   
		                   
		                   $("#deleteBoard").on("click", function(){
		                	   
		                	   var check = confirm("게시글을 삭제하시겠습니까?");
		           			
		        	   			if(check == true){
		        	   				location.href="deleteBoard?bNum=" + reportBno;
		        	   				alert("게시물이 삭제 되었습니다.");
		        	   				location.href="socialFeed.bo";
		        	   			} else {
		        	   				alert("취소되었습니다.");
		        	   				$("#modal2").fadeOut("fast").css({"display":"none"});
		        	   			}
		                	   
		                   });
		            	   
		            	   
		               } else {
		            	   $("#modal1").fadeIn("fast").css({"display":"block"}); 
		            	   
		            		// 신고하기 모달창 띄우기
		                   $(".report_modal_button").click(function(){
		                      $("#report_modal").fadeIn("fast").css({"display":"block"});
		                      $('#report').val(reportBno);
		                   });
		                      
		               	 // 취소 버튼 클릭시 닫힘.
		               	 $("#n_cancel").click(function(){
		               		$("#n_text").val('');
		                   $('#n_select').val('신고내용');
		                   $("#report_modal").fadeOut("fast").css({"display":"none"});
		                   
		                	});
		            	   
		               }
		               
		               
		             }
		
		             // 취소 버튼, 회색 바탕 클릭시 닫힘.
		             $(".modal_cancel, #modal1, #modal2").click(function(){
		             $("#modal1").fadeOut("fast").css({"display":"none"});
		             $("#modal2").fadeOut("fast").css({"display":"none"});
		             });
             });
      });
   </script>
  
   <script>
   function changeselect(e){
      // DB로 넘길 옵션값 가져오기
      var target = null;
      var op_val = null;
      // selected되게 onchange함수 등록 + selected된 value가져오기
      target = document.getElementById("n_select");
      op_val = target.options[target.selectedIndex].value;
   }
   
   $(document).ready(function(){
      
      
      //신고하기
      $('#n_notify').click(function(){
         var reportBno2 = $(this).prev().val(); // 신고당한 보드넘
         var report_c = $("#n_text").val(); // 신고내용 
         var report_f = "user01"; // 나중에 loginUser받으면 바꿔주기
         var op_val = $('#n_select option:selected').val();
         
         // select option이 신고내용으로 되어있을경우(== null)
         if($('#n_select option:selected').val() == "신고내용"){
            alert("신고내용을 선택해주세요.");
         } else if(report_c == ""){
            alert("신고내용을 입력해주세요.");
         } else {
            $.ajax({
               url: "notifyboard",
               type: "POST",
               data: {op_val: op_val, report_c : report_c, report_f : report_f, bno : reportBno2},
               success: function(data){
                  if(data > 0){ 
                      alert("게시물신고에 성공하셨습니다.");
                      $("#report_modal").fadeOut("fast").css({"display":"none"});
                      $("#n_text").val('');
                      $('#n_select').val('신고내용');
                      
                   } else {
                	   alert('게시물신고에 실패하였습니다.');
                   }
               }
            });
         }
      })
   })
   </script>
   <!-- 1-1. ···버튼에서의 신고하기 모달 end -->

   <!-- 2. 이미지 슬라이더 (스크립트 링크를 위에다가 하면 안먹히고 아래에다가 하니까 먹힙니다 (?) 여기다 해도 되나요 (?) -->
   <!-- ··· 버튼 사이즈 조절도 곧 수정하겠습니다. -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
   <script>
      $(document).ready(function(){
         $('.bxslider').bxSlider({
         slideWidth: 600,
         minSlides: 1
         });
         
      });
   </script>

	<!-- 거지같은 모달 -->
	<div class="modalType_modal">
	</div>
      
	<script>
		
		window.onload = function(){
			// 스크롤바
			var lastScrollTop = 0;
			
			$(".main_feed_table").hide();
			$(".main_feed_table").slice(0, 6).show();
			
			var length = $(".main_feed_table:hidden").length;
			// 스크롤 이벤트 최초 발생
			$(window).scroll(function(){
				// 현재스크롤 좌표
				var currentScrollTop = $(window).scrollTop();
				
				// 현재스크롤 좌표를 이전 스크롤 좌표로 할당
				lastScrollTop = currentScrollTop;
				
				// 현재 스크롤의 위치가(scrollTop) 화면의 보이는 위치보다 크다면
				// 즉, 현재 스크롤위치가 문서의 높이 - 화면의 높이보다 크거나 같다면 << 화면보다 스크롤닿는게 짧아서 -1을 해줌
				if(currentScrollTop >= $(document).height() - $(window).height() - 1) {
					
					// 스크롤 내릴때마다 20개씩 보여주기
					var j = 20;
					for(var i = 0; i <= length; i++){
						$(".main_feed_table").slice(i,j).show();
						j+=20;
					}
				}
				
			});
		};
			
		// 모달창 띄우기(제발제발) 거지띄우기
		// 댓글 버튼 클릭시
		$(".open_modalType").click(function(){
			
			// 로그인 안되어있을 시 모달창 오픈
       		var modalBg_login = document.querySelector('.modal-bg-login');
       		var modalClose_login = document.querySelector('.modal-close');
       	
     			if(${loginUser.userId == null}){
     				alert("회원만 볼 수 있는 게시글 입니다. \n 로그인 후 더 많은 STAGE를 즐기세요");
     				$(modalBg_login).addClass('bg-active');
     				
     				// 모달창 닫기
             		$(modalClose_login).click(function(){

                         $(modalBg_login).removeClass('bg-active');
                         location.href="home.do";
                     });
     				
     			} else {
					var target = this;
					$(".modalType_modal").fadeIn("fast").css({"display":"block"});
					var index = $(".open_modalType").index(target);//클릭한 게시글 위치인덱스 번호 받기
					var bNo = $('.only_class_bNo').eq(index).val();
		              
					$.ajax({
						type: 'post',
						data: {bNo : bNo},
						url: "<%= request.getContextPath() %>/selectBoardModal.bo",
						success: function(data){
							$.parseHTML(data); /* data가 화면 자체인데, 화면으로 넘어가는 게 아니라 String형식으로 넘어간다. 근데 이거를 dom형식으로 parse해주는 코드. */
							$('.modalType_modal').html(data);
						}
					})
     			}
		});
	
		// 제목 클릭시
		$(".open_modalType2").click(function(){
			
			// 로그인 안되어있을 시 모달창 오픈
       		var modalBg_login = document.querySelector('.modal-bg-login');
       		var modalClose_login = document.querySelector('.modal-close');
       	
     			if(${loginUser.userId == null}){
     				alert("회원만 볼 수 있는 게시글 입니다. \n 로그인 후 더 많은 STAGE를 즐기세요");
     				$(modalBg_login).addClass('bg-active');
     				
     				// 모달창 닫기
             		$(modalClose_login).click(function(){

                         $(modalBg_login).removeClass('bg-active');
                         location.href="home.do";
                     });
     				
     			} else {
			
					var target = this;
					$(".modalType_modal").fadeIn("fast").css({"display":"block"});
					var index = $(".open_modalType2").index(target);//클릭한 게시글 위치인덱스 번호 받기
					var bNo = $('.only_class_bNo').eq(index).val();
		               
					$.ajax({
						type: 'post',
						data: {bNo : bNo},
						url: "<%= request.getContextPath() %>/selectBoardModal.bo",
						success: function(data){
							console.log(data);
							$.parseHTML(data);
							$('.modalType_modal').html(data);
						}
					})
     			}
		});
	
		// 댓글 n개 보기 클릭시
		$(".open_modalType3").click(function(){
			
			// 로그인 안되어있을 시 모달창 오픈
       		var modalBg_login = document.querySelector('.modal-bg-login');
       		var modalClose_login = document.querySelector('.modal-close');
       	
     			if(${loginUser.userId == null}){
     				alert("회원만 볼 수 있는 게시글 입니다. \n 로그인 후 더 많은 STAGE를 즐기세요");
     				$(modalBg_login).addClass('bg-active');
     				
     				// 모달창 닫기
             		$(modalClose_login).click(function(){

                         $(modalBg_login).removeClass('bg-active');
                         location.href="home.do";
                     });
     				
     			} else {
			
					var target = this;
					$(".modalType_modal").fadeIn("fast").css({"display":"block"});
					var index = $(".open_modalType3").index(target);//클릭한 게시글 위치인덱스 번호 받기
					var bNo = $('.only_class_bNo').eq(index).val();
		               
					$.ajax({
						type: 'post',
						data: {bNo : bNo},
						url: "<%= request.getContextPath() %>/selectBoardModal.bo",
						success: function(data){
							$.parseHTML(data);
							$('.modalType_modal').html(data);
						}
					});
     			}
		});
      
	</script>

	<script>
		$(function(){
			
		// 좋아요
         // 출력되는 좋아요된 번호
         var likeNumList = new Array();
         <c:forEach items="${likeNoList}" var="likeBno">
         likeNumList.push("${likeBno}");
         </c:forEach>
	     
      	// 출력되는 게시글의 번호
         var boardList = new Array();
         <c:forEach items="${list}" var="bNo">
         boardList.push("${bNo.board_number}");
         </c:forEach>
         
        	var L = 0;
        	for(var i = 0; i < boardList.length; i++){
        		var boardNo = boardList[i];
        		do{
        			var likeNum = likeNumList[L];
        			
        			if(likeNum == boardNo){
                  		$(".likeIcon" + boardNo).attr("src","resources/images/8분음표.png");
                	}
        			
        			L++
        		}while(L < likeNumList.length);
        		
        		// 다른값들도 비교해야하기때문에
       			if(i < boardList.length){
       				L = 0;
       			}
        	}      
	      
        	
       	// 좋아요 수정부분끝

         /* 좋아요 눌렀을 떄 */
         $('.like_btn').click(function(e){
        	 
        	 // 클릭한 target이 무엇인지 알수있는 log
        	 // console.log(e.target.);
        	 
        	 $(this).css("cursor","porinter");
           
            //보드 넘버 받아오기
            var bNo = $(this).prev('input').val();
            var alarm_sender = "${loginUser.userId}";
            var alarm_sender_nickName = "${loginUser.nickName}";
            var alarm_receiver = $(this).prev().prev().prev('input').val();
            var alarm_receiver_nickName = $(this).prev().prev('input').val();            
            
            //하얀음표를 눌렀다면... 좋아요 하기
            if($('.likeIcon'+bNo).attr('src') == "resources/images/unlike.png"){
		         //검은 음표로 바꾸기
		         $('.likeIcon'+bNo).attr('src','resources/images/8분음표.png');
		         //좋아요 하기
		         $.ajax({
                  url: "<%= request.getContextPath() %>/socialLike.bo",
                  data : {bNo:bNo},
                  success: function(data){
                     $('#'+bNo+'_like_count').html(data);
                     $('#md-likeCount').html(data);
                     
 		 	 	 	var AlarmData = {
		 	 	 			"alarm_sender" : alarm_sender,
		 	 	 			"alarm_receiver" : alarm_receiver,
		 	 	 			"alarm_type" : "Like",
		 	 	 			"alarm_title" : "<b>"+alarm_sender_nickName+"</b>님이 회원님의 게시글을 좋아합니다.",
		 	 	 			"alarm_content" : "<b>"+alarm_sender_nickName+"</b>님이 회원님의 게시글을 좋아합니다.",
		 	 	 			"board_no" : bNo
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
			 	 	 				let socketMsg = "Like," + alarm_sender + "," + alarm_receiver + "," + bNo; // 소켓에 보낼 메세지
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
                  }
               })
               
               return;
                              
            } else if($('.likeIcon'+bNo).attr('src') == "resources/images/8분음표.png"){
            	/* 검은 음표를 눌렀다면..좋아요 취소 */
               //하얀음표로 바꾸기
               $('.likeIcon'+bNo).attr('src','resources/images/unlike.png');
               
               //좋아요 취소
               $.ajax({
                  url: "<%= request.getContextPath() %>/socialDeleteLike.bo",
                  data : {bNo:bNo},
                  success: function(data){
                     $('#'+bNo+'_like_count').html(data);
                     $('#md-likeCount').text(data);
                     
  		 	 	 	var AlarmData = {
		 	 	 			"alarm_sender" : alarm_sender,
		 	 	 			"alarm_receiver" : alarm_receiver,
		 	 	 			"alarm_type" : "Like",
		 	 	 			"board_no" : bNo
		 	 	 	};

		 	 	 	// 알림 DB 삭제
		 	 	 	$.ajax({
		 	 	 		type : 'post',
		 	 	 		url : 'deleteAlarm.ws',
		 	 	 		data : JSON.stringify(AlarmData),
		 	 	 		contentType: "application/json; charset=utf-8",
		 	 	 		dataType : 'text',
		 	 	 		success : function(data){
		 	 	 			if(data == 1){
		 	 	 				console.log("알림 삭제에 성공했습니다.");
			 	 	 		}else if(data == 0){
			 	 	 			console.log("알람 삭제에 실패했습니다");
		 	 	 			}

		 	 	 		},
		 	 	 		error : function(err){
		 	 	 			console.log(err); 
		 	 	 		}

					}); 
                  }
               })
               return;
            } 
            
         })
         
      })
   </script>
   
   <script>
         /* 보관함 */
      $(function(){
    	  
    	  // 받아온 보관함리스트
          var saveList = new Array();
          <c:forEach items="${ saveBoNos }" var="saveBno">
          	saveList.push("${ saveBno }");
          </c:forEach>
          
         
      	 // 출력되는 게시글의 번호
         var boardList = new Array();
         <c:forEach items="${list}" var="bNo">
         	boardList.push("${bNo.board_number}");
         </c:forEach>
         
         var L = 0;
     	for(var i = 0; i < boardList.length; i++){
     		var boardNo = boardList[i];
     		do{
     			var saveNum = saveList[L];
     			
     			if(saveNum == boardNo){
               		$(".keepIcon" + boardNo).attr("src","resources/images/보관함버튼.png");
               	}
     			
     			L++
     		}while(L < saveList.length);
     		
     		// 다른값들도 비교해야하기때문에
    			if(i < boardList.length){
    				L = 0;
    			}
     		}     
         
         
         
         /* 보관함 눌렀을 떄 */
         $('.keep_btn').click(function(){
            //보드 넘버 받아오기
            var bNo = $(this).prev('input').val();
            
            $(this).css("cursor","pointer");
            
            //하얀책갈피를 눌렀다면... 북마크 하기
            if($('.keepIcon'+bNo).attr('src') == "resources/images/unkeep.png"){
               //검은 책갈피로 바꾸기
               $('.keepIcon'+bNo).attr('src','resources/images/보관함버튼.png');
               //북마크 하기
               $.ajax({
                  url: "<%= request.getContextPath() %>/socialKeep.bo",
                  data : {bNo:bNo},
                  success: function(data){
                	  
                  }
               })
               
               return;
            } 
            
//             /* 검은 책갈피를 눌렀다면..보관함 취소 */
            if($('.keepIcon'+bNo).attr('src') == "resources/images/보관함버튼.png"){
               
               //하얀 책갈피로  바꾸기
               $('.keepIcon'+bNo).attr('src','resources/images/unkeep.png');
               
               //보관함 취소
               $.ajax({
                  url: "<%= request.getContextPath() %>/socialDeleteKeep.bo",
                  data : {bNo:bNo},
                  success: function(data){
                  }
               })
               return;
            }
            
          })
         
      })
   </script>
   
   









	<!-- 댓글 -->
	<script>
		/* 댓글달기 */
		function insertreply(e){
			var reply_in = $(e).prev();
			var index = $('.reply_in').index(reply_in);
			
			var alarm_receiver = $(".only_class_bWriter").eq(index).val();
			var alarm_receiver_nickName = $(".only_class_bWriter_nickName").eq(index).val();
			
			var replycontent = $(".comment_write_box .reply_in").eq(index).val();
			var replywriter = "${loginUser.userId}"; 
			var replywriter_nickName = "${loginUser.nickName}"; 
			var boardnum = $(".boardNum").eq(index).val();
	      
			console.log("댓글달기 확인" + boardnum);
	      
			if(replycontent == ""){
				alert("내용을 입력해 주세요");
				$(".reply_in").eq(index).focus();
			} else {
				$.ajax({
					type: "POST",
					url: "insertreply",
					data: {replycontent : replycontent, replywriter : replywriter, boardnum : boardnum },
					success: function(data){
						
						console.log("댓글 확인 : " + data);

			 	 	 	var AlarmData = {
			 	 	 			"alarm_sender" : replywriter,
			 	 	 			"alarm_receiver" : alarm_receiver,
			 	 	 			"alarm_type" : "BoardReply",
			 	 	 			"alarm_title" : "<b>"+replywriter_nickName+"</b>님이 회원님의 게시글에 댓글을 남겼습니다: "+ replycontent,
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
				 	 	 				let socketMsg = "BoardReply," + replywriter + "," + alarm_receiver + "," + boardnum; // 소켓에 보낼 메세지
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

		/* 부모댓글 삭제하기 */
		/* 삭제버튼 */
		$(document).ready(function(){
			$('.fd_comment_delete').click(e=>{
				
	            var bno = $(e.target).prev().val();
	            var parent_num = $(e.target).prev().prev().val();
	            
	            
	            var check = confirm("댓글을 삭제하겠습니까?");
	            
	             if(check == true){
	                $.ajax({
	                   url: "deleteParentReply",
	                   data: {bno : bno , parent_num : parent_num},
	                   success: function(data){
	                     
	                      if(data > 0) {
	                    	  $(e.target).parent().parent().parent().remove();
	                         alert("댓글을 삭제했습니다.");
	                         
	                         
	                      } else {
	                         alert("댓글 삭제에 실패하였습니다.");
	                      }
	                   }
	                });
	             } else {
	                alert("취소했습니다.");
	             }
	            
	          });
		});
		
		// 더보기 버튼
		$(".feedType_content_div").css({"white-space":"nowrap", "text-overflow":"ellipsis", "height":"26px"});
		$(".moreContent").on("click", function(){
			var content = $(this).prev();
			
			
			if($(content).hasClass("active")){
				$(content).css({"height":"26px", "text-overflow":"ellipsis", "white-space":"nowrap"});
				$(content).removeClass("active");
			} else {
				$(content).addClass("active");
				$(content).css({"height":"auto", "white-space":"inherit", "text-overflow":"none"});
				
			}
		});
		
		$(".nickname_link").on("click", function(){
			var targetId = $(this).next().val();
			
			var path = "goYouStage.st?targetId=" + targetId;
			location.href = path;
		});
   </script>
	
</body>
</html>