<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/setting.jsp" %>
<script type ="text/javascript" src="${project}/item/js/bookInsert.js"></script>

<html>
<body>

	<h1>도서 예약 처리</h1>
	
	<c:if test="${cnt == 0}">
		<!-- 예약 실패 -->
		<script type="text/javascript">
			errorAlert(reservError);
		</script>
	</c:if>
	
	<c:if test="${cnt > 0}">
		<!-- 예약 성공 -->
		<script type="text/javascript">
			alert("도서가 예약 되었습니다.");
			window.location = "bookList.item";
		</script>
	</c:if>
	
	<c:if test="${cnt == -2}">
		<!-- 예약 취소 -->
		<script type="text/javascript">
			alert("예약이 취소 되었습니다.");
			window.location = "reservList.item";
		</script>
	</c:if>
	
	<c:if test="${cnt == -3}">
		<!-- 예약 불가 -->
		<script type="text/javascript">
			alert("예약 최대치이기 때문에 예약할 수 없습니다.");
			window.location = "bookList.item";
		</script>
	</c:if>
	
	<c:if test="${cnt == -4}">
		<!-- 예약 불가 -->
		<script type="text/javascript">
			alert("이미 예약된 책 입니다.");
			window.history.back();
		</script>
	</c:if>
	
</body>
</html>