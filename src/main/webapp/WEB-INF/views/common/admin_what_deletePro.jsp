<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<html>
<body>	  
	<c:if test="${cnt ==0}">
		<script>alert("삭제에 실패하였습니다. 중복값, 공란을 확인하십시오.");</script>
		
	</c:if>
	
	<c:if test="${cnt ==1}">						
		<script>
				alert("성공적으로 삭제하였습니다.");
				// 줄 삭제해주기
				
				$('.r'+'${param.row}').parents("tr").remove();
				/* 
				 $('.r'+'${param.row}').each(function(){
					 this.remove();
				 }); 
				*/
		</script>
	</c:if>
</body>
</html>


