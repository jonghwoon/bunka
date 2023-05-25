/*
 *	item페이지 자바스크립트 소스 
 */

//도서입력 관련 에러메세지
var msg_img = "이미지를 넣어주세요.";
var msg_lib	= "도서관을 선택해 주세요.";
var msg_title = "책 제목을 입력해 주세요.";
var msg_author = "저자명을 입력해 주세요.";
var msg_publisher = "출판사를 입력해 주세요.";
var msg_keyword = "키워드를 입력해 주세요.";
var msg_isbn_null = "ISBN을 입력해 주세요.";
var msg_pubDate = "출판일을 입력해 주세요.";
var msg_incomeDate = "입고일을 입력해 주세요.";
var msg_index = "목차를 입력해 주세요.";
var msg_catBig = "대분류를 선택해 주세요.";
var msg_catMid = "중분류를 선택해 주세요.";
var msg_value = "수량을 입력해 주세요.";

var insertError = "도서 등록에 실패했습니다. \n확인 후 다시 시도해 주세요";
var rendError = "도서 대여에 실패했습니다. \n확인 후  다시 시도해 주세요.";
var reservError = "도서 예약에 실패했습니다. \n확인 후 다시 시도해 주세요.";
var penaltyError = "도서 대여 제한 상태입니다.";
var rendMaxError = "대여한 도서 숫자가 최대치 입니다.";
var updateError = "도서 수정에 실패했습니다. \n확인 후 다시 시도해 주세요.";
var rentnowError = "대여중인 도서는 삭제할 수 없습니다!";
var queError = "우선 순위 예약자가 있습니다.";

//도서 입력 시 필수 입력 체크
function bookInsertCheck() {
	//도서관	
	if(!document.bookInsert.library.value) {
		alert(msg_lib);
		document.bookInsert.library.focus();
		return false;
	//제목
	} else if(!document.bookInsert.title.value) {
		alert(msg_title);
		document.bookInsert.title.focus();
		return false;
	//저자	
	} else if(!document.bookInsert.author.value) {
		alert(msg_author);
		document.bookInsert.author.focus();
		return false;
	//출판사	
	} else if(!document.bookInsert.publisher.value) {
		alert(msg_publisher);
		document.bookInsert.publisher.focus();
		return false;
	//키워드
	} else if(!document.bookInsert.keyword.value) {
		alert(msg_keyword);
		document.bookInsert.keyword.focus();
		return false;
	//isbn	
	} else if(!document.bookInsert.isbn.value) {
		alert(msg_isbn_null);
		document.bookInsert.isbn.focus();
		return false;
	//출판일
	} else if (!document.bookInsert.publishDate.value){
		alert(msg_pubDate);
		document.bookInsert.publishDate.focus();
		return false;
	//입고일
	} else if (!document.bookInsert.incomedate.value){
		alert(msg_incomeDate);
		document.bookInsert.incomedate.focus();
		return false;
	//목차
	} else if (!document.bookInsert.index.value){
		alert(msg_index);
		document.bookInsert.index.focus();
		return false;
	//대분류
	} else if (!document.bookInsert.selectbasic.value){
		alert(msg_catBig);
		document.bookInsert.selectbasic.focus();
		return false;
	//중분류
	} else if (!document.bookInsert.selectsub.value){
		alert(msg_catMid);
		document.bookInsert.selectsub.focus();
		return false;
	//수량
	} else if (!document.bookInsert.value.value){
		alert(msg_value);
		document.bookInsert.value.focus();
		return false;
	}
	
}

//오류 발생
function errorAlert(msg){
	alert(msg);
	history.back();
}

