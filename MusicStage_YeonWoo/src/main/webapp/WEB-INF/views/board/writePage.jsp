<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	c9bc97c8ab03830ce16b818faae5fb6d&libraries=services"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/default.css"/>" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
	background: #FAFAFA !important;
}

header {
	z-index: 1;
	height: 50px;
	position: fixed;
}

#centerWrap {
	padding: 40px 70px;
	margin: auto;
	min-height: 800px;
	border: 1px solid #DBDBDB;
	width: 940px;
	background: white;
}

#left_div {
	display: inline-block;
	width: 50%;
	height: 500px;
	float: left;
}

#center_div {
	position: relative;
	top: 150px;
	height: 300px;
	margin: 0 20px;
}

#quick_menu {
	display: flex;
	font-size: 0;
	padding: 0;
	margin: 20px auto;
}

#quick_menu li {
	display: inline-block;
	width: 25%;
	font-size: 12px;
	list-style: none;
	text-align: center;
}

#quick_menu img {
	max-width: 80%;
	max-height: 50%;
}

#right_div {
	display: inline-block;
	width: 50%;
	height: 500px;
	float: left;
}

#main_img {
	height: 100%;
	object-fit: cover;
	-webkit-filter: grayscale(100%);
	filter: gray;
	opacity: 0.2;
	max-width: -webkit-fill-available;
	max-height: 100%;
}

#slide_menu {
	display: inline-block;
	width: 100%;
	height: 350px;
	border: 1px solid brown;
	margin-top: 20px;
}

.section {
	width: 100%;
	height: 100vh;
	margin-top: 50px;
	z-index: 1;
}

/* 여기서부터 서영. */
/* //////////// */
.detail_main_div {
	margin: auto;
	width: 937px; /* centerWrap 가로에 맞춤. */
	
	/* border: 1px solid yellow; */
}

/* bottom_div의 소제목 */
/* .bottom_div p {
	font-weight: 600;
	font-size: 13pt;
	text-align: left;
} */

.bottom_div div {
	text-align: center;
}

.write_div img {
	width: auto;
	max-width: 700px;
}

.detail_list_button {
	/* border: 1px solid red; */
	text-align: center;
	margin: 50px 0px;
}

#insert_button{
	background: #521110;
	border-radius: 5px;
	border: none;
	padding: 5px 10px;
	width: 60px;
	height: 26px;
	color: white;
}

#goBack_button {
	border: 1px solid #DBDBDB;
	border-radius: 5px;
	background: white;
	padding: 5px 10px;
	width: 60px;
	height: 26px;
	margin-left: 5px;
}




/* writePage css start */
/* /////////////////// */
.write_top_div {
	width: 800px;
	height: 140px;
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 25px;
}

.write_top_div th {
	width: 150px;
	vertical-align: middle;
	text-align: left;
	padding-left: 5px;
	padding-bottom: 10px;
	font-size: 15px;
}

.write_top_div td{
	margin-top: 5px;
}

#write_text_div input[type="text"] {
	width: 790px;
	height: 30px;
	border: 1px solid #DBDBDB;
	outline: none;
	margin-left: 15px;
	margin-bottom: 25px;
	text-indent: 10px;
}

#write_select {
	display: flex;
	flex-direction: row;
	align-items: center;
}

#select_one_title, #select_find_title, #select_column_top_title,
#select_column_bottom_title, #select_review_top_title{
	height: 35px;
	border: 1px solid #DBDBDB;
	outline: none;
	border-radius: 5px;
	padding: 5px 6px;
	margin-left: 15px;
}

#select_review_bottom_title {
	width: 400px;
	border: 1px solid #DBDBDB;
	text-indent: 0px;
	padding-left: 10px;
	margin-left: 10px;
}

#select_one_title{
	width: 150px;
}

#select_find_title{
	width: 200px;
}

.write_bottom_div {
	width: 800px;
	border: 1px solid #DBDBDB;
	margin-bottom: 30px;
}

.write_img_div {
	width: 500px;
	height: 500px;
}

#thumbnail_div{
	width: 500px;
	height: 500px;
	display: flex;
	overflow: hidden;
	justify-content: center;
	vertical-align: middle;
}

#thumbnail{
	opacity: 0.5;
	height: 100%;
}
#thumbnail:hover{
	opacity: 1.0;
	cursor: pointer;
}

