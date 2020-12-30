<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="/resources/css/membership.css?after"/>"
	rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="default.css/__MACOSX/default.css" />
<title>Document</title>
<style>

.create_label{
margin-left:110px; 
width:500px; 
height:30px; 
border-color: #e4e5ed; 
 margin-top: 10px; 
 border-radius: 8px; 
 border-style: solid; 
 border-width: 1px;
 display: inline-block; 
 border-color: e4e5ed;
}
.gg  {
	list-style:none;
	width: 500px;
	border-color: #e4e5ed;
	border-radius: 8px;
	border-style: solid;
	border-width: 1px;
	display: inline-block;
	border-color: e4e5ed;
	text-align: center;
	z-index: 5;
	position: absolute;
	left: 243px;
	
}
.na{
	list-style:none;
	width: 500px;
	border-color: #e4e5ed;
	border-radius: 8px;
	border-style: solid;
	border-width: 1px;
	display: none;
	border-color: e4e5ed;
	text-align: center;
	background: white;
}

.Inpo li {
	border-color: #e4e5ed;
	margin-right: 10px;
	display: inline-block;
	margin-top: 0px;
	border-radius: 8px;
	border-style: solid;
	border-width: 1px;
}

#list li {
	background-color: white;
}

#list {
	width: 500px;
	height: 30px;
	border-color: #e4e5ed;
	margin-top: 20px;
	border-radius: 8px;
	border-style: solid;
	border-width: 1px;
	display: block;
	float: right;
	border-color: e4e5ed;
	z-index: 1;
}

.checkbox {
	border-color: #e4e5ed;
	width: 460px;
	height: 30px;
	margin-top: 20px;
	border-radius: 8px;
	border-style: solid;
	border-width: 1px;
	display: inline;
	border-color: e4e5ed;
}

.s_title {
	font-weight: bolder;
	font-size: 19px;
	float: left;
	display: inline-block;
	width: 80px;
}

form  {
	padding-left: 120px;
	padding-right: 90px;
	padding-top: 60px;
	z-index: 0;
	position: relative;
}



