<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.musicstage.spring.member.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	ArrayList<Interest> list = new ArrayList<>();
	list.add(new Interest(1, "노래/보컬"));
	list.add(new Interest(2, "기타/베이스"));
	list.add(new Interest(3, "드럼"));
	list.add(new Interest(4, "피아노"));
	list.add(new Interest(5, "현악기"));
	list.add(new Interest(6, "관악기"));
	list.add(new Interest(7, "작사/작곡"));
	list.add(new Interest(8, "밴드/합주"));
	list.add(new Interest(9, "인디음악"));
	list.add(new Interest(10, "랩/힙합/DJ"));
	list.add(new Interest(11, "클래식"));
	list.add(new Interest(12, "재즈"));
	list.add(new Interest(13, "뉴에이지"));
	list.add(new Interest(14, "락/메탈"));
	list.add(new Interest(15, "일렉트로닉"));
	list.add(new Interest(16, "트로트"));
	list.add(new Interest(17, "국악"));
	list.add(new Interest(18, "찬양/CCM"));
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Header_SignupModal</title>
	<link href="<c:url value="/resources/css/membership.css?after"/>" rel="stylesheet">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
    
    .modal-btn2{
        display: none;
    }

    .modal-bg2{
        position: fixed;
        width: 100%;
        height:100vh;
        top:0;
        left:0;
        background-color: rgba(0,0,0,0.5);
        display:flex;
        justify-content: center;
        align-items: center;
        visibility: hidden;
        opacity:0;
        transition: visibility 0s opacity 0.5s;
        z-index: 3;
    }

    .bg-active2{
        visibility: visible;
        opacity: 1;
    }

    .modal2{
        position:relative;
        background-color: white;
        width:350px;
        height:350px;
        display: flex;
        align-items:center;
        flex-direction: column;
        border-radius: 10px;
    }

	.interest_table{
		border-spacing: 5px;
    	border-collapse: separate;
	}
	
	.img_div{
		width:50px;
		height:50px;
		border: 1px solid black;
	}
	
	.chooseFour{
		margin: auto;
		padding: 5px;
	}
	
	tr:last-child{
		text-align: left;
	}
	
	.hover_name{
		opacity: 0;
		background: #000000;
		height:100%;
		position: relative;
	}
	
	.hover_name p{
		width:48px;
		height: 100%;
		word-break:keep-all;
		position: absolute;
    	top: 50%;
    	left: 50%;
    	margin-left: -24px;
    	margin-top: -12px;
    }
	
	.img_div:hover .hover_name{
		opacity: 0.5; 
		text-align: center; 
		color: #ffffff;
	}
	
</style>
</head>
<body>
    <input type="button" class="modal-btn2">

    <div class="modal-bg2">
        <div class="modal2">
            <form id="interest_frm" action="updateInterest.st" accept-charset="UTF-8" method="post" style="display: inline; margin: 0 auto;">
	        	<div class="headpoint">
		      		<span class="backbutton">
		                <img src="${contextPath}/resources/images/back.png" style="width: 15px;">
		            </span>
		      		<c:forEach var="k" begin="1"  end="4" >
			            <span class="headpoint_dot">
			                <img src="${contextPath}/resources/images/gg.png " style="width: 5px;">
			            </span>
		      		</c:forEach>
		            <p class="text_p">관심사를 선택해 주세요!</p>
				</div>
	        <div style="text-align:center; width:280px; margin-left: auto; margin-right: auto; margin-top: 10px;" >
		       <c:set var="i" value="0" />
		       <c:set var="j" value="5" />
		       <table class="interest_table">
		       		<c:forEach var="list" items="${list}" varStatus="status">
		       			<c:if test="{i%j == 0}">
		       				<tr>
		       			</c:if>
		       				<td class="table_img_frame">
		       					<c:if test="${fn:indexOf(list.like_interest_name, '/') == -1 }">
		       						<div class="img_div" id="img_div${status.count}	" style="background-image:url(<%= request.getContextPath() %>/resources/images/member_interesting/${list.like_interest_name}.jpeg); background-size:cover" value="${list.like_interest_name}">
		       							<div class="hover_name">
		       								<p><c:out value="${list.like_interest_name}"/></p>
		       							</div>
		       						</div>
		       					</c:if>
		       					<c:if test="${fn:indexOf(list.like_interest_name, '/') != -1 }">
		       						<div class="img_div" id="img_div${status.count}	" style="background-image:url(<%= request.getContextPath() %>/resources/images/member_interesting/${fn:replace(list.like_interest_name, '/', ',')}.jpeg); background-size:cover" value="${list.like_interest_name}">
		       							<div class="hover_name">
		       								<p><c:out value="${list.like_interest_name}"/></p>
		       							</div>
		       						</div>
		       					</c:if>	
		       				</td>
		       			<c:if test="${i%j == j-1 }">
		       				</tr>
		       			</c:if>
		       		<c:set var="i" value="${i+1}" />
	       			</c:forEach>
		       </table>      
	        </div>
        	<input type="hidden" name="interests" id="hidden_interest">
        </form>
	      	<button class="button_css5 chooseFour">
	      		<p style="font-size: 5px; color: darkgray;" id="four">4개 선택</p>
	      	</button>
	    </div>
	</div>
    <script>
        var modalBg_signup = document.querySelector('.modal-bg2');

        $(document).ready(function(){
            modalBg_signup.classList.add('bg-active2');
        });
        
        var list = [];
        var count = 0;
        
        $(".img_div").on("click", function(event){
        	var target = event.currentTarget;
        	var like_interest = target.getAttribute("value");
        	var origin_like_interest = target.getAttribute("value");
        	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;
        	
        	if(like_interest.indexOf("/") != -1){
        		like_interest = like_interest.replace(regExp, ",");
        	}
        	
        	var list_length = list.length;
        	var check_img = "<%= request.getContextPath() %>/resources/images/member_interesting/check.png";
			var origin_img_name = "<%= request.getContextPath() %>/resources/images/member_interesting/" + like_interest + ".jpeg";
			
			if(list_length <= 3 && list.indexOf(like_interest) == -1){
        		count++;
        		$(this).css({"background-image" : "url(" + check_img + ")", "background-size" : "cover"});
        		list.push(origin_like_interest);
        		$("#four").html(4-count + "개의 선택이 필요합니다.");
        		$("#four").css("color", "red");
        	} else if(list.indexOf(like_interest) >= 0){
        		count--;
        		list.splice(list.indexOf(origin_like_interest), 1);
        		$(this).css({"background-image" : "url(" + origin_img_name + ")", "background-size" : "cover"});
        		$("#four").html(4-count + "개의 선택이 필요합니다.");
        		$("#four").css("color", "red");
        	}
			
			if(list.length >= 4){
				$("#hidden_interest").val(list);
			}
        });
        	
        $("#four").on("click", function(){
        	$("#interest_frm").submit();
        });
    </script>
</body>
</html>