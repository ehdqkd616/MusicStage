<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
body {
  margin: 10px;
  font-size: 14px;
}

select {
  width: 200px;
  padding: .8em .5em;
  font-family: inherit;
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid #999;
  border-radius: 0px;
}

select::-ms-expand {
  /* for IE 11 */
  display: none;
}
.frameG{
margin-left:120px;
 height:30px;
  margin-top:10px;
   width:500px;
    border-color: #e4e5ed;
     border-radius: 8px;
      border-style: solid;
       border-width: 1px;
        display: inline-block;
         border-color: e4e5ed;
          text-align: center;
        }
td{
	cursor: pointer;
}
</style>
<body style="padding-top: 100px; padding-left: 30px;">



				<select id='fruits' name='school_name' style="width: 300px;" >
					<option value='' selected>-- 학력 --</option>
				</select>
				<select id='fruits2' name='school_name' >
					<option value='' selected>-- 학교 --</option>
				</select>				
				<select id='fruits3' name='school_name' >
					<option value='' selected>-- 전공 --</option>
				</select>	
<div style=" display: inline-block; right: 30px;">

						<input type="text" name="file" id="innner" class="frameG" >
						<table id="tablee" style=" width: 600px; text-align: right; right: 50px; ">
							<tr >
								<td>학력</td>
								<td>학교</td>
								<td>전공</td>
							</tr>
							
						
						</table>
