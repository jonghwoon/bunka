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
		String res_date	= dto.getValue("res_date"); //.split(" ")[0];
		String seat		= dto.getValue("seat");
		
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
		pageContext.setAttribute("show_num",show_num);
		pageContext.setAttribute("res_date",res_date);
		pageContext.setAttribute("seat",seat);
		 
	%>	
	
	<%
		char row ='A';
		pageContext.setAttribute("row", row);		
	%>
	<div id="seatOutline">
	
	<table id="seatTable" class="center">
		<tr><td class="screen"	colspan="40">Screen	</td></tr>		
		<tr><td 				colspan="40">		</td></tr>
		<tr><td 				colspan="40">		</td></tr>				
		<c:forEach var="table" items="${tables}" >
			<tr class="row">
			<c:set var="col" value="1"></c:set>	<!-- col init -->
			<c:forEach var="tab" items="${table}">								
				<!-- 좌석 번호 들어가야함 -->
				<td class="${tab}" id="${row}${col}">
					<c:if test="${tab!='0'}"> 
					${row}${col}
					</c:if>
				</td>
				<c:set var="col" value="${col+1}"></c:set>		<!-- col++ -->						
			</c:forEach>
			</tr>
			<% pageContext.setAttribute("row", ++row); %>
		</c:forEach>	
	</table>

	<br>
		
	<p class="center">
	
	&nbsp;예약 하실 인원 : <input id="man" type="number" min="1" max="4" value="2" disabled="disabled" autofocus="autofocus"> <span class="blue">(최대 10인)</span>
	<input id="total" type="hidden">
	<br><br>
	<input class="bottom_margin_20 center" type="button" value="예약하기" onclick="reserve();">
	</p>
		
	<!-- 전송을 위한 폼 -->
	<form id="seatProForm">
		<input type="hidden" name="id" 			value="${sessionScope.id}">
		<input type="hidden" name="show_num" 	value="${show_num}">
		<input type="hidden" name="res_date" 	value="${res_date}">
		<input type='hidden' name='seat' 		value="${seat}">
		<input type='hidden' name='seat_code' 	value="">
		
	</form>
	
	<div id="responseDiv"></div>
	
	</div>
</body>
	
