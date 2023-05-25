<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>
<html>
<body>
	<%	
		String[] week_kor = {"","일","월","화","수","목","금","토"};
	
		// 데이터 준비
		Calendar cal = Calendar.getInstance();
		int date = cal.get(Calendar.DATE);		
		int year,month,day,week;
		String day_week = ""; 
		
		// 상영일 가져오기 
		ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");
		if(dtos!=null)		
			day_week = dtos.get(0).getValue("day_week");
		
		// 선택 요일 만들기
		String options="";
		int size = 1; // 날짜 선택란 +1
		for(int i=0;i<7;i++){
			year 	= cal.get(Calendar.YEAR);
			month 	= cal.get(Calendar.MONTH) + 1;
			day 	= cal.get(Calendar.DAY_OF_MONTH);
			week 	= cal.get(Calendar.DAY_OF_WEEK);
			
			if(day_week.contains(String.valueOf(week))){
				size++;
				options += "<option>"+year+"-"+month+"-"+day+" ("+week_kor[week]+")</option>";
			}
			cal.set(Calendar.DATE,cal.get(Calendar.DATE)+1);
			
			// 자바는 SUNDAY 1 / MONDAY 2
			// 자바형을 기준으로 작성하기로 하자.
		}
	%>	
	<select id="date_again"	  size="<%=size%>" onchange="resetSeatView();">
		<option disabled="disabled">날짜선택</option>
		<%= options %>
	</select>
		
	<script>
		function resetSeatView(){
			if($("#seatDiv").html()==null)
				return;
			else
				viewSeatDiv();
		}
	</script>
</body>
</html>














