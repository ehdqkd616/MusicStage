<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Direct</title>
<style>
	header{z-index: 1; height:50px; position: fixed;}
    #centerWrap{margin:0 250px; height: 800px;}
    /* #left_div{display: inline-block; width:50%; height:500px; float: left;} */
    /* #center_div{position: relative; top:150px; height:300px; margin:0 20px;} */
    /* #quick_menu{display: flex; font-size: 0; padding:0; margin:20px auto;}
    #quick_menu li{display: inline-block; width: 25%; font-size: 12px; list-style: none; text-align: center;}
    #quick_menu img{max-width: 80%; max-height: 50%;}
    #right_div{display: inline-block; width:50%; height:500px; float: left;}
 */
   /*  #main_img{
        height: 100%;
        object-fit: cover;
        -webkit-filter: grayscale(100%);
        filter: gray;
        opacity: 0.2;
        max-width: -webkit-fill-available;
        max-height: 100%;
    } */

 /*    #slide_menu{
    	display: inline-block;
    	width:100%;
    	height:350px;
    	border: 1px solid brown;
    	margin-top:20px;
    } */

	.section{
	  width: 100%;
	  height: 100vh;
	  margin-top: 50px;
	  z-index: 1;
	}
</style>
</head>
<body>
 	<%@ include file="../common/header.jsp" %>
	<section class="section">
		<div id="centerWrap"> <!-- 여기에다가 넣으면 됩니다 -->
            <%@ include file="chatting.jsp" %>
        </div>
	</section>
</body>
</html>