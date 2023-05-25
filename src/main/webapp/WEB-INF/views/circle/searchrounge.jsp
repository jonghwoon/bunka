<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
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
<!--   테이블 풋(글쓰기 버튼) -->
	<div class="gallery" align="center">
	<%
	for(DTO dto : dtos) {
	%>
    <div class="gallery-item">
      <div class="gallery-item-image">
        <img src="./resources/circle/image/<%=dto.getValue("name")%>.jpg">
      </div>
      <div class="gallery-item-description">
        <h4><%=dto.getValue("name")%></h4>
        <span>
     			가격 : <%=dto.getValue("price")%><br>
				설명 : <%=dto.getValue("content")%><br>
				지역 : <%=dto.getValue("location")%> 부근<br><br>
		</span>
		<input type="button" name="roungeinfo" value="자세히 보기" class="btn btn-primary" role="button" onclick="window.open('roungeinfo.circle')">
	  </div>
    </div>
	<%
	}
	 %>
	 </div>
</body>
</html>