/**
 * 
 */

var msg_writer = "작성자를 입력해조";
var msg_passwd = "비밀번호를 입력해조";
var msg_subject = "제목을 입력하세요";

var passwdError = "호오? 비밀번호 확인이 되지 않네요?";
var updateError = "수정 실패! 확인후 다시 시도하시조";
var insertError = "등록실패!";
var msg_confirmId="중복확인을 확인해라";

function confirmcheck() {
	if (confirm("정말 삭제 할건가요??") == true) {
		if(!document.getElementById("delete").value) {
			document.viewform.contentsdel.focus();
			document.test.action="page_a.html";

			return false;
		}else{
		window.location("qboardDel.circle");
		}
	} else {
		window.history.back();
	}
}

function qwritecheck() {
	alert("로그인이후 글쓰기 가능합니다.");
}

function writecheck() {
	alert("로그인이후 글쓰기 가능합니다.");
	window.location("board.circle");
	return false;
}

function errorAlert(msg) {
	alert(msg);
	window.history.back();
}	


