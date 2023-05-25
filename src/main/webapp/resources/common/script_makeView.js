// * made by INKY 오후 9:01 2017-07-12
popupReady();
function popupReady(){
	/* =========================================================
	 * popup div 생성 <body onload="popupReady();"> 로 추가한다.
	 * 
	 * 아래의 설정은 사용자의 취향에 맞게 수정하여 사용할 수 있다.
	 * =========================================================*/
	
	//Style #1 -- 이후 다른 스타일을 작성하여 사용할 수 있을것이다.	 
	if($("#popup").length==0){
		$('body').append("<div id='popup'></div>");
		$("#popup").css("z-index","510");
		$("#popup").css("display","inline");
		$("#popup").css("position","fixed");
		$("#popup").css("top","200px");
		$("#popup").css("left","50vw");
		$("#popup").css("opacity","1");
		$("#popup").css("background-color","white");	
		$("#popup").css("visibility","hidden");
		$("#popup").css("overflow","hidden");		
		$("#popup").css("transform","translateX(-50%)	translateY(-50%) scale(0.01, 0.01)");
	
		//$("#popup").css("border-radius","10px"); // 모서리를 둥글게 하고싶으면 쓰세요.
		
		//popup_back 생성	
		$('body').append("<div id='popup_back' onclick='popdown()'></div>");
		$("#popup_back").css("z-index","500");
		$("#popup_back").css("display","inline");
		$("#popup_back").css("position","fixed");
		$("#popup_back").css("top","0px");
		$("#popup_back").css("left","0px");
		$("#popup_back").css("width","100%");
		$("#popup_back").css("height","0vh");
		$("#popup_back").css("opacity","0.7");
		$("#popup_back").css("background-color","black");
		
		//console.log("popup div build!");
	}	
	// X 마크 css 설정 // 먹히지 않아 버튼에 직접 넣었다.
	
	// 디버그
	//console.log("popup div ready!");
}

function popup(page,width,height,form,exit){	
	//console.log("popup div called!");
	/* ========================================================= 
	 * popup 명령, 간단하게 onclick="popup('page.do',500,500);" 같이 사용한다.  
	 * 패러미터 : 
	 * 		page : 이동할 페이지  
	 * 		width,height : popup 될 창의 크기 (생략 가능) default : 500px * 500px 
	 * 		form : 전송할 데이터를 담은 폼의 id (생략 가능)
	 * 		exit : 공백을 클릭할때 닫을지를 물어볼 것인가. (생략 가능)
	 * =========================================================*/
	
	
	// 팝업 크기 결정	// 입력없을시 500 x 400
	width  = width !=null ? width  : 500;
	height = height!=null ? height : 400;
	
	var datas = new Object;
	if(form!=null){
		datas = $("#"+form).serialize();		
		//디버그 
			console.log("form  : " + form);
			console.log("datas : " + datas);
			//page  = form.attr('action');
	}
	
	// 팝업 애니메이션
	$("#popup_back").css("width" ,"100%");
	$("#popup_back").css("height","100%");		//$(document).height()
	$("#popup_back").css("transition","0s");
	
	$("#popup").html("");
	
	// 뒤로가기 버튼에 CSS를 넣었다. 
	var buttonX = "<div style='z-index:520;display:table;position:absolute;right:0px;top:0px;width:50px;height:50px;background-color:gray;cursor:pointer;text-align:center;'"	
				 +"id='exit' onclick='popdown();'><span style='display:table-cell;vertical-align:middle;'> X </span></div>";
	
	// 전송하고 결과에 뒤로가기 버튼을 추가한다.  
	setTimeout(function() {		
	    $.ajax({ 					
	        data: 	datas,			
	        type: 	'post',	 		
	        url: 	page,	 		
	        success: function(response) { 		
	        	response+= buttonX;
	        	$("#popup").html(response); 	
	        }
	    });
	}, 300);
	
	var top	= $("#popup_back").css("height").replace("px","");
	//debug
		//console.log("top "+ top);
	var top = (top*1 - height*1)/2;	
	
	//debug 
		//console.log("top "+ top);
		
	$("#popup").css("top",top+"px");
	$("#popup").css("width",width+"px");
	$("#popup").css("height",height+"px");	
	$("#popup").css("visibility","visible");
	$("#popup").css("transform","translateX(-50%) scale(1,1)");	
	$("#popup").css("transition","0.5s");
}
	
function popdown(mode){
	/* ========================================================= 
	 * popdown 명령, 신경쓰지 않아도 된다.   
	 * =========================================================*/
	
	//로그 
		//console.log("popdown");
		
	//alert("프로틴");	
	if(mode==null)
		for(var i=0; i< $(".input").length ; i++)
			if($(".input").eq(i).val()!="")
				if(!confirm("작성중이던 내용이 사라집니다. 괜찮습니까?"))	return;				
				else 	break;
	$("#popup").html("");
	
	$("#popup").css("transform","translateX(-50%) translateY(-50%) scale(0.01,0.01)");
	$("#popup").css("transition","0.3s");
	
	setTimeout(function() {
		$("#popup_back").css("height","0vh");
		$("#popup_back").css("transition","0s");
	}, 300);
	
	setTimeout(function() {
		$("#popup").css("visibility","hidden");		
	}, 300);
	
}