</style>
</head>
<body>
<!-- 	<div id="content_frame" style="display: none;"> -->
<!-- 	<div style="margin-left: 115px; margin-top: 60px;"> -->
		<c:choose>
			<c:when test="${loginUser.pro_approve eq 'Y'.charAt(0)}">
					<div style="margin-left: 115px; margin-top: 60px;">
					<h3>전문가 수정이 필요하신가요?</h3>
					<input type="button" class="updatePro" value="수정">
					<input type="button" onclick="home()" value="돌아가기">
					<script type="text/javascript">
						$('.updatePro').click(function(){
							$('#content_frame').css('display','block');
							$('.updatePro').css('display','none');
						
							$('h3').css('display','none');
							});
							function home(){
							location.href='home.do';
							}
					</script>
					</div>
				<div id="content_frame" style="display: none;">
				<form action="update.fo" method="POST" enctype="multipart/form-data" >
			</c:when>
			<c:when test="${registerUser_Pro.register_approve eq 'N'.charAt(0)}">
					<div style="margin-left: 115px; margin-top: 60px;">
					<h3>관리자에 판단에 의해 수정이 필요합니다.</h3>
					<input type="button" class="updatePro" value="수정">
					<input type="button" onclick="home()" value="돌아가기">
					<script type="text/javascript">
						$('.updatePro').click(function(){
							$('#content_frame').css('display','block');
							$(this).css('display','none');
							$('h3').css('display','none');
							});
							function home(){
							location.href='home.do';
							}
					</script>
					</div>
				<div id="content_frame" style="display: none;">
				<form action="update.fo" method="POST" enctype="multipart/form-data" >
			</c:when>
			<c:otherwise>
					<h3>전문가 심사 중입니다...</h3>
					<input type="button" onclick="home()" value="돌아가기">
						<script type="text/javascript">
							function home(){
							location.href='home.do';
							}
					</script>
					<div id="content_frame" style="display: none;">
			</c:otherwise>
		</c:choose>
		
				<!--  전문 분야  시작 -->	
			<form action="expert.me" method="POST" enctype="multipart/form-data" >
				<input type="checkbox" id="check" style="display: none;">
				<input type="hidden" id="num1" name="specialrt_field" value="${registerUser_Pro.specialrt_field}" style="display: none;" >
				<div>
					<span style="width:120px; height:50px; position:absolute;  font-weight: bolder; display: inline-block;">전문분야
					</span>
					<label for="check">
					<span class="gg">
							<li id="first" style="height:30px; width:500px; display: inline-block;  text-align: center;">
							<c:choose>
							<c:when test="${registerUser_Pro.specialrt_field == 'null' || registerUser_Pro.specialrt_field =='NULL'}">
									전문분야 선택
								</c:when>
								<c:otherwise>
										${registerUser_Pro.specialrt_field}
								</c:otherwise>
							</c:choose>	
								<img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" style="width: 15px; transform: rotate(270deg); float: right;  margin-right: 20px; margin-top: 5px;">
							</li>
							<span class="na">
							<li>보컬</li>
							<li>악기</li>
							<li>화성악</li>
							<li>작곡</li>
							<li>작사</li>
							<li>미디</li>
							<li>디제잉</li>
							<li>ECT</li>
							</span>
				</span>		
				</label>	
				</div>
	
				
					
			<!--  전문 분야  부분 끝 -->	
				<!--  소개 부분 시작 -->
				<div>
					<div style="line-height: 15px; margin-top: 40px; height: 60px; ">
						<span style="width:110px; float: none; height:30px; font-weight: bolder;  display: inline-block; ">소개</span>
						<input id="intro" value="${registerUser_Pro.introduce}" name="introduce"  type="text" style=" width:500px; height:30px; border-color: #e4e5ed;  margin-top: 20px; border-radius: 8px; border-style: solid; border-width: 1px; display: inline-block; border-color: e4e5ed;">
						<span style="width:110px; height:30px; font-weight: bolder;  display: inline-block; ">
						</span>
					</div>
				</div>
						<div style="height: 50px; width: 600px; display: inline-block;">
							<span id="num" style="display: block; text-align: right;">1/80</span>
						</div>
			<!--  소개 부분 끝 -->
				<!--  학력 부분 시작 -->
				<div style=" display: inline-block;">
				</div>
				<div>
					<input type="text" id="check"  style=" display : none; width:500px; height:30px; border-color: #e4e5ed;  margin-top: 20px; border-radius: 8px; border-style: solid; border-width: 1px;">
					<div style="line-height: 15px;" id="school" >
						<span style="width:110px; float: none; height:30px; font-weight: bolder;  display: inline-block; ">학력</span>
						<input id="textgg"; required="required" value="${registerUser_Pro.major}" type="text" name="major" style=" width:500px; height:30px; border-color: #e4e5ed;  margin-top: 20px; border-radius: 8px; border-style: solid; border-width: 1px; display: inline-block; border-color: e4e5ed;">
						<input type="text" readonly="readonly" name="d" id="innner" style="margin-left:120px; height:30px; margin-top:10px; width:500px; border-color: #e4e5ed; border-radius: 8px; border-style: solid; border-width: 1px; display: inline-block; border-color: e4e5ed; text-align: center;" >
						<div style=" width: 600px; display: inline-block; margin-top: 10px;">
							<input type="file" name="file" style="display: none;" id="filed">
							<label id="filenameID" for="filed"  style="cursor: pointer; display: block; float: right;">증빙 서류올리기
							</label>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					$('#textgg').on('click',function(){
						var readU = null;
						var vv = null;
						var dd = null;
						
						var popupX = (window.screen.width/2)-(570/2);
						var popupY = (window.screen.height/2) - (420/2);
						var pop = window.open("univer.fo","pop","width=600,height=500,left="+popupX +",top="+popupY+",screen"+popupX+",screenY="+popupY+",scrollbars=yes, resizable=yes"); 
						});
						
						function callback(readU,vv,dd){
							document.getElementById("textgg").value = '  1. 학력 : '+readU;
							document.getElementById("textgg").value += '  2. 학교 : '+vv;
							document.getElementById("textgg").value += '  3. 전공 : '+dd;
						}
				</script>
				<!--  학력 부분 끝 -->
				<!--  경력 부분 시작 -->
				
				<div style="  margin-top: 20px; ">
					<span style="width:110px; height:30px; font-weight: bolder;  display: inline-block;">경력
					</span>
				<textarea name="career" required="required" style="display:inline-block; width:500px; height:150px; border-color: #e4e5ed;  margin-top: 20px; border-radius: 8px; border-style: solid; border-width: 1px;  resize: none;" rows="5" cols="33">${registerUser_Pro.career}</textarea>
				</div>
				
				<div style="height: 30px; width: 600px; display: inline-block;">
							<span id="num1" style="display: block; text-align: right;">1/1000</span>
				
				</div>
				
				<input type="hidden" id="file2" name="file1" style="display: none;">
				<div id="gggg">
					
				</div>
				
