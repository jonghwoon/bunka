<%@page import="java.util.Calendar"%>
<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>
<html>
<body>
	<%
		ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");
		
		if(dtos!=null){
			int size = dtos.size()>10 ? 10 :dtos.size()+1; 
			p("<select id='title' size='"+ size +"' onchange='viewDetail();'>");
				p("<option disabled='disabled'>작품 선택</option>");
			for(DTO dto : dtos)
				p("<option>"+dto.getValue("title")+"</option>");
			p("</select>");
		}
		else{
		%>
			<select id="title"	 size="3" >
				<option disabled='disabled'>작품 선택</option>				
				<option disabled='disabled'>검색 결과가 없습니다.</option>
			</select>
		<%
		}
	%>	
	
	<form id="show_num">
		<input type="hidden" name="show_num">
	</form>
	<form id="seatInfoform"></form>
</body>

 
<style>	
</style>


<script type="text/javascript">

	function viewDetail(){
		// seatDiv 초기화
		$("#seatDiv").empty();
		
		// show_num 을 폼에 할당
		var	show_num =new Array();		
		<%
			if(dtos!=null) 
				for(DTO dto : dtos)
					p("show_num.push('"+dto.getValue("show_num")+"');");
		%>						
		var selIdx = document.getElementById("title").selectedIndex -1;				
		$("#show_num input[name='show_num']").val(show_num[selIdx]);

	
		// 날짜 선택 여부에 따라 div 이동 ========================================================
		
		if($("#date").val()=="전체" || $("#date").val()==null){
			//dateDiv 수정하여 로드 // 해당 요일만 선택가능, 선택해도 title 리로드 안되게
			// 페이지 로드
			loadPage('dateDiv','show_reservation_date.art','show_num');
				// 디버그 : 
				 console.log($("#show_num input[name='show_num']").val());
			
			// 정렬
			arrayDivs('placeDiv','itemDiv','titleDiv','dateDiv','seatDiv'); // 'detailDiv'				
		}
		else
			arrayDefault();
		

		// 결과가 있다면 =========================================================================
		if(selIdx==null)
			return;
		
		// 페이지 로드 
			//loadPage(div,url,form,sync)
		
		// 페이지 위치 선정 - 상대위치라 위치가 잡히지 않는다.  
		/* 
		var top  = $("#placeDiv").css("top").replace("px","")*1  + $("#title").height();
		var left = $("#placeDiv").css("left").replace("px","")*1;
			//debug
				// console.log("top"  + top);
				// console.log("left" + left);
		
		$("#detailDiv").css("top" , top+"px");
		$("#detailDiv").css("left",left+"px");
		 */
		loadPage('detailDiv','show_reservation_detail.art','show_num');
				
	}
		
	
	function viewSeatDiv(){	
		// 좌석이 상황이 비슷해서 페이지 전환 기능이 필요할 것 같다. 
		
		//날짜가 선택 되었는가 확인하기
		var isDateEmpty  = $("#date").val()==null 		|| $("#date").val()=="전체";		
		var isAgainEmpty = $("#date_again").val()==null	|| $("#date_again").val()=="전체";
		
		if(isDateEmpty && isAgainEmpty){
			alert("날짜가 선택되지 않았습니다.");
			$("#date").focus();
			return;			
		}
		
		//로그인 되어있지 않다면 작동하지 않는다. 
		var id='${sessionScope.id}';
			if(id=='')
				return;
		
		// div의 위치를 계산한다.
			//var divleft = $("#detailDiv").css("left").replace("px","")*1 + $("#detailDiv").width() + 20;
			// 기준이 변경되었다. detailDiv 옆 => dateDiv 혹은 titleDiv 옆 
			
			//dateDiv, titleDiv 중 좀더 오른쪽에 있는... 이 아니라 그냥 고정 위치로 할까 싶은데?
			//var divleft = "50%";
			
			//var divleft = "820px";
		
		
				
		// debug
			//console.log($("#detailDiv").css("left").replace("px",""));
			//console.log($("#detailDiv").width());		
			//console.log(divleft);
		
		//$("#seatDiv").css("left", divleft);	
		
		// 예약일을 변수에 담기
		var res_date;
		if(!isDateEmpty)	res_date = $("#date").val();
		else 				res_date = $("#date_again").val();
		res_date = res_date.split(" ")[0];
		
		// 선택된 작품의 리스트 번호 
		var show_num = $("#show_num input[name='show_num']").val();						
		
		// 특정 form 의 값을 비운 후 데이터를 적재한다. show_num 과 res_date
			$("#seatInfoform").empty();
			$("#seatInfoform").html(
				 "<input type='hidden' name='res_date' value='"+res_date+"'>"
				+"<input type='hidden' name='show_num' value='"+show_num+"'>"
			);				   
			
		// debug 
			console.log("show_num " + show_num);
			console.log("res_date " + res_date);
			
		// 전송
		 
		//$("#seatDiv").css("height","0px");
		 

		//loadPage('seatDiv','show_reservation_seat_editmode.art','seatInfoform');
		
		loadPage('seatDiv','show_reservation_seat.art','seatInfoform');
		
		//changePage('seatDiv','show_reservation_seat.art','seatInfoform');
		
		/* 
		$("#seatDiv").css("height","100%");
		$("#seatDiv").css("trasition","1s");
		 */
	}
	
</script>

<style>
	.bottom_margin_20{	margin-bottom: 20px;}
	#title{
		width: 470px;
	}
</style>

</html>








