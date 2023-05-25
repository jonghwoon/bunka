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
	<div id='menu_load'></div>
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
		alert("가입신청이 되었습니다.");
		window.location='search.circle';
		</script>
		
	</c:if>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			errorAlert("가입신청이 되지 않았습니다 잠시후 다시 신청 바랍니다.");
			window.location='search.circle';
		</script>
	</c:if>
</body>
</html>