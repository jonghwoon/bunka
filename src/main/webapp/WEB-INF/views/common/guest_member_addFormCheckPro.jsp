<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<html>
<body>
	<c:if test="${cnt ==0}">
		<script>
			$("#done").css("color" , "blue");
			$("#done").html("사용가능");
		
			 // 제출 가능 on			 
			$("#idCheckdone").val(1); 
		</script>
	</c:if>
	
	<c:if test="${cnt ==1}">
		<script>
			$("#done").css("color" , "red");
			$("#done").html("사용불가");

			// 제출 가능 off
			$("#idCheckdone").val(0);
			
		</script>		
	</c:if>
</body>
</html>