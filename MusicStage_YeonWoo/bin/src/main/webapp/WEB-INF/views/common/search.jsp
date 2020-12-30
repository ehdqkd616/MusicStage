<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script>
        $(document).ready(function(){
            $(".default_option").click(function(){
                $(this).parent().toggleClass("active");
            })

            $(".select_ul li").click(function(){
                var currentHtml = $(this).html();
                $(".default_option li").html(currentHtml);
                $(this).parents(".select_wrap").removeClass("active");
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
    
    .box{
        margin-top: 100px;
    }

    .box h2{
        color: black;
        font-size: 30px;
        font-weight: 500;
        margin-bottom: 10px;
    }

    .box input, .box button[type="button"]{
        position:absolute;
        display: inline-block;
        font-size: 20px;
        box-sizing: border-box;
        height:100%;
    }

    .box input[type="text"]{
        background: #fff;
        width: calc(100% - 150px);
        border:none;
        outline: none;
        padding: 5px 0px;
        left:125px;
       	text-indent: 0px;
    }

    .box button[type="button"]{
        border:none;
        outline:none;
        cursor:pointer;
		right:0;
        padding:0 5px;
        background: transparent;
    }

    .search_form{
        position:relative;
        width:100%;
        border:5px solid #521110;
        border-radius: 10px;
    }

    .select_wrap{
        width:125px;
        position:relative;
        user-select: none;
        display: inline-block;
    }

    .select_wrap ul{
        padding:0;
        margin:0;
        list-style: none;
    }

    .select_wrap .default_option{
        background:#fff;
        position: relative;
        cursor: pointer;
        border-radius: 4px;
    }

    .select_wrap .default_option li{
    	border-radius: 4px;
        padding:10px 20px;
    }

    .select_wrap .default_option:before{
        content:"";
        position: absolute;
        top:9px;
        right: 23px;
        width:6px;
        height: 6px;
        border:2px solid;
        border-color: transparent transparent #555555 #555555;
        transform: rotate(-45deg);
    }

    .select_wrap .select_ul{
        position: absolute;
        top:55px;
        left:0;
        width:100%;
        background: #fff;
        display: none;
        
    }

    .select_wrap .select_ul li{
        width: 125px;
        height: 35px;
	    cursor: pointer;
	    text-align: center;
        cursor: pointer;
        line-height: 35px;
    }

    .select_wrap .select_ul li:hover{
        background: #fff4dd;
    }

    .select_wrap ul:nth-child(2){
        margin-top: -16px;
    }

    .select_wrap.active .select_ul{
        display: block;
    }

    .select_wrap.active .default_option:before{
        top:50%;
        transform: rotate(-225deg);
    }
</style>
</head>
<body>
    <div class="box">
        <h2 style="font-weight: bold; color: /* rgb(75,75,75) */#190c0c">여기가 너의 STAGE</h2>
        <form>
            <div class="search_form">
                <div class="select_wrap">
                    <ul class="default_option">
                        <li>
                            <div class="menubar_option">
                                <p>-- 선택 --</p>
                            </div>
                    </li>
                    </ul>
                    <ul class="select_ul">
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
                <input type="text" name="serachText" id="beForesearch" placeholder="검색">
                <button type="button" onclick="serachBClick();">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </form>
    </div>
    
    <script>
    	var cate = null;
	    $(".menubar_option").on("click", function(){
			cate = $(this).parent("li").data("cate");
			
		});
	    
	    function serachBClick(){
			var text = document.getElementById("beForesearch").value;
			
			
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