<!-- 				<input type="file" value="" style="display: none;" id="asdf"> -->
				<div style="height: 50px; width: 600px; margin-left:20px; display: inline-block;">
							<label id="filed222" for="asdf" style="cursor: pointer; display: block; float: right; text-align: center; margin-left:110px; width:500px; height:30px; border-color: #e4e5ed;  margin-top: 10px; border-radius: 8px; border-style: solid; border-width: 1px; display: inline-block; border-color: e4e5ed;">
										<span id="up" onclick="create(1)" style=" display: none; float: left;  margin-left: 10px; ">추가하기</span>
										<span id="yy" onclick="upload(1)">파일 업로드</span>
										<span id="delete123" style=" display: none; float: right; margin-right: 10px; " onclick="deleteStart(1)">삭제하기</span>
							</label>
				</div>
					
				<!--  경력 부분 끝 -->
			
				
				<div style="  margin-top: 20px; ">
					<span style="width:110px; height:30px; font-weight: bolder;  display: inline-block;">자격증
					</span>
				<textarea name="certification" required="required" style="display:inline-block; width:500px; height:150px; border-color: #e4e5ed;  margin-top: 20px; border-radius: 8px; border-style: solid; border-width: 1px;  resize: none;" rows="5" cols="33">${registerUser_Pro.certification}</textarea>
				</div>
				<div id="gggg2">
					<input type="hidden" id="file3" name="file" style="display: none;">	
				</div>
				<!--  자격증 부분 시작 -->
				
				<div style="height: 50px; width: 600px; margin-left:20px; display: inline-block;">
						
							<label id="filed222" for="asdf" style="cursor: pointer; margin-left:100px;  height:30px; width:500px; border-color: #e4e5ed; border-radius: 8px; border-style: solid; border-width: 1px; display: inline-block; border-color: e4e5ed; text-align: center;">
										<span id="up2" onclick="create(2)" style=" display: none; float: left;  margin-left: 10px; ">추가하기</span>
										<span id="yy2" onclick="upload(2)">파일 업로드</span>
										<span id="delete1232" style=" display: none; float: right; margin-right: 10px; " onclick="deleteStart(2)">삭제하기</span>
							</label>
				</div>
				<!--  자격증 부분 끝 -->	
				<c:if test="${!empty(list)}">
					<div style="height: 50px; width: 600px; display: inline-block;">
						<span style="width:110px; position:absolute;  font-weight: bolder; display: inline-block;">업로드 된 파일
						</span>
							<span type="hidden"style="cursor: pointer; margin-left:120px; width:500px; border-color: #e4e5ed; border-radius: 8px; border-style: solid; border-width: 1px; display: inline-block; border-color: e4e5ed; text-align: center;">	
								<c:forEach items="${list}" var="ga" varStatus="status">
									<a id="${ga.file_number}" href="${ pageContext.servletContext.contextPath }/resources/muploadFiles/${ga.file_change_name}" download >${ga.file_origin_name}</a>
									<button type="button" class="filedelete" value="${ga.file_number}" >삭제</button><br>
								</c:forEach>
							</span>
							<script type="text/javascript">
								$('.filedelete').click(function(){
									var ee = $(this).val();
								console.log(ee);
										$.ajax({
												url:'filedelect.fo',
												data : {num:ee},
												dataType:'json',
												success:function(data){
													console.log(data.num);
														if(data.num == 1){
															alert("gege");
																	$('#'+ee+'').css('display','none');
																	$('#'+ee+'').next().css('display','none');
																}
													}
											
											});
									});
							</script>
					</div>
				</c:if>
				<!--  카테고리 분야  시작 -->	
		<c:forTokens var="certi" begin="0" end="0" items="${registerUser_Pro.top_special_category}" delims="/">
			<c:if test="${!empty(certi)}">
				<input type="hidden" value="${certi}" name="top_special_category" id="top_special_category" style="display: none;">
			</c:if>
			<c:if test="${empty(certi)}">
				<input type="hidden" name="top_special_category" id="top_special_category" style="display: none;">
			</c:if>
					<input type="checkbox" id="check1" style="display: none; ">
				<div  style= "height:30px; margin-top: 10px; margin-bottom: 20px; z-index: 500;">
					<span style="width:110px; height:30px; position:absolute;  font-weight: bolder; display: inline-block;">카테고리
					</span>
					<label for="check1">
					<span class="gg" style="cursor: pointer; background: white; position: absolute; z-index: 500;">
							<li id="first1" style="height:30px; width:500px;  display: inline-block; border-color: e4e5ed; text-align: center;">
								<c:choose>
													
									<c:when test="${certi == 'NULL'}">
   													상위 카테고리
												</c:when>
									<c:otherwise>
										${certi}
									</c:otherwise>
								</c:choose>	
								<img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" style="width: 15px; transform: rotate(270deg); float: right;  margin-right: 20px; margin-top: 5px;">
							</li>
							<span id="ha1"  style="display: none;  background: white; ">
							<li>레슨</li>
							<li>연습실</li>
							<li>연주자</li>
							<li>음악제작</li>
							<li>컬럼</li>
							</span>
				</span>		
				</label>	
				</div>
		</c:forTokens>
						
				
			<c:forTokens var="cate" begin="1" end="1" items="${registerUser_Pro.top_special_category}" delims="/">
				<div  style=" height:30px; margin-top: 10px; margin-bottom: 20px; z-index: 400;">
					<span style="width:580px; height:50px; position:absolute;  font-weight: bolder; display: inline-block;">하위카테고리
					</span>
							<c:choose>
								<c:when test="${!empty(cate)}">
											<c:choose>
													<c:when test="${cate == 'null' || cate =='NULL'}">
													<input type="text" placeholder="작성하신 내용이 없습니다." value=""  name="middle_special_category" class="gg" id="first2" style="position: absolute; z-index: 400; height:30px; width:500px;  display: inline-block; text-align: center;">
												</c:when>
												<c:otherwise>
													<input type="text" placeholder="${cate}" value="${cate}"  name="middle_special_category" class="gg" id="first2" style="position: absolute; z-index: 400; height:30px; width:500px;  display: inline-block; text-align: center;">
												</c:otherwise>
											</c:choose>
									</c:when>
									<c:otherwise>
										<input type="text" placeholder="필요한 카테고리를 입력해주세요" value=""  name="middle_special_category" class="gg" id="first2" style="position: absolute; z-index: 400; height:30px; width:500px;  display: inline-block; text-align: center;">
									</c:otherwise>
							</c:choose>	
				</div>
			</c:forTokens>
						
				<!--  카테고리 분야  부분 끝 -->	
				
				<!--  서비스타입 분야  시작 -->	
			<c:forTokens var="item0" begin="0" end="0" items="${registerUser_Pro.service_type}" delims="/">
				<c:if test="${!empty(item0)}">
					<input type="hidden" value="${item0}" required="required" name="service_type"  id="service_type" style="display: none;">
				</c:if>
				<c:if test="${empty(item0)}">
					<input type="hidden" value="" name="service_type" id="service_type" style="display: none;">
				</c:if>
					<input type="checkbox" id="check3" style="display: none; margin-bottom: 20px;">
					<div  style=" height:30px; margin-top: 10px; margin-bottom: 20px; z-index: 300;">
					<span style="width:580px; height:50px; position:absolute;  font-weight: bolder; display: inline-block;">서비스타입
					</span>
					<label for="check3">
					<span class="gg" style=" background: white; position: absolute; z-index: 300;">
							<li id="first3" style="height:30px; width:500px;display: inline-block;  text-align: center;">
										<c:choose>
												<c:when test="${item0 == 'null' || item0 =='NULL'}">
												서비스타입 선택
											</c:when>
											<c:otherwise>
												${item0}
											</c:otherwise>
										</c:choose>
								<img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" style="width: 15px; transform: rotate(270deg); float: right;  margin-right: 20px; margin-top: 5px;">
							</li>
							<span id="ha3"  style="display: none;  background: white; ">
							<li>CM송</li>
							<li>로고송</li>
							<li>BGM</li>
							<li>MR/AR</li>
							<li>효과음/사운드</li>
							<li>편곡</li>
							<li>Loops</li>
							<li>Beats</li>
							</span>
				</span>		
				</label>	
				</div>
			</c:forTokens>
						
		<c:forTokens var="item1" begin="1" end="1" items="${registerUser_Pro.service_type}" delims="/">
			<c:if test="${!empty(item1)}">
				<input type="hidden" value="${item1}" required="required" name="form_of_provision" id="form_of_provision" style="display: none;">
			</c:if>
			<c:if test="${empty(item1)}">
				<input type="hidden" value="" required="required" name="form_of_provision" id="form_of_provision" style="display: none;">
			</c:if>	
				<input type="checkbox" id="check4" style="display: none;">
				<div  style=" height:30px; margin-top: 10px; margin-bottom: 20px; z-index: 200;">
					<span style="width:580px; height:50px; position:absolute; font-weight: bolder; display: inline-block;">제공형태
					</span>
					<label for="check4">
					<span class="gg" style=" background: white; position: absolute; z-index: 200;">
							<li id="first4" style="height:30px; width:500px;  display: inline-block;  text-align: center;">
										<c:choose>
											<c:when test="${item1 == 'null' || item1 =='NULL'}">
												제공형태
											</c:when>
											<c:otherwise>
												${item1}
											</c:otherwise>
											</c:choose>
								<img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" style="width: 15px; transform: rotate(270deg); float: right;  margin-right: 20px; margin-top: 5px;">
							</li>
							<span id="ha4"  style="display: none;  background: white; ">
							<li>악보</li>
							<li>MP3</li>
							<li>FLAC</li>
							<li>WAV</li>
							</span>
				</span>		
				</label>	
				</div>
			</c:forTokens>
				
				
				<!--  서비스타입 분야  부분 끝 -->
	<!--style="display: none;"  -->
