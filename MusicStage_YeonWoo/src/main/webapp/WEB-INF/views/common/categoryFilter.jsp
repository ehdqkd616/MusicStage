<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
	color: #4B4B4B !important;
	/* a태그 default css가 black인가봄. 기본색 #4B4B4B으로 바꿔줌. */
}

/* 1. 메인 div */
.filter_main_div {
	border: 1px solid #DBDBDB;
	border-radius: 4px;
	background: white;
	width: 200px;
	float: right;
	margin-top: 30px;
	margin-right: 25px;
}

/* 2. 보드형식, 피드형식 아이콘 div */
.typeSelect_div {
	padding: 7px 0 5px 3px;
	border-bottom: 2px solid #DBDBDB;
}

.typeSelect_div img {
	width: 20px;
	height: 20px;
}

label{
	cursor: pointer;
}

/* 3. 카테고리 */
.filter_title {
	padding: 10px;
	font-size: 16px;
	font-weight: bold !important;
	background: #A7543A;
	color: white;
	border-bottom: 2px solid #DBDBDB;
}

.filter_sub_div {
	line-height: 40px;
    font-size: 14px;
    font-weight: bold;
    color: #4B4B4B !important;
}

#moreFileter{
	display:inline-block;
	width:10px;
	height: 10px;
	margin-left: 80px;
}

#moreImg{
	width: 10px;
	height: 10px;
	margin-top: -20px;x
}

.filterTitle{
	padding-left: 10px;
    width: 190px;
    font-size: 17px;
}

.filterContent{
    display: inline-block;
    border-radius: 100px;
    width: 83px;
    height: 30px;
    text-align: center;
    line-height: 25px;
    background: white;
    border: 1px solid #d6d6d6;
    box-shadow: 0 2px 3px 0px rgba(0,0,0,0.25);
    transition: .2s all;
    margin: 0 0 10px 10px;
}

.find_label, .cate_label{
	font-size: 11px;
	cursor: pointer;
    
}

.filterSearch:hover .filterContent{
	filter:blur(1px);
	opacity:.5;
	box-shadow:none;
	
}

.filterSearch:hover .filterContent:hover{
	cursor: pointer;
	font-size: 12px;
	transform:scale(1.2);
	filter:blur(0px);
	opacity:1;
	box-shadow:0 8px 20px 0px rgba(0,0,0,0.125);
}

.find_label:hover{
	cursor: pointer;
}

/* 찾아요 */


/* 컬럼 */
#searchUserNickName{
	text-indent: 0px;
	width: 170px;
	margin-left: 13px;
	padding-left: 5px;
	border: none;
	outline: none;
}

#searchButton{
	width: 45px;
    height: 20px;
    position: relative;
    border-radius: 2px;
    top: -50px;
    left: 145px;

}

#filtercolumn{
    margin-top: 15px;
    height: 117px;
}

#columnnick{
	border-bottom: 1px solid black;
    display: inline-block;
    width: 177px;
   	height: 66px;
    position: relative;
    top: -69px;
    left: 10px;
    pointer-events: none;
    overflow: hidden;
}

#columnnick:after{
	content: "";
	border-bottom: 3px solid #521110;
    display: inline-block;
    width: 177px;
    height: 72px;
    position: absolute;
    bottom: 0px;
    transform: translateX(-100%);
    transition: all 0.3s ease;
}

#columnContent{
	position: absolute;
	bottom: -5px;
	left: 10px;
	transition: all 0.3s ease;
}

#searchUserNickName:focus + #columnnick #columnContent,
#searchUserNickName:valid + #columnnick #columnContent{
	transform: translateY(-60%);
	font-size: 12px;
	color: #521110;
}

#searchUserNickName:focus + #columnnick:after, 
#searchUserNickName:valid + #columnnick:after{
	transform: translateX(0%);
}

/* 리뷰 */
#filterDetail{
	height: 134px;
}

#detailsearch{
	text-indent: 0px;
    width: 170px;
    margin-left: 13px;
    padding-left: 5px;
    position: relative;
    top: 25px;
    border: none;
    outline: none;
}

#reviewDetail{
	border-bottom: 1px solid black;
    display: inline-block;
    width: 177px;
   	height: 66px;
    position: relative;
    top: -44px;
    left: 10px;
    pointer-events: none;
    overflow: hidden;
}

#reviewDetail:after{
	content: "";
	border-bottom: 3px solid #521110;
    display: inline-block;
    width: 177px;
    height: 72px;
    position: absolute;
    bottom: -1px;
    transform: translateX(-100%);
    transition: all 0.3s ease;
}

