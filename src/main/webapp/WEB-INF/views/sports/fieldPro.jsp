<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp" %>     
<html>
<head>
</head>
<body>

<c:if test="${cnt == 0}">
	<script type="text/javascript">
		alert("구장 추가에 실패했습니다.");
	</script>
</c:if>

<c:if test="${cnt != 0}">
	<script type="text/javascript">
		alert("구장 추가에 성공했습니다.");
		window.history.back();
	</script>
</c:if>


</body>
</html>