<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file = "setting.jsp" %>
<%@ include file = "../../common/setting.jsp" %>
</head>
<body>

 <h1>도서 반납처리</h1>
	<c:if test="${cnt == 0}">
		<!-- 대여 실패 -->
		<script type="text/javascript">
			errorAlert(rendError);
		</script>
	</c:if>
	
	<c:if test="${cnt == -2}">
		<!-- 반납 - 대여제한 -->
		<script type="text/javascript">
			alert("반납되었습니다. \n도서관 이용이 제한 되었습니다.");
			window.location = "rendList.item";
		</script>
	</c:if>
	
	<c:if test="${cnt > 0}">
		<!-- 반납 성공 -->
		<script type="text/javascript">
			alert("반납되었습니다.");
			window.location = "rendList.item";
		</script>
	</c:if>
</body>
</html>