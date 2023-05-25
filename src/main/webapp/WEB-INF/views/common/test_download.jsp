<%@page import="cobra.mvc.center.common.domain.FileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<body>	
	<% 
		FileDTO dto = (FileDTO)request.getAttribute("dto");
		byte[] binary = dto.getBinary();
		
		String s64 = new sun.misc.BASE64Encoder().encode(binary);
	%>
	<h1>wow!</h1>
	
	<img alt="Embedded Image" src="data:image/png;base64,<%= s64 %>" />
	
</body>
</html>