<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/menu_top.jsp">	
	<jsp:param name="aaa" value="aaa"/>
</jsp:include>

<html>
    <%// 페이지 기본 설정 =============================================
		String bigTitle = "Circle";
		String subTitle = "Circle admin Page";;
	//===============================================================%>

<style>	
	#serachDiv{	width: 1700px;}

	/* SHOWNUM	ITEM	TITLE	FILENAME	RUNTIME	PLACE	ORG	DAY_START	DAY_END	DAY	TIM	TIM	TIM	TIM */
	.t0:FIRST-CHILD { min-width:  75px;}			
	#c0 { width:  150px;}	/*NAME*/		
	#c1 { width:  50px;}	/*LOCATION*/ 
	#c2 { width:  50px;}	/*CATEGORY*/ 
	#c3 { width:  70px;}	/*REGDATE*/	
	#c4 { width:  60px;}	/*PEOPLE*/
	#c5 { width:  50px;}	/*CIRCLENUM*/
	#c6 { width:  50px; text-align: left;}	/*MAXPEOPLE*/ 	
	#c7 { width: 300px;}	/*INFOS*/ 					
	#c8 { width: 300px;}	/*RECRUIT*/ 		
	#c9 { width: 200px;}	/*IMAGEINFO*/ 
	#c10 { width: 50px; text-align: right;}	/*IMAGEINFO*/ 
	 	 	
	
</style>
</html>

<script>	
// body 로드 전까지는 숨기기 ===========================================
hideBody();
</script>
	
<jsp:include page="admin_Circletable.jsp">
	<jsp:param name="bigTitle" value="<%= bigTitle %>"/> 
	<jsp:param name="subTitle" value="<%= subTitle %>"/>
</jsp:include>