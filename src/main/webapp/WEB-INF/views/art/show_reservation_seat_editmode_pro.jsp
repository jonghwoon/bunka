<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>
<html>
<body>
		<!-- //보낸 결과 성공인지 확인한다. -->
		<c:if test="${cnt==1}">
			<!-- //도착한 페이지에서 성공 메시지를 보내고 창을 닫는다. -->
			<script>
				alert("업데이트에 성공하였습니다.");
				popdown();
			</script>
		</c:if>
		
		<c:if test="${cnt==0}">
			<!-- //아니라면 창을 닫지 않는다. -->
			<script>
				alert("업데이트에 실패하였습니다.");
			</script>
		</c:if>
		
		
		
</body>
</html>





