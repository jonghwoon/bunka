
	 

//guestAddForm
function idCheck(id){
	
	// 빈칸테스트 말고 regex 테스트로 변경
	//  	받아오는 함수를 만들기 귀찮아서 그냥 쓰기로 했다. 
	var regexp = /^[a-z]\w{3,11}$/;
	
	if(!regexp.test(id) ){
		alert("id 를 확인해 주세요. - 영문으로 시작하는 4자리 이상의 영문,숫자 조합");
		return;
	};
	
	//==============================================
	// true 일때 페이지 변환
		
    $.ajax({ 									// create an AJAX call...
        data: 	{"id" : id},					// get the form data
        type: 	'post',	 						// GET or POST	// form.attr('method')
        url: 	'guest_member_addFormCheckPro.common',	 		// the file to call
        success: function(response) { 			// on success..
            $('#secret').html(response); 		// update the DIV
        	//console.log("guest_AddFormCheckPro Done id :" + id);	// log
        }
    });   
	//==============================================    
    //  cnt 에 따라 문구 변환/ 제출가능 변수 설정 - 이후 guest_idCheckPro 에서 처리
  
}


function emptyCheck(){	
	var inputs = $(".input");	
	// 공란 검색
	for(var i in inputs)
		if(	inputs[i].value==""){
			inputs[i].focus();
			alert("정보를 작성해주세요!");
			return false;
		}
	return true;
}

//submit REGEX 
// guest, add, info 용 체크	
function inputCheck(form){
	//infoList 필요 
	// infor_list.push(new Array("pwd"   ,"비밀번호를"     ,"password"	,"4자리 이상"  	    	,/\w{3,11}$/       	          		,12, "" ));//1
	
	// 입력 항목 검사
	for(var i in infor_list){					
		// 검사 재료 준비								
		var id  		= infor_list[i][0];		
		var label 		= infor_list[i][1];	
		var placeHolder	= infor_list[i][3];
		var regexp 		= infor_list[i][4];				
								
		var value;
		var errchk = false;
		switch(id){
			
			case "pwdre" :
				if($("#pwdre").val() != $("#pwd").val())
					errchk = true;	
				break;
				
			case "gender" :				
				if( $("#" + id + ":checked").length < 1 )							
					errchk = true;
				else
					value = $("#" + id + ":checked").val();
				break;
				
			case "hobby" :						
				break;
				
			default : 
				if(!regexp.test($("#" + id).val()) )
					errchk = true;
				else
					value = $("#" + id).val();
		}
				
		if(errchk){
			alert(label + " 확인하세요. - " + placeHolder);
			$("#" + id).focus();
			return false;
		}
		
	}
		
	//==============================================
	// true 일때 페이지 변환
	if(form!=null){
		console.log(form + "inputCheck Done");	
		
	    $.ajax({ 								// create an AJAX call...
	        data: 	form.serialize(),			// get the form data
	        type: 	'post',	 					// GET or POST	// form.attr('method')
	        url: 	form.attr('action'),	 	// the file to call
	        success: function(response) { 		// on success..
	            $('#secret').html(response); 	// update the DIV
	        }
	    });
	}
	//==============================================
    
    return true;
    
};



function inputCancel(){
	
	for(var i=0; i< $(".input").length ; i++)
		if($(".input").eq(i).val()!=""){
			$(".input").each(function(){
				$(this).val("");
			})
			return;
		}
	
	popdown('close');
}			
