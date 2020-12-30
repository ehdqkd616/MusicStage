<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<div id="follow_list">
		<div id="follow_title"><h3 id="list_title" align= center>팔로우/팔로워 리스트</h3><input id="xButton" type="button" value="X"></div>
		<hr>
		<div id="f_tab">
			<div id="f_tab1" class="f_tab current" data-tab="ft-1">팔로워</div>
			<div id="f_tab2" class="f_tab" data-tab="ft-2">팔로우</div>
		</div>
		<hr>
		<!-- 팔로워 탭 -->
		<div class="f_list current" id="ft-1">
			<!-- 팔로워가 없을 경우 -->
			<c:if test="${empty followingList}"> 
				<div class="no_follow" align="center">
					<img class="no_f_img" src="<%= request.getContextPath() %>/resources/images/검색아이콘.png"><!-- 이미지 나중에 바꾸기 --><br>
					팔로워 목록이 없습니다
				</div>
			</c:if>
			<!-- 팔로워가 있을 경우 -->
			<!-- 누르면 그사람의 Stage로 넘기기 -->
			<c:if test="${not empty followingList}">
				<c:forEach var="member" items="${followingList}" varStatus="status">
					<c:set var="fullPath1" value="${contextPath}/resources/userProfile/${member.userId}/${member.profile_pic}"/>
					<div class="member">
						<c:choose>
							<c:when test="${not empty member.profile_pic}">
								<div class="img_area"><img class="f_img" src="${fullPath1}"></div>
							</c:when>
							<c:otherwise>
								<div class="img_area"><img class="f_img" src="<%= request.getContextPath() %>/resources/images/profileDefault.png"></div>
							</c:otherwise>
						</c:choose>
						<div class="m_nick">${member.nickName}</div>
						<input class="m_button" type="button" value="메세지보내기">
						<input class="hidden_memberCount1" type="hidden" value="${status.index}">
						<input class="hidden_userId" type="hidden" value="${member.userId}">
					</div>
				</c:forEach>
			</c:if>
		</div>
		
		<!-- 팔로우 탭 -->
		<div class="f_list" id="ft-2">
			<!-- 팔로우가 없을 경우 -->
			<c:if test="${empty followerList}">
				<div class="no_follow" align="center">
					<img class="no_f_img" src="<%= request.getContextPath() %>/resources/images/검색아이콘.png"><!-- 이미지 나중에 바꾸기 --><br>
					팔로우 목록이 없습니다
				</div>
			</c:if>
			<!-- 팔로우가 있을 경우 -->
			<!-- 누르면 그사람의 Stage로 넘기기 -->
			<c:if test="${not empty followerList}">
				<c:forEach var="member" items="${followerList}" varStatus="status">
					<c:set var="fullPath2" value="${contextPath}/resources/userProfile/${member.userId}/${member.profile_pic}"/>
					<div class="member">
						<c:choose>
							<c:when test="${not empty member.profile_pic}">
								<div class="img_area"><img class="f_img" src="${fullPath2}"></div>
							</c:when>
							<c:otherwise>
								<div class="img_area"><img class="f_img" src="<%= request.getContextPath() %>/resources/images/profileDefault.png"></div>
							</c:otherwise>
						</c:choose>
						<div class="m_nick">${member.nickName}</div>
						<input class="m_button" type="button" value="메세지보내기">
						<input class="hidden_memberCount2" type="hidden" value="${status.index}">
						<input class="hidden_userId" type="hidden" value="${member.userId}">
					</div>
				</c:forEach>
			</c:if>
		</div>            
      </div>
	
	<div class="modal_layer"></div>
	
	<script>
		
		var followingAllCount = ${followingAllCount};
		var followerAllCount = ${followerAllCount};
		
		$("#ft-1").scroll(function(){
			
			var memberCount = $("#ft-1").find(".hidden_memberCount1:last").val();
			
			var data = {"memberCount" : memberCount};
			
			var currentScrollTop = $("#ft-1").scrollTop();
					
			var list_height = $("#ft-1").height();
			
			var member_height = (parseInt(memberCount)+1) * 50;
			
			var stand = member_height - list_height;
			
			if(currentScrollTop == stand && (parseInt(memberCount)+1) % 20 == 0 && (parseInt(memberCount)+1) >= 20){
				
				$.ajax({
					type: "post",
					url: "getFollowerList.st",
					contentType: "application/json; charset=utf-8",
					data: JSON.stringify(data),
					success: function(data){
						var str = "";
						if(data != ""){
							$(data).each(function(){
								
								var path = "<%= request.getContextPath() %>/resources/userProfile/"
								path += this.userId;
								path += "/";
								path += this.profile_pic;
								
								str += "<div class=" + "'member'" + ">";
								if(this.profile_pic != null){
								str	+= "<div class=" + "'img_area'" + "><img class=" + "'f_img'" + "src=";
								str += path;
								str += "></div>";
								} else {
								str	+= "<div class=" + "'img_area'" + "><img class=" + "'f_img'" + "src=" + "'<%= request.getContextPath() %>/resources/images/profileDefault.png'" + "></div>";	
								}
								str	+= "<div class=" + "'m_nick'" + ">" + this.nickName + "</div>";
								str	+=	"<input class=" + "'m_button'" + "type=" + "'button'" + "value=" + "'메세지보내기'" + ">";
								str	+=	"<input class=" + "'hidden_memberCount'" + "type=" + "'hidden'" + "value=" + this.index + ">";
								str += "<input class=" + "'hidden_userId'" + "type=" + "'hidden'" + "value=" + this.userId + ">";
								str	+=	"</div>";
								
							});
							
							$("#ft-1").find(".member:last").after(str);
						}					
					}
				});	
			
			} else if((parseInt(memberCount)+1) >= followingAllCount){
				return false;
			}
		});
		
		$("#ft-2").scroll(function(){
			
			var memberCount = $("#ft-2").find(".hidden_memberCount2:last").val();
			
			var data = {"memberCount" : memberCount};
			
			var currentScrollTop = $("#ft-2").scrollTop();
					
			var list_height = $("#ft-2").height();
			
			var member_height = (parseInt(memberCount)+1) * 50;
			
			var stand = member_height - list_height;
			
			if(currentScrollTop == stand && (parseInt(memberCount)+1) % 20 == 0 && (parseInt(memberCount)+1) >= 20){
				
				$.ajax({
					type: "post",
					url: "getFollowingList.st",
					contentType: "application/json; charset=utf-8",
					data: JSON.stringify(data),
					success: function(data){
						var str = "";
						if(data != ""){
							$(data).each(function(){
								
								var path = "<%= request.getContextPath() %>/resources/userProfile/"
								path += this.userId;
								path += "/";
								path += this.profile_pic;
								
								str += "<div class=" + "'member'" + ">";
								if(this.profile_pic != null){
								str	+= "<div class=" + "'img_area'" + "><img class=" + "'f_img'" + "src=";
								str += path;
								str += "></div>";
								} else {
								str	+= "<div class=" + "'img_area'" + "><img class=" + "'f_img'" + "src=" + "'<%= request.getContextPath() %>/resources/images/profileDefault.png'" + "></div>";	
								}
								str	+= "<div class=" + "'m_nick'" + ">" + this.nickName + "</div>";
								str	+=	"<input class=" + "'m_button'" + "type=" + "'button'" + "value=" + "'메세지보내기'" + ">";
								str	+=	"<input class=" + "'hidden_memberCount'" + "type=" + "'hidden'" + "value=" + this.index + ">";
								str += "<input class=" + "'hidden_userId'" + "type=" + "'hidden'" + "value=" + this.userId + ">";
								str	+=	"</div>";
								
							});
							
							$("#ft-2").find(".member:last").after(str);
						}					
					}
				});	
			
			} else if((parseInt(memberCount)+1) >= followingAllCount){
				return false;
			}
		});
		
	
		$(document).on("click", ".m_nick", function(e){
			
			var _this = $(e.target);
			var targetId = _this.next().next().next().val();
			
			var path = "goYouStage.st?targetId=" + targetId;
			location.href = path;
		});
		
		$(document).on("click", ".m_button", function(){
			alert("메세지 버튼");
		});
	</script>
</body>
</html>