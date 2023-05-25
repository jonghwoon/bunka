<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<html>
<body>

	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("가입승인에 실패했습니다 잠시후 다시 시도해주세요");
			popdown();
		</script>
	</c:if>
	
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			loadPage('result','teamadmin.sports');
			popdown();
			setTimeout(function() { alert("가입승인이 완료되었습니다");}, 1000);
		</script>
	</c:if>
</body>
</html>