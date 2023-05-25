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
s	<c:if test="${cnt != 0}">
		<script type="text/javascript">
		alert("글이 삭제되었습니다.");
		window.location='board.circle?';
		</script>
		
	</c:if>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			errorAlert("글 삭제가 되지 않았습니다.");
		</script>
	</c:if>
</body>
</html>