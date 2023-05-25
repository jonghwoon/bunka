<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%-- 
<%@ include file="setting_circle.jsp" %>
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
		ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");
%>

<body onload="loadPage('menu_load','menu_top.common');">
	<div id='menu_load'></div>
	<div style="margin-left: 30%; margin-right: 30%;">
	<table class="table table-hover">
		<thead>
			<tr>
				<th width="10%">동아리넘버</th>
				<th width="5%">지역  </th>
				<th width="10%">이름</th>
				<th width="15%">카테고리</th>
				<th width="20%">생성일</th>										
			</tr>
		</thead>

	<tbody>
<!--   테이블 풋(글쓰기 버튼) -->
	<%
	for(DTO dto : dtos) {
	%>
	<tr>
		<td><%=dto.getValue("circlenum")%></td>
		<td><%=dto.getValue("location")%></td>
		<td><a href='viewCircleInfo.circle?circlenum=<%=dto.getValue("circlenum")%>&name=<%=dto.getValue("name")%>&people=<%=dto.getValue("people")%>&maxpeople=<%=dto.getValue("maxpeople")%>'><%=dto.getValue("name")%></a></td>
		<td><%=dto.getValue("category")%> </td>
		<td><%=dto.getValue("regdate")%> </td>
	</tr> 	
	<%
	}
	 %>
    </tbody>
    </table>
    </div>
</body>
</html>