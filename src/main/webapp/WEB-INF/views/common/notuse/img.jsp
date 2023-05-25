<%@page import="cobra.mvc.center.common.domain.FileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
<% 
		FileDTO fdto = (FileDTO)request.getAttribute("fdto");
		byte[] binary = fdto.getBinary();		
		String s64 = new sun.misc.BASE64Encoder().encode(binary);
%>
<img src="data:image/jpg;base64,<%=s64%>">
 --%>