<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>

<html>
<script> 
// body 로드 전까지는 숨기기 ===========================================
hideBody();
function init(){
	//topPage 로드 ===================================================== 
	topMenuLoad();
	
	// div page 로드 ===================================================
	loadPage('titleDiv','show_reservation_title.art',null,'sync');
	loadPage('dateDiv' ,'show_reservation_date_none.art',null,'sync');	
		// 검색 1차 실행 
			show();
	
	// body 모두 로드시 view밝히기 =====================================
	loadBody();
	
	// =================================================================
}
</script>
<body onload="init();">
	<div id='menu_load'></div>
	
	<div class="res_menu" id="my_res_menu"> <h3>상영 예약 페이지</h3></div>	
	
	<c:if test="${sessionScope.id!=null}">
		<div class="res_menu" id="my_res_info" onclick="view_res_info();"> <h3> 나의 예약 정보  </h3></div>		
		<form id="show_member_form">
			<input type="hidden" name="id" value="${sessionScope.id}">
		</form>			
	</c:if>
	
	<%
		String[] item 	= {	 "음악/교향","뮤지컬","연극"	};
		String[] place 	= {	 "금천구","구로구","강남구","강동구","강북구","강서구","관악구","광진구","노원구","도봉구","동대문구","동작구",
							 "마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"};		
	%>
	
<div class = "main" id="selectionDiv">
	<div class = "main" id="placeDiv">
		<%-- <select id="place"	size="<%= place.length + 2 %>" autofocus="autofocus" onchange="show('andDateLoad')"> --%>
			<select id="place"	size="10" autofocus="autofocus" onchange="show('andDateLoad')">			
			<option class="option-title" disabled="disabled">위치선택</option>
			<option selected="selected">전체</option>
			<%
				for(String p : place)
					p("<option>"+p+"</option>");	// selected='selected' 로 선택해야함.
			%>
		</select>
	</div>
	
	<div class = "main" id="itemDiv">
		<select id="item"	 size="<%= item.length + 2 %>" onchange="show('andDateLoad')">
			<option class="option-title" disabled="disabled">종류선택</option>
			<option selected="selected">전체</option>
			<%
				for(String i : item)
					p("<option>"+i+"</option>");
			%>
		</select>
	</div>
	
	<div class = "main" id="dateDiv">   </div>
	<div class = "main" id="titleDiv">  </div>	
	<div class = "main" id="seatDiv"> 	</div>
	<div class = "main" id="detailDiv"> </div>
	
	<div class = "main" id="watchDogDiv"> 	</div>
</div>	
</body>

<script>
	
	
	
	 
	
	// 와치독 이벤트는 seat에서 바로 교체하기로 했다.
	/* 
	setInterval(watchDog,1000);	// 반복 실행 	
	function watchDog(){
		var seatload = $("#seatDiv").html() == "";
		//debug
			//console.log(status);
		
		if(!seatload) return;	// seat 상태가 있을때만 갱신한다.
	}
	 */
	
	//날짜, 카테고리를 선택하면 셀렉트 내용 리로드	
	function show(mode){
		//debug;
			console.log($("option"));
			
		if(mode!=null){ // andDateLoad
			loadPage('dateDiv','show_reservation_date_none.art');
			$("#seatDiv").empty();
		}
		
		arrayDefault();
		// 변수 담기
		var place 	= $("#place").val();
		var item	= $("#item").val();
		var date	= $("#date").val();
			date	= date!=null ? date.split(" ")[0] : "전체";		
				
		// 디버그 
		console.log("place: " + place);
		console.log("item : " + item);
		console.log("date : " + date);
		
		// 조건 충족되지 않으면 중지 
			//if (place==null || item==null || date==null)	return;
		
		// 요일 변환		
		var day_week = new Date(date).getDay()+1;
			// 자바는 		SUNDAY 1 / MONDAY 2
			// 스크립트는	SUNDAY 0 / MONDAY 1
			
			// 디버그 
				//console.log(" day_week ! " + day_week);
				//var dateW = new Date(date);
				//console.log(date + " : " + dateW.getDay());
		
		// 변수 적재,조건정제 
		var datas = new Object;
		
		if(place!="전체")	datas["place"] 		= place;		
		if(item!="전체")	datas["item"] 		= item;		
		if(date!="전체")	datas["day_start"] 	= date;
		if(date!="전체")	datas["day_week"] 	= day_week;	// date 에 의해 결정
		
		var urls = "show_reservation_title.art";
		
		// 정보 로드하기
		$.ajax({
			 data : datas
			,type : 'post'
			,url  : urls
			,success: function(response) {				
				$("#titleDiv").empty();
				$("#detailDiv").empty();
				$("#seatDiv").empty();
	        	$("#titleDiv").html(response); 		        	
	        }
		});
		
	}	
	
	// 아래의 디펄트 형
	function arrayDefault()	{
		arrayDivs('placeDiv','itemDiv','dateDiv','titleDiv','seatDiv');		// 'detailDiv' 는 제외한다. 
	}
	
	function arrayDivs(){ //place // item // date // title // detail   [Div]				
		// 환경 설정 ====================================================
		var start_margin= 20;
		var space = 20;
		var time  = 0.5;
					
		// 변수 할당 ====================================================
		var names = arguments;	// arguments : 인자들의 배열
			// 디버그
			// console.log("a : " + arguments[0]); 
		
		var divs 	= new Array();
		var widths	= new Array();
				
		for(var i in names){
			var name = names[i];			
			divs[i]		= $("#"+name);
			widths[i]	= $("#"+name).width();			
			// 디버그
				//console.log( name 		+ " : " + divs[i]);
				//console.log("w_"+name 	+ " : " + widths[i]);
			
			//widths[i]	= widths[i].replace("px","");
		}
		
		// 정렬 하기  ===================================================		
		var l_total= start_margin;	
		for(var i in names){
			divs[i].css("left"		, (l_total-space) + "px");
			divs[i].css("left"		, l_total + "px");
			divs[i].css("transition", time + "s");
			l_total+= widths[i]*1 + space; 
		}
		
		// =============================================================
	}
	
	function view_res_info(){		
		//popup(page,width,height,form);
		popup('show_member_info.art',1200,600,'show_member_form');
		
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

	#place{
		
	}

	option:FIRST-CHILD{
		background-color: #001c26;	
		color : white;
	}
	
	.res_menu{
		margin : auto;
		display : inline;
		position : absolute;
				 
		text-align: center;
		cursor: pointer;
	}
	
	#my_res_menu{		
		/* 
		background-color:  #5937d3;
		color : white;
		 */
		top : 40px;
		left: 0px;
		
		width : 245px;
		height : 65px;	
	}
	
	#my_res_info{		
		background-color:  #001c26;
		color : white;
		top : 40px;
		right : 0px;
		
		width : 200px;
		height : 65px;	
	}

	select	{ 	overflow: auto; }	
	.main	{	display: inline;
				position: absolute;
				top: 70px;
	}

	option {
		padding : 5px;
	}	
	
	#selectionDiv { left:100px;	}
	#placeDiv { left:0px;	}		 
	#itemDiv  { left:100px;	}
	#dateDiv  { left:200px;	}
	#titleDiv { left:300px;	}		
	
	#detailDiv { 
		width : 770px;
		
		left:120px;	
		top :430px;
		
		display : inline;
		position : fixed;
		
		word-wrap: break-word;
	}
			
	#seatOutline, #deatilOutline{ border : 1px grey solid;	background-color: white;}
	
	#seatDiv  { left:1150px; width:900px; heigh: 800px;	}
	

	
</style>

</html>