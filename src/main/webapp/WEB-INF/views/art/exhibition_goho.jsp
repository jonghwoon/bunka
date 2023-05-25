<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>
	
<%!
	protected String randomColor() { 
		return String.valueOf(Math.round((Math.random()*1000000)));			
	}	
%>

<html>

<script> 
// body 로드 전까지는 숨기기 ===========================================
hideBody();

function init(){
	//topPage 로드 ===================================================== 
	topMenuLoad();	
	// div page 로드 ===================================================
		// div 로드 
			//loadPage(div,url,form,sync){
			loadPage('menu_left','exhibition_form_menu.art');
		// div 들을 정렬한다.
		arraybox();	
	// body 모두 로드시 view밝히기 =====================================
	loadBody();
	
	// =================================================================
}
</script>
<body onload="init();">

	<div id='menu_load'></div>
	
	<div id='menu_left'>
	<!-- 
		<p class="ex_menu">				<span class="glyphicon glyphicon-home"></span> &nbsp; Home</p>
		<p class="ex_menu" id="bu" >	<span class="glyphicon glyphicon-fire"></span> &nbsp; Special Exhibition</p>
		<p class="ex_menu" id="goho" >	<span class="glyphicon glyphicon-star"></span> &nbsp; Permanent Exhibition</p>
		<p class="ex_menu">				<span class="glyphicon glyphicon-user"></span> &nbsp; Artist</p>
		<p class="ex_menu">				<span class="glyphicon glyphicon-globe"></span> &nbsp; 시설 찾아보기 </p>
		<p class="ex_menu">				<span class="glyphicon glyphicon-thumbs-up"></span> &nbsp; 게시판</p>
		<p class="ex_menu">				<span class="glyphicon glyphicon-phone-alt"></span> &nbsp; 의견 보내기</p>
	 -->	
	</div>

	<div id='menu_right'>
		 
		<div id="box_menu" class="goho">
			<c:forEach begin="1" end="28" step="1" var="num">				
				<div class="box" id="${num}" style="background-color: <%=randomColor()%>">					
					<img id="box_img_${num}" src="/center/resources/art/images/ex/goho/goho${num}.jpg">
				</div>
			</c:forEach>
		</div>
		<div id="box_view">
		<img id="box_view_img" src="/center/resources/art/images/ex/goho/goho1.jpg">
		</div>
		
	</div>
		
	<div id='menu_bottom'></div>
	
	<form id="ex_form">
		<input type="hidden" name="title" value="goho">
		<input type="hidden" name="size"  value="28">		
	</form>	
</body>

<script>

	//그림 클릭시 화면전환
	$(".box").click(function(){
		
		var thisColor = $(this).css("background-color");
		D(thisColor);
		
		$("#box_view").css("background-color",thisColor);
		$("#box_view").css("transition","0.5s");
		
		
		var num = this.id;		
		var id  = $(this).parent().attr("class");
				
		$("#box_view_img").attr("src","/center/resources/art/images/ex/"+id+"/"+id+num+".jpg");
		
		// 그림 옆에 설명 넣을까 싶기도...
		
		/* 
		$("#box_view").animate({width:'toggle'},350);  
			$("#box_view").html("<img src='/center/resources/art/images/ex/"+id+"/"+id+num+".jpg'>");				
		$("#box_view").animate({width:'toggle'},350);
		 */
	});

	$( window ).resize(function() {
		arraybox();
	});
	
	
	function arraybox(){
		// init ========================				
		var space 	= 0;
		var time  	= 0.3;
		
		// box 크기 할당 ===============		
		var len = $(".box").length;		
		var maxRow, maxCol, boxSize =0;
		
				if(len<=7)  {maxRow=1;	boxSize=240;maxCol=7; }
		else	if(len<=28) {maxRow=2;	boxSize=120;maxCol=14;}
		else	if(len<=63) {maxRow=3;	boxSize=80; maxCol=21;}
		else	if(len<=112){maxRow=4;	boxSize=60; maxCol=28;}
		else	if(len<=175){maxRow=5;	boxSize=48; maxCol=35;}
		else	if(len<=252){maxRow=6;	boxSize=40; maxCol=42;}
		else				{alert("게시물이 너무 많습니다.");	return;}
				
		// do it =======================
		var totalLeft;	
		for(var i=0;i<len;i++)	{
			// 박스 사이즈 할당
			$(".box").eq(i).width(boxSize);
			$(".box").eq(i).height(boxSize);
			
			// 가로 위치 리셋
			if(i%maxCol==0)	totalLeft = 0;
			
			// 가로위치 적용
			$(".box").eq(i).css("left"		,(totalLeft-space) + "px");
			$(".box").eq(i).css("left"		, totalLeft + "px");
			$(".box").eq(i).css("transition", time + "s");
			
			// 가로 위치 계산 
			totalLeft+= boxSize + space;
			
			// 세로위치 계산 
			var row= Math.floor(i/maxCol);
			
			// 세로위치 적용
			if(row>0)
				$(".box").eq(i).css("top",(boxSize+space)*row);			
		}	
		
		// 큰 뷰의 위치
		
		var viewHeight= $("#menu_right").height()- $("#box_menu").height();
		$("#box_view").css("width" , "100%" );
		$("#box_view").css("height", viewHeight);				
		$("#box_view").css("top", $("#box_menu").height());
		$("#box_view").css("left",0);
		
	}
	
</script>


<!-- 우측 상단 메뉴 -->
<style>	

	.box img{
		width:100%;
		height: auto;
		
		overflow: hidden;
		min-width:  100%;
		min-height: 100%; 	
	} 
	
	#menu_right{
		
		left : 240px;
		top : 40px;
		width	: calc(100% - 240px);
		height	: 100%;
		
		margin : 0px;
		
		display  	: inline;
		position 	: fixed;
		
		background-color :  lightgray;	
		
		/*
		padding-top	: 25px;
		padding: 40px; 		
						
	 	*/
	 	
	} 
	
	#menu_right .box{
		/* 	
		width : 100px;
		height: 100px;
		
		background-color : yellow;
		 */
		
		display: inline;				
		cursor : pointer;		
		position : absolute;		
		transition : 0.5s;
								
		overflow: hidden;					
	}
	
	.box{
		
	}
	
	.box:hover{
		filter: brightness(150%);
		transition : 0.5s;
	 	
		/*
		 
		opacity: 0.5;
		
		transform : scale(0.9, 0.9);
		 
		transform : scale(0.9, 0.9) translate(50px, 100px);
		
		크기변환 보다는 색상 변환을 해보는 것이 좋지않을까?
		 */
	}
	
	#box_menu{
		width	: 100%;
		height	: 240px;
	}
	
	#box_view{
		
		position : absolute;
		background-color : skyblue;
		/*
		width 	: 100%;
		height 	: 100%;
		*/
	}
	
	.canvas{	
		position : relative;
		
		/* 3d setting */
		perspective : 600px;
	}
	
	#menu_right .box :hover{
		/*	3d 예제
		transform : translateY(-25px) rotateX(90deg) ;
		transition : 0.5s;
		*/	
	}
	
</style>

<!-- 우측 하단 메뉴 -->
<style>

	#box_view img{
		height: 100%;
		width : auto;		
	}
		
</style>

</html>