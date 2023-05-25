<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>    
<html>
<body>
	<c:if test="${cnt ==0}">
		<script type="text/javascript">
			alert("권한이 없습니다.");
		</script>
	</c:if>
	
	<c:if test="${cnt ==1}">
		<script type="text/javascript">
			alert("매칭이 취소되었습니다.");
			popdown();
		</script>
	</c:if>

</body>
</html>