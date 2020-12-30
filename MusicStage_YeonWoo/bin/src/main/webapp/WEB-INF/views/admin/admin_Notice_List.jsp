<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>공지사항목록</title>
<style>
	header{z-index: 1; height:50px; position: fixed;}
	
	body{font-family: 'Nanum Gothic', sans-serif; background: #FAFAFA !important;}
	
	
    #centerWrap{margin: auto; width: 1100px; height: auto;}
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
	
	
	/* 카테고리버튼 */
	#m_category{ margin-top: 80px; }
	#m_category input[type=button] { width: 75px; height: 30px; margin-left: 5px; border: 1px solid #DBDBDB; border-radius: 4px; }
	#m_category input[type=button]:hover{ background: gray; color: white; font-weight: bold; }
	/* 카테고리 선택 시 */
	#notice{ background: gray; color: white; font-weight: bold; }
	
	/* 글쓰기 버튼 */
	#m_button{ margin-top: 50px; }
	#m_button input[type=button]{ height: 30px; border: 1px solid #DBDBDB; border-radius: 4px;
								  font-size: 13px; font-weight: bold; }
	#m_button input[type=button]:hover{ background: gray; color: white; font-weight: bold; }
	
	#n_delete{ width: 50px; margin-right: 5px; }
	#n_write{ width: 60px; margin-left: 920px; }
	
	
	/* 공지전체div */
	#m_content { margin-top: 10px; }
	
	
	
	
	
	
	/* 공지목록 */
	#m_content table{ width: 1050px; margin-top: 10px; border-bottom: 3px solid #DBDBDB; table-layout: fixed; }
	#table{ border-top: 3px solid #DBDBDB; border-bottom: 3px solid #DBDBDB;}
	#table th{ height: 40px; font-size: 17px; }
	#t_num{ width: 80px; }
	#t_title{ width: 630px; }
	#t_date{ width: 150px; }
	
	.content td{ height: 40px; font-size: 14px; text-align: center; border-bottom: 1px solid #DBDBDB; }
	.content:hover{ background: #DBDBDB; font-weight: bold; }
	
	.n_title{ text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
	
	/* 페이징 */
	#paging_area{ vertical-align: middle; margin-top: 50px; }
	#paging { list-style: none; line-height: 30px; }
	.p_li{ display: inline-block; border: 1px solid #DBDBDB; width: 30px; height: 30px;
			text-align: center; border-radius: 4px; font-size: 15px; margin-right: 5px; }
	.p_li:hover{ background: #DBDBDB; font-weight: bold; }
	
	
	
	/* 모달창 */
	.modal_layer { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5);
	 				z-index:-1; }
	/* 모달창 공지글쓰기 */
	#modal1 { position:relative; width:100%; height:100%; z-index:1; display:none; }
	#add_notice{ width: 700px; height: 370px; border: 1px solid #DBDBDB; 
				border-radius: 8px; padding: 20px 15px 15px 15px; background: white;
				position: fixed; left: 450px; bottom: 195px;}
	#modal_title{ font-size: 17px; font-weight: bold; margin-bottom: 20px; }
	.a_object{ margin-top: 10px; margin-bottom: 10px; }
	/* 공지사항제목 */
	#a_title{ font-size: 14px; font-weight: bold; padding-right: 10px; vertical-align: middle;}
	#title_write{ width: 615px; text-indent: 10px; vertical-align: middle;}
	/* 공지사항내용 */
	#a_content{ font-size: 14px; font-weight: bold; padding-right: 10px; position: relative; top: -100px;}
	#content_write{width: 615px; height: 220px; resize: none; text-indent: 10px; }
	/* 버튼 */
	#n_button1{ width: 60px; height: 25px; border: none; background: #521110; color: white; border-radius: 4px; }
	#n_button2{ width: 45px; height: 25px; border: 1px solid #DBDBDB; border-radius: 4px; }
	#n_button1, #n_button2{cursor: pointer;}
	
	
	
	
	
	
	/* 모달창 공지보기 */
	#modal2 { position:relative; width:100%; height:100%; z-index:1; display:none; }
	#see_notice{ width: 700px; min-height: 350px; border: 1px solid #DBDBDB; border-radius: 8px;
				padding: 20px 15px 15px 15px; background: white; position: fixed; left: 450px; bottom: 195px;}
	.s_object{ margin-top: 10px; margin-bottom: 10px; }
	/* 공지사항 등록시간 */
 	#enroll_date {margin-top: 10px; margin-bottom: 10px; align: right;}
	#enroll_date_p {margin-right: 20px; text-align: right;}
	/* 공지사항제목 */
	#s_title{ font-size: 14px; font-weight: bold; padding-right: 10px; vertical-align: middle;}
	#notice_title{ width: 615px; text-indent: 10px; background: none; border: none; vertical-align: middle;}
	/* 공지사항내용 */
	#s_content{ font-size: 14px; font-weight: bold; padding-right: 10px; position: relative; top: 0px;}
	#content_see{width: 615px; height: 220px; padding-top: 10px; display: inline-block; text-indent: 10px; }
	/* 버튼 */
	#modal_modify{ width: 40px; height: 25px; border: 1px solid #DBDBDB; border-radius: 4px; }
	#modal_delete{ width: 40px; height: 25px; border: 1px solid #DBDBDB; border-radius: 4px; }
	#b_list{ width: 60px; height: 25px; border: none; background:#521110; color: white; border-radius: 4px; }
	
	/* 모달창 공지수정 */
	#modal3 { position:relative; width:100%; height:100%; z-index:1; display:none; }
	#see_notice2{ width: 700px; min-height: 350px; border: 1px solid #DBDBDB; border-radius: 8px;
				padding: 20px 15px 15px 15px; background: white; position: fixed; left: 450px; bottom: 195px;}
	.s_object{ margin-top: 10px; margin-bottom: 10px; }
	/* 공지사항제목 */
	#s_title2{ font-size: 14px; font-weight: bold; padding-right: 10px; vertical-align: middle;}
	#notice_title2{ width: 615px; text-indent: 10px; background: none; border: none; vertical-align: middle;}
	/* 공지사항내용 */
	#s_content2{ font-size: 14px; font-weight: bold; padding-right: 10px; position: relative; top: 0px;}
	#content_see2{width: 615px; height: 220px; padding-top: 10px; display: inline-block; text-indent: 10px; }
	/* 버튼 */
	#modal_modify2{ width: 40px; height: 25px; border: 1px solid #DBDBDB; border-radius: 4px; }
	#modal_delete2{ width: 40px; height: 25px; border: 1px solid #DBDBDB; border-radius: 4px; }
	#b_list2{ width: 60px; height: 25px; border: none; background:#521110; color: white; border-radius: 4px; }
	
