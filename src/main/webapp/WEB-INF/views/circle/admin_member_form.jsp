<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../common/menu_top.jsp">	
	<jsp:param name="aaa" value="aaa"/>
</jsp:include>

<html>
    <%// 페이지 기본 설정 =============================================
		String bigTitle = "회원";
		String subTitle = "Member admin Page";
	//===============================================================%>
<style>	
	#serachDiv{	width: 1550px;}

	.t0:FIRST-CHILD { min-width:  75px;}			
	#c0 { width:  70px;}	/*ID*/		
	#c1 { width:  70px;}	/*PWD*/ 
	#c2 { width:  60px;}	/*NAME*/ 
	#c3 { width:  80px;}	/*NICK*/	
	#c4 { width:  120px;}	/*JUMIN1*/
	#c5 { width:  230px;}	/*ADDRESS*/
	#c6 { width:  50px;text-align: right;}	/*ZIPCODE*/ 	
	#c7 { width: 100px;}		/*HP*/			
	#c8 { width: 150px;}	/*EMAIL*/	 		
	#c9 { width: 150px; text-align: right;}		/*EMAIL*/
	#c10{ width: 150px; text-align: right;}
	#c11{ width: 50px; text-align: right;}
	#c11{ width: 50px; text-align: right;}
	
</style>
<body>
</body>
</html>

<script>	
// body 로드 전까지는 숨기기 ===========================================
hideBody();
</script>

<jsp:include page="admin_Membertable.jsp">
	<jsp:param name="bigTitle" value="<%= bigTitle %>"/> 
	<jsp:param name="subTitle" value="<%= subTitle %>"/>
</jsp:include>