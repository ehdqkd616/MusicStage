<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	*{
  box-sizing: border-box;
}

.wrapper{
  width: 100%;
  height: 100%;
}

/* 배경색바꿈 */
.top_navbar{
  height: 60px;
  display: flex;
  position: fixed;
  width: 100%;
  top: 0;
  left: 0;
  background: #fff;
  border-bottom: 2px solid #DBDBDB;
}

/* 배경색바꿈 */
.top_navbar .hamburger{
  width: 80px;
  background: #fff;
  position: relative;
  font-size: 28px;
}

.top_navbar .hamburger .hamburger__inner{
  cursor: pointer;
  width: 35px;
  height: 35px;
  position: absolute;
  left: 20px;
  top: 10px;
}

.top_navbar .hamburger__inner > img{
  width: 25px;
}

/* 배경색 바꿈 */
.main_container .sidebar{
  position: fixed;
  top: 60px;
  left: 0;
  width: 225px;
  height: 100%;
  background: #fff;
  
  transition: all 0.3s ease;
  overflow: hidden;
}

.main_container .sidebar .sidebar__inner{
  position: relative;
}

.sidebar:hover {
  overflow-y: scroll;
}

.sidebar::-webkit-scrollbar{ width: 8px; }
.sidebar::-webkit-scrollbar-thumb{background: lightgray; border-radius: 4px;}

.main_container .sidebar ul li a{
  color: #fff;
  font-size: 15px;
  padding: 20px 100px 20px 28px;
  white-space: nowrap;
  display: flex;
  align-items: center;
  margin-bottom: 1px;
  transition: all 0.3s ease;
}

.main_container .sidebar ul li a .icon{
  margin-right: 40px;
}

.main_container .sidebar ul li a span{
  display: inline-block;
}

/* 색깔바꿈 */
.main_container .sidebar ul li a:hover,
.main_container .sidebar ul li a.active{
  border-left: 5px solid #833821;
  color: white;
}

.sidebar__inner hr{
  display:block;
}

.followList h2{
  font-size: 18px;
  color: #521110;
  padding: 20px 30px;
}

.sidebar_submenu, .more_view{
  display: flex;
  align-items: center;
  font-size: 14px;
  color: #fff;
  padding: 10px 20px;
}

.sidebar_submenu, .more_view:hover{
	cursor: pointer;
}

.followList div img{
	margin-right: 25px;
}

.footer{
  height: 200px;
  margin: 20px;
  font-size: 15px;
}

.main_container span{
  color: #4B4B4B;
}

/* after adding active class */
.wrapper.active .sidebar{
  width: 80px;
}

.wrapper.active .sidebar ul li a span.title,
.wrapper.active .sidebar_sub_menu_area,
.wrapper.active .footer,
.wrapper.active hr
{
  display: none;
}

.wrapper.active .main_container .sidebar{
  overflow: hidden;
}

.wrapper.active .main_container .container{
  width: calc(100% - 80px);
  margin-left: 80px;
}

.icon.home{ 
	width: 30px !important; 
	height: 30px !important;
	border-radius: 100px;
}

#moreButton{ widht: 10px; height: 10px; }



</style>
<head>
	<meta charset="UTF-8">
	<title>SideBar Menu</title>
	<!-- <link rel="stylesheet" href="styles.css"> -->
	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			$(".hamburger .hamburger__inner").click(function(){
			  $(".wrapper").toggleClass("active")
			})

			$(".top_navbar .fas").click(function(){
			   $(".profile_dd").toggleClass("active");
			});
			
		});
	</script>
