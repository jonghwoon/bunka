<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>

<html>
<head>
	<meta name="viewport" content="width=device-width", initial-scale="1">
</head>
<body onload="arraybox(); loadPage('menu_load','menu_top.common');">
	
	<%!
		protected String randomColor() { 
			return String.valueOf(Math.round((Math.random()*1000000)));			
		}	
	%>
	
	<!-- menu_top 자리  -->
	<div id='menu_load'></div>
	<!-- menu_top 자리  -->
		
	<div id='menu_left'>	
		<p><span class="glyphicon glyphicon-home"></span> &nbsp; Home</p>
		<p><span class="glyphicon glyphicon-fire"></span> &nbsp; Special Exibition</p>
		<p><span class="glyphicon glyphicon-star"></span> &nbsp; Permanent Exhibition</p>
		<p><span class="glyphicon glyphicon-user"></span> &nbsp; Artis</p>
		<p><span class="glyphicon glyphicon-globe"></span> &nbsp; 시설 찾아보기 </p>
		<p><span class="glyphicon glyphicon-thumbs-up"></span> &nbsp; 게시판</p>
		<p><span class="glyphicon glyphicon-phone-alt"></span> &nbsp; 의견 보내기</p>	
	</div>

	<div id='menu_right'>
		<div id="box_menu">
			<c:forEach begin="1" end="63" step="1">
				<div class="box" style="background-color: <%=randomColor()%>"></div>
			</c:forEach>
		</div>
		<div id="box_view"></div>
		
	</div>
	
	<div id='menu_bottom'></div>
	
</body>

<script>
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
	 
	$( window ).resize(function() {
		arraybox();
	});
	
	$(".box").click(function(){
		
		var thisColor = $(this).css("background-color");
		D(thisColor);
		$("#box_view").css("background-color",thisColor);
		$("#box_view").css("transition","0.5s");
		
	});
	
	
</script>



<!-- 좌측 메뉴  -->
<style>
	* {
		margin 	: 0px;
		padding : 0px;
	}
	#menu_left{			
		width	: 240px;
		height	: 100%;
		
		padding-top	: 20px;		
		position 	: fixed;
		display  	: inline;		
		background-color :  lightgray;		

	} 
	
	#menu_left p{
		font-size 		: 1.1em;
		padding-left 	: 20px;
		
		padding-top		: 1em;
		padding-bottom	: 1em;
		
		transition: 0.3s;
	}
	
	#menu_left p:hover{	
		background-color : #fffff5;
		text-decoration : none;
		cursor : pointer;
		
		/* 
		font-size 	: 1.7em;
		
		padding-top		: 0.9em;
		padding-bottom	: 0.9em;
		transition: 0.3s;
	 	*/
	}
	
</style>

<!-- 우측 상단 메뉴 -->
<style>	

	
	#menu_right{	
		
		left : 240px;			
		width	: calc(100% - 240px);
		height	: 100%;
		
		margin : 0px;	
				
		position 	: fixed;
		display  	: inline;
		
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
		/*
		
		*/								
	}
	
	.box:hover{		
		opacity: 0.5;		
		transition : 0.5s;
		
		/* 예제
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


</html>