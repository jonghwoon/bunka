<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>    
<html>
<body>
	<c:if test="${cnt ==0}">
		<script type="text/javascript">
			alert("예약에 실패했습니다 다시 시도해주세요");
			popdown();
		</script>
	</c:if>
	
	<c:if test="${cnt ==1}">
		<script type="text/javascript">
			alert("예약에 성공했습니다.");
			popdown();
		</script>
	</c:if>

</body>
</html>