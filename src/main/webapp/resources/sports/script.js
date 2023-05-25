
var msg_writer="작성자를 입력하세요";
var msg_passwd="비밀번호를 입력하세요";
var msg_subject="제목을 입력하세요";
var msg_content="글 내용을 입력하세요";
var passwdError="비밀번호가 일치하지 않습니다. \n확인후 다시 시도하세요";
var updateError="글 수정에 실패하였습니다. \n 확인후 다시 시도하세요";
var deleteError="글 삭제에 실패했습니다. \n 확인후 다시 시도해주세요";
var insertError="글작성에 실패했습니다. \n 확인후 다시 시도해주세요";

function confirmId(){
	if(!document.inputform.id.value){
		alert("아이디를 입력해주세요");
		document.inputform.id.focus();
		return false;
	}
	
	//window.open("파일명", "윈도우명", "창속성");
	//url="주소?속성명=" + 속성값;
	var url="confirmId.do?id="+document.inputform.id.value;
	         
	window.open(url, "confirm", "menubar=no, width=300, height=200");
}

function setId(id){
	
	opener.document.inputform.id.value=id;
	opener.document.inputform.hiddenId.value="1";
	self.close();
}

function resethidden(){
	document.inputform.hiddenId.value="0";
}




	
function errorAlert(msg){
	alert(msg);
	window.history.back();
}


//게시글 수정, 삭제
function passwdFocus(){
	document.passwdform.passwd.focus();
}



function passwdCheck(){
	if(!document.passwdform.passwd.value){
		alert(msg_passwd);
		document.passwdform.passwd.focus();
		return false;
	}
}

function modifyFocus(){
	document.modifyform.subject.focus();
}

function modifyCheck(){
	if(!document.modifyform.subject.value){
		alert(msg_subject);
		document.modifyform.subject.focus();
		return false;
	}

	if(!document.modifyform.passwd.value){
		alert(msg_passwd);
		document.modifyform.passwd.focus();
		return false;
	}
}

function writefocus(){
	document.writeform.writer.focus();
}


function writeCheck(){
	if(!document.writeform.writer.value){
		altert(msg_writer);
		document.writeform.writer.focus();
		return false;
	}else if(!document.writeform.passwd.value){
		altert(msg_passwd);
		document.writeform.passwd.focus();
		return false;
	}else if(!document.writeform.subject.value){
		altert(msg_subject);
		document.writeform.subject.focus();
		return false;
	}else if(!document.writeform.content.value){
		altert(msg_content);
		document.writeform.content.focus();
		return false;
	}
}

/*function check(chk){
	//console.log(chk);
	var chkvalue="";
	var cou = "";
alert("aaa");
	for(var a=0; a < chk.length; a ++){
		if(chk[a].checked == true){
			chkvalue += chk[a].value+'-';
			cou += document.getElementsByName("count"+[a]).value+'&';
		}
	}
	window.location="basketadd.do?chk="+chkvalue+"&cou=" + cou;
}*/

function basketremove(chk){
	var chkvalue="";
	for(var a=0; a < chk.length; a ++){
		if(chk[a].checked == true){
			console.log(chk[a].value);
			chkvalue += chk[a].value+'-';
			
		}
	}
	window.location="basketremove.do?chk="+chkvalue;
}

function loginchk(){
	alert("로그인 후 이용해 주세요.")
}

function loginCheck(logcnt){
	if(logcnt == 0){
		alert("로그인 후 이용해주세요");
		return false;
	}
	
}