<c:forTokens var="item2" begin="2" end="3" items="${registerUser_Pro.service_type}" delims="/">
	<c:if test="${!empty(item2)}">
		<input type="hidden" value=""${item2} required="required" name="additional_options" id="additional_options" style="display: none;">
	</c:if>	
	<c:if test="${empty(item2)}">
		<input type="hidden"  required="required" name="additional_options" id="additional_options" style="display: none;">
	</c:if>	
			<input type="checkbox" id="check5" style="display: none; z-index: 100;">
					<span style="width:120px; height:50px; position:absolute;  font-weight: bolder; display: inline-block;">추가옵션
					</span>
					<label for="check5" style="background: aqua;">
					<span class="gg" style=" background: white; position: absolute; z-index: 100;">
							<li id="first5" style="height:30px; width:500px;  display: inline-block;  text-align: center;">
								<c:choose>
									<c:when test="${item2 == 'null' || item2 =='NULL'}">
   													상위 카테고리
												</c:when>
									<c:otherwise>
										${item2}
									</c:otherwise>
								</c:choose>	
								<img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" style="width: 15px; transform: rotate(270deg); float: right;  margin-right: 20px; margin-top: 5px;">
							</li>
							<span id="ha"  style="display: none;">
							<li>믹싱/마스터링</li>
							<li>보컬추가</li>
							<li>특수효과</li>
							<li>트랙분할</li>
							<li>영상추가</li>
							</span>
				</span>		
				</label>	
