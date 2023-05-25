<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>    
<html>
<body>

	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("매칭에 실패했습니다.");
			popdown();
		</script>
	</c:if>
	
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			alert("매칭이 성사되었습니다");
			popup('matchingcom.sports', 600, 500);
		</script>
	</c:if>

</body>
</html>