</head>
<body>

  <div class="wrapper">
    <div class="top_navbar">
      <div class="hamburger" align="center">
      	<div class="hamburger__inner">
      		<img src="<%= request.getContextPath()%>/resources/images/menu_bar.png">
      	</div>
      </div>
    </div>
      
    <div class="main_container">
        <div class="sidebar">
            <div class="sidebar__inner">
              <ul>
                <li>
                  <a href="<%= request.getContextPath() %>/allFeed.bo"  id="button_home">
                    <span class="icon"><!-- <i class="fas d-fa-dice-d6"></i> >> 사용x-->
                    <img src="<%=request.getContextPath() %>/resources/images/home버튼.png" style="width: 27px; height: 27px;">
                    </span>
                    <span class="title">Home</span>
                  </a>
                </li>
                <li>
                  <a href="fresh.bo" id="button_fresh">
                    <span class="icon"><!-- <i class="fas fa-bullhorn"></i> -->
                    <img src="<%=request.getContextPath() %>/resources/images/fresh.png" style="width: 27px; height: 27px;">
                    </span>
                    <span class="title">소식</span>
                  </a>
                </li>
                <li>
                  <a href="follow.bo"  id="button_follow">
                    <span class="icon"><!-- <i class="fab fa-elementor"></i> -->
                    <img src="<%=request.getContextPath() %>/resources/images/팔로우버튼.png" style="width: 27px; height: 27px;">
                    </span>
                    <span class="title">팔로우</span>
                  </a>
                </li>
                <li>
                  <a href="save.bo" id="button_save">
                    <span class="icon"><!-- <i class="far fa-folder-open"></i> -->
                    <img src="<%=request.getContextPath() %>/resources/images/보관함버튼.png" style="width: 27px; height: 27px;">
                    </span>
                    <span class="title">보관함</span>
                  </a>
                </li>
              </ul>
              <br>
              <hr style="border: 1px solid #DBDBDB; background: #DBDBDB;">
                <div class="sidebar_sub_menu_area">
                  <div class="followList">
                      <h2 class="sidebar_title">
                          팔로우
                      </h2>
                      <c:if test="${ empty followList }">
                      	<div style="font-size: 13px; width: 200px; height: 180px; margin-left: 8px; padding-left: 20px;">
                      	팔로우 목록이 없습니다<br>
                      	다양한 사람들을 만나보세요(?)
                      	</div><br>
                      </c:if>
                      
                      <c:if test="${ !empty followList }">
                      <c:forEach var="list" items="${ followList }">
                      	<div class="sidebar_submenu" style="display: none;">
                            <c:if test="${ list.profile_pic eq null }">
								<input type="hidden" value="${ list.userId }">
	                      		<img src="<%= request.getContextPath()%>/resources/images/profileDefault.png" class="icon home">
	                            <span>${ list.nickName }</span>
							</c:if>
							<c:if test="${ list.profile_pic ne null }">
								<input type="hidden" value="${ list.userId }">
	                      		<img src="<%= request.getContextPath()%>/resources/userProfile/${ list.userId }/${list.profile_pic}" class="icon home">
	                            <span>${ list.nickName }</span>>
							</c:if>
                        </div>
                      </c:forEach>
                      
                      	<div class="more_view" id="more">
                          <span>더보기</span>&nbsp;&nbsp;<!-- <i class="fas fa-chevron-down"></i> -->
                          <img id="moreButton" src="<%= request.getContextPath() %>/resources/images/morebutton.png">
                      	</div>
                      	<div class="more_view" id="simple" style="display:none;">
                          <span>간략히</span>&nbsp;&nbsp;<!-- <i class="fas fa-chevron-down"></i> -->
                          <img id="moreButton_a" src="<%= request.getContextPath() %>/resources/images/morebutton.png">
                      	</div>
                      </c:if>
                  </div>
              </div>
              
              <div class="footer">
                  <div class="copyright">
                      © 2020 MusicStage<br>
                      CEO: Park Shin Woo<br>
                      주소: 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F<br>
                      전화: 1544-9970 (무료)
                  </div>
              </div>
            </div>
        </div>
    </div>
  </div>
  
  <script>
	$(".sidebar_submenu").slice(0, 6).show();
	/* 더보기 클릭하면 팔로워 모든팔로워 보이게하기 */
	var test= ($(".sidebar_submenu:hidden").length);
	
  	$("#more").on("click", function(){
  		$(".sidebar_submenu:hidden").fadeIn();
  		
  		if($(".sidebar_submenu:hidden").length == 0){
	  		$("#simple").show();
	  		$("#moreButton_a").css({"transform":"rotate( 180deg )","width":"10px","height":"10px"});
	  		$("#more").hide();
	  	}
  	});
  	
  	$("#simple").on("click", function(){
		$("#simple").hide();
		$("#more").show();
		$(".sidebar_submenu").slice(6, 1000000000).fadeOut();
	});
	
  	
  	// 닉네임 클릭하면 그사람 stage로 넘어가게하기
  	$(".sidebar_submenu").on("click", function(){
		var targetId = $(this).children("input[type=hidden]").val();
  		
		/* 첫번째는 넘어가지는데 페이지변경되고서는 
		http://localhost:8747/spring/goYouStage/goYouStage/tjdud.st >> 이렇게뜸 */
  		location.href="goYouStage.st?targetId=" + targetId;
  	});
  	
  	
 // 로그인 안되어있을 시 모달창 오픈
	var modalBg_login = document.querySelector('.modal-bg-login');
	var modalClose_login = document.querySelector('.modal-close');

	if(${loginUser.userId == null}){
		alert("회원만 사용할 수 있는 메뉴 입니다. \n 로그인 후 더 많은 STAGE를 즐기세요");
		$(modalBg_login).addClass('bg-active');
		
	
	}
	// 모달창 닫기
	$(modalClose_login).click(function(){

        $(modalBg_login).removeClass('bg-active');
    });
  </script>	
</body>
</html>