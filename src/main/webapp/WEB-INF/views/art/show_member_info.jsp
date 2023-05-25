<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp" %>

<html>
<body>
	<%
		ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");		
		if(dtos==null || dtos.size()==0){	
			p("<center><h2> 예약된 정보가 없습니다.</h2><center>");
			return;	
		}
				
		/* 
		String[] names;
		for(DTO dto : dtos){
			names = dto.getNames();
			for(String name : names){
				Object value = dto.get(name);
			}
		}
		 */
		//pageContext.setAttribute("dto",dto);

		String[] names = {"title","org","res_date","seat_code"};		
		pageContext.setAttribute("names",names);
	
	%>
	
	<form id="cancle_res_form">
		<input type="hidden" name="id" 			value="${sessionScope.id}">
		<input type="hidden" name="show_num" 	value="">
		<input type="hidden" name="res_date" 	value="">
		<input type="hidden" name="seat" 		value="">
	</form>
	<div id="hidden"></div>
	
	<div id="res_info_div">
	<br> 
	<h2> 나의 예약 정보 </h2>
	<br> <br> 
	<table id="info_table">
	<tr>
		<c:forEach var="name" items="${names}">
		<th>${name}</th>
		</c:forEach>
		<th> button</th>
	<tr>
	<c:forEach var="dto" items="${dtos}">
		<tr>
			<c:forEach var="name" items="${names}">				
				<td>${dto.getValue(name)}</td>
			</c:forEach>
			<td><input type="button" value="취소하기" onclick="cancle_res(this);" id=${dto.getValue("show_num")} name=${dto.getValue("res_date")} alt=${dto.getValue("seat")}></td>
		</tr>
	</c:forEach>
	</table>
	</div>
	<div id= "hidden_cancle"></div>
</body>
<script>
	function cancle_res(who){		
		// 정보를 담기
		var show_num = who.id; 		//console.log(who.id);
		var res_date = who.name;	
		var seat     = who.alt;
		
		/// 임시 수정 
		$("#cancle_res_form input[name='show_num']").val(show_num);
		$("#cancle_res_form input[name='res_date']").val(res_date);
		$("#cancle_res_form input[name='seat']").val(seat);
		
		// key 정보를 보내서 삭제
		// loadPage(div,url,form,sync)
		loadPage('hidden_cancle','show_reservation_back.art','cancle_res_form');
		
		// 이후 창을 리로드 한다.
		// loadPage('seatDiv','show_reservation_seat.art','seatInfoform');
	}
</script>

<style>

	/*	less 문법이라고 한다. 지금은 사용 못한다. 	 
	@myRed 		: #ff2c0c;
	@myYellow 	: #f5cd3f;
	@myBlue 	: #72bbff;
	@myCrimson	: #c83f42;
	@myPurple 	: #5937d3;
	@myNavy		: #001c26;
	@myGreen	: #83d35a;
	 */		

	#res_info_div{
		width  : 100%;
		heigth : 100%;
		display: inline-table;
		text-align: center;
	}

	#info_table{
		display: inline;		
		font-size: 15px;		
	}
	 
	#info_table tr, td, th{
		border-collapse: collapse;
		border: 1px solid black;
	}
	#info_table td{
		padding: 5px;
	}
	#info_table th{
		text-align : center;
		background-color : #001c26;
		color: white;
		padding: 10px;
	}
	
	#info_table input{
		width  : 100%;
		heigth : 100%;
		background-color: #c83f42;
		color: white;
	}
</style>

</html>





