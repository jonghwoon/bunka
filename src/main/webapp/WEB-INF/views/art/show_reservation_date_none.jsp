<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>
<html>
<body>

	<%		
		String[] week_kor = {"","일","월","화","수","목","금","토"};		
		Calendar cal = Calendar.getInstance();
		int date = cal.get(Calendar.DATE);		
		int year,month,day,week;
		
	%>
	
	<select id="date"	  size="9" onchange="show()">
			<option disabled="disabled">날짜선택</option>
			<option selected="selected">전체</option>
		<%
			for(int i=0;i<7;i++){
				year 	= cal.get(Calendar.YEAR);
				month 	= cal.get(Calendar.MONTH) + 1;
				day 	= cal.get(Calendar.DAY_OF_MONTH);
				week 	= cal.get(Calendar.DAY_OF_WEEK);
				
				p("<option>"+year+"-"+month+"-"+day+" ("+week_kor[week]+")</option>");
				
				cal.set(Calendar.DATE,cal.get(Calendar.DATE)+1);
				
				// 자바는 SUNDAY 1 / MONDAY 2
				// 자바형을 기준으로 작성하기로 하자.
			}
		%>
	</select>
</body>
</html>