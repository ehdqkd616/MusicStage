<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%!
    //	임시로 설정함
    	String user_id = "";
    %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Home</title>
<style>
	header{z-index: 1; height:50px; position: fixed;}
    #centerWrap{margin:0 250px; height: 800px;}
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
    	/* border: 1px solid brown; */
    	margin-top:20px;
    }

	.section{
	  width: 100%;
	  height: 100vh;
	  margin-top: 50px;
	  z-index: 2;
	}
</style>
</head>
<body>
	
	<!--  상위 검색 및 내비 부분 -->
	
 		<%@ include file="/WEB-INF/views/common/header.jsp" %>
 
 	
 	
	<section class="section">
		<div id="centerWrap"> 
            <div id="left_div">
                <div id="center_div">
                    <div>
                    <!-- 중간 검색 부분 -->
                         <%@ include file="/WEB-INF/views/common/search.jsp" %>
                    </div>
                    <div>
                        <ul id="quick_menu">
                            <li><a href="socialFeed.bo"><img src="${pageContext.request.contextPath}/resources/images/social.png" alt="소셜"></a></li>
                           	<li><a href="findFeed.bo"><img src="${pageContext.request.contextPath}/resources/images/find.png"></a></li>
                            <li><a href="columnFeed.bo"><img src="${pageContext.request.contextPath}/resources/images/review.png"></a></li>
                            <li><a href="reviewFeed.bo"><img src="${pageContext.request.contextPath}/resources/images/column.png"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="right_div"><img src="<%= request.getContextPath() %>/resources/images/headset.jpeg" id="main_img"></div>
            <div id="slide_menu">
            <!-- 하단 인기 서비스 부분 -->
                <%@ include file="/WEB-INF/views/common/slide_modal.jsp" %>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
	</section>
	
	<script>
		$(document).ready(function(){
			var msg = '${msg}';
			if(msg != ""){
				alert(msg);
				console.log(msg);
				if(msg == "로그인 후 이용하세요."){
					$(".modal-btn").click();
				}
			}
		});
	</script>
</body>
</html>