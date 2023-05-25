<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>
<html>
<body>
	<%	
		
		// 이건 나중에 시간 많으면 하자. 
			// 지금 해야할듯
				
		// DTO 체크
		ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");
		if(dtos==null && dtos.size()!=1)
			return;	// 비정상적이면 뭔가 조치를 취한다.
		
		// 변수 받아오기 
		DTO dto = dtos.get(0);
		String show_num = dto.getValue("show_num");
		//String res_date	= dto.getValue("res_date").split(" ")[0];
		String seat		= dto.getValue("seat");
		d("seat" + seat);
		
		// 좌석 배열로 변환
		String[] seatRows = seat.split("\\|");	// "|" 는 or 로 인식된다. 
		char[] seatCols;
		int[][] tables = new int[seatRows.length][seatRows[0].toCharArray().length];
			//debug
				d("r"+seatRows.length);
				d("c"+seatRows[0].toCharArray().length);
		
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
								
		// 예약 테이블의 예 ===================================
		// 도착하는 데이터의 구조  000111111000|000111111000|000111111000|000111111000 // 이런식
			// 0 좌석 아님 
			// 1 빈 좌석 
			// 2 선택된 좌석
			// 3 예약된 좌석
					
			// 0좌석X , 1빈 , 2선택, 3예약
			/* 
			int[][] tables =	{
				{0,0,0,1,1,1,1,0,0,0},
				{0,0,1,1,1,1,1,1,0,0},
				{0,1,1,1,1,1,1,1,1,0},
				{1,1,1,1,1,1,1,1,1,1},
				{1,1,1,1,1,1,1,1,1,1},
				{1,1,1,1,1,3,1,1,1,1},
				{1,1,1,1,1,1,1,3,3,1},
				{1,1,1,1,1,1,1,1,3,1}
			};
			 */
			 
		//JSTL 변환 
		pageContext.setAttribute("tables", tables);
		
		//저장시 필요한 정보
		pageContext.setAttribute("show_num",show_num);
		//pageContext.setAttribute("res_date",res_date);
		pageContext.setAttribute("seat",seat);
		 
	%>	
	
	<%
		char row ='A';
		pageContext.setAttribute("row", row);
	%>
	
	<div id="seatOutline">		
		<div class="center bottom_margin_20">
			<br>
			<h3>좌석 제작/수정 페이지</h3>
			<br>
			<span> (최대 24 x 12): </span>
			가로 = <input id = "cal_w"		type="number" min="2" max="24" value="14">&nbsp;x&nbsp;	
			세로 = <input id = "cal_h"		type="number" min="2" max="12" value="8">&nbsp;=&nbsp;
			<input id = "cal_submit"	type="button" value ="적용하기" onclick= "send_seat();">	
			<input id = "cal_reset"		type="button" value ="리셋하기" onclick="reset_seat();">
			
			<!-- 크기 조절 및 전송을 위한 폼 -->
			<form id="seat_send_form">
				<input type="hidden" name="seat" 		value="${seat}">
				<input type="hidden" name="show_num" 	value="${show_num}">
			</form>	 
		</div>
		
		<div id="seat_view_div">
			<%--	내용 : show_reservation_seat_editmode_sub.art 	--%> 
		</div>
	
		<br>
			
		<p class="center bottom_margin_20">			
			&nbsp;선택된 도구 : <input class="0" id="editor_select" type="text" value="빈공간" disabled="disabled" > 
			<input id="total" type="hidden">
			<br><br>
			
			<input class="0 editor" id="0"	type="button" value="빈공간">
			<input class="1 editor" id="1"	type="button" value="일반석">		
			<input class="4 editor" id="4"	type="button" value="장애인 배려석" >
			<input class="5 editor" id="5"	type="button" value="귀빈석">
			<input class="6 editor" id="6"	type="button" value="출구" 	>
		</p>
		
		<p class="right bottom_margin_20">
			<input type="button" value="수정완료" onclick="edit_submit();">&nbsp;&nbsp;&nbsp;&nbsp;
		</p>
		<div id="hidden"></div>
	</div>
</body>
	
