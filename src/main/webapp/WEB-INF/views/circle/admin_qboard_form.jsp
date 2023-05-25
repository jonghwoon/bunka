<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/menu_top.jsp">	
	<jsp:param name="aaa" value="aaa"/>
</jsp:include>

<html>
    <%// 페이지 기본 설정 =============================================
		String bigTitle = "QBoard";
		String subTitle = "QBoard admin Page";;
	//===============================================================%>

<style>	
	#serachDiv{	width: 1050px;}

	/* SHOWNUM	ITEM	TITLE	FILENAME	RUNTIME	PLACE	ORG	DAY_START	DAY_END	DAY	TIM	TIM	TIM	TIM */
	.t0:FIRST-CHILD { min-width:  75px;}			
	#c0 { width:  90px;}	/*WRITER*/		
	#c1 { width:  50px;}	/*NUM*/ 
	#c2 { width:  70px;}	/*SUBJECT*/ 
	#c3 { width:  70px;}	/*PASSWD*/	
	#c4 { width:  60px;}	/*CONTENTS*/
	#c5 { width:  80px; text-align: right;}	/*READCNT*/
	#c6 { width:  200px; text-align: left;}	/*ADDDATE*/ 	
	#c7 { width: 100px; text-align: right;}	/*RECOUNT*/ 					
	#c8 { width: 50px; text-align: right;}	 
	 	 	
	
</style>
</html>

<script>	
// body 로드 전까지는 숨기기 ===========================================
hideBody();
</script>
	
<jsp:include page="admin_QBoardtable.jsp">
	<jsp:param name="bigTitle" value="<%= bigTitle %>"/> 
	<jsp:param name="subTitle" value="<%= subTitle %>"/>
</jsp:include>