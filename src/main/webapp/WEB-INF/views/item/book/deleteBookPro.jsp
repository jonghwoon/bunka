<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/setting.jsp" %>
<script type ="text/javascript" src="${project}/item/js/book.js"></script>

<html>
<body>

	<h1>도서 삭제 처리페이지</h1>
	
	<c:if test="${cnt == 0}">
		<!-- 입력 실패 -->
		<script type="text/javascript">
			errorAlert(deleteError);
		</script>
	</c:if>
	
	<c:if test="${cnt == -2}">
		<!-- 대여중 실패 -->
		<script type="text/javascript">
			errorAlert(rentnowError);
		</script>
	</c:if>
	
	<c:if test="${cnt > 0}">
		<!-- 글쓰기 성공 -->
		<script type="text/javascript">
			alert("도서가 삭제 되었습니다.");
			window.location = "bookList.item";
		</script>
	</c:if>
	
</body>
</html>