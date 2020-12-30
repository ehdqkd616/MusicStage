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
	<title>게시글승인</title>
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
	#b_approval{ background: gray; color: white; font-weight: bold; }
	
	
	/* 게시글신고전체div */
	#m_content { margin-top: 80px;}
	
	/* 검색 버튼 */
	#search_button{ width: 60px;}
	#search_button{ height: 30px; border: 1px solid #DBDBDB; border-radius: 4px;
								  font-size: 13px; font-weight: bold; }
	#search_button:hover{ background: gray; color: white; font-weight: bold; }
	
	/* 게시글신고목록 */
	#m_content table{ width: 1050px; margin-top: 10px; border-bottom: 3px solid #DBDBDB; table-layout: fixed; }
	#table{ border-top: 3px solid #DBDBDB; border-bottom: 3px solid #DBDBDB;}
	#table th{ height: 40px; font-size: 17px; }
	#t_num{ width: 60px; }
	#t_cate2{ width: 130px; }
	#t_title{ width: 420px; }
	#t_date{ width: 130px; }
	#t_result{ width: 80px; }
	
	.content td{ height: 40px; font-size: 14px; text-align: center; border-bottom: 1px solid #DBDBDB; }
	.content:hover{ background: #DBDBDB; font-weight: bold; }
	
	.b_title{ text-overflow: ellipsis; white-space: nowrap; overflow: hidden;}
	
	/* 페이징 */
	#paging_area{ vertical-align: middle; margin-top: 50px; }
	#paging { list-style: none; line-height: 30px; }
	.p_li{ display: inline-block; border: 1px solid #DBDBDB; width: 30px; height: 30px;
			text-align: center; border-radius: 4px; font-size: 15px; margin-right: 5px; }
	.p_li:hover{ background: #DBDBDB; font-weight: bold; }
	
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
			          <option value="W" ${opt2}>승인 대기</option>
			          <option value="N" ${opt3}>승인 거절</option>
			          <option value="Y" ${opt4}>승인 완료</option>
			       </select>
			       
	       			<button id="search_button" onclick="searchBoard();">검색하기</button>
			    </div>
			    
			    <script>
		    	function searchBoard(){
		        	var searchCondition = $("#searchCondition").val();
		         
		        	location.href="searchBoardApproveList.ad?searchCondition="+searchCondition;
		    	}
			    </script>
			    			
				<table>
					<tr id="table">
						<th id="t_num">번호</th>
						<th id="t_cate1">대분류</th>
						<th id="t_cate2">소분류</th>
						<th id="t_title">제목</th>
						<th id="t_writer">요청인</th>
						<th id="t_date">날짜</th>
						<th id="t_result">조치여부</th>
					</tr>
					<c:forEach var="b" items="${list}">
						<tr class="content">
						<c:choose>
							<c:when test="${ empty list}">
								<td colspan="7">게시글 승인 요청이 없습니다.</td>
							</c:when>
							<c:otherwise>						
								<td class="b_num">${b.board_number}</td>
								<td class="b_cate1">${b.board_category_name}</td>
								<td class="b_cate2">${b.sub_category}</td>
								<td class="b_title">${b.board_title}</td>
								<td class="b_writer">${b.b_writer_nickName}</td>
								<td class="b_date"><fmt:formatDate value="${b.b_write_date}" pattern="yyyy-MM-dd" /></td>
								<td class="b_result">${b.board_approve}</td>
							</c:otherwise>
						</c:choose>
						</tr>
					</c:forEach>					
				</table>
				
			</div>
			
			<!-- 페이징 -->
			<div id="paging_area" align= center>
			
	         	<c:if test="${searchCondition eq null}">
	         		<c:set var="loc" value="/boardApproveList.ad" scope="page"/>
	         	</c:if>
	         	<c:if test="${searchCondition ne null}">
	         		<c:set var="loc" value="/searchBoardApproveList.ad" scope="page"/>
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
			
        </div>
	</section>
	
	<script>
		$(function(){
			$('.content').click(function(){
				var board_number = $(this).children('td').eq(0).text();
				var searchCondition = '${searchCondition}';
				location.href = "boardApproveDetail.ad?board_number=" + board_number + "&page=" + ${pi.currentPage} + "&searchCondition=" + searchCondition;
			});
		});
	</script>		
</body>
</html>