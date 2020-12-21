<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	background: white;
	width: 200px;
	/* height: 500px; */
	float: right;
	margin-top: 30px;
}

/* 2. 보드형식, 피드형식 아이콘 div */
.typeSelect_div {
	padding: 15px;
	border-bottom: 2px solid #DBDBDB;
}

.typeSelect_div img {
	width: 20px;
	height: 20px;
}

/* 3. 카테고리 */
.filter_title {
	padding: 10px;
	font-size: 16px;
	font-weight: bold !important;
	/* color: black; */
	background: #A7543A;
	color: white;
	border-bottom: 2px solid #DBDBDB;
}

.filter_sub_div {
	line-height: 40px;
    font-size: 14px;
    font-weight: bold;
    color: #4B4B4B !important;
   /*  padding-left: 10px; */
}

.filter_sub_div div {
	/* background: #EED9D2; */
	background: #F9F3F0;
}

.filter_sub_ul li a {
	color: #727272 !important;
	padding-left: 10px;
}

</style>
</head>
<body>

	<div class="filter_main_div">
		<div class="typeSelect_div">
			<a href="allFeedType.bo"><img src="resources/images/피드형식버튼.png"></a>&nbsp;
			<a href="allBoardType.bo"><img src="resources/images/피드형식버튼.png"></a> <!-- 보드형식 아이콘 못찾아서 임시. -->
		</div>
		
		<div class="filter_title">상위 카테고리</div>
		
		<div class="filter_sub_div">
		<ul>
			<li>
				<div class="filter_div"><a href="">&nbsp;&nbsp;&nbsp;소셜</a></div>
			</li>
			<li>
				<div class="filter_div" id="filter_slide">&nbsp;&nbsp;&nbsp;찾아요</div>
				<ul class="filter_main_ul">
					<li>&nbsp;&nbsp;&nbsp;레슨
						<ul class="filter_sub_ul">
							<li><a href="">&nbsp;&nbsp;&nbsp;선생님 찾기</a></li>
							<li><a href="">&nbsp;&nbsp;&nbsp;학생 찾기</a></li>
						</ul>
					</li>
					<li>&nbsp;&nbsp;&nbsp;연습실
						<ul class="filter_sub_ul">
							<li><a href="">&nbsp;&nbsp;&nbsp;연습실 찾기</a></li>
							<li><a href="">&nbsp;&nbsp;&nbsp;연습실 홍보</a></li>
						</ul>
					</li>
					<li>&nbsp;&nbsp;&nbsp;연주자
						<ul class="filter_sub_ul">
							<li><a href="">&nbsp;&nbsp;&nbsp;연주자 찾기</a></li>
							<li><a href="">&nbsp;&nbsp;&nbsp;연주할 곳 찾기</a></li>
						</ul>
					</li>
					<li>&nbsp;&nbsp;&nbsp;음악제작
						<ul class="filter_sub_ul">
							<li><a href="">&nbsp;&nbsp;&nbsp;제작자 찾기</a></li>
							<li><a href="">&nbsp;&nbsp;&nbsp;음악제작 홍보</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<li class="filter_subTitle">
				<div class="filter_div"><a href="">&nbsp;&nbsp;&nbsp;컬럼</a></div></li>
			<li class="filter_subTitle">
				<div class="filter_div"><a href="">&nbsp;&nbsp;&nbsp;리뷰</a></div></li>
		</ul>
		</div>
	</div>
	
	<script>
   		// html dom 이 다 로딩된 후 실행된다.
    	$(document).ready(function(){
        
    	//모든 서브 메뉴 감추기
        $(".filter_main_ul").css({display:"none"}); 
    	
    	// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $("#filter_slide").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
   		});
	</script>
	
	<!-- <script type="text/javascript">
		function goBoardType() {
			location.href="boardType.jsp";
		}
	</script> -->
	
</body>
</html>