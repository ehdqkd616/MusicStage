<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>계정설정-회원탈퇴</title>
<style>
	header{z-index: 1; height:50px; position: fixed;}
	
	body{font-family: 'Nanum Gothic', sans-serif; background: #FAFAFA !important;}
	
	
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
    	border: 1px solid brown;
    	margin-top:20px;
    }

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
	
	#member_out{ border-left: 3px solid black; }
	
	#menu li:hover{ border-left: 3px solid #DBDBDB; }
	
	
	/* 탭안의 내용 */
	#accountContent{ width: 690px; min-height: 400px; display: inline-block; border-left : 1px solid #DBDBDB; }
	
	
	/* 프로필 이미지 부분 */
	
	#a_profile{ margin: 40px 0;}
	
	#p_img{ width: 60px; height: 60px; border-radius: 100px;
	
			display: inline-block; position: relative; left: 90px;}
	
	#p_img img{ width: 100% }
	
	#p_info { display: inline-block; position: relative; left: 110px; vertical-align: middle; }
	
	#p_nick{ font-weight: bold; font-size: 20px; }
	
	
	
	/* 비밀번호 입력 */
	
	#a_pwd{ margin-left: 60px; margin-top: 45px;}
	
	.i_pwd{ margin-bottom: 10px; }
	
	.pwdText{ width: 130px; font-size: 15px; display: inline-block; text-align: right; vertical-align: middle;}
	
	input[type=password]{ width: 400px !important; height: 25px !important; margin-left: 10px; width: 270px; border: 1px solid #DBDBDB; 
	border-radius: 4px; text-indent: 10px !important;}
	
	
	/* 수정/취소버튼 */
	
	#b_success{ width: 70px; height: 30px; border: none; background: #521110; color: white;
	
	border-radius: 4px; margin-top: 25px; left: calc(100%/2 - 35px); position: relative;}
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
					<div align="center"><h3>정말로 탈퇴하시겠습니까?</h3></div>
					<form id="a_pwd" action="deleteMember.st" method="post" onsubmit="return deleteMember();">
						<div class="i_pwd"><div class="pwdText">비밀번호 : </div><input id="new_pwd1" type="password" placeholder= "비밀번호를 입력해주세요."></div>
						<input type="hidden" id="hidden_pwd1" value="false">
						<div class="i_pwd"><div class="pwdText">비밀번호 확인 : </div><input id="new_pwd2" type="password" placeholder= "다시한번 비밀번호를 입력해주세요."></div>
						<input type="hidden" id="hidden_pwd2" value="false">
					<input id="b_success" type="submit" value="회원탈퇴">
				</form>
				</div>
			</div>
        </div>
	</section>
	
	<script>
		$("#new_pwd1").on("blur", function(){
			
			var originPwd = $("#new_pwd1").val();
			
			var data = {
					
					"encPwd" : "${loginUser.password}",
					"originPwd" : originPwd
			};
			
			$.ajax({
				type: "post",
				url: "encodingPwd.st",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				success: function(data){
					
					if(data == "ok"){
						$("#hidden_pwd1").val("true");
					} else{
						$("#hidden_pwd1").val("false");
					}
				}
			});
		});
	
		$("#new_pwd2").on("blur", function(){
			if($("#new_pwd1").val() === $("#new_pwd2").val()){
				$("#hidden_pwd2").val("true");
			} else{
				$("#hidden_pwd2").val("false");
			}
		});
		
		function deleteMember(){
			
			var pwd1 = $("#hidden_pwd1").val();
			var pwd2 = $("#hidden_pwd2").val();
			
			if(pwd1 === "true" && pwd2 === "true"){
				return true;
			}
			
			alert("비밀번호를 다시 확인해주세요");
			return false;
		}
	</script>
</body>
</html>