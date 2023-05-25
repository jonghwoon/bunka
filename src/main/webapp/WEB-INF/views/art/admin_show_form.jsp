<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../common/menu_top.jsp">	
	<jsp:param name="aaa" value="aaa"/>
</jsp:include>

<html>
    <%// 페이지 기본 설정 =============================================
		String bigTitle = "회원";
		String subTitle = "Show admin Page";
	//===============================================================%>	
	
<style>	
	/* 	#serachDiv{	width: 1500px;}	*/ 	
	/* SHOWNUM	ITEM	TITLE	FILENAME	RUNTIME	PLACE	ORG	DAY_START	DAY_END	DAY	TIM	TIM	TIM	TIM */
	.t0:FIRST-CHILD { min-width:  75px;}
	#c0 { width:  70px;}	/*SHOW_NU*/		
	#c1 { width:  70px;}	/*ITEM*/ 
	#c2 { width:  300px;}	/*TITLE*/ 
	#c3 { width:  100px;}	/*FILENAME*/	
	#c4 { width:  60px;}	/*RUNTIME*/
	#c5 { width:  50px;}	/*PLACE*/
	#c6 { width:  150px;text-align: right;}	/*ORG*/ 	
	#c7 { width: 100px;}	/*DAY_STA*/ 					
	#c8 { width: 50px;}	 /*DAY_END*/ 		
	#c9 { width: 50px; text-align: right;}/*DAY_WEE*/ 
	#c10{ width: 50px; text-align: right;}	/*TIME_ST*/
	#c11{ width: 50px; text-align: right;}	/*TIME_ST*/ 
	#c12{ width: 50px; text-align: right;}	/*TIME_EN*/ 
	#c13{ width: 50px; text-align: right;}	/*TIME_TE*/ 
	#c14{ width: 70px; text-align: right;}	/*SEAT*/	 
</style>


<script>	
// body 로드 전까지는 숨기기 ===========================================
hideBody();
	function seat_function(x){
		
		var col = x.id;
		var row = x.className;
		
		// 정보를 받아오자
			// 참조 : var show_num = $("."+row+"[class='c0']");	// //document.getElementsByClassName('test_class')[0].getAttribute('name');
		var show_num = document.getElementsByClassName(row)[0].value;		
		//var seat = x.name; // name 에 저장해놓음. - 제대로 동작하지 않는다.
		
		//보낼 정보는 show_num 과 seat = this.name
		// debug
			//console.log(col + " " + row);
			//console.log(x);
			//console.log("show_num " + show_num);
			//console.log("seat " + seat);
		
		//보낼 정보를 담기 
			 document.getElementsByName('show_num')[0].value = show_num;
			 //document.getElementsByName('seat')[0].value 	 = seat;
			 			 
		popup('show_reservation_seat_editmode.art',1200,820,'seat_form','q');
		
	}
</script>

<body>
	<form id="seat_form">
		<input type="hidden" name="show_num">
		<!-- <input type="hidden" name="seat"> -->
	</form>	
</body>
</html>
<jsp:include page="../common/admin_table.jsp">
	<jsp:param name="bigTitle" value="<%= bigTitle %>"/> 
	<jsp:param name="subTitle" value="<%= subTitle %>"/>
</jsp:include>