</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>
 	
	<section class="section">
		
		<div id="centerWrap"> <!-- 여기에다가 넣으면 됩니다 시작 -->
			<div id="m_category" align= center>
				<input id=notice type="button" value="공지사항" onclick="location.href='noticeList.ad'">
				<input id="a_report" type="button" value="계정신고" onclick="location.href='memberReportList.ad'">
				<input id="b_report" type="button" value="게시글 신고" onclick="location.href='boardReportList.ad'">
				<input id="p_approval" type="button" value="전문가승인" onclick="location.href='proApproveList.ad'">
				<input id="b_approval" type="button" value="게시글승인" onclick="location.href='boardApproveList.ad'">
			</div>
			
			<div id="m_button" align="center">
				<input id="n_write" type="button" value="글쓰기">		
			</div>
			
			<div id="m_content" align=center>
				
				<table>
					<tr id="table">
						<th id="t_num">번호</th>
						<th id="t_title">공지제목</th>
						<th id="t_writer">글쓴이</th>
						<th id="t_date">날짜</th>
					</tr>
					
					<c:forEach var="b" items="${list}">
						<tr class="content">
						<c:choose>
							<c:when test="${ empty list}">
								<td colspan="4">공지사항이 없습니다.</td>
							</c:when>
							<c:otherwise>
								<td class="n_num">${b.board_number}</td>
								<td class="n_title">${b.board_title}</td>
								<td class="n_writer">${b.b_writer_nickName}</td>
								<td class="n_date"><fmt:formatDate value="${b.b_write_date}" pattern="yyyy-MM-dd" /></td>
							</c:otherwise>
						</c:choose>			
						</tr>
					</c:forEach>
				</table>
				
			</div>
			
			<!-- 페이징 -->
			<div id="paging_area" align= center>
				<ul id="paging">
				
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					<li class="p_li">&lt;</li>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="noticeList.ad">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<li class="p_li"><a href="${ before }">&lt;</a> &nbsp;</li>
				</c:if>

				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<li class="p_li"><b>${ p }</b></li>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="noticeList.ad">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<li class="p_li"><a href="${ pagination }">${ p }</a> &nbsp;</li>
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<li class="p_li">&gt;</li>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="noticeList.ad">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<li class="p_li"><a href="${ after }">&gt;</a></li>
				</c:if>				
				
				</ul>
			</div>
			
			
			<!-- 모달 -->
			<!-- 공지글 쓰기 -->
			<div id="modal1">
				<form action="insertNotice.ad" method="post" id="insertNotice">
					<div id="add_notice">
						<div id="modal_title" align="center">
							공지사항
						</div>
						<div class="a_object">
							<span id="a_title">제목</span>
							<input type="text" id="title_write" placeholder="공지제목을 입력해 주세요" name="board_title">
						</div>
						<div class="a_object">
							<span id="a_content">내용</span>
							<textarea id="content_write" placeholder="내용을 입력해 주세요" name="board_content"></textarea>
						</div>
						<div align= center>
							<input id="n_button1" type="submit" onclick="return check();" value="보내기">
							<input id="n_button2" type="reset" value="취소">
						</div>
					</div>
				</form>
				<script>
					function check(){			
					
			 		 	var alarm_sender = "${loginUser.userId}";
			 	 	 	var alarm_title = $("#title_write").val();
			 	 	 	var alarm_content = $("#content_write").val();					
						
						var ck = confirm("공지사항 작성을 완료하시겠습니까?");
						if(ck){
							alert("공지사항 작성을 완료하였습니다.");
				 	 	 	var AlarmData = {
				 	 	 			"alarm_sender" : alarm_sender,
				 	 	 			"alarm_type" : "Notice",
				 	 	 			"alarm_title" : "<b>MusicStage </b>"+ alarm_title,
				 	 	 			"alarm_content" : "<pre>"+alarm_content+"</pre>"
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
					 	 	 				let socketMsg = "Notice," + alarm_sender + ",AllMember,null"; // 소켓에 보낼 메세지
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
							return true;
						}else{
							alert("취소하였습니다.");
							return false;
						}
					}
				</script>
				
				<div class="modal_layer"></div>
			
			</div>
			
			<!-- 공지글 보기 -->
			<div id="modal2">
				<form action="deleteNotice.ad" method="post">
				<input type="hidden" id="bno" value="" name="board_number">
					<div id="see_notice">
						<div id="modal_title" align="center">
							공지사항
						</div>
						<div id="enroll_date">
							<p id="enroll_date_p">등록 시간 : </p>
						</div>
						<div class="s_object">
							<span id="s_title">제목</span>
							<input id="notice_title" type="text" readonly>
						</div>
						<div class="s_object">
							<span id="s_content">내용</span>
							<div id="content_see">내용이 들어간다</div>
						</div>
						<div align= center>
							<input id="modal_modify" type="button" value="수정">
							<input id="modal_delete" type="submit" onclick="return check3();" value="삭제">
							<input id="b_list" type="button" value="목록보기">
						</div>
					</div>
				</form>						
				<script>
					function check3(){
						var ck = confirm("공지사항을 삭제하시겠습니까?");
						if(ck){
							alert("공지사항 삭제가 완료하였습니다.");
							return true;
						}else{
							alert("취소하였습니다.");
							return false;
						}
					}
				</script>				
				<div class="modal_layer"></div>
			</div>
			
			<!-- 공지글 수정 -->
			<div id="modal3">
				<form action="updateNotice.ad" method="post">
				<input type="hidden" name="board_number" id="bno2">
					<div id="see_notice2">
						<div id="modal_title2" align="center">
							공지사항
						</div>
						<div class="s_object2">
							<span id="s_title2">제목</span>
							<input id="notice_title2" type="text" name="board_title">
						</div>
						<div class="s_object2">
							<span id="s_content2">내용</span>
							<textarea id="content_see2" name="board_content">내용이 들어간다</textarea>
						</div>
						<div align= center>
							<input id="modal_modify2" type="submit" onclick="return check2();" value="수정">
							<input id="b_list2" type="button" value="목록보기">
						</div>
					</div>
				</form>	
				<script>
					function check2(){
						var ck = confirm("공지사항을 수정하시겠습니까?");
						if(ck){
							alert("공지사항 수정이 완료하였습니다.");
							return true;
						}else{
							alert("취소하였습니다.");
							return false;
						}
					}
				</script>			
				<div class="modal_layer"></div>
			</div>
			
			
        </div>
	</section>
        
	<!-- 모달 스크립트 -->
	<script>
   	$(document).ready(function(){
   		
   		/* 공지글 쓰기모달 */
   		$("#n_write").click(function(){
   			$("#modal1").fadeIn("fast").css("display","block");
   		});
   		
   		// 모달아닌 다른곳 클릭하면 닫기
		$(".modal_layer").click(function(){
			$("#modal1").fadeOut("fast").css({"display":"none"});
		});
		
		$("#n_button2").click(function(){
			$("#modal1").fadeOut("fast").css({"display":"none"});
		});
		
		/* 공지글 수정 */
		$("#modal_modify").click(function(){
			$("#modal2").fadeOut("fast").css({"display":"none"});
			$("#modal3").fadeIn("fast").css("display","block");
			    			
			$("#notice_title2").val($("#notice_title").val());
			$("#content_see2").html($("#content_see").html());
			$("#bno2").val($("#bno").val());	
		});
		    		
		// 모달아닌 다른곳 클릭하면 닫기
		$(".modal_layer").click(function(){
			$("#modal3").fadeOut("fast").css({"display":"none"});
		});
		
		$("#b_list2").click(function(){
			$("#modal3").fadeOut("fast").css({"display":"none"});
		});				

		/* 공지글 보기모달 */
    	$("tr.content").click(function(){
    			
   			// 게시글 번호 가져오기
   			var board_number = $(this).children('td').eq(0).text();
   			console.log("선택한 공지사항 글 번호 : " + board_number);
   			
   			$.ajax({
   				type : "post",
   				url : "noticeDetail.ad",
   				dataType : "json",
   				data : {board_number : board_number},
   				success : function(data){
   					
   					console.log("success : " + data);
   					
   					if(data.length != 0){
   						$("#notice_title").val(data.board_title);
   						$("#content_see").html(data.board_content);
   						$("#enroll_date_p").html("등록 시간 : " + data.b_write_date);
   						$("#bno").val(data.board_number);
   					}
   				},
   				error : function(request, error){
   					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   				}
   			});
   			
   			$("#modal2").fadeIn("fast").css("display","block");
   		});
    		
    	// 모달아닌 다른곳 클릭하면 닫기
		$(".modal_layer").click(function(){
			$("#modal2").fadeOut("fast").css({"display":"none"});
		});
		
		$("#b_list").click(function(){
			$("#modal2").fadeOut("fast").css({"display":"none"});
		});
    		
    });
	</script>
	
</body>
</html>