#preview{
	height: 500px;
	padding: 20px;
	overflow: auto;
	font-size: 14px;
	
}

.write_preview_div {
	border-left: 1px solid #DBDBDB;
}

.write_detail_div {
	width: 800px;
	min-height: 500px; /* 임시. */
	border: 1px solid #DBDBDB;
	padding: 20px 25px 30px 25px;
	border-radius: 15px;
	font-weight: 600;
	font-size: 13pt;
	text-align: left;
	margin-bottom: 30px;
}

.detail_img p, .dlatl p{
	margin-left: 10px;
}

.dlatl span, .detail_img span{
	font-size: 12px; 
	font-weight:normal; 
	opacity: 0.7;
	margin-left: 15px;
}

#content_area{
	text-indent: 0px;
	padding: 10px;
	height: 350px;
	resize: none;
}

#insertImageArea{
	display: flex;
	justify-content: center;
	vertical-align: middle;
	flex-wrap: wrap;
}

.inputImageArea{
	width: 300px;
	height: 300px;
	border: 1px solid #DBDBDB;
	border-radius : 4px; 
	margin-top: 10px;
	margin-left: 10px;
	overflow: hidden;
	text-align : center ;
}

.insertImage{
	display: inline;
	opacity: 0.5;
	height: 100%;
	
}
.insertImage:hover{
	opacity: 1.0;
	cursor: pointer;
}

#insertAudio{
	border: 1px solid #DBDBDB;
	border-radius: 4px;
	width: 200px;
	height: 300px;
	margin-top: 10px;
	margin-left: 20px;
	opacity: 0.5
}

#insertAudio:hover{
	opacity: 1.0;
	cursor: pointer;
}

#audioList{
	border: 1px solid #DBDBDB;
	border-radius: 4px;
	font-size: 13px;
	font-weight: normal;
	display: inline-block;
	width: 490px;
    height: 300px;
    vertical-align: top;
    margin-top: 10px;
    margin-left: 10px;
    padding: 10px;
}

.audioFileName, .videoFileName{
	display : inline-block;
	width : 445px;
	height : 20px;
	margin-left : 5px;
	margin-top : 5px;
}

#insertVideo{
	border: 1px solid #DBDBDB;
	border-radius: 4px;
	width: 200px;
	height: 300px;
	margin-top: 10px;
	margin-left: 20px;
	opacity: 0.5
}

#insertVideo:hover{
	opacity: 1.0;
	cursor: pointer;
}

#videoList{
	border: 1px solid #DBDBDB;
	border-radius: 4px;
	font-size: 13px;
	font-weight: normal;
	display: inline-block;
	width: 490px;
    height: 300px;
    vertical-align: top;
    margin-top: 10px;
    margin-left: 10px;
    padding: 10px;
}
/* .xBox{
	width: 15px;
    height: 15px;
    font-size: 13px;
    background: white;
    border-radius: 4px;
    color: #A7543A;
    font-weight: bold;
}
 */
 
 
/* 선택요소 */
#sub_detail_write{
	width: 800px;
	min-height: 100px; /* 임시. */
	border: 1px solid #DBDBDB;
	padding: 20px 25px 30px 25px;
	border-radius: 15px;
	font-weight: 600;
	font-size: 13pt;
	text-align: left;
}

#slideCurriculum, #slidePlace, #slideFormat{
	padding-left: 10px;
	cursor: pointer;
}

/* 커리큘럼 */
#insertCurriculumArea{
	margin-top: 10px; 
	display: none;
}

#curriculum{
	width: 720px;
	height: 350px;
	resize: none;
	text-indent: 0px;
	margin: 0 20px;
	padding: 10px;
}

/* 장소 */
#insertPlaceArea{
	display:none;
}

#map{
	 width: 700px; 
	 height: 500px; 
	 margin: 15px 20px;
	 border-radius: 4px;
}

#main_address, #sub_address{
	width: 300px;
	background: white;
	text-indent: 10px;
	margin-left: 10px;
}

