<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp" %> 
<%@ include file="../common/setting.jsp"%>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<style>		
		.heading{	color: white;}
		a		{	cursor:pointer;	}
	</style>

</head>
<script type="text/javascript">

/* 
highlight();
function highlight(){
	var page = '${param.menu}';
	var i=0;
	switch(page){
		case 'soccerview.sports'		:i=0; break; 
		case 'placelist.sports'			:i=1; break;
		case 'teamlist.sports'			:i=2; break;
		case 'blacklist.sports'			:i=3; break;
		case 'blacklistadmin.sports'	:i=4; break;
	}
	
	$(".menu").eq(i).parent().attr("class","active");
	
	console.log("!"+page+"!!");
	console.log($(".menu").eq(i));
}
 */
 
$(document).ready(function(){	
	$(".menu").click(function(){
		// 색깔 빼기 
		$(".navbar-nav li").attr("class","");		
		// 색깔 주기 
		$(this).parent().attr("class","active");
	});
	
});

function init(){
		topMenuLoad();
		loadPage('menu_middle','menu_middle.sports');
		loadPage('soccer_view','${param.menu}');
	}
</script>
<body onload="init();">
	<div id="menu_load"> </div>
	<form id="chk">
		<input type="hidden" name="chk" value="1">
	</form>
	
	<div id="menu_middle"></div>	 
	<div class="container-fluid" id="soccer_view"></div>
	
</body>
</html>


