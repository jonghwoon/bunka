<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="setting_art.jsp"%>

<html>

<script> 
// body 로드 전까지는 숨기기 ===========================================
hideBody();

//carousel preload ====================================================
loadPage('menu_bottom_left','main_sub_carousel.art');

function init(){
	//topPage 로드 ===================================================== 
	topMenuLoad();
	// div page 로드 ===================================================
	
	loadPage('menu_bottom_right','main_sub_intro.art',null,'sync');	
	// body 모두 로드시 view밝히기 =====================================
	loadBody();	
	// =================================================================			

}
</script>
<body onload="init();">

	<div id="title" 					onclick="goArticle('intro3')"> 					Arts and Exhibitions </div>	
	<div class="menu" id="show" 		onclick="href('exhibition_form.art');">			온라인 전시			</div>
	<div class="menu" id="reservation" 	onclick="href('show_reservation_form.art');">	상영/연극 예약 		</div>
	<div class="menu" id="etc"			onclick="href('play.art');">					기타...			</div>
	<div id="menu_back"></div>
 	<div id="menu_bottom_left"></div>
 	<div id="menu_bottom_right"></div>
</body>

<script>
function goArticle(seq){
	 // 이동할 타겟 위치 = div	 
	var targetOffset  	= $("#"+seq).offset().top;
	var divScrollTop	= $('#menu_bottom_intro').scrollTop();
	var divOffset		= $('#menu_bottom_intro').offset().top;
		
	var top = targetOffset + divScrollTop - divOffset;	/// 현재위치 반영하여 계산
		
	$('#menu_bottom_intro').stop();
	$('#menu_bottom_intro').animate({scrollTop : (top)}, 400);
	
	// 출처: http://cofs.tistory.com/191 [CofS] : 에서 참고하여 수정.. 하다가 완전 새로 썼구먼..
}
</script>

<!-- menu_middle_top -->
<style>
	/*  
	== 컬러 참조 : 학원 모니터 기준 ==
	바탕퍼플 : 001c26
	 
	red 	: ff2c0c
	yellow 	: f5cd3f
	blue 	: 72bbff
	crimson	: c83f42
	purple 	: 5937d3
	navy	: 001c26
	green	: 83d35a	
		
	== 인기 노트북 기준 ==	
  	*/

	.menu{	
		cursor : pointer; 
		display : inline;
		position: absolute;
		width : 20%;
		height: 200px;
		line-height :200px;
				
		text-align : center;
		vertical-align: middle;
		font-weight: 600;
				
		font-size : 40px;		
		color:#fffff5;
		text-decoration: none;		
		overflow: hidden;
	}
	
	#show			{	top :  40px; left: 40%;	background-color: #f5cd3f;}
	#reservation	{	top :  40px; left: 60%; background-color: #72bbff;}
	#etc			{	top :  40px; left: 80%; background-color: #c83f42;}
						
</style>

<style>
	@font-face{font-family:'BebasNeue'; src:url('resources/common/font/BebasNeue.otf')}	
 	 	
	body {
		margin : 0px;
		padding: 0px;
		
		overflow: hidden;
	}
	
	#title{
		cursor : pointer; 
		display : inline;
		position : absolute;
						
		top : 40px;
		left : 0p;
		
		width : 40%;
		height: 200px;		
		line-height :200px;
		
		background-color: #001c26;
		
		vertical-align: center;
		text-align : center;
		
		color : #fffff5;
		font-family : BebasNeue;
		font-size: 80px;
	}
	
	#menu_back{
		background-color : #001c26;
		width	: 100%;	
		height	: 100%;
	}
	
	#menu_bottom_left{
		display : inline;
		position : absolute;
		
		top : 240px;		
		left : 0px;
				 
		background-color : #001c26;
		width : 40%;
		height : calc(100% - 240px);
					
	}
	
	#menu_bottom_right {
		display : inline;
		position : absolute;
				
		top : 240px;
		left: 40%;
		
		color : white;		
		background-color : #001c26;
		width : 60%;
		height: calc(100% - 240px);		
	}	
</style>


<!-- 스크롤바 세팅 -->
<style type="text/css">
::-webkit-scrollbar {
  width: 12px;
  height: 12px;
}
::-webkit-scrollbar-button {
  width: 12px;
  height: 12px;
}
::-webkit-scrollbar-thumb {
  background: #83d35a;
  border: 0px none #001c26;
  border-radius: 0px;
}
::-webkit-scrollbar-thumb:hover {
  background: #83d35a;
}
::-webkit-scrollbar-thumb:active {
  background: #83d35a;
}
::-webkit-scrollbar-track {
  background: #001c26;
  border: 0px solid #001c26;
  border-radius: 0px;
}
::-webkit-scrollbar-track:hover {
  background: #001c26;
}
::-webkit-scrollbar-track:active {
  background: #001c26;
}
::-webkit-scrollbar-corner {
  background: transparent;
}
</style>


</html>












