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
loadPage('menu_left','exhibition_form_menu.art');
function init(){
	//topPage 로드 ===================================================== 
	topMenuLoad();	
	// div page 로드 ===================================================
		// div 로드 
			//loadPage(div,url,form,sync){
			
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
		 
		<div id="box_menu" class="bu">
			<c:forEach begin="1" end="63" step="1" var="num">				
				<div class="box" id="${num}" style="background-color: <%=randomColor()%>">
					<%-- ${num} --%>					
					<img id="box_img_${num}" src="/center/resources/art/images/ex/bu/bu${num}.jpg">
				</div>
			</c:forEach>
		</div>
				
	</div>
		
	<div id='menu_bottom'></div>
	
	<form id="ex_form">
		<input type="hidden" name="title" value="goho">
		<input type="hidden" name="size"  value="30">		
	</form>	
</body>

<script>

	//그림 클릭시 화면전환
	$(".box").click(function(){
		
		var thisColor = $(this).css("background-color");
		D(thisColor);
		
		$("#box_menu").css("background-color",thisColor);
		$("#box_menu").css("transition","0.5s");
		
		
		var num = this.id;		
		var id  = $(this).parent().attr("class");
		
		playbox($(this));
		// 그림 옆에 설명 넣을까 싶기도...
				 
	});

	$( window ).resize(function() {
		arraybox();
	});
	
	
	function playbox($div_this){
		// div 정보를 받는다. 
		var $div_all= $(".box");		
		var div_all_length = $div_all.length;
		
		var div_this_num= $div_this.id;
		var id_this_div = $div_this.attr("id");
		//debug 
			console.log("div_all_length " + div_all_length); 
			console.log("div_this_num " + div_this_num);
		
		// div 번호를 바꾼다. // 바꾸지 않고도 정렬 할 수 있다.
			// 현재 디브를 가장 앞으로 놓고 // 현재 디브가 아닐경우 차곡차곡 정렬한다. 

		// 현재 디브를 1/1에 놓고 이미지 사이즈에 맞춰 정렬한다.
			//div 안의 이미지 정보를 출력한다. 
			var $img_this = $div_this.children("img");
			var img_this = $div_this.children("img");
			
			//sizeNow
				//console.log($img_this);
				//console.log("width " +$img_this.width());
				//console.log("height "+$img_this.height());
			
			//naturalWidth
			//console.log("width " +$img_this.naturalWidth);	// jquery 로는 잴 수 없다.
			//console.log("heigh " +$img_this.naturalHeight);	// jquery 로는 잴 수 없다.
			
			// 현재 img의 원래 크기를 반환
			var id_this_img = $img_this.attr("id");
			console.log(id_this_img);
			var width_nature 	= document.getElementById(id_this_img).naturalWidth;
			var height_nature 	= document.getElementById(id_this_img).naturalHeight;
			
				//console.log("width " + width_nature);
				//console.log("height "+ height_nature);
			
			// 현재 Div 의 크기를 반환
			var width_this_div  = $div_this.width();
			var height_this_div = $div_this.height();
			
				console.log("width_this_div " + width_this_div);
				console.log("height_this_div "+ height_this_div);	
			
			// 부모 Div 의 크기를 반환				
			var width_parent_div  = $div_this.parent().width();
			var height_parent_div = $div_this.parent().height();
				
					console.log("width_parent_div " + width_parent_div);
					console.log("height_parent_div "+ height_parent_div);
			
			// 모든 div의 크기를 이전의 div 크기로 조정한다. 
				$(".box").css({"width":width_this_div,"height":height_this_div});
					
			// 부모 Div 크기와 비교하여 더 크다면 맞추도록 한다.
				
				// 가로 세로 비율을 계산 후 
									
					if(width_nature>width_parent_div){
						var div = width_parent_div/width_nature;
						width_nature = width_parent_div;
						height_parent_div *= div;
						console.log("div "+ div);
					}
			
					if(height_nature>height_parent_div){
						var div = height_parent_div/height_nature
						height_nature = height_parent_div
						width_nature *= div;
						console.log("div "+ div);
					}
			
			console.log("width_this_div " + width_this_div);
			console.log("height_this_div "+ height_this_div);
			
			// 현재 Div를 이동 
			$div_this.css({"left":"0px","top":"0px","transition":"0.5s"});
			
			// 현재 Div의 z-index 우선으로
			$div_all.css({"z-index":"1"});
			$div_this.css({"z-index":"1000"});
						
			// 현재의 Div의 크기를 변경
			$div_this.css({"width":width_nature,"height":height_nature});
			
		// div 를 정렬한다.
		
			// 정렬의 기준은 가장 커진 그림의 : width_nature 가 된다.
			
			var left_origin	= width_nature;
			var top_origin	= 0;
			
			var left_next	= left_origin;
			var top_next	= top_origin;
			
			for(var i=0 ; i<div_all_length ; i++){				
			
				if($(".box").eq(i).attr("id") == id_this_div){
					console.log("id_this_div catch : " + id_this_div);
					continue;
				}
				
				$(".box").eq(i).css({"left":left_next,"top":top_next});
				var width_small_box = 
				left_next+= width_this_div;
				// 부모 div크기와 비교
				if(left_next + width_this_div > width_parent_div ){
					left_next = left_origin;
					top_next += height_this_div;
				}
			}
		
			// 
			
		
	}
	
	
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
		filter: brightness(150%) ;
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
		height	: 100%;
		/* 
		height	: 240px;
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