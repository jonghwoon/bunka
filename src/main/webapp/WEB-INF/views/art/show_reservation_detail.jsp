<%@page import="java.util.Calendar"%>
<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>
<html>
<body>
	<%-- 
	<%
		ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");
		
		if(dtos==null){
			int size = dtos.size()>10 ? 10 :dtos.size()+1; 
			p("<select id='title' size='"+ size +"' onchange='viewDetail();'>");
				p("<option disabled='disabled'>작품 선택</option>");
			for(DTO dto : dtos)
				p("<option>"+dto.getValue("title")+"</option>");
			p("</select>");
		}
	%>	
	 --%>
	 
	 <%
	 	
	 	ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");
	 	if(dtos==null){
	 		p("해당 상영 정보가 없습니다.");
	 		return;
	 	}
	 	
	 	pageContext.setAttribute("dto",dtos.get(0));
	 	
	 %>
	 
	
	
	<form id="show_num">
		<input type="hidden" name="show_num">
	</form>
			
	<div id="deatilOutline">
		<table>
		<tr>
		<td>
			<img src='${project}/art/images/show/${dto.filename}.jpg'>
		</td>
		<td width="100%">
			<br>상영 번호 : ${dto.show_num}<br>
			<h3>${dto.title}</h3>
			<br>
			<br> &nbsp; 상영 시간 : ${dto.time_start_hr} 시 ${dto.time_start_min}분 
			<br> &nbsp; 러닝 타임 : ${dto.runtime} 분
			<br> &nbsp; 상영 기관 : ${dto.org}
			<br> &nbsp; 상영 기간 : ${dto.day_start}일 부터 ${dto.day_end} 일 까지
			<br> &nbsp; 상영 요일 : ${dto.day_week}
			<br><br><br>
			
			<!-- 이하 로그인 상황에 따라 분기 -->
			<p class="center">
			<c:if test="${sessionScope.id==null}">
				<br><p class='bottom_margin_20 crimson'> 좌석 조회는 로그인 후 가능합니다.</p>
			</c:if>
			
			<c:if test="${sessionScope.id!=null}">			
				<input class='bottom_margin_20' type='button' value='좌석보기' onclick= 'viewSeatDiv();'>
			</c:if>
			<p>
			
		</td>
		</tr>
		</table>
	</div>
	
		
	<form id="seatInfoform">
	
	</form>
	
</body>

<style>
	
	.center{text-align: center;}
	.bottom_margin_20{	margin-bottom: 20px;}
	#deatilOutline td:NTH-CHILD(2){
		padding : 10px;
	}	
</style>

</html>








