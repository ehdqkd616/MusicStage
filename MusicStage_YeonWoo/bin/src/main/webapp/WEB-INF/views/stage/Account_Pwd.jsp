<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>계정수정 - 비밀번호변경</title>
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
	
	#pwd_m{ border-left: 3px solid black; }
	
	#menu li:hover{ border-left: 3px solid #DBDBDB; }
	
	
	/* 탭안의 내용 */
	#accountContent{ width: auto; min-height: 400px; display: inline-block; border-left : 1px solid #DBDBDB; }
	
	/* 프로필 이미지 부분 */
	#p_img{ width: 60px; height: 60px; border-radius: 100px; display: inline-block; margin-left: 90px; margin-top: 40px;}
	
	#p_img img{ width: 100% }
	
	#p_info{ display: inline-block; position: relative; left: 10px;}
	
	#p_nick{ font-weight: bold; font-size: 20px; }
	
	
	/* 비밀번호 변경입력부분 */
	#a_modify{margin-left: 60px; margin-top: 40px;}
	
	.m_pwd{ margin-bottom: 15px; }
	
	.pwdText { width: 120px; font-size: 15px; display: inline-block; text-align: right; vertical-align: middle;}
	
	input[type=password] {width: 400px !important; height: 25px !important; margin-left: 10px; width: 270px; border: 1px solid #DBDBDB; 
	border-radius: 4px; text-indent: 10px !important; display: inline-block;}
	
	
	/* 비밀번호 변경 버튼 */
	
	#b_success{ width: 105px; height: 30px; border: none; margin-left: 210px;
	
	background: #521110; color: white; border-radius: 4px; margin-top: 25px;}

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
					<form action="updatePwd.st" method="post" onsubmit="return changePwd();">
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
						
						<div id="a_modify">
							<div class="m_pwd"><div class="pwdText">이전 비밀번호 : </div><input id="before_pwd" type="password" placeholder="현재 비밀번호를 입력 해 주세요."></div>
							<input type="hidden" id="hidden_before" value="false">
							<div class="m_pwd"><div class="pwdText">새 비밀번호 : </div><input id="new_pwd1" type="password" name="password" placeholder="8~25자 사이의 최소 하나의 문자 및 하나의 숫자가 있어야합니다."></div>
							<input type="hidden" id="hidden_dup" value="false">
							<div class="m_pwd"><div class="pwdText">새 비밀번호 확인 : </div><input id="new_pwd2" type="password" placeholder="새로운 비밀번호를 한번 더 입력 해 주세요."></div>
							<input type="hidden" id="hidden_new" value="false">
						</div>
							
						<input id="b_success" type="submit" value="비밀번호 변경">
					</form>
				</div>
			</div>
        </div>
	</section>
	
	<script>
		$("#before_pwd").on("blur", function(){
			
			var originPwd = $("#before_pwd").val();
			
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
						$("#hidden_before").val("true");
					} else{
						$("#hidden_before").val("false");
					}
				}
			})
		});
		
		$("#new_pwd1").on("blur", function(){
			
			var originPwd = $("#before_pwd").val();
			var new_pwd1 = $("#new_pwd1").val();
			var pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
			
			if(originPwd === new_pwd1){
				$("#hidden_dup").val("false");
			} else if(pwdReg.test(new_pwd1)){
				$("#hidden_dup").val("true");
			} else{
				$("#hidden_dup").val("false");
			}
		});
		
		$("#new_pwd2").on("blur", function(){
			
			var new_pwd1 = $("#new_pwd1").val();
			var new_pwd2 = $("#new_pwd2").val();
			
			if(new_pwd1 === new_pwd2){
				$("#hidden_new").val("true");
			} else{
				$("#hidden_new").val("false");
			}
		});
		
		function changePwd(){
			
			var before = $("#hidden_before").val();
			var dup = $("#hidden_dup").val();
			var _new = $("#hidden_new").val();
			
			if(before === "true" && dup === "true" && _new === "true"){
				return true;
			}
			
			alert("비밀번호를 다시 확인해주세요");
			return false;
		}
	</script>
</body>
</html>