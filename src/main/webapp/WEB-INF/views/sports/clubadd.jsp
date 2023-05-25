<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp" %>    
<html>
<body>
	<c:if test="${cnt==0}">
		<script type="text/javascript">
			alert("비밀번호를 확인해주세요");
			window.history.back();
		</script>	
	</c:if>
	<c:if test="${cnt==1}">
		<script type="text/javascript">
			alert("가입을 환영합니다");
			window.location="soccer.sports";
		</script>
	</c:if>

</body>
</html>