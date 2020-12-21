$(function(){
	 
	 $("#ok-email").hide();
	 
	 $.ajax({
		 url: "random.com",
		 success: function(data){
			 obj = JSON.parse(data);
			 console.log(obj);
			 $("#random").val(obj);
		 }
	 })
 });
 
 $("#btn-email").click(function(){
	 
	 $.ajax({
		 url: "emailCheck.com",
		 data: {email: $("#email").val(), random: $("#random").val()},
		 success: function(data){
			 
			 console.log(data);
			 
			 if(data == "ok"){
			 	alert("사용가능한 이메일입니다. 인증번호를 입력해주세요");				 
			 } else if(data == "false"){
				 alert("다시 시도해주세요");
			 }
		 },
		 error:function(data){
			 alert("이메일을 확인해주세요");
			 return false;
		 }
	 });
 });
 
 $("#auth").change(function(){
	 
	 if($("#auth").length >= 1){
		 $("ok-eamil").show();	 
	 }
	 
	 $.ajax({
		 url: "emailAuth.com",
		 data: {random : $("#random").val(), auth : $("#auth").val()},
		 success: function(data){
			
			 if(data == "ok"){
				 $("#ok-eamil").text("인증이 완료되었습니다");
			 } else if(data == "false"){
				 $("#ok-eamil").text("인증번호를 잘못 입력하셨습니다");
			 }
		 },
		 error: function(data){
			 alert("다시 시도해주세요");
		 }
	 });
 });