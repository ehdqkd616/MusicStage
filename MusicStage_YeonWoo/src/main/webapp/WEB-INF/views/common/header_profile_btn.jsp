<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Header_ProfileButton</title>
<style>
	/* 
    .icon {
        width: 40px;
        height: 40px;
    }
	
	.profile{
		margin-bottom: 5px;
	} */
	.profile_div{
		position: relative;
		display:inline;
	}
	
	
    .myPage_drop_area{
        position: absolute;
        top: 28px;
        background: rgb(254, 251, 255);
        width: 160px;
        right: 0px;
        display: none;
        flex-direction: column;
       	border-radius: 4px;
    }
    

    .myPage_itmes{
        display: flex;
        flex-direction: column;
    }

    .myPage_profile{
        display: flex;
        flex-shrink: 1;
    }

    #myPage_profile_a{
        display: flex;
        flex-grow: 1;
        align-items: center;
        padding: 10px;
    }

    .myPage_a{
        padding-left: 10px;
    }

    .myPage_drop_area a{
        display: flex;
        align-items: center;
        color: #4B4B4B;
        line-height: 40px;
        text-decoration: none;
        box-sizing: border-box;
        transition: 0.5s;
    }

    .myPage_drop_area a:hover {
        background: #A6A3A3;
    }


    #profile_photo{
        width: 45px;
	    height: 45px;
	    margin-right: 10px;
	    border-radius: 100px;
    }

    .myPage_drop_area i{
        margin-right: 10px;
    }

    #nickName_text{
        flex-grow: 1;
    }

    /* [id="myPage_chk"]:checked + div{
        display: flex;
    } */
    
    #myPage_chk:checked + div{
        display: flex;
    }

    .drop_btn{
        cursor: pointer;
    }

    .chk{
        display: none;
    }
</style>
</head>
<body>
	<div class="profile_div">
	    <label for="myPage_chk" class="drop_btn myPage_btn" id="drop_btn_myPage" style="width: 50px; height: 50px; margin-top: -11px;">
    		<c:if test="${ loginUser.profile_pic eq null }">
            <img src="<%= request.getContextPath() %>/resources/images/profileDefault.png" class="icon profile" style="width:50px !important; height: 50px !important;">
            </c:if>
           	<c:if test="${ loginUser.profile_pic ne null }">
           	<img src="${pageContext.request.contextPath}/resources/userProfile/${loginUser.userId}/${loginUser.profile_pic}" class="icon profile" style="width:50px !important; height: 50px !important; border-radius: 40px;">
           	</c:if>
	    </label>
	    <input type="checkbox" id="myPage_chk" class="chk">
	    
	    <div class="myPage_drop_area">
	        <div class="myPage_profile">
	            <a href="goStage.st" id="myPage_profile_a">
	            	<c:if test="${ loginUser.profile_pic eq null }">
	                <img src="<%= request.getContextPath() %>/resources/images/profileDefault.png" id="profile_photo">
	                </c:if>
	               	<c:if test="${ loginUser.profile_pic ne null }">
	               	<img src="${pageContext.request.contextPath}/resources/userProfile/${loginUser.userId}/${loginUser.profile_pic}" id="profile_photo">
	               	</c:if>
	                <span id="nickName_text">${loginUser.nickName}</span>
	            </a>
	        </div>
	
             <div class="myPage_itmes">
               <a href="#" class="myPage_a" id="mystage_btn"><i class="fas fa-user"></i>MyStage</a>
                 <c:if test="${!empty(registerUser_Pro) }">
                  <a href="${pageContext.request.contextPath}/final.fo" class="myPage_a"><i class="fab fa-itunes-note"></i>전문가수정/확인</a>
               </c:if>
                <c:if test="${empty(registerUser_Pro)}">
                  <a href="${pageContext.request.contextPath}/final2.fo" class="myPage_a"><i class="fab fa-itunes-note"></i>전문가등록</a>
               </c:if>
               <a href="#" class="myPage_a" id="setting_btn"><i class="fas fa-cog"></i>계정관리</a>
               <c:if test="${loginUser.authority eq '99'}">
               	  <a href="#" class="myPage_a" id="admin_btn"><i class="fas fa-cog"></i>관리자페이지</a>
               </c:if>
               <a href="#" class="myPage_a" id="logout_btn"><i class="fas fa-sign-out-alt"></i>로그아웃</a>
           </div>
	    </div>
    </div>
    
	<script>
		$("#logout_btn").click(function(){
			location.href="logout.me";
		});
		
		$("#mystage_btn").click(function(){
			location.href="goMyStage.st";
		});
		
		$("#setting_btn").click(function(){
			location.href="goStage.st";
		});
		
		$("#admin_btn").click(function(){
			location.href="noticeList.ad";
		});
	</script>
</body>
</html>