#reviewContent{
	position: absolute;
	bottom: -5px;
	left: 10px;
	transition: all 0.3s ease;
}

#detailsearch:focus + #reviewDetail #reviewContent,
#detailsearch:valid + #reviewDetail #reviewContent{
	transform: translateY(-60%);
	font-size: 12px;
	color: #521110;
}

#detailsearch:focus + #reviewDetail:after, 
#detailsearch:valid + #reviewDetail:after{
	transform: translateX(0%);
}

#detailButton{
	position: absolute;
    top: 785px;
    right: 40px;
    width: 45px;
    height: 20px;
    border-radius: 2px;
}

.aTag{
	width: 45px;
    height: 35px;
    display: inline-block;
   	text-align: center;
}

.aTag label{
	/* margin-left: 10px; */
}

</style>
</head>
<body>
	
	<c:if test="${ boardCategory eq 1 || boardCategory eq 2 || boardCategory eq 3 || boardCategory eq 4 || not empty list}">
	<div class="filter_main_div">
			
		<div class="typeSelect_div">
		
			<c:choose>
				<c:when test="${ list[0].board_category eq 1 }">
				<a href="socialFeed.bo" class="aTag"><img src="resources/images/feed타입.png"><br><label>FEED</label></a>
				<a href="socialBoard.bo" class="aTag"><img src="resources/images/board타입.png"><br><label>BOARD</label></a><!-- 보드형식 아이콘 못찾아서 임시. -->
				<div id="moreFileter"><img id="moreImg" src="resources/images/morebutton.png" ></div>
				</c:when>
				
				<c:when test="${ list[0].board_category eq 2 || boardCategory eq 2 }">
				<a href="findFeed.bo" class="aTag"><img src="resources/images/feed타입.png"><br><label>FEED</label></a>
				<a href="findBoard.bo" class="aTag"><img src="resources/images/board타입.png"><br><label>BOARD</label></a><!-- 보드형식 아이콘 못찾아서 임시. -->
				<div id="moreFileter"><img id="moreImg" src="resources/images/morebutton.png" ></div>
				</c:when>
				
				<c:when test="${ list[0].board_category eq 3 || boardCategory eq 3 }">
				<a href="columnFeed.bo" class="aTag"><img src="resources/images/feed타입.png"><br><label>FEED</label></a>
				<a href="columnBoard.bo" class="aTag"><img src="resources/images/board타입.png"><br><label>BOARD</label></a><!-- 보드형식 아이콘 못찾아서 임시. -->
				<div id="moreFileter"><img id="moreImg" src="resources/images/morebutton.png" ></div>
				</c:when>
				
				<c:when test="${ list[0].board_category eq 4 || boardCategory eq 4 }">
				<a href="reviewFeed.bo" class="aTag"><img src="resources/images/feed타입.png"><br><label>FEED</label></a>
				<a href="reviewBoard.bo" class="aTag"><img src="resources/images/board타입.png"><br><label>BOARD</label></a><!-- 보드형식 아이콘 못찾아서 임시. -->
				<div id="moreFileter"><img id="moreImg" src="resources/images/morebutton.png" ></div>
				</c:when>
			</c:choose>
		</div>
		
		
		<form action="searchType.bo" name="searchType" method="get">
		<c:if test="${ list[0].board_category eq 2 || boardCategory eq 2 }">
			<div class="filter_sub_div">
			<div class="filterTitle">Category</div>
			<!-- 찾아요 -->
			<div class="filterSearch" style=" height: 102px;">
			<div class="filterContent"><label class="find_label"><input type="checkbox" class="searchType" id="find_student" name="searchType[]" value="fs" style="display: none;">학생찾아요</label></div>
			<div class="filterContent"><label class="find_label"><input type="checkbox" class="searchType" id="find_teacher" name="searchType[]" value="ft" style="display: none;">전문가찾아요</label></div>
			<div class="filterContent"><label class="find_label"><input type="checkbox" class="searchType" id="find_place"name="searchType[]" value="fp" style="display: none;">연습실</label></div>
			</div>
			</div>
		</c:if>
		</form>
		
		<form action="searchColumn.bo" name="searchUserNick" method="get">
		<c:if test="${ list[0].board_category eq 3 || boardCategory eq 3 }">
			<div class="filter_sub_div">
			<div class="filterTitle">Search</div>
			<!-- 컬럼 -->
			<div id="filtercolumn">
			<input type="text" id=searchUserNickName name="searchUserNickName" autocomplete="off" required>
			<div id="columnnick"><span id="columnContent">NickName</span></div>
			<input type="submit" id="searchButton" value="검색">
			</div>
			</div>
		</c:if>
		</form>
			
		<form action="searchCate.bo" name="sub_cate" method="get">
		<c:if test="${ list[0].board_category eq 4 || boardCategory eq 4 }">
			<div class="filter_sub_div">
			<div class="filterTitle">Category</div>
			<!-- 리뷰 -->
			<div class="filterSearch" style="height: 232px;">
			<div class="filterContent"><label class="cate_label"><input type="checkbox" class="subCate" id="soft" name=subCate[] value="소프트악기" style="display: none;">소프트악기</label></div>
			<div class="filterContent"><label class="cate_label"><input type="checkbox" class="subCate" id="plugin" name=subCate[] value="플러그인" style="display: none;">플러그인</label></div>
			<div class="filterContent"><label class="cate_label"><input type="checkbox" class="subCate" id="play" name=subCate[] value="악기관련" style="display: none;">악기관련</label></div>
			<div class="filterContent"><label class="cate_label"><input type="checkbox" class="subCate" id="musicgear" name=subCate[] value="음악장비" style="display: none;">음악장비</label></div>
			<div class="filterContent"><label class="cate_label"><input type="checkbox" class="subCate" id="synthesizer" name=subCate[] value="신디사이저" style="display: none;">신디사이저</label></div>
			<div class="filterContent"><label class="cate_label"><input type="checkbox" class="subCate" id="controller" name=subCate[] value="미디컨트롤러" style="display: none;">미디컨트롤러</label></div>
			<div class="filterContent"><label class="cate_label"><input type="checkbox" class="subCate" id="userUse" name=subCate[] value="유저사용기" style="display: none;">유저사용기</label></div>
			<div class="filterContent"><label class="cate_label"><input type="checkbox" class="subCate" id="workPlace" name=subCate[] value="작업공간" style="display: none;">작업공간</label></div>
			<div class="filterContent"><label class="cate_label"><input type="checkbox" class="subCate" id="primer" name=subCate[] value="프리미엄리뷰" style="display: none;">프리미엄리뷰</label></div>
			<div class="filterContent"><label class="cate_label"><input type="checkbox" class="subCate" id="etc" name=subCate[] value="etc" style="display: none;">etc</label></div>
			</div>
			
			<div id="filterDetail">
			<input type="text" id="detailsearch" name="detailSearch"  autocomplete="off" required>
			<div id="reviewDetail"><span id="reviewContent">DetailCategory</span></div>
			<input type="submit" id="detailButton" value="검색">
			</div>
			</div>
		</c:if>
		</form>
	</div>
	</c:if>	
		
	
	<script>
	// html dom 이 다 로딩된 후 실행된다.
	$(document).ready(function(){
    
    	//모든 서브 메뉴 감추기
        // $(".filter_sub_div").css({display:"none"}); 
    	
    	var cateNum = "<c:out value='${ list[0].board_category }'/>"
    	
        if(cateNum == 1){
        	$("#moreFileter").hide();
        } else {
        	$("#moreFileter").on("click", function(){
	   			var subCate  = $(this).parent().nextAll("form").children("div [class=filter_sub_div]");
	   			// var subCate  = $(this).parent().next("div [class=filter_sub_div]");
	   			
	   			if(subCate.is(":hidden")){
	   				subCate.slideDown();
	   				$("#moreImg").css("transform","rotate(180deg)");
	   			} else {
	   				subCate.slideUp();
	   				$("#moreImg").css("transform","rotate(0deg)");
	   			}
	   		})	
        }
    	
    	
    	// 찾아요 세부카테고리 선택
    	$(".searchType").on("click", function(){
    		if($(this).is(":checked")){
    			searchType.submit();
    		} else {
    			searchType.submit();
    		}
    		
    	});
    	
    	// 컬럼닉네임검색
    	var columnButton = document.getElementById("searchButton");
    	$(columnButton).on("click", function(){
    		var searchText = $(this).prev("input[type=text]").val();
    		
    		if(searchText == ""){
    			alert("검색을 원하는 닉네임을 입력해 주세요");
    			return false;
    		}
    		
    	});
    	
    	
    	// 리뷰 세부카테고리 선택
   		$(".subCate").on("click", function(){
       		if($(this).is(":checked")){
       			sub_cate.submit();
       		} else {
       			sub_cate.submit();
       		}
       	});	
    	// 리뷰 세부검색
    	var reviewButton = document.getElementById("detailButton");
    	$(reviewButton).on("click", function(){
			var searchText = $(this).prev("input[type=text]").val();
    		
    		if(searchText == ""){
    			alert("검색을 원하는 키워드을 입력해 주세요");
    			
    		}
    	});
    	
	});
	</script>
	
</body>

</html>