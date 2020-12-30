<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>계정설정 - 관심사 수정</title>
<style>
	/* header{z-index: 1; height:50px; position: fixed;} */
	
	body{font-family: 'Nanum Gothic', sans-serif; background: #FAFAFA !important;}
	
	
    #centerWrap{margin:0 250px; height: 800px;}
    /* #left_div{display: inline-block; width:50%; height:500px; float: left;}
    #center_div{position: relative; top:150px; height:300px; margin:0 20px;}
    #quick_menu{display: flex; font-size: 0; padding:0; margin:20px auto;}
    #quick_menu li{display: inline-block; width: 25%; font-size: 12px; list-style: none; text-align: center;}
    #quick_menu img{max-width: 80%; max-height: 50%;}
    #right_div{display: inline-block; width:50%; height:500px; float: left;} */

/*     #main_img{
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
    } */

	.section{
	  width: 100%;
	  height: 100vh;
	  margin-top: 50px;
	  z-index: 1;
	}
	
	
 	#account{ width: 900px; min-height: 400px; border: 1px solid #DBDBDB; border-radius: 4px;  margin-top: 30px; margin-left: 50px;
						background: white;	}
	
	/* 계정메뉴바 */
	#accountMenu{ width: 200px; float: left; }
	
	#Menu{ list-style: none; padding-left: 0px; margin: 0px; }
	
	#menu li { padding-bottom: 15px; padding-top: 15px; padding-left: 20px;}
	
	#interest_m{ border-left: 3px solid black; }
	
	#menu li:hover{ border-left: 3px solid #DBDBDB; }
	
	
	/* 탭안의 내용 */
	#accountContent{ width: 690px; min-height: 300px; display: inline-block; border-left : 1px solid #DBDBDB; }
	
	
	/* 프로필 이미지 부분 */
	#p_img{ width: 60px; height: 60px; border-radius: 100px; display: inline-block; margin-left: 90px; margin-top: 40px;}
	
	#p_img img{ width: 100% }
	
	#p_info{ display: inline-block; position: relative; left: 10px;}
	
	#p_nick{ font-weight: bold; font-size: 20px; }
	
	/* 수정버튼 */
	/* #i_button{ width: 120px;  height: 30px; position: relative; top: 110px; border-radius: 4px; cursor: pointer;
				 } */
	
	
	/* 모달 */
	/* #modal{ position:relative; width:100%; height:100%; z-index:1; display:none; } */
	
	/* .div_main_frame{
	    border: 1px; 
	    border-radius: 10px; 
	    width: 600px; 
	    height: 420px;
	    background-color: white;
	    border-style: solid; 
	    border-color:  #e4e5ed;
	    position:relative; 
	   	left: 250px;
	   	bottom: 300px;
	} */
	/* .headpoint{
	    text-align: center;
	     margin-top: 20px;
	} */
	/* .backbutton{
	    margin-bottom: 10px; 
	    margin-top: 10px; 
	    display: inline; 
	    float: left; 
	    margin-left: 10px;
	} */
	/* .headpoint_dot{
	    margin-bottom: 10px;
	    margin-top: 10px;
	    display: inline-block;
	    float: none;
	    margin-right: 10px;
	        
	} */
	/* .button_css5{
	    border: cornsilk;
	    border-radius: 10px; 
	    width: 480px; 
	    height: 35px;
	    margin-right: 5px;
	} */
	/* .text_p{
	    font-size: 18px; 
	    color: darkgray;
	    margin-top: 10px;
	} */
	/* .text_pp{
	    font-size: 4px;
	     text-align: center; 
	     margin-top: 20px;
	} */
	/* .table_img_frame{
	    width: 80px;
	    height: 80px;
	    display: inline-block;
	    background-color: brown;
	    margin-right: 20px;
	    margin-bottom: 10px;
	} */
	/* .table_img{
	    width: 100%; 
	    height: 100%; 
	    border-radius: 5px; 
	} */
	
	/* .modal_layer { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5);
	 				 z-index:-1; } */ 
	 				 
	#a_interest{ padding: 50px;}
	
	.interest_class{ width: 400px !important; text-align: center;}
	
	.interest_div{ margin: 20px 0;}
	
</style>
</head>
<body>
 	<%@ include file="../common/header.jsp"%>

	<section class="section">

		<%@ include file="../common/section_menubar.jsp"%>
		
		<div id="centerWrap"> <!-- 여기에다가 넣으면 됩니다 시작 -->
			<div id="account">
				
				<!-- 메뉴부분 -->
				<div id="accountMenu">
					<%@ include file="Account_Menu.jsp" %>
				</div>
					
				<!-- 내용부분 -->
				<div id="accountContent">
					<!-- 프로필부분 -->
					<div id="a_profile">
						<c:set var="fullPath" value="${contextPath}/resources/userProfile/${loginUser.userId}/${loginUser.profile_pic}"/>
						<c:choose>
							<c:when test="${not empty loginUser.profile_pic }">
								<div id=p_img><img src="${fullPath}"></div>
							</c:when>
							<c:otherwise>
								<div id=p_img><img src="<%= request.getContextPath() %>/resources/images/profileDefault.png"></div>
							</c:otherwise>
						</c:choose>
						<div id="p_info"><p id="p_nick">${loginUser.nickName}</p></div>
					</div>
					<div id="a_interest">
						<c:forEach var="interest" items="${interest}" varStatus="status">
							<div class="interest_div">취미${status.count} : <input type="text" value="${interest.like_interest_name}" class="interest_class" readonly></div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div id="modal">
				<!-- <div class="div_main_frame"> -->
					<%@ include file="Account_Interesting_modal.jsp" %>
		    	<!-- </div> -->
			</div>
	    </div>
	</section>
	
	<!-- 모달창 script -->
	<script>
		$(document).ready(function(){
			
			// 모달창 띄우기
			window.onload = function(){
				$("#modal").fadeIn("fast").css({"display":"block"});
			}
			
			
			// 모달아닌 다른곳 클릭하면 닫기
			/* $(".modal_layer").click(function(){
				$("#modal").fadeOut("fast").css({"display":"none"});
			}); */
			
			// 모달창 끄기
			$(".backbutton").click(function(){
				$("#modal").fadeOut("fast").css({"display":"none"});
			});
			
			// 잘못눌렀을때 다시누르기
			/* $("#interest_m").click(function(){
				$("#modal").fadeIn("fast").css({"display":"block"});
			}); */
			
			
		});		
	
	</script>
</body>
</html>