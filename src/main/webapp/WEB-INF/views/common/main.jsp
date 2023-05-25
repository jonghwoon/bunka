<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>

<html>

<script> 
// body 로드 전까지는 숨기기 ===========================================
hideBody();

// carousel preload ====================================================
loadPage('menu_bottom_left','main_sub_carousel.common');

function init(){
	//topPage 로드 ===================================================== 
		topMenuLoad();
	// div page 로드 ===================================================	
		loadPage('menu_bottom_right','main_sub_intro.common');	
	// body 모두 로드시 view밝히기 =====================================
		loadBody();	
	// =================================================================
}
</script>
<body onload="init();">

	<div id="title" 				onclick="goArticle('intro3')"> 	Central Culture System</div>	
	<div class="menu" id="site" 	onclick="goArticle('intro2')">	사이트 소개	</div>
	<div class="menu" id="circle" 	onclick="href('main.circle');">	동아리		</div>
	<div class="menu" id="item"		onclick="href('main.item');">	도서/대여	</div>
	<div class="menu" id="camp"		onclick="href('main.camp');">	대관/캠핑	</div>
	<div class="menu" id="art" 		onclick="href('main.art');">	전시/상영	</div>
	<div class="menu" id="sports" 	onclick="href('main.sports');">	체육/팀매칭	</div>
	 
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
	바탕퍼플 : 3b2c4a
	 
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
	
	#site 	{	top :  40px; left: 40%;	background-color: #f5cd3f;}
	#circle	{	top :  40px; left: 60%; background-color: #72bbff;}
	#item 	{	top :  40px; left: 80%; background-color: #c83f42;}
	#camp 	{	top : 240px; left: 40%;	background-color: #5937d3;}
	#art 	{	top : 240px; left: 60%;	background-color: #001c26;}
	#sports {	top : 240px; left: 80%;	background-color: #83d35a;}
						
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
		height: 400px;		
		line-height :400px;
		
		background-color: #ff2c0c;
		
		vertical-align: center;
		text-align : center;
		
		color : #fffff5;
		font-family : BebasNeue;
		font-size: 80px;
	}
	
	#menu_back{
		background-color : #3b2c4a;
		width	: 100%;	
		height	: 100%;
	}
	
	#menu_bottom_left{
		display : inline;
		position : absolute;
		
		top : 440px;
		left : 0px;
				 
		background-color : #3b2c4a;
		width : 40%;
		height : calc(100% - 440px);
					
	}
	
	#menu_bottom_right {
		display : inline;
		position : absolute;
				
		top	: 440px;
		left: 40%;
		
		color : white;		
		background-color : #3b2c4a;
		width : 60%;
		height: calc(100% - 440px);		
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
  background: #001c26;
  border: 0px none #3b2c4a;
  border-radius: 0px;
}
::-webkit-scrollbar-thumb:hover {
  background: #001c26;
}
::-webkit-scrollbar-thumb:active {
  background: #001c26;
}
::-webkit-scrollbar-track {
  background: #3b2c4a;
  border: 0px solid #3b2c4a;
  border-radius: 0px;
}
::-webkit-scrollbar-track:hover {
  background: #3b2c4a;
}
::-webkit-scrollbar-track:active {
  background: #3b2c4a;
}
::-webkit-scrollbar-corner {
  background: transparent;
}
</style>
<!-- 
	컬러 픽커 사용했습니다. 
	https://mikethedj4.github.io/Webkit-Scrollbar-Generator/
-->

</html>












