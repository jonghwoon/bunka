<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting_circle.jsp" %>
<%@ include file="../common/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${cnt ==0}">
		<script>alert("등록에 실패하였습니다. 중복값, 공란을 확인하십시오.");
		window.location='admin_board_form.circle';
		</script>
	</c:if>
	
	<c:if test="${cnt ==1}">						
		<script>alert("성공적으로 등록하였습니다.");
		window.location='admin_board_form.circle';
		</script>
	</c:if>
</body>
</html>