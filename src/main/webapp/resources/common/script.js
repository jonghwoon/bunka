// ================================================ //
//				공용 명령어 목록 					//
// ================================================ //
 
// loadPage
// div에 url 주소를 form 의 데이터를 담아 전송한다. sync에 값이 있을경우 동기식으로 실행한다.
// 예) loadPage('menu_bottom_right','main_sub_intro.common',null,'sync');
function loadPage(div,url,form,sync){
	var data = form!=null ? $("#"+form).serialize() : null;	
	$.ajax({
		 data : data
		,type : 'post'
		,url  : url
		,async: sync==null ? true : false
		,success: function(response) {
			$("#"+div).empty();
			$("#"+div).html(response);
        }
	});
}

// 애니메이션을 주며 페이지 전환 // 을 하려고 하지만... 
function changePage(div,url,form,sync){
	$("#"+div).fadeOut(500);
	var data = form!=null ? $("#"+form).serialize() : null;	
	$.ajax({
		 data : data
		,type : 'post'
		,url  : url
		,async: sync==null ? true : false
		,success: function(response) {
			setTimeout(function(){
				$("#"+div).empty();
				$("#"+div).html(response);
				
			}, 400);
        }
	});
	$("#"+div).fadeIn(500);
}


//href
//화면 이동 효과를 주며 이동한다.
//예) onclick="href('main.common');"
function href(url){
   $('body').animate({"opacity": "0", "top": "100px"},500, 
  		 function () {document.location.href = url;});
   return false;	
}

//loadBody
//화면 이동 후 페이지 펼치기 
//예) <body onload="loadBody();">	
function loadBody(){
	$('html, body').css("visibility","visible");
	$('html, body').stop();
	$('html, body').animate({"opacity": "1"},500);
}

//hideBody
//화면 이동 후 바디 로드 전 까지 페이지 숨기기  
//예) <script> hideBody(); </script> 
function hideBody(){	
	$('html, body').css("visibility","hidden");
	$('html, body').css("opacity","0");
	//$('html, body').css("filter","grayscale(100%)");
	
	
}

//topMenuLoad
//상단 메뉴 로드 
//예 <body onload="topMenuLoad();">
function topMenuLoad(){
	// 상단 메뉴 Div 생성
	if($("#menu_load").length == 0)
		$('body').html("<div id='menu_load'></div>" + $('body').html());
	
	// 상단 메뉴 로드	
	loadPage('menu_load','menu_top.common',null,'sync');
	
	//
}
	