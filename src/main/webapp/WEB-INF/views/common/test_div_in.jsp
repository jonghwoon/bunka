<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<body>
	테스트 디브 페이지 로드 완료!
	<%
		out.println("<br>"+request.getParameter("fish"));
		out.println("<br>"+request.getParameter("crap"));
	%>
</body>
</html>