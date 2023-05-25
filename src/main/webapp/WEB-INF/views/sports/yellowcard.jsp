<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp" %>    
<html>
<body>
	<c:if test="${cnt == 1 }" >
		<script type="text/javascript">
			alert("경고 1회가 부여됩니다.");
			window.history.back();
		</script>
	</c:if>
	<c:if test="${cnt == 2 }" >
		<script type="text/javascript">
			alert("블랙리스트에 등록되었습니다");
			window.history.back();
		</script>
	</c:if>
	

</body>
</html>