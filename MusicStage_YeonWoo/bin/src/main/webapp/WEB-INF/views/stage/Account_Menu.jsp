<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul id="menu">
		<li id="profile_edit" onclick="goProfile(event);">프로필 편집</li>
		<li id="pwd_m" onclick="goProfile(event);">비밀번호 변경</li>
		<li id="interest_m" onclick="goProfile(event);">관심사 수정</li>
		<li id="member_out" onclick="goProfile(event);">회원탈퇴</li>
	</ul>
	
	<script>
		function goProfile(event){
			
			var id = event.currentTarget.id;
			
			if(id == "profile_edit"){
				location.href="goStage.st";
			} else if(id == "pwd_m"){
				location.href="goPwd.st";
			} else if(id == "interest_m"){
				location.href="goInterest.st";
			} else{
				location.href="goBreak.st";
			}
		}
	</script>
</body>
</html>