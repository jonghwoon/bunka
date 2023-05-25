<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>

<html>

<body onload="init();">
	<h3>Art Test Page</h3>
	<%
		String[] item 	= {	 "음악/교향","뮤지컬","연극"	};
		String[] place 	= {	 "금천구","구로구","강남구","강동구","강북구","강서구","관악구","광진구","노원구","도봉구","동대문구","동작구",
							 "마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"};		
	%>
	
<div id="selectionDiv">
	<div id="placeDiv">
		<select id="place"	size="<%= place.length + 2 %>" autofocus="autofocus" onchange="show('andDateLoad')">
			<option disabled="disabled">위치선택</option>
			<option selected="selected">전체</option>
			<%
				for(String p : place)
					p("<option>"+p+"</option>");	// selected='selected' 로 선택해야함.
			%>
		</select>
	</div>
	
	<div id="itemDiv">
		<select id="item"	 size="<%= item.length + 2 %>" onchange="show('andDateLoad')">
			<option disabled="disabled">종류선택</option>
			<option selected="selected">전체</option>
			<%
				for(String i : item)
					p("<option>"+i+"</option>");
			%>
		</select>
	</div>
	
	<div id="dateDiv">	
		
	</div>
	<div id="titleDiv">
		
	</div>
	<div id="detailDiv">
				
	</div>
</div>	
</body>

<script>
	// 초기화 설정
	function init(){		
		popupReady();				 
		show('andDateLoad'); 
		arrayDefault();
	}
	
	//날짜, 카테고리를 선택하면 셀렉트 내용 리로드	
	function show(mode){
		if(mode!=null) // andDateLoad
			loadPage('dateDiv','show_reservation_date_none.art');
		
		arrayDefault();
		// 변수 담기
		var place 	= $("#place").val();		 
		var item	= $("#item").val();
		var date	= $("#date").val().substr(0,10);
				
		// 디버그 
		console.log("place: " + place);
		console.log("item : " + item);
		console.log("date : " + date);
		
		// 조건 충족되지 않으면 중지 
		if (place==null || item==null || date==null)	return;
		
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
				
	        	$("#titleDiv").html(response); 	
	        	
	        }
		});
		
	}
	
	
	// 아래의 디펄트 형
	function arrayDefault()	{
		arrayDivs('placeDiv','itemDiv','dateDiv','titleDiv','detailDiv');	
	}
	
	function arrayDivs(){ //place // item // date // title // detail   [Div]				
		// 환경 설정 ====================================================
		var start_margin= 50;
		var space = 50;
		var time   = 0.5;
					
		// 변수 할당 ====================================================
		var names = arguments;	// arguments : 인자들의 배열
			// 디버그
			// console.log("a : " + arguments[0]); 
		
		var divs 	= new Array();
		var widths	= new Array();
		
		
		for(var i in names){
			var name = names[i];			
			divs[i]		= $("#"+name);				
			widths[i]	= $("#"+name).css("width");			
			// 디버그
				//console.log( name 		+ " : " + divs[i]);
				//console.log("w_"+name 	+ " : " + widths[i]);
			
			widths[i]	= widths[i].replace("px","");
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
		 
	function loadPage(div,urls,form){
		var datas = form!=null ? $("#"+form).serialize() : null;
		
		$.ajax({
			 data : datas
			,type : 'post'
			,url  : urls
			,success: function(response) {				
				$("#"+div).html(response);
	        }
		});
	}
</script>


<style>
	select {
		overflow: auto;	
	}	
	div {
		display: inline;
		position: absolute;
		top: 50px;
	}
	#selectionDiv { left:100px;	}
	#placeDiv { left:0px;	}		 
	#itemDiv  { left:100px;	}
	#dateDiv  { left:200px;	}
	#titleDiv { left:300px;	}
	#detailDiv{ left:800px;	word-wrap: break-word; }
</style>

</html>