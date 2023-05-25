<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp" %> 
<%@ include file="../common/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
		alert("블랙리스트 삭제 되었습니다.");
		loadPage('soccer_view','blacklist.sports');
		</script>
	</c:if>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("관리자만 삭제할 수 있습니다.");
			loadPage('soccer_view','blacklist.sports');
		</script>
	</c:if>
</body>
</html>