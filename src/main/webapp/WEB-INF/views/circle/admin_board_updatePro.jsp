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
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
		alert("게시글 정보가 수정되었습니다.");
		window.location='admin_board_form.circle';
		</script>
		
	</c:if>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			errorAlert("게시글 정보가 수정이 되지 않았습니다.");
			window.location='admin_board_form.circle';
		</script>
	</c:if>
</body>
</html>