</div>
<input type="button" value="완료" id="con">
	<script type="text/javascript">
		$('#con').click(function(){
			tta = 	$('#fruits').val();			
			tta2 =	$('#fruits2').val();	
			tta3 =	$('#fruits3').val();
						if(tta2 == null && tta3 == null){
								return false;
							}else{
						opener.callback(tta,tta2,tta3);
						uclose();
								}
				
			});
		function adf15(){
			 var ttttltlt = null;
		$.ajax({
		
		url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=15&pSize=1000',
		
		dataType:'json',
		async:false,
		success:function(data){
			 ttttltlt = data;
			
				}
			})
			return ttttltlt;
		}
		function adf14(){
			 var ttttltlt = null;
		$.ajax({
		
		url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=14&pSize=1000',
		
		dataType:'json',
		async:false,
		success:function(data){
			 ttttltlt = data;
			
				}
			})
			return ttttltlt;
		}
		function adf13(){
			 var ttttltlt = null;
		$.ajax({
		
		url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=13&pSize=1000',
		
		dataType:'json',
		async:false,
		success:function(data){
			 ttttltlt = data;
			
				}
			})
			return ttttltlt;
		}
		function adf12(){
			 var ttttltlt = null;
		$.ajax({
		
		url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=12&pSize=1000',
		
		dataType:'json',
		async:false,
		success:function(data){
			 ttttltlt = data;
			
				}
			})
			return ttttltlt;
		}
		function adf11(){
			 var ttttltlt = null;
		$.ajax({
		
		url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=11&pSize=1000',
		
		dataType:'json',
		async:false,
		success:function(data){
			 ttttltlt = data;
			
				}
			})
			return ttttltlt;
		}
		function adf10(){
			 var ttttltlt = null;
		$.ajax({
		
		url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=10&pSize=1000',
		
		dataType:'json',
		async:false,
		success:function(data){
			 ttttltlt = data;
			
				}
			})
			return ttttltlt;
		}
		function adf9(){
			 var ttttltlt = null;
		$.ajax({
		
		url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=9&pSize=1000',
		
		dataType:'json',
		async:false,
		success:function(data){
			 ttttltlt = data;
			
				}
			})
			return ttttltlt;
		}
		function adf8(){
			 var ttttltlt = null;
		$.ajax({
		
		url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=8&pSize=1000',
		
		dataType:'json',
		async:false,
		success:function(data){
			 ttttltlt = data;
			
				}
			})
			return ttttltlt;
		}
		function adf7(){
			 var ttttltlt = null;
		$.ajax({
		
		url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=7&pSize=1000',
		
		dataType:'json',
		async:false,
		success:function(data){
			 ttttltlt = data;
			
				}
			})
			return ttttltlt;
		}
		
		function adf6(){
			 var ttttltlt = null;
		$.ajax({
		
		url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=6&pSize=1000',
		
		dataType:'json',
		async:false,
		success:function(data){
			 ttttltlt = data;
			
				}
			})
			return ttttltlt;
		}
		
		function adf5(){
			 var ttttltlt = null;
		$.ajax({
		
		url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=5&pSize=1000',
		
		dataType:'json',
		async:false,
		success:function(data){
			 ttttltlt = data;
			
				}
			})
			return ttttltlt;
		}

		
		function adf4(){
			 var ttttltlt = null;
		$.ajax({
		
		url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=4&pSize=1000',
		
		dataType:'json',
		async:false,
		success:function(data){
			 ttttltlt = data;
			
				}
			})
			return ttttltlt;
		}
	
			
			function adf3(){
				 var ttttltlt = null;
			$.ajax({
			
			url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=3&pSize=1000',
			
			dataType:'json',
			async:false,
			success:function(data){
				 ttttltlt = data;
				
					}
				})
				return ttttltlt;
			}

			function adf2(){
				 var ttttltlt = null;
			$.ajax({
			
			url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=2&pSize=1000',
			
			dataType:'json',
			async:false,
			success:function(data){
				 ttttltlt = data;
				
					}
				})
				return ttttltlt;
			}

			function adf1(){
				 var ttttltlt = null;
			$.ajax({
			
			url:'https://openapi.gg.go.kr/Univmjrm?KEY=81076165bfef4ebf8cc4a5b9d0a92fca&Type=json&pIndex=1&pSize=1000',
			
			dataType:'json',
			async:false,
			success:function(data){
				 ttttltlt = data;
				
					}
				})
				return ttttltlt;
			}

			$('#fruits').ready(function(){
				var	total = new Array();
				var data = null;
				var ggga = new Array();
				total[0] = adf1();
				total[1] = adf2();
				total[2] = adf3();
				total[3] = adf4();
				total[4] = adf5();
				total[5] = adf6();
				total[6] = adf7();
				total[7] = adf8();
				total[8] = adf9();
				total[9] = adf10();
				total[10] = adf11();
				total[11] = adf12();
				total[12] = adf13();
				total[13] = adf14();
				total[14] = adf15();
				 	
				ggga[0] =	total[0].Univmjrm;
				ggga[1] =	total[1].Univmjrm;
				ggga[2] =	total[2].Univmjrm;
				ggga[3] =	total[3].Univmjrm;
				ggga[4] =	total[4].Univmjrm;
				ggga[5] =	total[5].Univmjrm;
				ggga[6] =	total[6].Univmjrm;
				ggga[7] =	total[7].Univmjrm;
				ggga[8] =	total[8].Univmjrm;
				ggga[9] =	total[9].Univmjrm;
				ggga[10] =	total[10].Univmjrm;
				ggga[11] =	total[11].Univmjrm;
				ggga[12] =	total[12].Univmjrm;
				ggga[13] =	total[13].Univmjrm;
				ggga[14] =	total[14].Univmjrm;
					gbgb(ggga);
			});
			
			function gbgb(data){
				var mas = new Array();
				var arrnum = new Array();
				var compareP = new Array();
				var compareP1 = new Array();
				var compareP2 = new Array();
				var compareP3 = new Array();
				var compareP4 = new Array();
				var compareP5 = new Array();
				var compareP6 = new Array();
				var compareP7 = new Array();
				var compareP8 = new Array();
				var compareP9 = new Array();
				var compareP10 = new Array();
				var compareP11 = new Array();
				var compareP12 = new Array();
				var compareP13 = new Array();
				var compareP14 = new Array();
				var compareP15 = new Array();

				
				for(var k = 0; k<data.length; k++){
						mas[k] = data[k];
				}
				for(var i=0; i<Object.keys(mas[0][1].row).length; i++){
					var compare = mas[0][1].row[i];
					compareP1[i] = compare;
				}
				for(var i=0; i<Object.keys(mas[1][1].row).length; i++){
					compareP2[i] = mas[1][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[2][1].row).length; i++){
					compareP3[i] = mas[2][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[3][1].row).length; i++){
					compareP4[i]= mas[3][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[4][1].row).length; i++){
					compareP5[i] = mas[4][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[5][1].row).length; i++){
					compareP6[i] = mas[5][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[6][1].row).length; i++){
					compareP7[i] = mas[6][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[7][1].row).length; i++){
					compareP8[i] = mas[7][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[8][1].row).length; i++){
					compareP9[i] = mas[8][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[9][1].row).length; i++){
					compareP10[i] = mas[9][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[9][1].row).length; i++){
					compareP11[i] = mas[10][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[9][1].row).length; i++){
					compareP12[i] = mas[11][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[9][1].row).length; i++){
					compareP13[i] = mas[12][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[9][1].row).length; i++){
					compareP14[i] = mas[13][1].row[i];
				}
				for(var i=0; i<Object.keys(mas[9][1].row).length; i++){
					compareP15[i] = mas[14][1].row[i];
				}
// 				var v1 = 	JSON.parse(JSON.stringify(obj))

// 				Object.assign(compareP1,compareP2);
// 				var v2 = Object.assign(v1,compareP3);
// 				var v3 = Object.assign(v2,compareP4);
// 				var concccc = Object.assign(v3,compareP5);
// 				console.log(v1);
			var concccc = 	compareP1.concat(compareP2).concat(compareP3).concat(compareP4).concat(compareP5).concat(compareP6).concat(compareP7).concat(compareP8).concat(compareP9).concat(compareP10).concat(compareP11).concat(compareP12).concat(compareP13).concat(compareP14).concat(compareP15);
				// 객체 길이 가져오기 Object.keys()
// 				 console.log( Object.keys(arrnum[0]).length);
				
				for(var i=0; i<Object.keys(concccc).length; i++){
					var compare = concccc[i];
						compareP4[i] = compare;
					}

					for(var i=0; i<compareP4.length; i++){
						var compare = compareP4[i];
						compareP[i] = compare;
						}

					
					 var ttt = Array();
				 	var arrnum = new Array();
					//대학교 이름
					var schoolName = new Array();
					//대학교 /전문대
					var SCHOOL_KIND_NM = new Array();
					// 전공
					var MJR_NM = new Array();
					
					const arr3 =   Array.from(compareP);
					console.log(arr3);
				 for(var i=0; i<arr3.length; i++){
					
						var ddo =	arr3[i].SCHOOL_NM;
							schoolName[i]	=	ddo;
						var MJR =	arr3[i].UNDSTUD_KWA_NM;
							MJR_NM[i] = MJR;
						var SCHOOL_in =	arr3[i].SCHOOL_DIV_NM;
							SCHOOL_KIND_NM[i] = SCHOOL_in;
						 
					 }

					 var ttttt = new Set(SCHOOL_KIND_NM);
					 // 대학교 이름
					 var sss = new Set(schoolName);
					 //전공
					 var tes = new Set(MJR_NM);
					 // 학력 구분
					 const arr = 	Array.from(ttttt);
					 //대학교
					 const arr1 = 	Array.from(sss);
					 //전공
					 const arr2 = 	Array.from(tes);
						//비교
			
	 				 console.log(ttttt);
	 				 console.log(sss);
	 				 console.log(tes);
	 				 console.log(arr);
	 				 console.log(arr1);
	 				 console.log(arr2);
			
				 

 				 function uni(){
					 var asd = 	new Array();
					 var f = 	$('#fruits').val();
					 console.log(f);
					 
				 for(var i = 0; i<arr3.length; i++){
					 if(arr3[i].SCHOOL_DIV_NM == f){
						 asd[i]  = 	arr3[i].SCHOOL_NM;
						 }else{
							continue;
							 }
					 }
				 return asd;
				 }

				 function uni2(){
					 var asd = 	new Array();
					 
				 for(var i = 0; i<arr3.length; i++){
					 var f = 	$('#fruits2').val();
					 if(arr3[i].SCHOOL_NM == f){
						 asd[i]  = 	arr3[i].UNDSTUD_KWA_NM;
						 }
					 }
				 return asd;
				 }
					
				 for(var i = 0; i<arr.length; i++){
						$('#fruits').append('<option  value='+arr[i]+'>'+arr[i]+'</option>');
							}
					
					for(var i = 0; i<arr1.length; i++){
						$('#fruits2').append('<option  value='+arr1[i]+'>'+arr1[i]+'</option>');
							}
					
					for(var i = 0; i<arr2.length; i++){
						$('#fruits3').append('<option  value='+arr2[i]+'>'+arr2[i]+'</option>');
							}
					var	 tesss = null;

					
					$('#fruits').click(function(){
						$('#fruits2').empty();
						var wpqkf = new Set(uni());
						console.log(wpqkf);
						 const gggg2 = Array.from(wpqkf);
						 console.log(gggg2.length);
						 for(var i=0; i<gggg2.length; i++){
							 if(gggg2[i] == undefined){
										continue;
								 }
								$('#fruits2').append('<option  value='+ gggg2[i]+'>'+  gggg2[i]+'</option>');
							}
						 $(this).click(function(){
							 tta = $(this).val(); 
							 console.log(tta);
							 })
						  });

					$('#fruits2').click(function(){
						console.log("egege");
						$('#fruits3').empty();
						var wpqkf = new Set(uni2());
						console.log(wpqkf);
						 const gggg = Array.from(wpqkf);
						 console.log(gggg.length);
						 for(var i=0; i<gggg.length; i++){
							 if(gggg[i] == undefined){
										continue;
								 }
								$('#fruits3').append('<option  value='+ gggg[i]+'>'+  gggg[i]+'</option>');
							}
						
						 $(this).change(function(){
							 tta2 = $(this).val(); 
							 console.log(tta);
							 })

				
					  });
					$('#fruits3').click(function(){
						 tta3 = $(this).val(); 
						 console.log(tta);
					});
						for(var i = 0; i<arr3.length; i++){
							 $('#tablee').append('<tr> <td>'+arr3[i].SCHOOL_DIV_NM+'</td> <td>'+arr3[i].SCHOOL_NM+'</td> <td>'+arr3[i].UNDSTUD_KWA_NM+'</td> </tr>');
											 }
						$('#tablee tbody tr').hide();
					$('#innner').on('keyup',function(){
						var ttt = $('#innner').val();
						$('#innner').empty();
						console.log(ttt);
						$('#tablee tbody tr').hide();
						var temp =	$('#tablee tbody tr td:nth-child(3n-1):contains("'+ttt+'")');
						console.log($(temp));
						$(temp).parent().show();
						$(temp).parent().click(function(){
							$('#tablee tbody tr').hide();
							$('#tablee').append('<tr id="first">'+$(this).html()+'</tr>').show();
						var tta=	$('#first td:nth-child(1)').html();
						var tta2=	$('#first td:nth-child(2)').html();
						var tta3=	$('#first td:nth-child(3)').html();
							$('#fruits').prepend('<option value="'+tta+'"selected">'+tta+'"</option>');			
							$('#fruits2').prepend('<option value="'+tta2+'"selected">'+tta2+'"</option>');			
							$('#fruits3').prepend('<option value="'+tta3+'"selected">'+tta3+'"</option>');			

							ttaa=	$('#first td:nth-child(1)').html();
							ttad2=	$('#first td:nth-child(2)').html();
							ttad=	$('#first td:nth-child(3)').html();
							tta = 	$('#fruits').val(ttaa);			
							tta2 =	$('#fruits2').val(ttad2);	
							tta3 =	$('#fruits3').val(ttad);	
							})
							})
						}
						
				//ajax 이벤트 끝부분});
	//ajax 이벤트 끝부분

		
			function uclose(){
				window.opener = window.location.href; self.close();

				}

		</script>
								

										
										

	
</body>
</html>