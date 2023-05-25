<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp"%>    
<html>
<body>
	
	<c:if test="${cnt == 0 }">
		비밀번호가 틀렸습니다
	</c:if>
	
	<c:if test="${cnt == 1 }">
		비밀번호가 확인되었습니다.
	</c:if>
	
	
</body>
</html>