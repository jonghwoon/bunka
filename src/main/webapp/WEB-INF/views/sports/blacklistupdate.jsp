<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<body>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("등록에 실패했습니다 다시 시도해주세요");
			popdown();
		</script>
	</c:if>
	
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			alert("블랙리스트에 등록 되었습니다.");
			load('blacklistadmin.sports');
		</script>
	</c:if>

</body>
</html>