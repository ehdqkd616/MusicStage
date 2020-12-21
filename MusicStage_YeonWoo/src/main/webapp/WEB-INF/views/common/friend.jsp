<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"
    %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <title>Header</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
   	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/default.css" type="text/css">
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.circle2 {
	cursor:pointer;
	margin-top:100px;
	background-repeat:no-repeat;
	/* border: 1px solid #ff0000; */
	display:inline-block;
	margin-left:5px;
	width: 70px;
	height: 70px;
	border-radius: 75px;
	text-align: center;
	margin: 0 auto;
	font-size: 12px;
	color: #fff;
	vertical-align: middle;
	line-height: 100px;
	
}
.username{
	
	vertical-align: middle;
	text-align: center;
		display:inline-block;
}
</style>
</head>

<body>
<form action="goYouStage.st?" id="target">
	<div style="margin-top:100px; top:80px; height:115px; left:20px; right:0px;   ">
		<div id="reg" style="width:600px;   margin: 0 auto;   border: 2px; border-style: solid; border-color:#DBDBDB; border-radius: 10px; text-align: center;  ">
			<c:forEach items="${Rv}"  varStatus="status">
				<c:set value="${status.count}" var="dgdg"/>
				<div class="gg" style="width: 80px; height:85px;  height: 110px; display: inline-block; margin-left:10px; margin-right:30px; margin: 0 auto; text-align: center;" >
					<c:choose>
					<c:when test="${!empty Rv[status.index].profile_pic }">
						<label for="hiddeninfo" class="circle2" style="margin-top:10px; background :url('${pageContext.request.contextPath}/resources/userProfile/${Rv[status.index].userId}/${Rv[status.index].profile_pic}'); 
																		background-position: center center; background-size: cover;">
						</label>
						<input type="hidden"   value="${Rv[status.index].userId}">	
						<span class="username">${Rv[status.index].nickName}</span>
					</c:when>
					<c:otherwise>
						<label for="hiddeninfo" class="circle2" style="margin-top:10px; background-image :url('${pageContext.request.contextPath}/resources/images/profileDefault.png');  background-position: center center;">
						</label>
						<input type="hidden"   value="${Rv[status.index].userId}">	
						<span class="username">${Rv[status.index].nickName}</span> 
					</c:otherwise>
					</c:choose>
				</div>
			</c:forEach>
			
			<input type="hidden" id="hiddenInfo" name="targetId">
		</div>
	</div>
</form>
	<script type="text/javascript">
		var nnv = 6;
			var nnva = 0;
			$(document).ready(function(){
				var nnv = 6;
				var nnva = 0;
				if(${total} < 7){
					index1(nnva,${total});
					}else{
				index(nnv,nnva);
				setInterval(num,2000);
						}
					});
			function nnum(){
					if(nnv == ${total}-6){
						nnv = 0;
						nnva = 6;
						}else{
							nnv++;
							nnva++;
							}
					index(nnv,nnva);
			};
			function index1(nnva,nnv){
				$('#reg div').css('display','none');	
			 for(nnva; nnva<=${total}; nnva++){
				$('#reg div:nth-child('+nnva+')').css('display','inline-block');	
				};
		 	}
			
		 function index(nnv,nnva){
				$('#reg div').css('display','none');	
			 for(nnva; nnva<=nnv; nnva++){
				$('#reg div:nth-child('+nnva+')').css('display','inline-block');	
				};
		 	}
		function num(){
				$('#reg div:nth-child('+nnv+')').css('display','inline-block');	
				$('#reg div:nth-child('+nnva+')').css('display','none');	
				if(nnv == ${total}){
					nnv = 6;
					nnva = 0;
					index(nnv,nnva);
					}else{
						nnv++;
						nnva++;
			}
		}
		$('.gg label').click(function(){
		var asdf=	$(this).next().val();
					$('#hiddenInfo').val(asdf); 
					//var path = "goYouStage.st?targetId=" + targetId;
					$('#target').submit();
			});
		
		

	</script>



</body>
</html>