<script>
	// 시작시 실행 할 것=======================================
	load_seat();
	
	//=========================================================
	function reset_seat(){
		var yes = confirm("작성하던 내용이 사라집니다. 이전의 좌석을 불러오시겠습니까?");
		
		if(yes)
			popup('show_reservation_seat_editmode.art',1200,800,'seat_form');
	}
	function load_seat(){
		loadPage('seat_view_div','show_reservation_seat_editmode_sub.art','seat_send_form');		
	}
				
	function edit_submit(){
		// 현재의 화면 정보를 받아온다. 

		// 클릭한 자리에 대한 정보를 얻는다. - 원본 show_reservation_seat // 
			// 좌석번호 - 좌석 줄마다 "|"를 넣어준다. 
			// 예약 상황
			var $table = $("#seatTable td");
			console.log($table);
			
			var seat = ""; // 예약상황
			var length = $table.length;
			var row = $(".row").length;
			var col = ((length-2)*1)/(row*1);
				//debug
					console.log("l" + length);
					console.log("r" + row);
					console.log("c" + col);
				
			//스크린과 빈 줄을 제외하고 2부터 시작한다.
			var count=0;
			for(var i=2 ; i<length ;i++){
				seat += $table.eq(i).attr("class");
				
				count++;
				if(count%col==0 && count+col<length)  
					seat+="|";
			}			
			// ◇ 예약 상황 
			console.log("seat "+ seat);
			
		// 좌석 정보를 담고 
			$("#seat_send_form input[name='seat']").val(seat);
		
		// 좌석 정보를 보내고 
			// seatProForm 의 show_num, seat 를 보낸다. // hidden 폼이 있어야할듯.   
			loadPage('hidden','show_reservation_seat_editmode_pro.art','seat_send_form');
			
		// 보낸 결과 성공인지 확인한다.
			//도착한 페이지에서 성공 메시지를 보내고 창을 닫는다.
			
	}
	
	
	function send_seat(){
		// 칸 수를 가져오기 
		var cal_w = $("#cal_w").val();
		var cal_h = $("#cal_h").val();
				
		// 칸 수를 String 으로 변환하기
		var seat = ""
		
		var h= cal_h;
		while(h--){
			var w = cal_w
			
			while(w--)
				// 네 모서리를 빈 공간으로 놓기
				if( (w%(cal_w-1)==0)  && (h%(cal_h-1)==0))	seat+="0"; 
				else										seat+="1";
			
			if(cal_h!=0)	seat+="|";
		}
				
		//debug
			//console.log("seat " + seat);
			
		// String 을 input[name="seat"] 에 담기
			$("#seat_send_form input[name='seat']").val(seat);
		
		// div로 전송
			loadPage('seat_view_div','show_reservation_seat_editmode_sub.art','seat_send_form');
		
	}
	
	
	// 에디터 선택 
	$(".editor").click(function(){
		$("#editor_select").attr("class",this.id);
		$("#editor_select").val(this.value);
		
		var $this = $("#"+this.id);
		var bg_img		= $this.css("background-image");
		var bg_color	= $this.css("background-color");
		
		$("#editor_select").css("background-image",bg_img 	);
		$("#editor_select").css("background-color",bg_color	);
		
		console.log(bg_img);
		console.log(bg_color);
	});


</script>

<style>
	.center{margin:auto; text-align: center;}
	.right {text-align: right;}
	.bottom_margin_20{	margin-bottom: 20px;}
		  
	#man {
		width: 40px;
	}
	
	#seatTable tr td {
		border-collapse: collapse;
		border : 2px solid white; 
	}
	
	#seatTable td {
		width : 40px;
		height: 40px;
		text-align: center;
		
		transition : 0.2s;
		
		cursor: pointer;
		
	}
	
	td[class="screen"]{background-color: #001c26; color:white; text-align: center; height:80px;}
	
	/* 
		id="0"	빈공간
		id="1"	좌석
		id="3"	지정석
		id="4"	장애인 배려석
		id="5"	귀빈석
		id="6"	출구
	 */
	
	/*	less 문법이라고 한다. 지금은 사용 못한다. 	 
	@myRed 		: #ff2c0c;
	@myYellow 	: #f5cd3f;
	@myBlue 	: #72bbff;
	@myCrimson	: #c83f42;
	@myPurple 	: #5937d3;
	@myNavy		: #001c26;
	@myGreen	: #83d35a;
	 */
	 	 
	td[class^="0"]	 				 {background-color: none;		color:white;}
					input[class^="0"]{background-color: none;		color:black;}
	
	td[class^="1"], input[class^="1"]{background-color: #72bbff;	color:black;}	
	td[class^="2"], input[class^="2"]{background-color: #f5cd3f;	color:black;}
		
	td[class^="4"], input[class^="4"]{color:black;	background: #72bbff url("/center/resources/art/images/pictogram/pictogram_handy.jpg") 	no-repeat left;}
	td[class^="5"], input[class^="5"]{color:black;	background: #f5cd3f url("/center/resources/art/images/pictogram/pictogram_king.jpg")	no-repeat left;}	
	td[class^="6"], input[class^="6"]{color:white;	background: #158638 url("/center/resources/art/images/pictogram/pictogram_exit.jpg")	no-repeat left;}
	
	
	#editor_select{
		text-align 	: center;
		width : 100px;
		height: 40px;
		border: 0px;
	}
	
	.editor{
		width:  100px;
		height:  40px;
	}
	
	#cal_w , #cal_h {
		width : 40px;
	}
	
	 
</style>
</html>





