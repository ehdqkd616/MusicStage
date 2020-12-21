<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("replace", "\n"); %>
<div class="modalType_content">
	<input type="hidden" class="mdBoardNum" value="${ board.board_number }">
	<table class="main_modal_table">
		<tr>
			<td rowspan=4 class="modalType_img_td">	
					
				<!-- 파일리스트가 하나일 경우 >> 썸네일은 무조건 들어가야하기때문에 다른파일들을 안넣었다면 썸네일만 들어가있을것 -->
				<c:if test="${ fn:length(board.boardFile) == 1 }">
					<c:forEach items="${ board.boardFile }" var="file">
						<c:if test="${ file.file_thumbnail eq '1'.charAt(0) }">
						<c:if test="${ file.file_change_name eq '썸네일-기본이미지.gif' }">
							<div style="width: 500px; height: 500px; overflow:hidden;">
								<img class="modalOnlyThumbnail"src="<%= request.getContextPath() %>/resources/images/썸네일-기본이미지.gif">
							</div>
							</c:if>
							<c:if test="${ file.file_change_name ne '썸네일-기본이미지.gif' }">
							<div style="width: 500px; height: 500px; overflow:hidden;">
								<img class="modalOnlyThumbnail" src="<%= request.getContextPath() %>/resources/boardImageFile/${ file.file_change_name }">
							</div>
						</c:if>
						</c:if>
					</c:forEach>
				</c:if>
				
				
				<c:if test="${ fn:length(board.boardFile) >= 2 }">
				<div class="slideshow-container">			
					<c:forEach items="${ board.boardFile }" var="f" varStatus="status"><!-- varStatus : 상태용변수 -->
						<%-- <c:if test="${status.index eq 0}"> --%>
							<div class="mySlides fade" style="display: block;">
								<div class="numbertext" style="color: black;"><c:out value="${ status.index+1 }" /> / <c:out value="${board.boardFile.size() }" /></div>
								<c:if test="${f.file_type eq 1}">
									<c:if test="${ f.file_change_name ne '썸네일-기본이미지.gif' }">
									<div style="width: 500px; height: 500px; overflow:hidden; position: relative;" >
										<img class="modalImage" src="<%= request.getContextPath() %>/resources/boardImageFile/${f.file_change_name}">
									</div>
									</c:if>
									<c:if test="${ f.file_change_name eq '썸네일-기본이미지.gif' }">
									<div style="width: 500px; height: 500px; overflow:hidden; position: relative;" >
										<img class="modalImage" src="<%= request.getContextPath() %>/resources/images/썸네일-기본이미지.gif">
									</div>
									</c:if>
								</c:if>
								<c:if test="${f.file_type eq 2}">
									<div style="width: 500px; height: 500px; overflow:hidden; position: relative;">
										<video class="md_list_video" controls src="<%= request.getContextPath() %>/resources/boardVideoFile/${f.file_change_name}"></video>
									</div>
								</c:if>
								<c:if test="${f.file_type eq 3}">
									<div style="width: 500px; height: 500px; overflow:hidden; position: relative;"><audio controls src="<%= request.getContextPath() %>/resources/boardAudioFile/${f.file_change_name}" 
										style="background-image: url('resources/images/audioBackground.gif'); background-size: 500px;"></audio></div>
								</c:if>
							</div>
					</c:forEach>
					<a class="prev" onclick="plusSlides(-1)"><img src="resources/images/controls_prev.png"></a>
					<a class="next" onclick="plusSlides(1)"><img src="resources/images/controls_next.png"></a>
				</div>
				</c:if>
			</td>
			
			
			<td class="modalType_profile_td">
				<!-- 프로필 사진이 없을 경우 -->
				<c:if test="${ empty board.member.profile_pic }">
					<img id="md-profileImg" src="<%= request.getContextPath() %>/resources/images/profileDefault.png">&nbsp;
				</c:if>
				<!-- 프로필 사진이 있을 경우 -->
				<c:if test="${ !empty board.member.profile_pic }">
					<img id="md-profileImg" src="<%= request.getContextPath() %>/resources/userProfile/${board.b_writer}/${board.member.profile_pic}">&nbsp;
				</c:if>
				
				<a href="" class="modalType_nickname_link" id="md-writer"><c:out value="${board.member.nickName}" /></a>
				<input type="hidden" value="${board.b_writer}">
				<button class="modalType_modal_button">...</button>
			</td>
		</tr>
		<tr>
			<td class="modalType_content_td">
				<!-- 수정해야함. scroll + 댓글들. -->
				<div class="modalType_title_div">
					<span id="md-title"><c:out value="${board.board_title}" /></span>
				</div>
				<div class="modalType_content_div" id="md-content">
					${ fn:replace(board.board_content, replace, "<br/>") }
				</div>
                  
				<div class="modal_button_div">
					<button class="" onclick="location.href='<%= request.getContextPath() %>/bDetail.bo?bNum='+${ board.board_number}" style="cursor: pointer;">상세보기</button>
				</div>
			</td>
		</tr>
		<tr>
			<td class="modalType_icon_td">
				<div class="forscroll">
				<c:forEach items="${ board.reply }" var="reply">
				<div>
				<div class="md_comment_box">
					<table class="md_parent_comment_box">
						<tr>
							<td class="md_comment_writer">
								<div class="md_parent_writer">${ reply.r_writer }</div>
							</td>
							<td class="md_commnent_content">
								<%-- ${ reply.reply_content } --%>
								<c:out value="${reply.reply_content }"/>
								<c:if test="${loginUser.userId eq reply.r_writer }">
									<input type="hidden" value="${ reply.reply_number }"/>
									<input type="hidden" value="${ board.board_number }"/>
									<input class="fd_comment_delete" id="fd_parent_delete" type="button" value="삭제">
								</c:if>
							</td>
							
						</tr>
					</table>
                     
					<div class="md_comment_plus_div">
						<span>- 댓글</span><span class="md_child_comment_count">${ reply.child_reply.size() }</span>개 <span>더보기</span>
						<input type="hidden" value=""><!-- 부모댓글번호 -->
					</div>
				</div>
                  
				<div class="md_children_box" style="display: none;">
					<div class="md_child_comment_write_box">
						<input type="text" class="child_reply_in" placeholder="댓글 달기 ...">
						<input type="hidden" value="${ reply.r_writer_nickName }"/>
						<input type="hidden" value="${ reply.r_writer }"/>
						<input type="hidden" value="${ reply.reply_number }">
						<input type="hidden" value="${ board.board_number }" />
						<input type="submit" class="child_insertreply" value="등록">
					</div>
                     
							<c:forEach items="${reply.child_reply }" var="child_reply">
								<table class="md_child_comment_box">
									<tr>
										<td class="md_comment_writer">
											<div class="md_parent_writer">${child_reply.r_writer }</div>
										</td>
										<td class="md_commnent_content">
											
											<%-- ${child_reply.reply_content } --%>
											<c:out value="${child_reply.reply_content }"/>
											<c:if test="${loginUser.userId eq child_reply.r_writer }">
											<input type="hidden" value="${ child_reply.reply_number }"/>
											<input type="hidden" id="parentNum" value="${ reply.reply_number }"/>
											<input type="hidden" value="${ board.board_number }"/>
											<input class="md_comment_delete" id="md_parent_delete" type="button" value="삭제">
											</c:if>	
										</td>
									</tr>
								</table>
							</c:forEach>
						</div>
				</div>
                </c:forEach>
                </div>
					<div class="icon_div">
						<input id="modalType_like_bNo" type="hidden" value="${ board.board_number }">
						<button style="color: none; background: none;">
							<c:if test="${ like == null }">
							<img id="modalType_like_icon" class="modalType_icon likeIcon" src="<%= request.getContextPath() %>/resources/images/unlike.png">
							</c:if>
							<c:if test="${ like != null }">
							<img id="modalType_like_icon" class="modalType_icon likeIcon" src="<%= request.getContextPath() %>/resources/images/8분음표.png">
							</c:if>
						</button>&nbsp;&nbsp;
						<img class="modalType_icon" src="resources/images/댓글버튼.png">&nbsp;&nbsp;
						<img class="modalType_icon" src="resources/images/메세기.png">
						
						
						<input id="modalType_keep_bNo" type="hidden" value="${ board.board_number }">
						<button style="float: right; color: none; background: none;">
							<c:if test="${ save == null }">
							<img id="modalType_keep_icon" class="modalType_icon keepIcon" src="<%= request.getContextPath() %>/resources/images/unkeep.png">
							</c:if>
							<c:if test="${ save != null }">
							<img id="modalType_keep_icon" class="modalType_icon keepIcon" src="<%= request.getContextPath() %>/resources/images/보관함버튼.png">
							</c:if>
						</button>
					</div>
					<!-- <br> -->

					<div class="like_div">
						<span> 좋아요 <span id="md-likeCount">${ likeCount }</span>개</span>
					</div>
					<!-- <br> -->
			</td>
		</tr>
		<tr>   
			<td class="modalType_comment_input_td">
				<div class="md_comment_write_box">
					<input type="text" id="reply_in" placeholder="댓글 입력 ...">
					<input type="hidden" value="${ board.board_number }"/>
					<input type="button" id="insertreply" value="등록">
				</div>
			</td>
		</tr>
	</table>
