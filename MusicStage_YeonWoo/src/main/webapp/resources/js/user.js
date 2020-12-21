let index = {
	
	init: function(){
		$("#btn-save").on("click", ()=>{
			
			var arr = [];
			
			$(".hidden_class").each(function(){
			
				if($(this).val() == "true"){
					arr.push($(this).val());		
				}
			});
			
			if($("#ok-eamil").text() == "인증이 완료되었습니다")
				arr.push($("#ok-eamil").text());
			
			/*console.log(arr.length);*/
			
			if(arr.length >= 9){
				this.save();				
			} else{
				alert("다시 확인해주세요");
			}
			
		});
	},
	
	checkId: function(){
		$("#check_id").on("click", function(){
		
		var userId = $("#userId").val();
		var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
		
		if(!idReg.test(userId)){
			alert("다시 확인해주세요");
			$("#hidden_id").val("false");
		} else{
			$.ajax({
			url: "isExistID.me",
			type: "GET",
			data: {userId:userId},
			dataType: "text",
			success:function(data){
				
				if(data == "true"){
				alert("사용 가능한 아이디 입니다.");
				$("#hidden_id").val("true");
				} else {
				alert("중복된 아이디 입니다.");
				$("#userId").focus();
				$("#hidden_id").val("false");
						}	
					}			
				});	
			}
		});
	},
	
	checkPwd: function(){
		$("#re_password").on("focusout",function(){
		
		var pwd1 = $("#password").val();
		var pwd2 = $("#re_password").val();
		var pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

		if(pwdReg.test(pwd1)){
			if(pwd1 == pwd2){
				alert("비밀번호 사용 가능합니다.");
				$("#hidden_pwd").val("true");
				
			} else {
				alert("비밀번호가 일치 하지 않습니다.");
				$("#re_password").val("");
				$("#re_password").focus();
				$("#hidden_pwd").val("false");
					}
			} else {
				alert("비밀번호를 다시 입력해주세요.");
				$("#password").val("");
				$("#re_password").val("");
				$("#password").focus();
				$("#hidden_pwd").val("false");
				}
			});
		},
		
	checkName: function(){
		
		$("#userName").on("blur", function(){
			
			var userName = $("#userName").val();
			var trimName = $.trim(userName);
			var korReg = /^[가-힣]{2,6}$/;
		
			if(korReg.test(trimName)){
				$("#userName").val(trimName);
				$("#hidden_name").val("true");
			} else {
				$("#userName").focus();
				$("#userName").val("");
				$("#hidden_name").val("false");
			}	
		});
	},	
	
	checkNickName: function(){
		
		$("#nickName").on("blur", function(){
			
			var nickName = $("#nickName").val();
			var trimNickName = $.trim(nickName);
		
			if(trimNickName != ""){
				$("#nickName").val(trimNickName);
				$("#hidden_nickName").val("true");
			} else if(trimNickName == ""){
				$("#nickName").focus();
				$("#nickName").val("");
				$("#hidden_nickName").val("false");
			}	
		});
	},
	
	checkJumin: function(){
		
		$("#registrationNumber1, #registrationNumber2").on("blur", function(){
		 $front = $("#registrationNumber1");
	     $front_value = $front.val();
	     $front_length = $front.val().length;
	     $back = $("#registrationNumber2");
	     $back_value = $back.val();
	     $back_length = $back.val().length;

         if ($front_length >= 6 && $back_length >= 1) {
                 var genderCode = $back_value.substring(0,1);
                 
                 if(genderCode % 2 == 1){
                     $("input:radio[value='M']").prop("checked", true);
                 }
                 else{	                    	
                 	$("input:radio[value='W']").prop("checked", true);
                 }

                 var year = $front_value.substring(0,2);
             
                 $("#birth_y").val((genderCode >= 3) ? "20" + year : "19" + year);
                 $("#birth_m").val($front.val().substring(2,4));
                 $("#birth_d").val($front.val().substring(4,6));
				 
				$("#hidden_jumin").val("true");
         } else if($front_length < 6){
			$front.focus();
			$("#hidden_jumin").val("false");
		} else if($back_length < 1){
			$back.focus();
			$("#hidden_jumin").val("false");
			}			
		});
	},
	
	checkPhone: function(){
		$("#phone").on("blur", function(){
			
			var phone = $("#phone").val();
			var phoneReg = /^01[0179][0-9]{7,8}$/;
			
			if(phoneReg.test(phone)){
				$("#hidden_phone").val("true");
			} else{
				$("#hidden_phone").val("false");
			}
		});
	},
	
	checkAddress: function(){
		$("#address").on("click",function(){

			var popupX = (window.screen.width/2) - (570/2);
			var popupY = (window.screen.height/2) - (420/2);
			var pop = window.open("address.me","pop","width=570,height=420,left="+popupX +",top="+popupY+",screen"+popupX+",screenY="+popupY+",scrollbars=yes, resizable=yes"); 
 		});
	},
	
	save: function(){
		
			$birth_y = $("#birth_y").val();
			$birth_m = $("#birth_m").val();
			$birth_d = $("#birth_d").val();
		
		let memberData = {
			userId: $("#userId").val(),
			password: $("#password").val(),
			userName: $("#userName").val(),
			nickName: $("#nickName").val(),
			birth: $birth_y + "-" + $birth_m + "-" + $birth_d,
			gender: $(".gender:checked").val(),
			email: $("#email").val(),
			phone: $("#phone").val(),
			address: $("#address").val(),
			url_address: $("#url_address").val()
		}
		
		$.ajax({
			type: "post",
			url: "api/join.me",
			data: memberData,
			success: function(resp){
				/*alert(resp);*/
				location.href="join3.me";
			}
		});
	}
}

index.checkId();
index.checkPwd();
index.checkName();
index.checkNickName();
index.checkJumin();
index.checkPhone();
index.checkAddress();
index.init();