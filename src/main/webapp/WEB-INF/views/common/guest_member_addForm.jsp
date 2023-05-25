<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<%@ include file="setting_common.jsp" %>




<html>
<!-- Style override -->
<style>	
	[value = '중복확인'] {
		font-size : 0.7em;
	}
</style>


 <!-- 로그인 관련  --> 
 <script type ="text/javascript" src="/center/resources/common/script_guest.js"></script>
  
<script type ="text/javascript">
//회원 가입에 관한 문서
	var infor_list = new Array();
						   //("id"    			,"label"         	,"type"    	,"placeholder"          ,/regex/                  		,"length","size?",));
	infor_list.push(new Array("id"    			,"아이디를"       	,"text"    	,"4자리 이상" 			,/^[a-z]\w{3,11}$/                 	,12, 	7	));//0
	infor_list.push(new Array("idCheckdone"  	,"아이디 중복확인을","hidden"   ,"버튼 클릭" 			,/^[1]$/               			  	,1, 	1	));//0
	infor_list.push(new Array("passwd"   		,"비밀번호를"     	,"password"	,"4자리 이상"  	    	,/\w{4,16}$/       	          		,12, 	10	));//1
	infor_list.push(new Array("passwdre" 		,"비밀번호 확인을"	,"password"	,"4자리 이상"   		,/\w{4,16}$/                 		,12, 	10	));//2
	infor_list.push(new Array("name"  			,"이름을"         	,"text"    	,"한글 이름 3자"		,/^[가-힣]{2,3}$/                 	,3, 	4	));//3
	infor_list.push(new Array("nick"  			,"닉네임을"       	,"text"    	,"2자 이상" 	       	,/[0-힣]{2,12}$/                 	,12, 	7	));//4
	infor_list.push(new Array("jumin"			,"주민번호를"     	,"text"   	,"6자리"    	      	,/^[00-99]{2}[01-12]{2}[01-31]{2}[0-9]{7}$/	,13, 	8	));//6
	
	//infor_list.push(new Array("jumin1"		,"주민번호를"     	,"text"   	,"6자리"    	      	,/^[00-99]{2}[01-12]{2}[01-31]{2}$/	,6, 	4	));//6
	//infor_list.push(new Array("jumin2"		,"주민번호를"     	,"password" ,"7자리"	        	,/^[0-9]{7}$/						,7, 	4	));//6	
	//infor_list.push(new Array("gender"		,"성별을"         	,"radio"   	,""					 	,""                   				,0, 	10	));//7
	
	/* 	
	infor_list.push(new Array("address"	  		,"주소를"			,"text"   	,"대충 입력"          	,/^[0-9]{10,11}$/					,11,	7	));//6
	infor_list.push(new Array("zipcode"	  		,""					,"hidden"   ,"자동 입력"          	,/^[0-9]{10,11}$/					,11,	7	));//6
	 */
	 
	infor_list.push(new Array("hp"	  			,"핸드폰번호를"		,"text"   	,"없이 입력"          	,/^[0-9]{10,11}$/					,11,	7	));//6
	infor_list.push(new Array("email" 			,"이메일 주소를"  	,"email"   	,"정확히 입력"          ,/^[a-z]\w+[@]\w+[.]\w+$/          	,20, 	15	));//5
	
	// ID	PASSWD	NAME	NICK	JUMIN	ADDRESS	ZIPCODE	HP	EMAIL	REGDATE	LASTDATE
	
	//테이블 제작	
	$(document).ready(function(){

		for(var i=0; i<infor_list.length; i++){
			
			// 재료 준비
			var inputForm = "";
			var repeat = 1;
			
			while(repeat){
				repeat--;
				
				var id  	= infor_list[i][0];
				var label 	= infor_list[i][1].substr(0,infor_list[i][1].length -1);
				var type 	= infor_list[i][2];
				var place 	= infor_list[i][3];			
				var len		= infor_list[i][5];
				var size 	= infor_list[i][6];
					
				switch(id){							
					case "gender" 	: 
						inputForm += "남성 <input type ='" + type + "' id ='" + id + "' name ='" + id + "' value ='1'>";
						inputForm += "여성 <input type ='" + type + "' id ='" + id + "' name ='" + id + "' value ='2'>";					
						break;
	
					default : 
						inputForm += "<input class = 'input' type ='" + type + "' id ='" + id + "' name ='" + id
							  	  +  "'placeholder ='" + place + "' maxlength ='" + len + "' size = '" + size + "'>";	break;
				}
				
				switch(id){	
					case "id" :
						inputForm += " <input type ='button' value='중복확인' onclick=idCheck($('#id').val())>";					
						inputForm += " <p id ='done'> </p>";	break;
						
					case "jumin1"		:	inputForm += " - ";	// slideDown
					case "idCheckdone"	:	i++;	repeat++;	break;
					default :	break;
				}
				
			}
			
			// 뿌리기	
			$("#join").append(	"<tr><td>	<label for ='" + id + "'> "  + label + "</label> </td>"
					   			  + "<td>" + inputForm + 									"</td></tr>"
			);
			
		}
		
	});
</script>

<script>
	// id 변경시 제출 변수 초기화, 사용불가 메시지 초기화.
	$(document).ready(function(){
		
		$("#id").change(function(){
			$("#done").html("");
			$("#done").css("color" , "red");
			 // 제출 가능 off	
			$("#idCheckdone").val(0);			 
		});
	})	
</script>

<style>
	.popupdiv	{margin : 80px;	}		
	.popupdiv td{height : 40px;	}	
	#join input {margin-left: 10px;	}	
	#secret 	{visibility: hidden;}	
	#done 		{font-size: 12px; display: inline;}	
	.c			{text-align: center;}
</style>

<body>
	<div class = "popupdiv">
	<h2 class="c"> 회원 가입 </h2>
	<br>
	<form id ="popupform" action ="guest_member_addPro.common" onsubmit="return false">
		<table id = "join">	</table>
		
		<!-- 임시 추가함 -->
		<input type="hidden" name="address" value="미입력">
		<input type="hidden" name="zipcode" value="0000">
		
		<div class="c" id = "enter">
			<br>
			<input type ="submit" id ="submit" value ="확인" onclick="inputCheck($('#popupform'));">
			<input type ="button" id ="reset"  value ="취소" onclick="inputCancel();">
		</div>	
	</form>
	</div>
	<div id="secret"></div>
	
</body>
</html>

