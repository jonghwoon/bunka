<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<script>
	// 결과 피드백
	// 에러 1001 : 이전 예약 현황을 불러올 수 없다면 리턴. 
	// 에러 1002 : 두 좌석의 길이가 다르다면 리턴.
	// 에러 1003 : 두 좌석의 예약 상태가 다르다면 리턴
	// 에러 1004 : 예약 기록이 중복 존재할 경우 리턴 - 이미 예약이 있습니다. 해당 일의 예약을 취소후 이용해주세요.
	// 에러 1005 : 멤버 예약정보가 추가되지 않으면 리턴	
	// 에러 1006 : 예약 상황 업데이트 되지 않는다면 리턴
		
	// 정상 1	 :
	feedback('${cnt}')
	function feedback(cnt){
		cnt=cnt*1;
		
		var msg = "" 
		switch(cnt){
			// 예약 등록 에러
			case 1001 : 
			case 1002 : 
			case 1005 :
			case 1006 : msg= cnt + "에러 : 예약에 실패했습니다."; break;
			
			case 1003 : msg= cnt + "에러 : 예약에 실패했습니다. - 아쉽게도 방금 전에 다른분에게 예약되었군요!"; break;
			case 1004 : msg= "당일에 이미 회원님의 예약이 있습니다. 해당 일의 예약을 취소후 이용해주세요."; break;
			
			case     1: msg= "성공적으로 예약 되었습니다."; break;
			default   : msg= "삭제 실패 : 알수 없는 에러";	break;
		}
		
		alert(msg);		
		
		viewSeatDiv();
	}
	
</script>
<%-- <body onload="foodback('${cnt}');"> --%>
<body>	
</body>
</html>
