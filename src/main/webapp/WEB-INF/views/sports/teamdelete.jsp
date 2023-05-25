<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>    
<html>
<body>

	<c:if test="${cnt == 0}">
		<script type="text/javascript"> 
		alert("권한이 없습니다");
		window.history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt == 2}">
		<script type="text/javascript"> 
		alert("비밀번호가 틀렸습니다");
		window.history.back();
		
		</script>
	</c:if>
	
	<c:if test="${cnt == 3}">
		<script type="text/javascript"> 
		alert("팀이 삭제되었습니다.");
		window.history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt == 4}">
		<script type="text/javascript"> 
		alert("비밀번호가 틀렸습니다");
		window.history.back();
		</script>
	</c:if>


</body>
</html>