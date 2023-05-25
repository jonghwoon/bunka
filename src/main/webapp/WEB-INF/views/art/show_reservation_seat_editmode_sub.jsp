<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>
<html>
<body>				
	<%	 
		// 좌석 배열로 변환
			String seat = (String)getVar("seat"); 
			
			String condition = "";
			
			// 구분자 선택 
			if(seat.contains("|"))
				condition = "\\|";
			else
				condition = "%";
			
			// 배열로 변환
			String[] seatRows = seat.split( condition ); // "|" 는 or 로 인식된다.
			
			char[] seatCols;
			int[][] tables = new int[seatRows.length][seatRows[0].toCharArray().length];
				//debug
					d("r"+seatRows.length);
					d("c"+seatRows[0].toCharArray().length);
		// 이중 배열로 변환
			int i=0;
			for(String seatRow : seatRows){
				int n=0;
				seatCols = seatRow.toCharArray();
				for(char seatCol : seatCols){
					tables[i][n] = seatCol-'0';
					n++;
				}
				i++;
			}
			
		//JSTL 변환 
		pageContext.setAttribute("tables", tables);

		//문자 준비
		char row ='A';
		pageContext.setAttribute("row", row);
	%>
	
	<table id="seatTable" class="center">		
		<tr><td class="screen"	colspan="40">Screen	</td></tr>
		<tr><td 				colspan="40">		</td></tr>		
		<c:forEach var="table" items="${tables}" >
			<tr class="row">
			<c:set var="col" value="1"></c:set>	<!-- col init -->
			<c:forEach var="tab" items="${table}">								
				<!-- 좌석 번호 들어가야함 -->
				<td class="${tab}" id="${row}${col}">
					${row}${col}					
				</td>
				<c:set var="col" value="${col+1}"></c:set>		<!-- col++ -->						
			</c:forEach>
			</tr>
			<% pageContext.setAttribute("row", ++row); %>
		</c:forEach>	
	</table>
	
</body>
<script>

	// 좌석 에디트 	
	$("#seatTable td").click(function(){
		console.log("click");
		
		var here = $(this).attr("class");
		var total = $("#total").val();
		
		var edit_mode = $("#editor_select").attr("class");
		
		/* 0좌석X , 1빈 , 2선택, 3예약 */
		// 0과 3번은 반응하지 않는다.
						
		$(this).attr("class", edit_mode );
		
			
		$("#total").val(total);//total 증가
		$("#man").val(total);
		
		console.log("total : " + $("#total").val() );
		
		return;	
	});
	
</script>

</html>





