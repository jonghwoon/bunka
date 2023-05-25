<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="setting.jsp" %>

<title>도서관 이용 등록 처리</title>
</head>
<body>
	<c:if test="${cnt == 0}">
		<!-- 이용등록 실패 -->
		<script type="text/javascript">
			errorAlert(regProMsg);
		</script>
	</c:if>
	
	<c:if test="${cnt != 0}">
		<!-- 이용등록 성공 -->
		<script type="text/javascript">
			alert("이용 등록에 성공했습니다.");
			window.history.go(-2);
		</script>
	</c:if>
</body>
</html>