<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<html>
<body>	  
	<c:if test="${cnt ==0}">
		<script>
			alert("회원 가입에 실패하였습니다.");			
		</script>
	</c:if>
	
	<c:if test="${cnt ==1}">
		<!-- 로그인 창으로 연계 -->				
		<script>
			alert("회원 가입에 성공하였습니다.");
			
			//팝업 창을 닫는다.		
			popdown("login");
			
			//로그인 창으로 연계 
			//popup('guest_member_loginForm.common');
			
		</script>		
	</c:if>
</body>
</html>