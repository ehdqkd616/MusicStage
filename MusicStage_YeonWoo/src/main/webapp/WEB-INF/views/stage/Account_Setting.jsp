<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>계정설정</title>
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
	
	
	#account{ width: 900px; min-height: 600px; border: 1px solid #DBDBDB; border-radius: 4px;  margin-top: 30px; margin-left: 50px;
						background: white;	margin: auto;}
	
	/* 계정메뉴바 */
	#accountMenu{ width: 200px; float: left; }
	
	#Menu{ list-style: none; padding-left: 0px; margin: 0px; }
	
	#menu li { padding-bottom: 15px; padding-top: 15px; padding-left: 20px;}
	
	#profile_edit{ border-left: 3px solid black; }
	
	#menu li:hover{ border-left: 3px solid #DBDBDB; }
	
	
	/* 탭안의 내용 */
	#accountContent{ width: 690px; min-height: 400px; display: inline-block; border-left : 1px solid #DBDBDB; }
	
	
	/* 프로필 이미지 부분 */
	
	#p_img{ width: 60px; height: 60px; border-radius: 100px;
	
			display: inline-block; position: relative; left: 90px; top: 40px;}
	
	#p_img img{ width: 100% }
	
	#p_info { display: inline-block; position: relative; left: 110px; top: 40px; vertical-align: middle; }
	
	#img_file { display: none;}
	
	#p_nick{ font-weight: bold; font-size: 20px; }
	
	.p_button{ color: #521110; margin-top: 5px; }
	.p_button:hover{ text-decoration: underline; }
	
	
	/* 계정수정내용 */
	
	#a_modify{ margin-left: 50px; margin-top: 60px;}
	
	#a_modify div{ margin-bottom: 20px; }
	
	.m_text { width: 90px; font-size: 15px; display: inline-block; text-align: right; vertical-align: middle; }
	
	input[type=text] { width: 400px !important; height: 25px !important; margin-left: 10px; width: 270px; border: 1px solid #DBDBDB; 
	border-radius: 4px; text-indent: 10px !important;}
	
	#m_intro { min-width: 270px; max-width: 400px; min-height: 45px; max-height: 200px; vertical-align: top; margin-left: 10px;
	
	border: 1px solid #DBDBDB; border-radius: 4px; text-indent: 10px;}
	
	.m_button { width: 70px; height: 28px; border:none; border-radius: 4px; background: #521110; color: white; margin-left: 20px;}
	
	
	/* 수정/취소버튼 */
	
	#a_button { margin-top: 25px; margin-bottom: 25px; text-align: center; }
	
	#b_success{ width: 70px; height: 30px; border: none; background: #521110; color: white; border-radius: 4px; margin-right: 10px;}
	
	#b_cancel{ width: 40px; height: 30px; border: 1px solid #DBDBDB; border-radius: 4px; }
	
	#hidden_nick{
		display: none;
		margin-left: 100px;
		border: none;
		color: red;
	}
	
	#auth, #random{ margin-left: 100px;}
	
	.m_center{ text-align: center}
	
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
			<c:set var="fullPath" value="${contextPath}/resources/userProfile/${loginUser.userId}/${loginUser.profile_pic}"/>
			<c:choose>
				<c:when test="${not empty loginUser.profile_pic }">
					<div id=p_img><img src="${fullPath}"></div>
				</c:when>
				<c:otherwise>
					<div id=p_img><img src="<%= request.getContextPath() %>/resources/images/profileDefault.png"></div>
				</c:otherwise>
			</c:choose>
			<div id="p_info">
				<p id="p_nick">${loginUser.nickName}</p>
				<div id="p_changeImg">
					<form id="a_profile" method="post" enctype="multipart/form-data">
						<input name="img_file" id="img_file" type="file" accept=".jpg, .jpeg, .png, .gif, .bmp">
						<label class="p_button" for="img_file">프로필 사진 바꾸기</label>
					</form>
				</div>
			</div>
			<form action="updateMember.st" method="post">
				<div id="a_modify" >
					<div><p class="m_text">아이디 : </p><input name="userId" id="m_id" class="m_center" type="text" value="${loginUser.userId}" style="width: 400px !important" readonly></div>
					<div><p class="m_text">닉네임 : </p><input name="nickName" id="m_nick" class="m_center" type="text" value="${loginUser.nickName}"><input id="nick_btn" class="m_button" type="button" value="중복확인"></div>
					<input id="hidden_nick" type="text" value="">
					<input id="orgin_nick" type="hidden" value="${loginUser.nickName}">
					<div><p class="m_text">이름 : </p><input name="userName" id="m_name" class="m_center" type="text" value="${loginUser.userName}" readonly></div>
					<div><p class="m_text">이메일 : </p><input name="email" id="m_email" class="m_center" type="text" value="${loginUser.email}"><input id="email_btn" class="m_button" type="button" value="이메일 인증"></div>
					<input type="hidden" id="random">
					<div><p class="m_text">핸드폰 : </p><input name="phone" id="m_phone" class="m_center" type="text" value="${loginUser.phone}"></div>
					<div><p class="m_text">주소 : </p><input name="address" id="m_add" class="m_center" type="text" value="${loginUser.address}"></div>
					<div><p class="m_text">url : </p><input name="url_address" id="m_url" class="m_center" type="text" value="${loginUser.url_address}"></div>
					<div><p class="m_text">자기소개 : </p><textarea name="introduce" id="m_intro" class="m_center" placeholder="자기소개를 써주세요~">${loginUser.introduce}</textarea></div>
				
				</div>
		
				<div id="a_button">
					<input id="b_success" type="submit" value="수정완료">
					<input id="b_cancel" type="button" value="취소">
				</div>
			</form>
		</div>
	
	</div>
            
    </div>
	</section>
	
	<script>
		$("#img_file").on("change", function(){
			
			var userId = $("#m_id").val();
			var form = $("#a_profile")[0];
			var formData = new FormData(form);
			formData.append("img_file", $("input[type=file]")[0].files[0]);
			
			$.ajax({
				type: "post",
				enctype: "multipart/form-data",
				url: "profile/uploadImg.st",
				data: formData,
				processData: false,
				contentType: false,
				success: function(data){
					alert("프로필 사진이 변경되었습니다");
				}
			});
		});
		
		
		const imageTag = document.getElementById("img_file");
		imageTag.addEventListener('change', function() {

		    loadImg(this); // 이미지 파일을 읽어 img src에 넣는 함수
		});

		function loadImg(value) {
		    if(value.files && value.files[0]) {
		        var reader = new FileReader();

		        reader.onload = function (e) {
		            document.querySelector("#p_img").querySelector("img").setAttribute('src', e.target.result);
		        }

		        reader.readAsDataURL(value.files[0]);
		    }
		}
		
		$("#nick_btn").on("click", function(){
			
			var nickName = $("#m_nick").val();
			var orgin_nick = $("#orgin_nick").val();
			
			if(nickName == orgin_nick){
				$("#hidden_nick").hide();
				$("#a_modify div:nth-child(2)").css("margin-bottom", "20px");
				return false;
			} else{
				$.ajax({
					url: "isExistNickName.st",
					type: "get",
					data: {nickName:nickName},
					dataType: "text",
					success:function(data){
						
						console.log(data);
						
						if(data == "true"){
							$("#hidden_nick").val("사용 가능한 닉네임입니다");
							$("#a_modify div:nth-child(2)").css("margin-bottom", "0");
							$("#hidden_nick").show();
						} else{
							$("#hidden_nick").hide();
							$("#a_modify div:nth-child(2)").css("margin-bottom", "20px");
						}
					}
				});	
			}
			
		});
		
		$(function(){
			 
			 $.ajax({
				 url: "random.com",
				 success: function(data){
					 obj = JSON.parse(data);
					 console.log(obj);
					 $("#random").val(obj);
				 }
			 })
		 });
		
		$("#email_btn").on("click", function(){
			
			$("#auth").remove();
			
			var input = $("<input>");
			input.attr({type:"text", id: "auth", placeholder: "인증번호를 입력해주세요"});
			
			$.ajax({
				 url: "emailCheck.com",
				 data: {email: $("#m_email").val(), random: $("#random").val()},
				 async:false,
				 success: function(data){

					 if(data == "ok"){
					 	alert("사용가능한 이메일입니다. 인증번호를 입력해주세요");
					 	input.insertAfter($("#email_btn"));
					 } else if(data == "false"){
						 alert("다시 시도해주세요");
					 }
				 },
				 error:function(data){
					 alert("이메일을 확인해주세요");
					 return false;
				 }
			 });
		});
		
		function jusoCallBack(address){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.getElementById("address").value = address;
		
		}
		
		$('#m_add').on('click',function(){

		      var popupX = (window.screen.width/2)-(570/2);
		      var popupY = (window.screen.height/2) - (420/2);
		      var pop = window.open("address.me","pop","width=570,height=420,left="+popupX +",top="+popupY+",screen"+popupX+",screenY="+popupY+",scrollbars=yes, resizable=yes"); 
		});
		
		
		$("#b_cancel").on("click", function(){
			
			location.href = "allFeed.bo";
		});
		
	</script>
</body>
</html>