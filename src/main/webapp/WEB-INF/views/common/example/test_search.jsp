<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<body>

	= 닝겐 찾기 로드 완료! =
	
	<br>
	<br>
	<%
		// Member DTO 모든 회원 정보 조회하기 
		ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");
		if(dtos!=null)
			for(DTO dto : dtos){				
				for(String name : dto.getNames())
					out.println(name + " : " + dto.getValue(name) + "<br>");
				out.println("<br><br>");
			}
			
	%>
	
</body>
</html>