<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp"%>    
<html>
<body>
	<c:if test="${cnt==0}">
		<script type="text/javascript">
			alert("가입신청에 실패했습니다. 이미 가입한팀이 있는지 확인해주세요.");
			popdown();
		</script>
	</c:if>
	
	<c:if test="${cnt==1}">
		<script type="text/javascript">
			alert("가입신청에 성공하였습니다.");
			popdown();
		</script>
	</c:if>

</body>
</html>