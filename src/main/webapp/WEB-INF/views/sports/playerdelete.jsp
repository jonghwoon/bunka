<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<html>
<body>

	<c:if test="${cnt ==0}">
		<script type="text/javascript">
			alert("선수 탈퇴에 실패했습니다.");
			popdown();
		</script>
	</c:if>
	
	<c:if test="${cnt ==1}">
		<script type="text/javascript">
			loadPage('result','teamadmin.sports');
			popdown();
			setTimeout(function() { alert("선수가 탈퇴 되었습니다.");}, 1000);
		</script>
	</c:if>

</body>
</html>