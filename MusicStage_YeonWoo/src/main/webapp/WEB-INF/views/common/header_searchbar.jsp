<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
        $(document).ready(function(){
            $(".menubar_default_option").click(function(){
                $(this).parent().toggleClass("active");
            })

            $(".menubar_select_ul li").click(function(){
                var currentHtml = $(this).html();
                $(".menubar_default_option li").html(currentHtml);
                $(this).parents(".menubar_select_wrap").removeClass("active");
            })
        });
    </script>
<style>
    *{
        list-style: none;
        margin: 0;
        padding:0;
        box-sizing: border-box;
    }

	.menubar_box{
		background: #fff;
		border-radius: 8px;
	}

    .menubar_box h2{
        color: black;
        font-size: 30px;
        font-weight: 500;
        margin-bottom: 10px;
    }

    .menubar_box input, .menubar_box button[type=button]{
        position:absolute;
        display: inline-block;
        font-size: 15px;
        box-sizing: border-box;
        height:100%;
    }

    .menubar_box input[type="text"]{
        background: #fff;
        width:calc(100% - 150px);
        border:none;
        outline: none;
        padding: 5px;
        left:125px;
        border-radius: 0;
		margin-top: 2px;
    }
    

    .menubar_box button[type=button]{
        border:none;
        outline:none;
        cursor:pointer;
        right:0;
        padding:0 5px;
        background: #fff;
        border-radius: 9px;
    }

    .menubar_search_form{
        position:relative;
        border:1px solid;
        border-color: gray;
        border-radius: 8px;
    }

    .menubar_select_wrap{
        width:125px;
        position:relative;
        user-select: none;
        display: inline-block;
    }

    .menubar_select_wrap ul{f
        padding:0;
        margin:0;
        list-style: none;
    }

    .menubar_select_wrap .menubar_default_option{
        background:#fff;
        position: relative;
        cursor: pointer;
        border-radius: 9px;
    }

    .menubar_select_wrap .menubar_default_option li{
        padding:10px 20px;
    }

    .menubar_select_wrap .menubar_default_option:before{
        content:"";
        position: absolute;
        top:10px;
        right: 18px;
        width:6px;
        height: 6px;
        border:2px solid;
        border-color: transparent transparent #555555 #555555;
        transform: rotate(-45deg);
    }

    .menubar_select_wrap .menubar_select_ul{
        position: absolute;
        top:55px;
        left:0;
        width:100%;
        background: #fff;
        display: none;
        border-radius: 4px;
    }

    .menubar_select_wrap .menubar_select_ul li{
        width: 125px;
        height: 35px;
	    cursor: pointer;
	    text-align: center;
        cursor: pointer;
        line-height: 35px;
    }

    .menubar_select_wrap .menubar_select_ul li:hover{
        background: #DBDBDB;
        border-radius: 4px;
    }

    .menubar_select_wrap ul:nth-child(2){
        margin-top: -16px;
    }

    .menubar_select_wrap.active .menubar_select_ul{
        display: block;
    }

    .menubar_select_wrap.active .menubar_default_option:before{
        top:45%;
        transform: rotate(-225deg);
    }
    
</style>
</head>
<body>
    <div class="menubar_box">
            <div class="menubar_search_form">
                <div class="menubar_select_wrap">
                    <ul class="menubar_default_option">
                        <li>
                            <div class="menubar_option" >
                                <p>-- 선택 --</p>
                            </div>
                    </li>
                    </ul>
                    <ul class="menubar_select_ul">
                        <li data-cate="social">
                            <div class="menubar_option">
                                <p>소셜</p>
                            </div>
                        </li>
                        <li data-cate="find">
                            <div class="menubar_option">
                                <p>찾아요</p>
                            </div>
                        </li>
                        <li data-cate="review">
                            <div class="menubar_option">
                                <p>리뷰</p>
                            </div>
                        </li>
                        <li data-cate="column">
                            <div class="menubar_option">
                                <p>컬럼</p>
                            </div>
                        </li>
                        <li  data-cate="musician">
                            <div class="menubar_option">
                                <p>뮤지션</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <input type="text" name="serachText" id="search" placeholder="검색">
                <button type="button" onclick="serachClick();">
                    <i class="fas fa-search"></i>
                </button>
            </div>
    </div>
    
    <script>
    	var cate = null;
	    $(".menubar_option").on("click", function(){
			cate = $(this).parent("li").data("cate");
			
		});
	    
	    function serachClick(){
			var text = document.getElementById("search").value;
			
			
			if(cate == null){
				alert("검색카테고리를 선택 해 주세요.");
				return false;
			} else if(text == ""){
				alert("검색어를 입력해 주세요");
				document.getElementById("search").focus();
			} else {
				location.href="search.bo?searchText=" + text + "&category=" + cate;
			}
		}
	    
    </script>
    
</body>
</html>