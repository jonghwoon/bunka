<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/setting.jsp" %>
<script type ="text/javascript" src="${project}/item/js/book.js"></script>

<html>
<body>

	<h1>도서 대여 처리</h1>
	
	<c:if test="${cnt == -1}">
		<!-- 대여 실패 -->
		<script type="text/javascript">
			errorAlert(rendError);
		</script>
	</c:if>
	
	<c:if test="${cnt == -2}">
		<!-- 대여 실패 - 대여제한 -->
		<script type="text/javascript">
			errorAlert(penaltyError);
		</script>
	</c:if>
	
	<c:if test="${cnt == -3}">
		<!-- 대여 실패 - 최대치 -->
		<script type="text/javascript">
			errorAlert(rendMaxError);
		</script>
	</c:if>
	
	<c:if test="${cnt == -4}">
		<!-- 대여 실패 - 최대치 -->
		<script type="text/javascript">
			errorAlert(queError);
		</script>
	</c:if>
	
	<c:if test="${cnt > 0}">
		<!-- 대여 성공 -->
		<script type="text/javascript">
			alert("도서가 대여 되었습니다.");
			window.location = "bookList.item";
		</script>
	</c:if>
	
</body>
</html>