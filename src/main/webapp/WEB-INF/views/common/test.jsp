<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<html>
<style>
</style>

<!-- 팝업 세팅 -->
<body onload="popupReady();">

	<!-- DTO를 사용한 데이터 호출의 예 -->
	<%
		// Member DTO 모든 회원 정보 조회하기 
		ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");
		int count=0;
		if(dtos!=null)
			for(DTO dto : dtos){
				if(count++>2) break;
				for(String name : dto.getNames())
					out.println(name + " : " + dto.getValue(name) + "<br>");
				out.println("<br>");
			}
	%>
	
	<hr>
		
	<!-- 팝업 간단 사용의 예 -->
	<input type="button" value="일반 팝업" onclick="popup('test_div_in.common');">
	
		
	<!-- 팝업 옵션 사용의 예 -->
	<input type="button" value="복잡한 팝업" onclick="popup('test_div_in.common',500,700,'dataForm');">
	<form id="dataForm">	
		<input type="hidden" name="fish" value="붕어">
		<input type="hidden" name="crap" value="꽃게">
	</form>
	
	<br><hr>
	<!-- 팝업 + DTO를 사용한 회원 정보 조회하기의 예 -->
	
	<form id="searchForm" onsubmit="return false">	
		회원 검색 : <input type="text" name="name" value="제갈봉현">	
		주소 : <input type="text" name="address" value="서울">		
		<input type="button" value="DB조회 예제" onclick="popup('test_search.common',500,600,'searchForm');">
	</form>
	
	
			
</body>

</html>