</c:forTokens>
				<div style="width: auto; height: auto; text-align: center;  margin-top: 50px; margin-bottom: 50px;">
							<input type="button" value="수정" id="next" class="button_css" style="display: inline-block;">
							<input type="button" value="취소" id="before" class="button_css"  style="display: inline-block;">
				</div>
			</form>
	</div>
	<script>
	$('#next').click(function(){
		$('form').submit();
		});
	
	$('#check').click(function(){
		var iden =	$('#check').prop("checked");
		var listN = $('.na');
		var listli =  $('.na li');
		var rite = $('#first');
		console.log(iden);
		var test = 	list(iden,listN,listli,rite);
		$('#num1').val(test);
			})
			
	$('#check1').click(function(){
		var iden4 =	$(this).prop("checked");
		var listN3 = $('#ha1');
		var listli2 =  $('#ha1 li');
		var rite1 = $('#first1');
		console.log(rite1);
		var test = 	list(iden4,listN3,listli2,rite1);
		$('#top_special_category').val(test);
			})		
			
	$('#check2').click(function(){
		var iden4 =	$(this).prop("checked");
		var listN3 = $('#ha2');
		var listli2 =  $('#ha2 li');
		var rite1 = $('#first2');
		console.log(rite1);
	var test = 	list(iden4,listN3,listli2,rite1);
			$('#cat').val(test);	
			})	
	
	$('#check3').click(function(){
		var iden4 =	$(this).prop("checked");
		var listN3 = $('#ha3');
		var listli2 =  $('#ha3 li');
		var rite1 = $('#first3');
		console.log(rite1);
		var test =	list(iden4,listN3,listli2,rite1);
		$('#service_type').val(test);
			})	
	
	
	$('#check4').click(function(){
		var iden4 =	$(this).prop("checked");
		var listN3 = $('#ha4');
		var listli2 =  $('#ha4 li');
		var rite1 = $('#first4');
		console.log(rite1);
		var test =	list(iden4,listN3,listli2,rite1);
		$('#form_of_provision').val(test);
			})		
			
	$('#check5').click(function(){
		var iden4 =	$(this).prop("checked");
		var listN3 = $('#ha');
		var listli2 =  $('#ha li');
		var rite1 = $('#first5');
		console.log(rite1);
		var test =	list(iden4,listN3,listli2,rite1);
		$('#additional_options').val(test);
			})
			
	