</div>

<div class="modalType_modal_layer"></div>

<!-- 3-1. modalPage ···버튼 눌렀을 때 나오는 모달 start -->
   <div id="modalType_plus_modal">
      <!-- 작성자가 아닌 다른 사람이 게시글을 볼 때 -->
      <c:if test="${ loginUser.userId ne board.b_writer }">
      <div id="modalType_my_plus_list">
         <div style="border-bottom: 1px solid #DBDBDB"><button class="modalType_report_modal_button">신고</button></div>
         <div style="border-bottom: 1px solid #DBDBDB"><button>링크 복사</button></div>
         <div><button class="modalType_modal_cancel">취소</button></div>
      </div>
      </c:if>
      
      <!-- 작성자가 게시글을 볼 때 -->
      <c:if test="${ loginUser.userId eq board.b_writer }">
      <div id="modalType_my_plus_list">   
        <div style="border-bottom: 1px solid #DBDBDB"><button>수정</button></div>
        <div style="border-bottom: 1px solid #DBDBDB"><button>삭제</button></div>
        <div><button class="modalType_modal_cancel">취소</button></div>
        </div>
        </c:if>
   </div>
   <!-- 3-1. modalPage ···버튼 눌렀을 때 나오는 모달 end -->
   
   <!-- 3-2. modalType의 ···버튼에서의 신고하기 모달 start -->
   <div id="report_modal">
      <div id="n_area">
         <div id="n_letter">
            <!-- 신고하기 <br> -->
            <select id="n_select">
               <option>신고내용</option>
               <option value="">음란성</option>
               <option value="">개인정보 노출</option>
               <option value="">스팸/광고</option>
               <option value="">악성코드 유포</option>
               <option value="">저작권침해</option>
               <option value="">불법성</option>
               <option value="">부적절한 광고</option>
            </select><br>
         </div>
         <textarea id="n_text" placeholder="신고내용을 입력해주세요."></textarea>
         <div class="n_button">
            <input id="n_notify" type="button" value="신고하기">
            <input id="n_cancel" type="button" value="취소">
         </div>
      </div>
   </div>

   <script>
   
   /* $(document).ready(function(){ */
	// 모달창 띄우기
	 $(".modalType_modal_button").click(function(){
   	 $("#modalType_plus_modal").fadeIn("fast").css({"display":"block"});
    	});
	
	
	// 취소 버튼, 회색 바탕 클릭시 닫힘.
	$(".modalType_modal_cancel, #modalType_plus_modal").click(function(){
	$("#modalType_plus_modal").fadeOut("fast").css({"display":"none"});
	});
	   			
	   			
	// 신고하기 모달창 띄우기
	$(".modalType_report_modal_button").click(function(){
	$("#report_modal").fadeIn("fast").css({"display":"block"});
	});
	        					
	// 취소 버튼 클릭시 닫힘.
	$("#n_cancel").click(function(){
	$("#report_modal").fadeOut("fast").css({"display":"none"});
	});
 /* }); */
   
   
 	//modalPage.jsp에서의 이미지 슬라이더
	var slideIndex = 1;
	showSlides(slideIndex);
	
	console.log(showSlides);
	  
	function plusSlides(n) {
		showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
		showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
		var i;
	
	var slides = document.getElementsByClassName("mySlides");
	
	if (n > slides.length) {slideIndex = 1}    
	if (n < 1) {slideIndex = slides.length}
	for (i = 0; i < slides.length; i++) {
		slides[i].style.display = "none";  
	}
	
	slides[slideIndex-1].style.display = "block";  
	}
   </script>
   
   <script>
   /* 좋아요 눌렀을 떄 */
   $('.likeIcon').click(function(){
      
     
      //보드 넘버 받아오기
      var bNo = $(this).parent().prev('input').val();
      var alarm_sender = "${loginUser.userId}";
      var alarm_sender_nickName = "${loginUser.nickName}";
      var alarm_receiver = "${board.b_writer}"
      var alarm_receiver_nickName = "${board.member.nickName}"; 
      
     //클래스 네임 추가
     $(this).addClass('likeIcon'+bNo);
      
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
                        
      } 
      /* 검은 음표를 눌렀다면..좋아요 취소 */
      else if($('.likeIcon'+bNo).attr('src') == "resources/images/8분음표.png"){
         
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
   
   
   /* 보관함 버튼 눌렀을때  */
   $('.keepIcon').click(function(){
      
     
      //보드 넘버 받아오기
      var bNo = $(this).parent().prev('input').val();
      
     //클래스 네임 추가
     $(this).addClass('keepIcon'+bNo);
      
      //하얀마크를 눌렀다면...
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
      /* 검은 음표를 눌렀다면..좋아요 취소 */
      else if($('.keepIcon'+bNo).attr('src') == "resources/images/보관함버튼.png"){
          
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
   </script>
   
   <script>
   	$(function(){
   	// 회색 배경 클릭시 닫힘.
        $(".modalType_modal_layer").click(function(){
           $(".modalType_modal").fadeOut("fast").css({"display":"none"});
           location.reload();
         });
   	})
   </script>
   
   <!-- 댓글 작성 -->
   <script>
   
   	$(".md_comment_plus_div").on("click", function(){
   		
   		var childBox = $(this).parent().next();
   		
   		if(childBox.is(":visible")){
   			childBox.slideUp();
   		} else {
   			childBox.slideDown();
   		}
   		
   	});
   	
   	
   	 /* 댓글달기 */
   		$("#insertreply").on("click", function(){
   			var replycontent = $(".md_comment_write_box #reply_in").val();
   			var boardnum = $(this).prev("input[type=hidden]").val(); // 게시글번호
   			var boardWriter = "${board.b_writer}"; // 게시글 작성자
   			var boardNick = "${board.member.nickName}"; // 게시글작성자닉네임
   			var alarm_sender = "${loginUser.userId}";
   			var alarm_sender_nickName = "${loginUser.nickName}";
   			
   			console.log(boardnum);
   			
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
   			
   		})
   		
   
   		 /* 대댓글달기 (도전중) */
   		$(".child_insertreply").on("click", function(){
   			var cReplyContent = $(this).prev().prev().prev().prev().prev().val();
   			var board_num = $(this).prev().val(); // 게시글번호
   			var boardWriter = "${board.b_writer}"; //게시글작성자ID
   			var boardNick = "${board.member.nickName}"; // 게시글작성자닉네임
   			var alarm_sender = "${loginUser.userId}";
   			var alarm_sender_nickName = "${loginUser.nickName}";
   			
   			var parent_num = $(this).prev().prev().val(); //부모댓글번호
   			var replyWriter = $(this).prev().prev().prev().val(); // 댓글작성자ID
   			var replyNick = $(this).prev().prev().prev().prev().val();// 댓글작성자닉네임
   			
   			console.log("게시글번호 : " + board_num);
   			console.log("게시글작성자ID : " + boardWriter);
   			console.log("게시글작성자Nick : " + boardNick);
   			
   			console.log("부모댓글번호 : " + parent_num);
   			console.log("댓글작성자ID : " + replyWriter);
   			console.log("댓글작성자NCIK : " + replyNick);
   			
   			var child_div = $(this).parent().parent();
   			
   			
   			if(cReplyContent == ""){
   				alert("내용을 입력해 주세요");
   				/* document.getElementByClass("child_reply_in").focus(); */
   			 } else {
   				$.ajax({
   					type: "POST",
					url : "childreplyInsert",
					data : {cReplyContent : cReplyContent, parent_num : parent_num, board_num : board_num},
					dataType: "JSON",
					success : function(data){
						
   						alert("댓글등록완료");
   						
   						var childTable = document.createElement("table");
   						$(childTable).addClass("md_child_comment_box");
   						
			 	 	 	var AlarmData = {
			 	 	 			"alarm_sender" : alarm_sender,
			 	 	 			"alarm_receiver" : boardWriter,
			 	 	 			"alarm_type" : "BoardReply",
			 	 	 			"alarm_title" : "<b>"+alarm_sender_nickName+"</b>님이 회원님의 게시글에 댓글을 남겼습니다: "+ cReplyContent,
			 	 	 			"alarm_content" : cReplyContent,
			 	 	 			"board_no" : board_num
			 	 	 	};

			 	 	 	//댓글 알림 DB저장
			 	 	 	$.ajax({
			 	 	 		type : 'post',
			 	 	 		url : 'saveAlarm.ws',
			 	 	 		data : JSON.stringify(AlarmData),
			 	 	 		contentType: "application/json; charset=utf-8",
			 	 	 		dataType : 'text',
			 	 	 		success : function(data){
			 	 	 			if(data == 1){
				 	 	 			if(socket){
				 	 	 				let socketMsg = "BoardReply," + alarm_sender + "," + boardWriter + "," + board_num; // 소켓에 보낼 메세지
				 	 	 				console.log("msgmsg : " + socketMsg); // 소켓 메세지 확인 콘솔
				 	 	 				socket.send(socketMsg); // 소켓에 메세지를 보낸다.
				 	 	 				
							 	 	 	var AlarmData = {
							 	 	 			"alarm_sender" : alarm_sender,
							 	 	 			"alarm_receiver" : replyWriter,
							 	 	 			"alarm_type" : "ReplyReply",
							 	 	 			"alarm_title" : "<b>"+alarm_sender_nickName+"</b>님이 "+"<b>"+boardNick+"</b>"+"님의 게시글에 있는 회원님의 댓글에 답글을 남겼습니다: "+ cReplyContent,
							 	 	 			"alarm_content" : cReplyContent,
							 	 	 			"board_no" : board_num,
							 	 	 			"reply_no" : parent_num
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
								 	 	 				let socketMsg = "ReplyReply," + alarm_sender + "," + replyWriter + "," + board_num; // 소켓에 보낼 메세지
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
   						
   						$(".child_reply_in").val("");
   						
   							
   							var child_writer = data[0].r_writer;
   							var child_content = data[0].reply_content;
   							var child_number = data[0].reply_number;
   							var child_parentNum = data[0].parent_number;
   							var child_boardNum = data[0].ref_board_number;
   							
   							
   							// 요소시작
   	   						var tr = document.createElement("tr");
   	   						var writerTd = document.createElement("td");
   	   						$(writerTd).addClass("md_comment_writer");
   	   						var writerDiv = document.createElement("div");
   	   						$(writerDiv).addClass("md_parent_writer");
   	   						$(writerDiv).html(child_writer);
   	   						$(writerTd).append(writerDiv);
   	   						
   	   						// 2번째td
   	   						var contentTd = document.createElement("td");
   	   						$(contentTd).addClass("md_commnent_content");
   	   						
   	   						// 요소들
   	   						var inputChildNum = document.createElement("input");
   	   						$(inputChildNum).val(child_number).attr("type","hidden");
   	   						var inputParentNum = document.createElement("input");
   	   						$(inputParentNum).val(child_parentNum).attr("type","hidden");
   	   						var intputBoardNum = document.createElement("input");
   	   						$(intputBoardNum).val(child_boardNum).attr("type","hidden");
   	   						var deleteButton = document.createElement("input");
   	   						$(deleteButton).attr({"type":"button", "value":"삭제", "id":"md_parent_delete"});
   	   						$(deleteButton).addClass("comment_delete");
   	   						
   	   						$(contentTd).append(child_content);
   	   						$(contentTd).append(inputChildNum);
   	   						$(contentTd).append(inputParentNum);
   	   						$(contentTd).append(intputBoardNum);
   	   						$(contentTd).append(deleteButton);
   	   						
   	   						$(tr).append(writerTd);
   	   						$(tr).append(contentTd);
   	   						
   	   						$(childTable).append(tr);
   	   						
   							$(child_div).append(childTable);
   							
   							$(".md_child_comment_count").html(data[0].childCount);
   							
   						
   					}	
   				});
   			}
   			
   		});
  
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
	                    	  /* 부모댓글 */
	                    	  $(e.target).parent().parent().parent().parent().parent().parent().remove();
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
   		
   		/* 대댓글 삭제하기 */
		/* 삭제버튼 */
		$(document).ready(function(){
			$('.md_comment_delete').click(e=>{
				var t = $(e.target).parent().parent().parent().parent().prev();
				var i = $('.md_child_comment_write_box').index(t);
				var rc = parseInt($('.md_child_comment_count').eq(i).text());
	            var child_num = $(e.target).prev().prev().prev().val();
	            var parent_num = $(e.target).prev().prev().val();
	            console.log(t);
	            console.log(i);
	            console.log(rc);
	            var check = confirm("댓글을 삭제하겠습니까?");
	            
	             if(check == true){
	                $.ajax({
	                   url: "deleteChildReply",
	                   data: {child_num : child_num , parent_num : parent_num},
	                   success: function(data){
	                     
	                      
	                    	  console.log("data" + data);
	                    	  $(e.target).parent().parent().parent().parent().remove();
	                    	  $('.md_child_comment_count').eq(i).text(rc-1);
	                         alert("댓글을 삭제했습니다.");
	                      
	                   },
	                   error: function(){
	                	   alert('댓글 삭제에 실패하였습니다.');
	                   }
	                });
	             } else {
	                alert("취소했습니다.");
	             }
	            
	          });
		});
   		
		$(".modalType_nickname_link").on("click", function(){
			var targetId = $(this).next().val();
			
			var path = "goYouStage.st?targetId=" + targetId;
			location.href = path;
		});
   </script>
   

