<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../common/setting.jsp"%>

<html>
<script> 
// body 로드 전까지는 숨기기 ===========================================
hideBody();
function init(){
	//topPage 로드 ===================================================== 
	topMenuLoad();	
	// div page 로드 ===================================================		
	loadPage('sub1','main_sub_show.art',null,'sync');
	loadPage('sub2','main_sub_show.art',null,'sync');
	loadPage('sub3','main_sub_show.art',null,'sync');
	
	// body 모두 로드시 view밝히기 =====================================
	loadBody();
	
	// =================================================================
}
</script>
<body onload="init();">	
	<div id="title">
		<br><br>
		<h1> Central Culture System</h1>		
		<!-- <input type="text"> -->
		
		<br><br>
	</div>
	
	<div id="menu_middle_top">	
		<ul>
		
			<li onclick="href('show_reservation_form.art');">	공연정보/예약	</li>
			<li onclick="href('exbition_form.art');">			온라인 전시		</li>			
			<li><a href="main.common">ABOUT	</a></li>
			<li><a href="main.common">ABOUT	</a></li>
			<li><a href="main.common">ABOUT	</a></li>			
		</ul>
	</div>				
	<div id="menu_middle"> 
		<div class="mid_sub" id="sub1"></div>	<!-- 신규 전시 -->
		<div class="mid_sub_empty"></div>
		<div class="mid_sub" id="sub2"></div>	<!-- 신규 도서 -->
		<div class="mid_sub_empty"></div>
		<div class="mid_sub" id="sub3"></div>	<!-- 신규 캠핑 -->		<!-- 신규 동아리 -->	<!-- 신규 팀 모집 -->
	</div>			
	<div id="menu_bottom">	</div>
	
	
	<form id="sub1_form">	<input type="hidden" name="temp" value="1">	</form>
	<form id="sub2_form">	<input type="hidden" name="temp" value="1">	</form>
	<form id="sub3_form">	<input type="hidden" name="temp" value="1">	</form>	
	
	
</body>
<!-- menu_middle_top -->
<style>
	#menu_middle_top ul{	
		margin 	: 0px;
		padding : 0px;		
	}
		
	#menu_middle_top li{
		font-size : 20px;	
		display: inline;
		padding-right: 20px;
	}
	
	#menu_middle_top li a{
		margin-right :  5px;
		color : black;
		text-decoration: none;
					
	}
	
	#menu_middle_top li a:HOVER{
		color : black;
		text-decoration: none;			
	}

</style>

<style>
	/*		 
		#fffff5 : #fffff5
		orangelight : #ffda8e
		skyblue : #80d4f6
		purple : #5c196b		
	 */	
	
	* {
		margin : 0px;
		padding: 0px;
	}
	#title{	
		text-align : center;
		width : 100%;
	}
	
	#title h1{
		font-family : BebasNeue;
		font-size: 80px;
	}
	
	#title input{
		width : 300px;
		height: 50px;
		border : 7px #80d4f6 solid;
		border-radius: 7px;

	}
	
	#menu_middle_top{
		width  : 100%;	
		height : 45px;
		background-color: lightgray;
	}
		
	#menu_middle{
		width  : 100%;	
		height : 300px;
		/* 
		background-color: #80d4f6;
		 */
	}
		.mid_sub{
			display : inline;
			position : absolute;
			width : 32%;
			height : 300px;
			background-color: #ffda8e;
		}
		#sub1{
			left : 0px;
		}
		
		#sub2{
			left : 50%;

			transform : translateX(-50%);
			
			/* 			
			transform : translateX(-50%)
			translateY(-50%)
			scale(0.01, 0.01);
			 */		
		}
			
		#sub3{
			right : 0px;
		}
	
	#menu_bottom{
		width : 100%;	
		height : 150px;
		background-color: lightgray;
	}
	
</style>
</html>