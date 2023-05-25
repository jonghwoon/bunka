<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="menu_top.jsp">	
	<jsp:param name="aaa" value="aaa"/>
</jsp:include>

<html>
    <%// 페이지 기본 설정 =============================================
		String bigTitle = "회원";
		String subTitle = "Member admin Page";;
	//===============================================================%>

<style>	
	#serachDiv{	width: 1500px;}

	/* SHOWNUM	ITEM	TITLE	FILENAME	RUNTIME	PLACE	ORG	DAY_START	DAY_END	DAY	TIM	TIM	TIM	TIM */
	.t0:FIRST-CHILD { min-width:  75px;}			
	#c0 { width:  70px;}	/*SHOWNUM*/		
	#c1 { width:  70px;}	/*ITEM*/ 
	#c2 { width:  300px;}	/*TITLE*/ 
	#c3 { width:  100px;}	/*FILENAME*/	
	#c4 { width:  60px;}	/*RUNTIME*/
	#c5 { width:  50px;}	/*PLACE*/
	#c6 { width:  150px;text-align: right;}	/*ORG*/ 	
	#c7 { width: 100px;}	/*DAY_START*/ 					
	#c8 { width: 50px;}	 /*DAY_END*/ 		
	#c9 { width: 50px; text-align: right;}/*TIM*/ 
	#c10{ width: 50px; text-align: right;}	/*TIM*/
	#c11{ width: 50px; text-align: right;}	/*TIM*/ 
	#c12{ width: 50px; text-align: right;}	/*TIM*/ 
	#c13{ width: 50px; text-align: right;}	/*TIM*/ 
	 	 	
	
</style>
</html>

<script>	
// body 로드 전까지는 숨기기 ===========================================
hideBody();
</script>
	
<jsp:include page="admin_table.jsp">
	<jsp:param name="bigTitle" value="<%= bigTitle %>"/> 
	<jsp:param name="subTitle" value="<%= subTitle %>"/>
</jsp:include>