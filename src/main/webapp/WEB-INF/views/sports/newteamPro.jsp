<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp"%>
<%@ include file="../common/setting.jsp"%>    
<html>
<head>
</head>
<body>

	<c:if test="${cnt == 0}" >
		<script type="text/javascript">
			alert("팀 생성에 실패했습니다 잠시후 다시 시도해주세요");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt == 1}" >
		<script type="text/javascript">
			alert("팀이 생성되었습니다.");
			popup('playeraddform.sports',400,535);
		</script>
	</c:if>
	
	

</body>
</html>