#address_button{
	width: 70px;
    height: 25px;
    border-radius: 4px;
    background: #521110;
    color: white;
}
/* 제공형식 */
#insertFormatArea{
	display:none;
	margin-top: 10px;
}
#insertFormat{
	text-indent: 0px;
	padding-left: 10px;
	margin: 10px 20px;
	width: 720px;
}
/* ///////////////// */
/* writePage css end */
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<section class="section">

		<%@ include file="../common/section_menubar.jsp"%>

		<div id="centerWrap">
			<!-- 여기에다가 넣으면 됩니다 시작 -->

			<form action="insertBoard.bo" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
			<div class="write_main_div">
				<!-- writePage start -->
				<!-- /////////////// -->
				<table class="write_top_div">
					<tr>
						<th colspan="2">제목</th>
					</tr>
					<tr id="write_text_div">
						<td colspan="2"><input name="title" id="title" type="text" autocomplete="off"></td>
					</tr>
					<tr>
						<th colspan="2">카테고리</th>
					</tr>
					<tr>
						<td colspan="2" id="write_select_td">
							<div id="write_select">
								<select name="menu_category" id="select_one_title">
									<option value=0 selected>카테고리 선택</option>
									<option value=1>소셜</option>
									<option value=2>찾아요</option>
									<c:if test="${ loginUser.authority eq 2 }">
									<option value=3>컬럼</option>
									</c:if>
									<option value=4>리뷰</option>
								</select>
								
								<!-- 찾아요 -->
								<select name="find_category" id="select_find_title" style="display:none;">
									<option value="null" selected>하위카테고리 선택</option>
									<option value="fs">학생 찾아요</option>
									<option value="ft">전문가 찾아요</option>
									<option value="fp">연습실</option>
								</select>							
								
								<!-- 리뷰상위 -->
								<select id="select_review_top_title" name="review_top" style="display:none;">
		                           <option value="null" selected>리뷰 상위속성</option>
		                           <option value="소프트악기">소프트악기</option>
		                           <option value="플러그인">플러그인</option>
		                           <option value="악기관련">악기관련</option>
		                           <option value="음악장비">음악장비</option>
		                           <option value="신디사이저">신디사이저</option>
		                           <option value="미디컨트롤러">미디컨트롤러</option>
		                           <option value="유저사용기">유저사용기</option>
		                           <option value="작업공간">작업공간</option>
		                           <option value="프리미엄리뷰">프리미엄리뷰</option>
		                           <option value="ect">etc</option>
		                        </select>
								<!-- 리뷰하위 -->
								<input type="text" name="review_bottom" placeholder="세부카테고리를 입력해주세요. (선택사항)" id="select_review_bottom_title" style="display:none;">
							</div>
						</td>
					</tr>
				</table>

				<table class="write_bottom_div">
					<tr>
						<td class="write_img_div">
							<input type="file" name="thumbnail_file" id="thumbnail_input" style="display:none;" accept="image/*">
							<div id="thumbnail_div"><img src="resources/images/썸네일추가.png" id="thumbnail" onclick="document.all.thumbnail_file.click()"></div>
						</td>
						<td class="write_preview_div">
							<div id="preview"></div>
						</td>
					</tr>
				</table>

				
				<div class="write_detail_div">
					<span style="display: inline-block; height: 30px; font-size: 18px;">필수입력</span>
					<span style="font-size: 12px; font-weight: normal; margin-left: 5px;">이미지, 음악, 영상은 선택사항입니다.</span>
					<hr style="display: block; border: 1px solid; opacity: 0.4; background: #727272;"><br> 
					<div class="dlatl">
						<p>설명</p>
						<br>
						<textarea name="content_area" id="content_area"></textarea>
					</div>

					<br><br>
					<hr style="display: block; opacity: 0.4;">
					<br>

					<div class="detail_img">
						<p>이미지</p><span>이미지는 최대 4개까지 등록이 가능합니다.</span>
						<br>
						<div id="insertImageArea">
						<input type="file" name="image1" id="image_input1" accept="image/*" style="display: none;">
						<div class="inputImageArea"><img src="resources/images/이미지추가.png" id="imagePreview1" class="insertImage" onclick="document.all.image1.click()"></div>
						<input type="file" name="image2" id="image_input2" accept="image/*" style="display: none;">
						<div class="inputImageArea"><img src="resources/images/이미지추가.png" id="imagePreview2" class="insertImage" onclick="document.all.image2.click()"></div>
						<input type="file" name="image3" id="image_input3" accept="image/*" style="display: none;">
						<div class="inputImageArea"><img src="resources/images/이미지추가.png" id="imagePreview3" class="insertImage" onclick="document.all.image3.click()"></div>
						<input type="file" name="image4" id="image_input4" accept="image/*" style="display: none;">
						<div class="inputImageArea"><img src="resources/images/이미지추가.png" id="imagePreview4" class="insertImage" onclick="document.all.image4.click()"></div>
						</div>
					</div>

					<br><br>
					<hr style="display: block; opacity: 0.4;">
					<br>

					<div class="dlatl">
						<p>음악</p><span>음악파일은 여러개 등록이 가능합니다.</span>
						<br>
						<div id="insertAudioArea">
						<input type="file" accept="audio/*" id="audio_input" name="audio" multiple style="display: none;">
						<img src="resources/images/음악파일추가.png" id="insertAudio" onclick="document.all.audio.click()">
						<div id="audioList">불러온파일이 없습니다.</div>
						</div>
					</div>

					<br>
					<hr style="display: block; opacity: 0.4;">
					<br>
					<div class="dlatl">
						<p>영상</p><span>영상파일은 여러개 등록이 가능합니다.</span>
						<div id="insertVideoArea">
						<input type="file" accept="video/*" id="video_input" name="video" multiple style="display: none;">
						<img src="resources/images/영상파일추가.png" id="insertVideo" onclick="document.all.video.click()">
						<div id="videoList">불러온파일이 없습니다</div>
						</div>
						<br>
					</div>
				</div>
				
				
				<!-- 선택사항 -->
				<div id="sub_detail_write">
					<span style="display: inline-block; height: 30px; font-size: 18px;">선택사항</span>
					<span style="font-size: 12px; font-weight: normal; margin-left: 5px;">입력할 항목을 클릭해주세요</span>
					<hr style="display: block; border: 1px solid; opacity: 0.4; background: #727272;">
					<br>
					<div class="dlatl">
						<div id="slideCurriculum">커리큘럼</div>
						<div id="insertCurriculumArea">
							<textarea name="curriculum_content" id="curriculum" placeholder="커리큘럼을 작성해 주세요."></textarea>
						</div>
					</div>
					
					<br>
					<hr style="display: block; opacity: 0.4;">
					<br>
					
					<div class="dlatl">
						<div id="slidePlace">장소</div>
						<div id="insertPlaceArea" align="center">
							<div id="map"></div>
							<input type="text" id="main_address" name="main_address" placeholder="주소" readonly>
							<input type="text" id="sub_address" name="sub_address" placeholder="세부주소">
							<input type="button" id="address_button" onclick="execDaumPostcode()" value="주소검색">
						</div>
					</div>
					
					<br>
					<hr style="display: block; opacity: 0.4;">
					<br>
					
					<div class="dlatl">
						<div id="slideFormat">제공형식</div>
						<div id="insertFormatArea">
						<span>제공형식은 쉼표(,)로 구분지어 주세요.</span>
							<input type="text" id="insertFormat" name="insertFormat" placeholder="키워드를 입력해 주세요. ex) #mr, #악보" autocomplete="off">
						</div>
					</div>
					
				</div>
			</div>

			<div class="detail_list_button">
				<input type="submit" id="insert_button" value="등록">
				<input type="button" id="goBack_button" value="취소" onclick="history.back()">
			</div>
			
			</form>
		</div>
	</section>
	
	<script>
		$(document).ready(function(){
			
			// 로그인 안되어있을 시 모달창 오픈
			var modalBg_login = document.querySelector('.modal-bg-login');
			var modalClose_login = document.querySelector('.modal-close');
		
			if(${loginUser.userId == null}){
				alert("회원만 사용할 수 있는 메뉴 입니다. \n 로그인 후 더 많은 STAGE를 즐기세요");
				$(modalBg_login).addClass('bg-active');
							
			}
			// 모달창 닫기
			$(modalClose_login).click(function(){
		
		        $(modalBg_login).removeClass('bg-active');
		        location.href="home.do";
		    });
			
			// 상위 카테고리 선택 시 하위카테고리 자동적으로 나타나게
			$("#select_one_title").change(function(){
				var selectValue = $(this).val();;
				
				if(selectValue == 1){ // 소셜
					$("#select_find_title").css("display","none");
					$("#select_review_top_title").css("display","none");
					$("#select_review_bottom_title").css("display","none");
					
					// 다른거 선택했다가 넘어와도 ~를 선택해주세요 안나타게 하기
					$("#select_find_title option:eq(0)").replaceWith("<option value='null' selected>하위카테고리 선택</option>");
					$("#select_review_top_title option:eq(0)").replaceWith("<option value='null' selected>하위카테고리 선택</option>");
					
					
				} else if(selectValue == 2){ // 찾아요
					$("#select_find_title").fadeIn("fast");
					$("#select_review_top_title").css("display","none");
					$("#select_review_bottom_title").css("display","none");
					
					$("#select_find_title option:eq(0)").replaceWith("<option value='0' selected>하위카테고리 선택</option>");
					
					// 다른거 선택했다가 넘어와도 ~를 선택해주세요 안나타게 하기
					$("#select_review_top_title option:eq(0)").replaceWith("<option value='null' selected>하위카테고리 선택</option>");
					
					
				} else if(selectValue == 3){ // 컬럼
					$("#select_column_top_title").fadeIn("fast");
					$("#select_find_title").css("display","none");
					$("#select_review_top_title").css("display","none");
					$("#select_review_bottom_title").css("display","none");
					
					// 다른거 선택했다가 넘어와도 ~를 선택해주세요 안나타게 하기
					$("#select_find_title option:eq(0)").replaceWith("<option value='null' selected>하위카테고리 선택</option>");
					$("#select_review_top_title option:eq(0)").replaceWith("<option value='null' selected>하위카테고리 선택</option>");
					
					
				} else if(selectValue == 4){ // 리뷰
					$("#select_review_top_title").fadeIn("fast");
					$("#select_find_title").css("display","none");
					$("#select_review_bottom_title").css("display","none");
					
					$("#select_review_top_title option:eq(0)").replaceWith("<option value='0' selected>하위카테고리 선택</option>");
					
					// 다른거 선택했다가 넘어와도 ~를 선택해주세요 안나타게 하기
					$("#select_find_title option:eq(0)").replaceWith("<option value='null' selected>하위카테고리 선택</option>");
					
					$("#select_review_top_title").change(function(){
						
						var topValue = $(this).val();
						
						if(topValue != 0){
							$("#select_review_bottom_title").fadeIn("fast");
						} else if(topValue == 0){
							$("#select_review_bottom_title").hide();
						}
						
					});
					
				}
				
			});
			
			// 설명칸에 적으면 썸네일 옆에 자동적으로 보이게 하기
			$("#content_area").on("propertychange change keyup paste input", function(){
				
				// 개행문자 >> <br>로 인식하게 하기
				var content = $(this).val();
				content = content.replace(/(?:\r\n|\r|\n)/g, '<br>');
				
				$("#preview").html(content);
				
			});
			
			// 썸네일 이미지 미리보기
			$("#thumbnail_input").on("change", thumbnailPreview);
			
			function thumbnailPreview(e){
				var files = e.target.files; // list
				var fileArr = Array.prototype.slice.call(files);
				
				fileArr.forEach(function(f){
					if(!f.type.match("image.*")){
						/* console.log(f.type); */ // 입력한 file의 확장자 알아보기
						alert("이미지만 넣어주세요");
						return false;
					} else {
						var reader = new FileReader();
						reader.onload = function(e){
							$("#thumbnail").attr("src", e.target.result).css("opacity","1.0");
						}
						reader.readAsDataURL(f);
					}
					
					
				})
			}
			
			// 이미지4개 미리보기
			$("#image_input1").on("change", imageFirstPreview);
			$("#image_input2").on("change", imageSecondPreview);
			$("#image_input3").on("change", imageThirdPreview);
			$("#image_input4").on("change", imagefourthPreview);
			
			function imageFirstPreview(e){
				var files = e.target.files;
				var fileArr = Array.prototype.slice.call(files);
				
				fileArr.forEach(function(f){
					if(!f.type.match("image.*")){
						alert("이미지만 넣어주세요.");
						return false;
					} else {
						var reader = new FileReader();
						reader.onload = function(e){
							$("#imagePreview1").attr("src", e.target.result).css("opacity","1.0");
						}
						reader.readAsDataURL(f);
					}
				});
			}
			 
			function imageSecondPreview(e){
				var files = e.target.files;
				var fileArr = Array.prototype.slice.call(files);
				
				fileArr.forEach(function(f){
					if(!f.type.match("image.*")){
						alert("이미지만 넣어주세요.");
						return false;
					} else {
						var reader = new FileReader();
						reader.onload = function(e){
							$("#imagePreview2").attr("src", e.target.result).css("opacity", "1.0");
						}
						reader.readAsDataURL(f);
					}
				});
			}
			
			 
			function imageThirdPreview(e){
				var files = e.target.files;
				var fileArr = Array.prototype.slice.call(files);
				
				fileArr.forEach(function(f){
					if(!f.type.match("image.*")){
						alert("이미지만 넣어주세요.");
						return false;
					} else {
						var reader = new FileReader();
						reader.onload = function(e){
							$("#imagePreview3").attr("src", e.target.result).css("opacity", "1.0");
						}
						reader.readAsDataURL(f);
					}
				});
			}
			
			 
			function imagefourthPreview(e){
				var files = e.target.files;
				var fileArr = Array.prototype.slice.call(files);
				
				fileArr.forEach(function(f){
					if(!f.type.match("image.*")){
						alert("이미지만 넣어주세요.");
						return false;
					} else {
						var reader = new FileReader();
						reader.onload = function(e){
							$("#imagePreview4").attr("src", e.target.result).css("opacity", "1.0");
						}
						reader.readAsDataURL(f);
					}
				});
			}
			
			
			// 음악파일 넣으면 div에 이름나오게하기
			$("#audio_input").on("change", audioInput);
			
			function audioInput(e){
				var files = e.target.files;
				var fileArr = Array.prototype.slice.call(files);
				
				var audioList = document.getElementById("audioList");
				$(audioList).html("");
				fileArr.forEach(function(f){
					if(!f.type.match("audio/*")){
						alert("오디오파일만 등록이 가능합니다.");
						return false;
					} else {
						var audioFileName = document.createElement("div");
						$(audioFileName).addClass("audioFileName");
						$(audioFileName).html(f.name);
						$(audioList).append(audioFileName);
					}
				});
				
			}
			
			
			
			// 영상파일 넣으면 div에 이름넣기
			$("#video_input").on("change", videoInput);
			
			function videoInput(e){
				var files = e.target.files;
				var fileArr = Array.prototype.slice.call(files);
				
				var videoList = document.getElementById("videoList");
				$(videoList).html("");
				fileArr.forEach(function(f){
					if(!f.type.match("video/*")){
						alert("비디오파일만 등록이 가능합니다.");
						return false;
					} else {
						var videoFileName = document.createElement("div");
						$(videoFileName).addClass("videoFileName");
						$(videoFileName).html(f.name);
						$(videoList).append(videoFileName);
					}
				});
			}
			
			
			// 필수조건에 빈칸이 있을 경우(제목, 카테고리, 썸네일, 내용)
			$("#insert_button").on("click", function(){
				var title = document.getElementById("title").value;
				var top_title = document.getElementById("select_one_title").value;
				var find_title = document.getElementById("select_find_title").value;
				var review_top_title = document.getElementById("select_review_top_title").value;
				var review_bottom_title = document.getElementById("select_review_bottom_title").value;
				var thumbnailFile = document.getElementById("thumbnail_input").value;
				var detail_content = document.getElementById("content_area").value;
				
				if(title == ""){
					alert("제목을 입력해 주세요.");
					$("#title").focus();
					return false;
				} else if(top_title == 0 ){
					alert("카테고리를 선택해 주세요");
					return false;
				} else if(find_title == 0){
					alert("상세카테고리를 선택해 주세요.");
					return false;
				} else if(review_top_title == 0){
					alert("상세카테고리를 선택해 주세요.");
					return false
				} else if(detail_content == ""){
					alert("내용을 입력해 주세요.");
					$("#content_area").focus();
					return false;
				} else if(review_bottom_title == ""){
					$(review_bottom_title).val("null");
				}
				
				// textarea하고 input이 null값으로 안넘어가져서 진행
				if($("textarea[name=curriculum_content]").val() == ""){
					$("#curriculum").val("null");
				} 
				if($("#main_address").val() == ""){
					$("#main_address").attr("value","null");
				}
				if($("#sub_address").val() == ""){
					$("#sub_address").attr("value","null");
				} 
				if($("#insertFormat").val() == ""){
					$("#insertFormat").attr("value","null");
				}
				if($("#select_review_bottom_title").val() == ""){
					$("#select_review_bottom_title").attr("value","null");
				}
				
				
				if(thumbnailFile == ""){
					
					var thumbCheck = confirm("썸네일사진을 넣지 않을 경우 기본이미지로 등록이 됩니다.\n 등록하시겠습니까?");
					if(thumbCheck == false){
						alert("썸네일을 등록해 주세요.");
						return false;
					} else {
						var menuSel = $("#select_one_title option:selected").val();
						var findSel = $("#select_find_title option:selected").val();
						
						if(menuSel == 2 && findSel == "fs"){
							alert("게시글 등록에 성공했습니다.\n   학생찾아요 카테고리는 전문가 승인 후 등록이 됩니다.");
							return true;
						} else if(menuSel == 2 && findSel == "fp"){
							alert("게시글 등록에 성공했습니다.\n   연습실 카테고리는 전문가 승인 후 등록이 됩니다.");
						} else if(menuSel == 3){
							alert("게시글 등록에 성공했습니다.\n   컬럼 카테고리는 전문가 승인 후 등록이 됩니다.");
						} else {
							alert("게시글을 등록하였습니다.");	
						}
					}
				} else {
					var insertCheck = confirm("게시글을 등록하시겠습니까?");
					if(insertCheck == false){
						alert("게시글 등록을 취소하였습니다.");
						return false;
					} else if(insertCheck == true){
						var menuSel = $("#select_one_title option:selected").val();
						var findSel = $("#select_find_title option:selected").val();
						
						if(menuSel == 2 && findSel == "fs"){
							alert("게시글 등록에 성공했습니다.\n   학생찾아요 카테고리는 전문가 승인 후 등록이 됩니다.");
							return true;
						} else if(menuSel == 2 && findSel == "fp"){
							alert("게시글 등록에 성공했습니다.\n   연습실 카테고리는 전문가 승인 후 등록이 됩니다.");
						} else if(menuSel == 3){
							alert("게시글 등록에 성공했습니다.\n   컬럼 카테고리는 전문가 승인 후 등록이 됩니다.");
						} else {
							alert("게시글을 등록하였습니다.");	
						}
						return true;
					}
				}
				
			});
			
		});
		
		// 선택사항 펼쳐보기
		// 커리큘럼
		$("#slideCurriculum").on("click", function(){
			if($(this).hasClass('active')){
				$(this).removeClass('active');
				$("#insertCurriculumArea").slideUp();
			} else {
				$(this).addClass('active');
				$("#insertCurriculumArea").slideDown();
			}
		});
		
		// 장소		
		//카카오 지도
		var mapContainer = document.getElementById('map');
		var options = {
				center : new kakao.maps.LatLng(37.499016, 127.032897), // 지도의 좌표
				level: 4 // 확대크기(처음보일때 확대)
		};
		
		var map = new kakao.maps.Map(mapContainer, options); // 지도를 생성
		var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체 생성
		var marker = new kakao.maps.Marker({ 
			// 마커미리생성
			position: new kakao.maps.LatLng(37.499154705213925, 127.03298409955396),
			map: map
		});
		
		$("#slidePlace").on("click", function(){
			if($(this).hasClass('active')){
				$(this).removeClass('active');
				$("#insertPlaceArea").slideUp();
			} else {
				$(this).addClass('active');
				$("#insertPlaceArea").slideDown();
				
				map.relayout();	
			}
		});
		
		// 주소를 검색할때 사용
		function execDaumPostcode(){
			new daum.Postcode({
				oncomplete: function(data){
					var addr = data.address; // 최종주소를 담는 변수
					
					// 주소정보를 필드에 넣기
					document.getElementById("main_address").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(addr, function(results, status){
						// 검색값이 있으면
						if(status === daum.maps.services.Status.OK){
							var result = results[0]; // 첫번째 결과값
							
							/* console.log(result); // List로 검색한 주소에 대한 정보 전체 가져오기
							console.log(result.road_address.address_name); // 도로명 주소만 가져오기(String)
							console.log(result.road_address.zone_no); // 우편번호 */
							
							// 해당주소에 대한 좌표받기
							var coords = new daum.maps.LatLng(result.y, result.x);
							// 지도에 보여주기
							mapContainer.style.display = "block";
							map.relayout();
							// 지도 중심을 변경
							map.setCenter(coords);
							// 마커를 결과값으로 받는 위치를 옮긴다
							marker.setPosition(coords);
							
						}
					});
				}
			}).open();
		
		}
		
		// 제공형식
		$("#slideFormat").on("click", function(){
			if($(this).hasClass('active')){
				$(this).removeClass('active');
				$("#insertFormatArea").slideUp();
			} else {
				$(this).addClass('active');
				$("#insertFormatArea").slideDown();
			}
		});
	
	</script>
</body>
</html>