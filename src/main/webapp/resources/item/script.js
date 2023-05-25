/**
 * 
 */
var regMsg = "도서관 이용 신청을 하지 않으셨습니다. \n이용 신청을 하시겠습니까?";
var regProMsg = "이용 신청 등록에 실패 했습니다. \n확인 후 다시 시도해 주세요.";
var dateMsg = "반납일까지 기간이 남아있습니다. \n정말로 반납 하시겠습니까?";
var returnMsg = "반납 하시겠습니까?";
var lateMsg = "반납일이 지나 도서관 이용에 제한이 생깁니다.";
var cancelMsg = "예약을 정말로 취소 하시겠습니까?";
var deleteError = "삭제에 실패 했습니다. \n확인 후 다시 시도해 주세요.";

//오류 발생
function errorAlert(msg){
	alert(msg);
	history.back();
}

//뒤로가기
function goBack() {
	window.history.back();
}

//상세검색
function advSearch() {
	window.location.href="advSearch.item"
}

//로그인 오류
function loginError() {
	alert("로그인 해 주세요.");
	window.history.back();
}

//이용신청 거부
function regError() {
	alert("이용 신청을 해주세요.");
	window.history.back();
}

//이용 등록 시 버튼 체크
function agreeCheck() {
	var check = document.regform.agree.checked;
	if(!check) {
		alert("이용 약관에 동의해 주세요.");
		return false;
	}
}

//대여도서관 선택
function selLib() {
	var lib = document.rend.rend.value;
	if(!lib) {
		alert("도서관을 선택해 주세요.");
		return false;
	}
}

//예약도서관 선택
function checkLib() {
	var lib = document.reservBook.reserv.value;
	if(!lib) {
		alert("도서관을 선택해 주세요.");
		return false;
	}
}

//반납시 확인
function rCheck() {
	var dayCheck = document.returnform.check.value;
	
	if(dayCheck < 0) {
		if(confirm(dateMsg) == false) {
			alert("취소 되었습니다.");
			return false;
		}
	} else if(dayCheck == 0) {
		alert(returnMsg);
	} else if(dayCheck > 0) {
		alert(lateMsg);
	}
	
}

//예약취소 확인
function reservCancel() {
	if(confirm(cancelMsg) == false) {
		alert("예약 화면으로 돌아갑니다.");
		return false;
	}
}

//도서 삭제시
function delBook() {
	if(confirm("정말 삭제 하시겠습니까?") == false) {
		return false;
	}
}