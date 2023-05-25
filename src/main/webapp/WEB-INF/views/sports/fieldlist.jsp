<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<html>
<head>
</head>
<body onload="loadPage('menu_load','menu_top.common');">
<div id='menu_load'></div>
<table>
<c:forEach var="dto" items="${dto}">
	<tr>
		<td>${dto.place}</td>
	</tr>
	<tr>
		<td>${dto.price}</td>
	</tr>
	<tr>
		<td>${dto.time }</td>
	</tr>
	<tr>
		<td>${dto.field}</td>
	</tr>	
	<tr>
		<td>${dto.fsize}</td>
	</tr>
</c:forEach>	
</table>


</body>
</html>