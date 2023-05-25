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
		
		.heading{
			color: white;
		}
		a{
			
			 cursor:pointer;
		}
	</style>

</head>
<script type="text/javascript">

$(document).ready(function(){
	
	$(".menu").click(function(){
		// 색깔 빼기 
		$(".navbar-nav li").attr("class","");
		
		// 색깔 주기 
		$(this).parent().attr("class","active");
	});
	
	
	
});

function active($x){
	//var $x= $(x);
	//console.log($x);
	//$x.parent().attr('class','active');
	//console.log(x.parent());
	
}

 
function init(){
		topMenuLoad();
		
		loadPage('soccer_view','soccerview.sports');
		loadPage('menu_middle','menu_middle.sports');
	}
</script>
<body onload="init();">
<div id="menu_load"> </div>
<form id="chk">
	<input type="hidden" name="chk" value="1">
</form>

<div id="menu_middle">
<%-- 
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">스포츠</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li > <a class="menu" onclick="loadPage('soccer_view','soccerview.sports'); active(this);">메뉴</a></li>
					<li > <a class="menu" onclick="loadPage('soccer_view','placelist.sports'); 	active(this);">시설 보기</a></li>
					<li > <a class="menu" onclick="loadPage('soccer_view','teamlist.sports'); 	active(this);">팀 정보</a></li>
					<li > <a class="menu" onclick="loadPage('soccer_view','blacklist.sports', 'chk'); active(this);">블랙리스트 보기</a></li>
					<c:if test="${sessionScope.grade >= '1000'}">
					<li > <a class="menu" onclick="loadPage('soccer_view','blacklistadmin.sports'); active(this);">블랙리스트 관리</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
 --%>
</div>
 
<div class="container-fluid" id="soccer_view">
	
</div>

<script type="text/javascript">


/* 
var myIndex = 0;
carousel();
function carousel() {
	var i;
	var x = document.getElementsByClassName("mySlides");
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";
	}
	myIndex++;
	if (myIndex > x.length) {
		myIndex = 1
	}
	x[myIndex - 1].style.display = "block";
	setTimeout(carousel, 2000); // Change image every 2 seconds
}
 */
</script>
 

</body>

</html>


