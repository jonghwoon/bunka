<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<script>	
	// 정상 1	 :
	feedback('${cnt}')
	
	function feedback(cnt){
		cnt=cnt*1;
		
		var msg = "" 
		switch(cnt){			
			// 예약 삭제 에러
			case 1101 :	// 에러 1101 : 이전 예약 현황을 불러올 수 없다면 리턴.   
			case 1102 :	// 에러 1102 : 예약 상황 불일치
			case 1103 :	// 에러 1103 : 좌석 업데이트 실패
			case 1104 : msg= cnt + "에러 : 예약 삭제에 실패했습니다."; break;	// 에러 1104 : 멤버 정보 삭제 실패
			case 1    : msg= "예약이 성공적으로 취소 되었습니다."; break;
			default   : msg= "삭제 실패 : 알수 없는 에러";	break;
		}
		
		alert(msg);
				
		var isDateEmpty  = $("#date").val()==null 		|| $("#date").val()=="전체";		
		var isAgainEmpty = $("#date_again").val()==null	|| $("#date_again").val()=="전체";
		
		// 날짜가 선택되지 않았습니다. 에러.
		
		// seat 정보가 열려있다면 업데이트
		if($("#seatDiv").html!=null && (!isDateEmpty || !isAgainEmpty))
			viewSeatDiv();
		
		// 예약 정보창 업데이트 
		view_res_info();
		
	}
	
</script>
<body>	
</body>
</html>