<script>

	var emptyTd= 3; // 좌석 테이블 중 스크린과 비어있는 칸의 수
	
		
	// 와치독 좌석 갱신 이벤트 추가중...	// 오후 1:50 2017-08-01
		// 참조 : setInterval(function(){ alert("Hello"); }, 3000);
	
	// 실시간 예약 
	clearInterval(loop);	
	var loop = setInterval(watchDog,1000);	// 반복 실행
	
	var watch_url = 'show_reservation_seat_watchdog.art'; 
	function watchDog(){
		// seat 상태가 있을때만 갱신한다.
			//var seatload = $("#seatDiv").html() == "";		
			//if(!seatload) return;	
		
		// 데이터 적재 후 확인
		var data = new Object();
		data["show_num"] = $("#seatProForm input[name='show_num']").val(); 
		data["res_date"] = $("#seatProForm input[name='res_date']").val();
		console.log(data);
		
		// 데이터 확인할 수 없으면 루프 종료
		if (data["show_num"] === undefined){
			clearInterval(loop);
			return;
		}
		
		//ajax 로 불러와 비교한다. 결과를... 비교.. 흠..
		$.ajax({
			 type : 'post'
			,data : data
			,url  : watch_url
			,success: function(new_seat){				
				var old_seat = $("#seatProForm input[name='seat']").val();
					old_seat = old_seat.replace(/2/g,"1");	// g : 전역 검색 
					
				var isSame = new_seat == old_seat;
					
				if(!isSame)
					replaceSeat(new_seat);
					
				// debug
					//console.log("old_seat " + old_seat);
					//console.log("ser_seat " + server_seat);
					//console.log(isSame);
			}			
		});
		
	}

	// 테이블을 newSeat 으로 교체한다. 
	function replaceSeat(new_seat){
		// 인터벌 정지
		clearInterval(loop);
		
		//2인칸과 충돌하면 !방금 예약되었습니다. 모두 교체후 메시지
		//충돌이 없다면 스무스하게 교체
		
		var old_seat = $("#seatProForm input[name = 'seat']").val();
		
		//두 배열을 비교 후 비교되는 곳의 class 를 변경한다.
		// 예정된 변경이 new= 3 old=2 가 아니면 그냥 변경 아니면 경고 없이 변경 
		var alertOn = false;
		// 두개를 일일이 비교하지 않고 그냥 바로 뿌려주는 것도 좋겟군. // 스무스하지않아. 
		// 칸만 변경시킨다. 
		
		var $table = $("#seatTable td");			
		var seat = ""; // 새로 넣어줄 상태
		var length = $table.length;
		var row = $(".row").length;
		var col = ((length-emptyTd)*1)/(row*1);	// 빈줄 제외 - 3
		
		var count=0;
		var num_count=0;
		for(var i=emptyTd ; i<length ;i++){
			
			var old_num = old_seat.charAt(num_count);
			var new_num = new_seat.charAt(num_count);
			
			if(old_num != new_num){
				if(!(old_num==2 && new_num==1))	// 새로 넣을 자리가 비어있고 선택중일 경우는 제외하고 				
					$table.eq(i).attr("class",new_num);	// 새 상태 적용	
				if(old_num=='2' && new_num=='3')
					alertOn = true;
				//debug
					console.log("i " + i + " old_num " + old_num + " new_num " + new_num);
			}
			
			seat += $table.eq(i).attr("class");	// 상태 코드 할당
			
			count++;
			num_count++;
			if(count%col==0 && count+col<length) {
				seat+="|";
				num_count++;
			}
			
		}
		// debug		
			// console.log("seat "+ seat);
		$("#seatProForm input[name = 'seat']").val(seat); // 상태코드 할당
		
		// 좌석 카운트 갱신
		var total = $("#seatTable [class='2']").length;
		$("#total").val(total);//total 증가
		$("#man").val(total);
		
		if(alertOn)
			alert("선택하신 좌석이 방금, 다른분에게 예약 되었습니다.");
		
		//인터벌 다시 시작 
		var loop = setInterval(watchDog,1000);	// 반복 실행
	}
	
	//실시간 예약 끝
	

	//예약 진행
	function reserve(){
		
		// 선택한 좌석이 0 이면 리턴한다. 
		if($("#total").val()==0){
			alert("좌석이 선택 되지 않았습니다. 좌석을 선택해주세요.");
			return;
		}
		
		// 이하는 writeSeat() 으로 분리 하였다. 
		/*
		var emptyTd= 3;
		// 클릭한 자리에 대한 정보를 얻는다. 
			// 좌석번호 - 좌석 줄마다 "|"를 넣어준다. 
			// 예약 상황
			var $table = $("#seatTable td");
			console.log($table);
			
			var seat = ""; // 예약상황
			var length = $table.length;
			var row = $(".row").length;
			var col = ((length-emptyTd)*1)/(row*1);	// 빈줄 제외 - 3
				//debug
					console.log("l" + length);
					console.log("r" + row);
					console.log("c" + col);
				
			//스크린과 빈 줄을 제외하고 시작한다. - 3
			var count=0;
			for(var i=emptyTd ; i<length ;i++){
				seat += $table.eq(i).attr("class");
				
				count++;
				if(count%col==0 && count+col<length)  
					seat+="|";
			}			
			
			// debug		
				console.log("seat "+ seat);
		 */	

			/// 좌석번호도 편의상 저장해주면 좋을듯.				
				/// 상태가 2인 좌표를 얻어서 저장?
				// 그냥 저장할까? 변환의 편의를 위해 그냥 저장하자.
			var seat_code ="";
			var length  = $(".2").length;
			for(var n=0; n<length;n++)
				seat_code +=	$(".2").eq(n).attr("id") + " ";
					
			// ◇ 예약 좌석 
			console.log("seat_code " + seat_code );
			
		// 선택한 좌석을 예약 하시겠습니까?
			var res_date = $("#seatProForm input[name='res_date']").val();
			var okey = confirm(res_date+ "일, 총 " + length +"좌석 : " + seat_code + " 을 예약 하시겠습니까?");
				// debug
					var res_num = $("#seatProForm input[name='show_num']").val();
					console.log("res_date " + res_date );
					console.log("show_num " + show_num );
					
					$("#seatProForm input[name='res_date']").val(res_date);
					
			if(!okey)
				return;
			
		// 클릭한 자리를 포함하여 데이터를 보낸다.
			// 예약 현황 
				// 공연번호		(미리 넣어놓는다.)
				// 날짜			(미리 넣어놓는다.)
				// 좌석 현황	(준비함)
				
			//회원 예약 조회
				// 회원id		(미리 넣어놓는다.)
				// 공연번호		(중복)
				// 날짜 		(중복)
				// 좌석번호		(준비함)		
				// 예약 상황 	(중복)
				
		// 좌석번호 적재하기 		
			$("#seatProForm input[name='seat_code']").val(seat_code);
		
		// 전송!
		loadPage('responseDiv','show_reservation_pro.art','seatProForm');
				
	}
	
	function writeSeat(){
		
		// 클릭한 자리에 대한 정보를 얻는다. 
			// 좌석번호 - 좌석 줄마다 "|"를 넣어준다. 
			
			// 예약 상황을 할당한다
				//테이블을 배열로 변환 
			var $table = $("#seatTable td");
				//console.log($table);
			
			var seat = ""; // 예약상황
			var length = $table.length;
			var row = $(".row").length;
			var col = ((length-emptyTd)*1)/(row*1);	// 빈줄 제외 - 3
				//debug
					console.log("l" + length);
					console.log("r" + row);
					console.log("c" + col);
					
			//스크린과 빈 줄을 제외하고 시작한다. - 3
			var count=0;
			for(var i=emptyTd ; i<length ;i++){
				seat += $table.eq(i).attr("class");
				
				count++;
				if(count%col==0 && count+col<length)  
					seat+="|";
			}
			// debug		
				// console.log("seat "+ seat);
			$("#seatProForm input[name = 'seat']").val(seat);
			// debug
				// console.log("#seatProForm input[name = 'seat'] "+ $("#seatProForm input[name = 'seat']").val());
	} 
		
	var maxman = 10;
	$("#seatTable td").click(function(){
		console.log("click");
		
		var here = $(this).attr("class");
		var total = $("#total").val();
		
		/* 0좌석X , 1빈 , 2선택, 3예약 */
		// 0과 3번은 반응하지 않는다.
				
		if(here=="1"){
			if(total<maxman){		
				$(this).attr("class","2");
				total++;
			}
			else
				alert("예약인원은 최대 "+maxman+"명 입니다.");
		}
		else if(here=="2"){			
				$(this).attr("class","1");
				total--;
		}
 
		$("#total").val(total);//total 증가
		$("#man").val(total);
		
		writeSeat();
		console.log("total : " + $("#total").val() );
		return;		
	});
