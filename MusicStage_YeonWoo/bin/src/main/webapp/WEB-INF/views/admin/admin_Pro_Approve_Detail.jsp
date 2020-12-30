<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <title>전문가승인-글보기</title>
<style>
   header{z-index: 1; height:50px; position: fixed;}
   
   body{font-family: 'Nanum Gothic', sans-serif; background: #FAFAFA !important;}
   
   
    #centerWrap{margin: auto; width: 1100px; height: auto;}
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
   
   
   /* 카테고리버튼 */
   #m_category{ margin-top: 80px; }
   #m_category input[type=button] { width: 75px; height: 30px; margin-left: 5px; border: 1px solid #DBDBDB; border-radius: 4px; }
   #m_category input[type=button]:hover{ background: gray; color: white; font-weight: bold; }
   /* 카테고리 선택 시 */
   #p_approval{ background: gray; color: white; font-weight: bold; }
   
   /* 게시글보는 부분 */
   #m_content{margin-top: 80px; }
   
   #m_content h1{ margin-bottom: 50px; }
   
   /* 전문가 등록 시간 */
   #enroll_date{float: right; margin-right: 50px;}
   
   /* 전문가 등록한 내용 */
   #pro_profile{ width: 1000px; min-height: 450px; border-top: 3px solid #DBDBDB; border-bottom: 3px solid #DBDBDB;}
   .table_title{ width: 100px; height: 20px; padding: 5px; border-bottom: 1px solid #DBDBDB; border-right: 2px solid #DBDBDB;}
   .content{ padding: 5px; border-bottom: 1px solid #DBDBDB;}
   .c_table_title{ width: 100px; height: 40px; text-align: right; padding: 5px; }
   .c_content{ padding: 5px; border-left: 2px solid #DBDBDB; }
   
   /* 승인, 거절, 목록보기 버튼 */
   #p_button{margin-top: 50px;}
   #p_button input[type=button]{ width: 60px; height: 25px; border-radius: 4px; margin-right: 5px;}
   #yes{ border: none; background: #009933; color: white; }
   #no{ border: none; background: #990033; color: white; }
   #list{ border: none; background: #521110; color: white; }
   
   
   /* 모달창 */
   .modal_layer { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5);
                z-index:-1; }
   /* 거절사유선택 */
   #modal { position:relative; width:100%; height:100%; z-index:1; display:none; }
   #no_why{ width: 320px; min-height: 130px; border: 1px solid #DBDBDB; border-radius: 8px; 
         padding: 20px 15px 15px 15px; background: white; position: fixed; left: 640px; bottom: 350px; }
   #modal_select{ margin: 20px 0px 25px 0px; }
   #no_select{ width: 280px; }
   #m_yes{ width: 50px; height: 25px; border: none; background:#521110; color: white; border-radius: 4px;}
   #m_no{width: 50px; height: 25px; border: 1px solid #DBDBDB; background: none; border-radius: 4px;}
   
</style>
</head>
<body>
    <%@ include file="../common/header.jsp"%>
        
   <section class="section">
      
      <div id="centerWrap"> <!-- 여기에다가 넣으면 됩니다 시작 -->
         <div id="m_category" align= center>
            <input id=notice type="button" value="공지사항" onclick="location.href='noticeList.ad'">
            <input id="a_report" type="button" value="계정신고" onclick="location.href='memberReportList.ad'">
            <input id="b_report" type="button" value="게시글 신고" onclick="location.href='boardReportList.ad'">
            <input id="p_approval" type="button" value="전문가승인" onclick="location.href='proApproveList.ad'">
            <input id="b_approval" type="button" value="게시글승인" onclick="location.href='boardApproveList.ad'">
         </div>
         <!-- 전문가 등록한 게시물 나오게 -->
         <div id="m_content">
            <div align="center">
               <h1>전문가 승인</h1>
            </div>
         
            <div align="center">
               <div id="enroll_date">
                  <p id="enroll_date_p">등록 시간 : <fmt:formatDate value="${registerPro.register_date}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
               </div>
               <table id="pro_profile">
                  <tr>
                     <th class="table_title">등록 번호</th>
                     <td class="content" colspan="2">${registerPro.register_no}</td>
                  </tr>
                  <tr>
                     <th class="table_title">등록자</th>
                     <td class="content" colspan="2">${registerPro.register_user_nickName}</td>
                  </tr>
                  <tr>
                     <th rowspan="8" class="table_title">등록내용</th>
                     <td class="c_table_title">
                        전문분야
                     </td>
                     <td class="c_content">
                        ${registerPro.specialty_field}
                     </td>
                  </tr>
                  <tr>
                     <td class="c_table_title">
                        소개
                     </td>
                     <td class="c_content">
                        ${registerPro.introduce}
                     </td>
                  </tr>
                  <tr>
                     <td class="c_table_title">
                        학력
                     </td>
                     <td class="c_content">
                        ${registerPro.school_name} / ${registerPro.major}
                     </td>
                  </tr>
                  <tr>
                     <td class="c_table_title">
                        경력
                     </td>
                     <td class="c_content">
                        ${registerPro.career}
                     </td>
                  </tr>
                  <tr>
                     <td class="c_table_title">
                        자격증
                     </td>
                     <td class="c_content">
                        ${registerPro.certification}
                     </td>
                  </tr>
                  <tr>
                     <td class="c_table_title">
                        카테고리
                     </td>
                     <td class="c_content">
                        ${registerPro.special_category}
                     </td>
                  </tr>
                  <tr>
                     <td class="c_table_title">
                        서비스타입
                     </td>
                     <td class="c_content">
                        ${registerPro.service_type}
                     </td>
                  </tr>
                  <tr>
                     <td class="c_table_title">
                        첨부파일
                     </td>
                     <td class="c_content">
                        첨부파일 들어가는 곳
                     </td>
                  </tr>
               </table>
            </div>
            
            <!-- 승인 Url -->
            <c:url var="approve" value="proApproveYes.ad">
               <c:param name="register_no" value="${registerPro.register_no}"/>
               <c:param name="register_user" value="${registerPro.register_user}"/>
               <c:param name="page" value="${ page }"/>
               <c:param name="searchCondition" value="${ searchCondition }"/>               
            </c:url>
            
            <!-- 거절 Url -->
            <c:url var="reject" value="proApproveNo.ad">
               <c:param name="register_no" value="${registerPro.register_no}"/>
               <c:param name="register_user" value="${registerPro.register_user}"/>
               <c:param name="page" value="${ page }"/>
               <c:param name="searchCondition" value="${ searchCondition }"/>               
            </c:url>                        
            
            <!-- 글 목록 -->
            <c:url var="blist" value="searchProApproveList.ad">
               <c:param name="page" value="${ page }"/>
               <c:param name="searchCondition" value="${ searchCondition }"/>
            </c:url>   
            
            <div id="p_button" align="center">
               <input id="yes" type="button" value="승인[Y]" onclick="check();">
               <input id="no" type="button" value="거절[N]">
               <input id="list" type="button" value="목록보기" onclick="location.href='${ blist }'">
            </div>
         </div>
         <script>
            function check(){
               var ck = confirm("전문가 등록 승인처리 하시겠습니까?");
               console.log("전문가 등록 승인처리 url : ${approve}");
               
               var register_no = "${registerPro.register_no}";
               var register_user = "${registerPro.register_user}";
               var register_user_nickName = "${registerPro.register_user_nickName}";
               
               console.log("register_no : " + register_no);
               console.log("register_user : " + register_user);
               console.log("register_user_nickName : " + register_user_nickName);
               
               
               if(ck){
                  alert("승인처리를 완료하였습니다.");
                  location.href="${approve}";
                  
                    var alarm_sender = "${loginUser.userId}";
                    
                   // 알림 DB저장
                     var AlarmData = {
                           "alarm_sender" : alarm_sender,
                           "alarm_receiver" : register_user,
                           "alarm_type" : "RegisterYes",
                           "alarm_title" : "<b>MusicStage</b> 전문가 등록 요청이 승인되었습니다.",
                           "alarm_content" : "축하드립니다. 전문가 등록 요청이 승인되었습니다. 전문가 등급으로 더욱 다양한 활동을 즐기며 혜택을 누려보세요!",
                           "register_no" : register_no      
                     };
                     
                     $.ajax({
                        type : 'post',
                        url : 'saveAlarm.ws',
                        data : JSON.stringify(AlarmData),
                        contentType: "application/json; charset=utf-8",
                        dataType : 'text',
                        success : function(data){
                           if(data == 1){
                              if(socket){
                                 let socketMsg = "RegisterYes," + alarm_sender + ","+register_user+","+register_no; // 소켓에 보낼 메세지
                                 console.log("msgmsg : " + socketMsg); // 소켓 메세지 확인 콘솔
                                 socket.send(socketMsg); // 소켓에 메세지를 보낸다.                  
                              }else{
                                 alert("소켓이 열려있지 않습니다.");
                              }
                           }else if(data == 0){
                              alert("알람 저장에 실패했습니다");
                           }

                        },
                        error : function(err){
                           console.log(err); 
                        }
                     });   
               }else{
                  alert("취소하였습니다.");
               }
            }
         
            function check2(){
               var ck = confirm("전문가 등록 거절처리 하시겠습니까?");
               var no_select = $("#no_select option:selected").text();
               
               var register_no = "${registerPro.register_no}";
               var register_user = "${registerPro.register_user}";
               var register_user_nickName = "${registerPro.register_user_nickName}";
               var urlDetail = "<%= request.getContextPath() %>"+"/registerDetail.me?register_no="+register_no;
               
               console.log("register_no : " + register_no);
               console.log("register_user : " + register_user);
               console.log("register_user_nickName : " + register_user_nickName);
               console.log("urlDetail : " + urlDetail);
               
               
               if(ck){
                  alert("전문가 등록 거절 처리를 완료하였습니다.");
                  location.href="${reject}"+"&no_select="+no_select;
                  
                    var alarm_sender = "${loginUser.userId}";
                    
                   // 신고자 알림 DB저장
                     var AlarmData = {
                           "alarm_sender" : alarm_sender,
                           "alarm_receiver" : register_user,
                           "alarm_type" : "RegisterNo",
                           "alarm_title" : "<b>MusicStage</b> 전문가 등록 요청이 거절되었습니다.",
                           "alarm_content" : "전문가 등록 요청이 다음과 같은 사유로 거절되었습니다. <br><br>" + no_select + "<br><br> 사유를 확인해주시고 수정 후 재등록 요청 바랍니다.",
                           "register_no" : register_no,   
                     };
                  
                     $.ajax({
                        type : 'post',
                        url : 'saveAlarm.ws',
                        data : JSON.stringify(AlarmData),
                        contentType: "application/json; charset=utf-8",
                        dataType : 'text',
                        success : function(data){
                           if(data == 1){
                              if(socket){
                                 let socketMsg = "RegisterNo," + alarm_sender + ","+register_user+","+register_no; // 소켓에 보낼 메세지
                                 console.log("msgmsg : " + socketMsg); // 소켓 메세지 확인 콘솔
                                 socket.send(socketMsg); // 소켓에 메세지를 보낸다.                  
                              }else{
                                 alert("소켓이 열려있지 않습니다.");
                              }
                           }else if(data == 0){
                              alert("알람 저장에 실패했습니다");
                           }
                        },
                        error : function(err){
                           console.log(err); 
                        }
                     });   
                  
                  
               }else{
                  alert("취소하였습니다.");
               }
            }
         </script>
         
            
         
         
         <!-- 거절누를시 거절사유 선택할수있는 div -->
         <div id="modal">
            <div id="no_why">
               <div id="modal_table_title" align="center">전문가등록-거절</div>
               <div id="modal_select" align="center">
                  <select id="no_select" >
                     <option>1번옵션</option>
                     <option>2번옵션</option>
                     <option>3번옵션</option>
                     <option>4번옵션</option>
                     <option>5번옵션</option>
                     <option>6번옵션</option>
                  </select>
               </div>
               <div align= center>
                  <input id="m_yes" type="button" value="확인" onclick="check2();">
                  <input id="m_no" type="button" value="취소">
               </div>
            </div>
         
            <div class="modal_layer"></div>
         </div>
         
         <!-- 모달 스크립트 -->
        <script>
           $(document).ready(function(){
            
            /* 신고글 보기모달 */
              $("#no").click(function(){
                 $("#modal").fadeIn("fast").css("display","block");
              });
              
              // 모달아닌 다른곳 클릭하면 닫기
            $(".modal_layer").click(function(){
               $("#modal").fadeOut("fast").css({"display":"none"});
            });
            
            $("#m_no").click(function(){
               $("#modal").fadeOut("fast").css({"display":"none"});
            });
              
           });
        
        </script>
      
      
        </div>
   </section>
</body>
</html>