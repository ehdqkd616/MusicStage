<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:choose>
	<c:when test = "${searchCondition eq 'All'}">
		<c:set var = "opt1" scope = "page" value = "selected" />
	</c:when>
	<c:when test = "${searchCondition eq 'W'}">
		<c:set var = "opt2" scope = "page" value = "selected" />
	</c:when>	
	<c:when test = "${searchCondition eq 'N'}">
		<c:set var = "opt3" scope = "page" value = "selected" />
	</c:when>
	<c:when test = "${searchCondition eq 'Y'}">
		<c:set var = "opt4" scope = "page" value = "selected" />
	</c:when>
</c:choose>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>계정신고</title>
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
	#a_report{ background: gray; color: white; font-weight: bold; }
	
	
	/* 계정신고전체div */
	#m_content { margin-top: 80px;}
	
	/* 검색 버튼 */
	#search_button{ width: 60px;}
	#search_button{ height: 30px; border: 1px solid #DBDBDB; border-radius: 4px;
								  font-size: 13px; font-weight: bold; }
	#search_button:hover{ background: gray; color: white; font-weight: bold; }	
	
	
	/* 계정신고목록 */
	#m_content table{ width: 1050px; margin-top: 10px; border-bottom: 3px solid #DBDBDB; table-layout: fixed; }
	#table{ border-top: 3px solid #DBDBDB; border-bottom: 3px solid #DBDBDB;}
	#table th{ height: 40px; font-size: 17px; }
	#t_num{ width: 80px; }
	#t_title{ width: 520px; }
	#t_date{ width: 150px; }
	#t_result{ width: 80px; }
	
	.content td{ height: 40px; font-size: 14px; text-align: center; border-bottom: 1px solid #DBDBDB; }
	.content:hover{ background: #DBDBDB; font-weight: bold; }
	
	.a_title{ text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
	
	/* 페이징 */
	#paging_area{ vertical-align: middle; margin-top: 50px; }
	#paging { list-style: none; line-height: 30px; }
	.p_li{ display: inline-block; border: 1px solid #DBDBDB; width: 30px; height: 30px;
			text-align: center; border-radius: 4px; font-size: 15px; margin-right: 5px; }
	.p_li:hover{ background: #DBDBDB; font-weight: bold; }
	
	
	
	
	
	/* 모달창 */
	.modal_layer { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5);
	 				z-index:-1; }
	/* 신고글 보기 */
	#modal1 { position:relative; width:100%; height:100%; z-index:1; display:none; }
	#see_notify{ width: 700px; min-height: 350px; border: 1px solid #DBDBDB; 
				border-radius: 8px; padding: 20px 15px 15px 15px; background: white;
				position: fixed; left: 450px; bottom: 150px; }
	#modal_title{ font-size: 17px; font-weight: bold; margin-bottom: 20px; }
	.n_object{ margin-top: 10px; margin-bottom: 10px; }
	/* 신고 시간 */
 	#enroll_date {margin-top: 10px; margin-bottom: 10px; align: right;}
	#enroll_date_p {margin-right: 20px; text-align: right;}
	/* 신고 회원 */
	#n_member{ width: 60px; margin-right: 10px; font-size: 14px; font-weight: bold; vertical-align: middle; display: inline-block; text-align: right;}
	#report_member{ width: 400px; text-indent: 10px; background: none; border: none; }			
	/* 신고글카테고리 */
	#n_cate{ width: 60px; margin-right: 10px; font-size: 14px; font-weight: bold; vertical-align: middle; display: inline-block; text-align: right;}
	#cate_see{ width: 300px; padding: 10px; background: none; border: none; display: inline-block;}
	/* 신고자 */
	#n_write{ width: 60px; margin-right: 10px; font-size: 14px; font-weight: bold; vertical-align: middle; display: inline-block; text-align: right;}
	#write_see{ width: 400px; text-indent: 10px; background: none; border: none; }
	/* 신고글내용 */
	#n_content{ width: 60px; margin-right: 10px; font-size: 14px; font-weight: bold; vertical-align: middle; display: inline-block; text-align: right; }
	#content_see{width: 590px; height: 220px; padding-top: 10px; display: inline-block; text-indent: 10px;}
	/* 버튼 */
	#modal_yes{ width: 50px; height: 25px; border-radius: 4px; background: #009933; color: white; }
	#modal_no{ width: 50px; height: 25px; border-radius: 4px; background: #990033; color: white;  }
	#b_list{ width: 60px; height: 25px; border: none; background:#521110; color: white; border-radius: 4px; margin-left: 500px;}
	
	
	
	
	/* 거절사유선택 */
	#modal2 { position:relative; width:100%; height:100%; z-index:1; display:none; }
	#no_why{ width: 320px; min-height: 130px; border: 1px solid #DBDBDB; border-radius: 8px; 
			padding: 20px 15px 15px 15px; background: white; position: fixed; left: 640px; bottom: 350px; }
	#modal_select{ margin: 20px 0px 25px 0px; }
	#no_select{ width: 280px; }
	#yes{ width: 50px; height: 25px; border: none; background:#521110; color: white; border-radius: 4px;}
	#no{width: 50px; height: 25px; border: 1px solid #DBDBDB; background: none; border-radius: 4px;}
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
			
			<div id="m_content" align=center>
			    <div id="search_condition" align="center">
					검색 조건 : ${searchCondition}
				</div>
				<!---------------- 게시글 검색 ------------------>
			    <div id="searchArea" align="center">
			       <label>검색 조건</label>
			       <select id="searchCondition" name="searchCondition">
			          <option value="All" ${opt1}>전체</option>
			          <option value="W" ${opt2}>처리 대기</option>
			          <option value="N" ${opt3}>처리 거절</option>
			          <option value="Y" ${opt4}>처리 완료</option>
			       </select>
			       
	       			<button id="search_button" onclick="searchBoard();">검색하기</button>
			    </div>
			    
			    <script>
		    	function searchBoard(){
		        	var searchCondition = $("#searchCondition").val();
		         
		        	location.href="searchMemberReportList.ad?searchCondition="+searchCondition;
		    	}
			    </script>	
				
				<table>
					<tr id="table">
						<th id="t_num">번호</th>
						<th id="t_cate">신고사유</th>
						<th id="t_title">신고내용</th>
						<th id="t_writer">신고자</th>
						<th id="t_date">날짜</th>
						<th id="t_result">조치여부</th>
					</tr>
					
					<c:forEach var="rm" items="${list}">
						<tr class="content">
						<c:choose>
							<c:when test="${ empty list}">
								<td colspan="7">계정 신고 내역이 없습니다.</td>
							</c:when>
							<c:otherwise>						
						
								<td class="a_num">${rm.report_no}</td>
								<td class="a_cate">${rm.member_report_category_name}</td>
								<td class="a_title">${rm.report_content}</td>
								<td class="a_writer">${rm.report_from_nickName}</td>
								<td class="a_date"><fmt:formatDate value="${rm.report_date}" pattern="yyyy-MM-dd" /></td>
								<td class="a_result">${rm.report_status}</td>
							</c:otherwise>
						</c:choose>
						</tr>
					</c:forEach>
				</table>
				
			</div>
			
			<!-- 페이징 -->
			<div id="paging_area" align= center>
			
	         	<c:if test="${searchCondition eq null}">
	         		<c:set var="loc" value="/memberReportList.ad" scope="page"/>
	         	</c:if>
	         	<c:if test="${searchCondition ne null}">
	         		<c:set var="loc" value="/searchMemberReportList.ad" scope="page"/>
	         	</c:if>  
	         	  			
				<ul id="paging">
				
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					<li class="p_li">&lt;</li>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var = "before" value="${loc}" >
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					
		                <!-- 페이지 바뀔 때 검색결과 가지고 이동하기 위해서 -->
		                <c:if test="${searchCondition ne null}">
		                	<c:param name="searchCondition" value="${searchCondition}" />
		                </c:if>  			
					</c:url>
					<li class="p_li"><a href="${ before }">&lt;</a> &nbsp;</li>
				</c:if>

				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<li class="p_li"><b>${ p }</b></li>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="${loc}">
							<c:param name="page" value="${ p }"/>
			               
			                <!-- 페이지 바뀔 때 검색결과 가지고 이동하기 위해서 -->
			                <c:if test="${searchCondition ne null}">
			                	<c:param name="searchCondition" value="${searchCondition}" />
			                </c:if> 							
						</c:url>
						<li class="p_li"><a href="${ pagination }">${ p }</a> &nbsp;</li>
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<li class="p_li">&gt;</li>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="${loc}">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
		                 
		                <!-- 페이지 바뀔 때 검색결과 가지고 이동하기 위해서 -->
		                <c:if test="${searchCondition ne null}">
		                	<c:param name="searchCondition" value="${searchCondition}" />
		                </c:if>  					
					</c:url>
					<li class="p_li"><a href="${ after }">&gt;</a></li>
				</c:if>				
				
				</ul>
			</div>
			
			
			<!-- 신고글 보기 -->
			<div id="modal1">
					<div id="see_notify">
					
						<input type="hidden" id="bno" value="" name="report_no">
						<div id="modal_title" align="center">
							계정신고
						</div>
						<div id="enroll_date">
							<p id="enroll_date_p">신고 시간 : </p>
						</div>					
						<div class="n_object">
							<div id="n_member">신고회원</div>
							<input type="text" id="report_member" value="신고회원 닉네임(아이디)" readonly>
						</div>							
						<div class="n_object">
							<div id="n_cate">신고사유</div>
							<div id="cate_see">신고카테고리나오게한다</div>
						</div>
						<div class="n_object">
							<div id="n_write">신고자</div>
							<input type="text" id="write_see" value="신고자1" readonly>
						</div>
						<div class="n_object">
							<div id="n_content">내용</div>
							<div id="content_see">내용이 들어간다</div>
						</div>
						<div align= center>
							<input id="modal_yes" type="button" value="승인[Y]" onclick="check();">
							<input id="modal_no" type="button" value="거절[N]">
							<input id="b_list" type="button" value="목록보기">
						</div>
					</div>
				
				<script>
					function check(){
						var ck = confirm("신고 승인처리 하시겠습니까?");
						var report_no = $("#bno").val();
						var report_member_origin = $("#report_member").val();
						var report_member = report_member_origin.substring(report_member_origin.indexOf("[")+1, report_member_origin.indexOf("]"));
						var report_member_nickName = report_member_origin.substring(0, report_member_origin.indexOf("["));						
						var alarm_receiver_origin = $("#write_see").val();
						var alarm_receiver = alarm_receiver_origin.substring(alarm_receiver_origin.indexOf("[")+1, alarm_receiver_origin.indexOf("]"));
						var alarm_receiver_nickName = alarm_receiver_origin.substring(0, alarm_receiver_origin.indexOf("["));
						var report_reason = $("#cate_see").html();
						
						
						console.log("report_no 값 : " + report_no);
						console.log("report_member_origin 값 : " + report_member_origin);
						console.log("report_member 값 : " + report_member);
						console.log("report_member_nickName 값 : " + report_member_nickName);
						console.log("alarm_receiver_origin 값 : " + alarm_receiver_origin);
						console.log("alarm_receiver 값 : " + alarm_receiver);
						console.log("alarm_receiver_nickName 값 : " + alarm_receiver_nickName);
						console.log("report_reason 값 : " + report_reason);
						
						if(ck){
							alert("승인처리를 완료하였습니다.");
							location.href="memberReportYes.ad?report_no="+report_no+"&report_member="+report_member
											+"&page="+${pi.currentPage}+"&searchCondition="+"${searchCondition}";
					 		
				 		 	var alarm_sender = "${loginUser.userId}";
	 	
					 		// 신고자 알림 DB저장
				 	 	 	var AlarmData = {
				 	 	 			"alarm_sender" : alarm_sender,
				 	 	 			"alarm_receiver" : alarm_receiver,
				 	 	 			"alarm_type" : "MemberReportYes",
				 	 	 			"alarm_title" : "<b>MusicStage</b> 회원 신고 요청이 접수되었습니다.",
				 	 	 			"alarm_content" : "<b>"+report_member_nickName+"</b>님에 대한 신고 요청이 접수되었습니다. 신고 내역에 따라 해당 계정은 패널티가 적용 될 예정입니다.",
				 	 	 			"m_report_no" : report_no		
				 	 	 	};
				 	 	 	
				 	 	 	$.ajax({
				 	 	 		type : 'post',
				 	 	 		url : 'saveAlarm.ws',
				 	 	 		data : JSON.stringify(AlarmData),
				 	 	 		contentType: "application/json; charset=utf-8",
				 	 	 		dataType : 'text',
				 	 	 		success : function(data){
				 	 	 			if(data == 1){
					 	 	 			if(socket){
					 	 	 				let socketMsg = "MemberReportYes," + alarm_sender + ","+alarm_receiver+","+report_no; // 소켓에 보낼 메세지
					 	 	 				console.log("msgmsg : " + socketMsg); // 소켓 메세지 확인 콘솔
					 	 	 				socket.send(socketMsg); // 소켓에 메세지를 보낸다.
					 	 	 				
					 	 	 				// 피신고자 알림 DB저장
								 	 	 	var AlarmData2 = {
								 	 	 			"alarm_sender" : alarm_sender,
								 	 	 			"alarm_receiver" : report_member,
								 	 	 			"alarm_type" : "MemberReportYes",
								 	 	 			"alarm_title" : "<b>MusicStage</b> 회원님에 대한  신고 요청이 접수되었습니다.",
								 	 	 			"alarm_content" : "<b>"+report_member_nickName+"</b>님에 대해 다음과 같은 사유로 신고 요청이 접수되었습니다. <br><br>" +report_reason+"<br><br>신고 내역 및 회수에 따라 해당 계정은 패널티가 적용 될 수 있으니 이용에 유의하여 주시기 바랍니다.",
								 	 	 			"m_report_no" : report_no
					 	 	 				} 	
								 	 	 	$.ajax({
								 	 	 		type : 'post',
								 	 	 		url : 'saveAlarm.ws',
								 	 	 		data : JSON.stringify(AlarmData2),
								 	 	 		contentType: "application/json; charset=utf-8",
								 	 	 		dataType : 'text',
								 	 	 		success : function(data){
								 	 	 			if(data == 1){
									 	 	 			if(socket){
									 	 	 				let socketMsg = "MemberReportYes," + alarm_sender + ","+report_member+","+report_no; // 소켓에 보낼 메세지
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
				 	 	 	
						}else{
							alert("취소하였습니다.");
							return false;
						}
					}
				</script>
				
				<div class="modal_layer"></div>
			</div>
			
			<!-- 거절누를시 거절사유 선택할수있는 div -->
			<div id="modal2">
				<div id="no_why">
					<div id="modal_title" align="center">계정신고-거절</div>
					<div id="modal_select" align="center">
						<select id="no_select" >
							<option>1번옵션</option>
							<option>2번옵션</option>
							<option>3번옵션</option>
							<option>4번옵션</option>
							<option>5번옵션</option>
							<option>6번옵션</option>
						</select>
					</div>
					<div align= center>
						<input id="yes" type="button" value="확인" onclick="check2();">
						<input id="no" type="button" value="취소">
					</div>
				</div>
				<script>
					function check2(){
						var ck = confirm("신고 거절처리 하시겠습니까?");
						var report_no = $("#bno").val();
						var report_member_origin = $("#report_member").val();
						var report_member_nickName = report_member_origin.substring(0, report_member_origin.indexOf("["));						
						var report_member = report_member_origin.substring(report_member_origin.indexOf("[")+1, report_member_origin.indexOf("]"));						
						var alarm_receiver_origin = $("#write_see").val();
						var alarm_receiver = alarm_receiver_origin.substring(alarm_receiver_origin.indexOf("[")+1, alarm_receiver_origin.indexOf("]"));
						var alarm_receiver_nickName = alarm_receiver_origin.substring(0, alarm_receiver_origin.indexOf("["));
						var no_select = $("#no_select option:selected").text();
						
						console.log("report_no 값 : " + report_no);
						console.log("report_member_origin 값 : " + report_member_origin);
						console.log("report_member 값 : " + report_member);
						console.log("report_member_nickName 값 : " + report_member_nickName);
						console.log("alarm_receiver_origin 값 : " + alarm_receiver_origin);
						console.log("alarm_receiver 값 : " + alarm_receiver);
						console.log("alarm_receiver_nickName 값 : " + alarm_receiver_nickName);						
						console.log("no_select 값 : " + no_select);		
						
						if(ck){
							alert("신고 거절 처리를 완료하였습니다.");
							location.href="memberReportNo.ad?report_no="+report_no+"&report_member="+report_member+"&no_select="+no_select
											+"&page="+${pi.currentPage}+"&searchCondition="+"${searchCondition}";
				 		 	
							var alarm_sender = "${loginUser.userId}";

							// 신고자 알림 DB저장
				 	 	 	var AlarmData = {
				 	 	 			"alarm_sender" : alarm_sender,
				 	 	 			"alarm_receiver" : alarm_receiver,
				 	 	 			"alarm_type" : "MemberReportNo",
				 	 	 			"alarm_title" : "<b>MusicStage</b> 회원 신고 요청이 거절 처리되었습니다.",
				 	 	 			"alarm_content" : "<b>"+report_member_nickName+"</b>님에 대한 신고 요청이 다음과 같은 사유로 거절되었습니다.<br><br>"+no_select,
				 	 	 			"m_report_no" : report_no		
				 	 	 	};

				 	 	 	$.ajax({
				 	 	 		type : 'post',
				 	 	 		url : 'saveAlarm.ws',
				 	 	 		data : JSON.stringify(AlarmData),
				 	 	 		contentType: "application/json; charset=utf-8",
				 	 	 		dataType : 'text',
				 	 	 		success : function(data){
				 	 	 			if(data == 1){	
					 	 	 			if(socket){
					 	 	 				let socketMsg = "MemberReportNo," + alarm_sender + ","+alarm_receiver+","+report_no; // 소켓에 보낼 메세지
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
							alert("취소하였습니다.");
							return false;
						}
					}
				</script>
				<div class="modal_layer"></div>
			</div>
		</div>
		
		<!-- 모달 스크립트 -->
        <script>
        	$(document).ready(function(){
				
				/* 신고글 보기모달 */
        		$("tr.content").click(function(){
        			
        			// 신고글 번호 가져오기
        			var report_no = $(this).children('td').eq(0).text();
        			console.log("선택한 신고글 번호 : " + report_no);
        			
        			$.ajax({
        				type : "post",
        				url : "memberReportDetail.ad",
        				dataType : "json",
        				data : {report_no : report_no},
        				success : function(data){
        					
        					console.log("success : " + data);
        					
        					if(data.length != 0){
        						$("#cate_see").html(data.member_report_category_name);
        						$("#write_see").val(data.report_from_nickName+'['+data.report_from+']');
        						$("#content_see").html(data.report_content);        						
        						$("#report_member").val(data.report_to_nickName+'['+data.report_to+']');
        						$("#enroll_date_p").html("신고 시간 : " + data.report_date);    						
        						$("#bno").val(data.report_no);
        					}
        				},
        				error : function(request, error){
        					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        				}
        			});        			
        			
        			$("#modal1").fadeIn("fast").css("display","block");
        		});
        		
        		// 모달아닌 다른곳 클릭하면 닫기
				$(".modal_layer").click(function(){
					$("#modal1").fadeOut("fast").css({"display":"none"});
				});
				
				$("#b_list").click(function(){
					$("#modal1").fadeOut("fast").css({"display":"none"});
				});
				
				
				/* 신고글 거절모달 */
        		$("#modal_no").click(function(){
        			$("#modal1").fadeOut("fast").css("display","none");
        			$("#modal2").fadeIn("fast").css("display","block");
        		});
        		
        		// 모달아닌 다른곳 클릭하면 닫기
				$(".modal_layer").click(function(){
					$("#modal2").fadeOut("fast").css({"display":"none"});
				});
				
				/* 신고글 거절모달 취소 */
				$("#no").click(function(){
        			$("#modal2").fadeOut("fast").css("display","none");
        			$("#modal1").fadeIn("fast").css("display","block");
				});	
        		
        	});
        
        </script>
	</section>
</body>
</html>