</script>

<style>
	.center{margin:auto; }
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
	 	 	 
	td[class^="0"]{background-color: none;		color:white;	cursor: default;}
	
	td[class^="1"]{background-color: #72bbff;	color:black;	cursor: pointer;}
	td[class^="2"]{background-color: #f5cd3f;	color:black;	cursor: pointer;}
	
	td[class^="3"]{background-color: #c83f42;					cursor: not-allowed;}
		
	td[class^="4"]{font-size : 0px;	background: #72bbff url("/center/resources/art/images/pictogram/pictogram_handy.jpg") 	no-repeat left;	cursor: not-allowed;}
	td[class^="5"]{font-size : 0px;	background: #f5cd3f url("/center/resources/art/images/pictogram/pictogram_king.jpg")	no-repeat left;	cursor: not-allowed;}	
	td[class^="6"]{font-size : 0px;	background: #158638 url("/center/resources/art/images/pictogram/pictogram_exit.jpg")	no-repeat left;	cursor: default;	}
	
	
	/*	less 문법이라고 한다. 지금은 사용 못한다. 	 
	@myRed 		: #ff2c0c;
	@myYellow 	: #f5cd3f;
	@myBlue 	: #72bbff;
	@myCrimson	: #c83f42;
	@myPurple 	: #5937d3;
	@myNavy		: #001c26;
	@myGreen	: #83d35a;
	 */		
	 
</style>
</html>