//$('#check')  = identi    $('#na') = listName    $('#na li') = listNameli  write =  $('#first') 
	function list( identi,listName,listNameli,write){
		//identi.on('click',function(){
	         if(identi == true){
	        	 $('#ha').css('z-index','3');
	        	 listName.css('display','inline-block');
	        	 listNameli.mouseover(function(){
	               $(this).css("color","red");
	               listNameli.click(function(){
	                    var te =  $(this).html();
	                     $(listName).css('display','none');
	                   	  Field = te; 
	                   		write.text(Field);
	                   		write.append('<img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" style="width: 15px; transform: rotate(270deg); float: right;  margin-right: 20px; margin-top: 5px;">');
	               })
	           })
	           listNameli.mouseleave(function(){
	               $(this).css("color","black");
	           })
	          }else{
	        	  listName.css('display','none');
	          }
	     // })
			return Field;
		}

	
     // 리스트 ---------------------------------------
     
    
    
    
    
     
     
     $('#intro').on('keyup',function(){
        var ge = this.value.length;
        if(ge <=80){
       		var hh = $('#num').html(ge +'/'+ 80);
        }else{
			alert("최대 길이는 80자 까지 입니다.");
			this.val().substring(0.80);
            }
			
         })
         
         
         $('textarea').on('keyup',function(){
        var ge = this.value.length;
        if(ge <=1000){
       		var hh = $('#num1').html(ge +'/'+ 1000);
        }else{
			alert("최대 길이는 1000자 까지 입니다.");
			this.val().substring(0.1000);
            }
			
         })
		  // 학교 이벤트=========================================================
		    $('#filenameID').on('click',function(){
				$('#filed').change(function(){
					var d=	$('#filed').val();
					var fileValue = 	d.split("\\");
					var fileextension = d.split(".");
					var fileName1 = fileValue[fileValue.length-1];
					var fileName2 = fileextension[fileextension.length-1];
					 
				
					var ffff = fileName1.split(".");
					var filename = ffff[0];
					var fileexten = ffff[1];
					console.log(filename);
					console.log(fileexten);
					console.log($('filed'));
					$('#innner').val('파일 이름' +' : '+  filename +'  /  '+"  확장자"+" : " + fileexten);
						});
		  })
		  
		  function upload(num){
		  if(num == 1){
				$('#yy').html("");
				$('#up').css('display','inline-block');
				$('#delete123').css('display','inline-block');
			  }else{
				  $('#yy2').html("");
					$('#up2').css('display','inline-block');
					$('#delete1232').css('display','inline-block');
				  }
		  }
	  
     		var k = 0;

        	var cnt =1;
    		  function create(num){
				if(num ==1){
				$('#gggg').append($('<input type="file" value=""  class="create_label_x" style="display:inline-block;" name="file'+cnt+'" >'));
			 	$('#gggg').append($('<span value=""  class="create_label" style="display:none;"  >'));
			 	cnt++;
				}else{
				$('#gggg2').append($('<input type="file" value=""  class="create_label_x" style="display:inline-block;"  name="file'+cnt+'"   i>'));
				 $('#gggg2').append($('<span value=""  class="create_label" style="display:none;"  >'));
				 cnt++;	
					}
				}
			
				  $('#gggg').change(function(){
							
							var tt =$('#gggg input').last().val();
							var arr = StringTrans(tt);
							
							$('.create_label_x').css('display','none');
							$('#gggg span').last().css('display','inline-block');
						var test = 	$('#gggg span').last().html('파일 이름' +' : '+  arr[0] +'  /  '+"  확장자"+" : " + arr[1]);					

						var ttt=  $("#file2").val(tt);
						console.log("test "+ttt.val());
							console.log($('#gggg input').length);
							if($('#gggg input').length > 3){
								$('#gggg span').last().css('display','none');
								alert("파일 업로드는 3개 까지 입니다.")
						}
							})
							
				 $('#gggg2').change(function(){
							
							var tt =$('#gggg2 input').last().val();
							var arr = StringTrans(tt);
							
							$('.create_label_x').css('display','none');
							$('#gggg2 span').last().css('display','inline-block');
							$('#gggg2 span').last().html('파일 이름' +' : '+  arr[0] +'  /  '+"  확장자"+" : " + arr[1]);					
							console.log($('#gggg2 input').length);
							if($('#gggg2 input').length > 3){
								$('#gggg2 span').last().css('display','none');
								alert("파일 업로드는 3개 까지 입니다.")
						}
							})			
							
		  	
			 function StringTrans(tt){
     		 	console.log(tt);
 					var d=	tt;
					var fileValue = 	d.split("\\");
					var fileextension = d.split(".");
					var fileName1 = fileValue[fileValue.length-1];
				
					var ffff = fileName1.split(".");
					return ffff;
			 }
			
			function deleteStart(num){
				if(num ==1){
				var result = confirm("파일을 삭제하시겠습니까?");
					if(result == true){
					  $('#gggg').first().empty();
						}
					}else{
						var result = confirm("파일을 삭제하시겠습니까?");
						if(result == true){
						  $('#gggg2').first().empty();
							}
						}
				}
		
	
	</script>         
</body>
</html>

