<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("블랙리스트 요청에 실패했습니다.");
		</script>
	</c:if>

	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("블랙리스트 요청이 등록되었습니다");
			popdown();
		</script>
	</c:if>
</body>
</html>