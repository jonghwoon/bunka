<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<body>	
	<p class="ex_menu">				<span class="glyphicon glyphicon-home"></span> &nbsp; Home</p>
	<p class="ex_menu" id="bu" >	<span class="glyphicon glyphicon-fire"></span> &nbsp; Special Exhibition</p>
	<p class="ex_menu" id="goho" >	<span class="glyphicon glyphicon-star"></span> &nbsp; Permanent Exhibition</p>
	<p class="ex_menu">				<span class="glyphicon glyphicon-user"></span> &nbsp; Artist</p>
	<p class="ex_menu">				<span class="glyphicon glyphicon-globe"></span> &nbsp; 시설 찾아보기 </p>
	<p class="ex_menu">				<span class="glyphicon glyphicon-thumbs-up"></span> &nbsp; 게시판</p>
	<p class="ex_menu">				<span class="glyphicon glyphicon-phone-alt"></span> &nbsp; 의견 보내기</p>	
</body>

<script>

	//메뉴 클릭시 목록 변환
	
	$(".ex_menu").click(function(){
		var id 	 = this.id;
		var url  = "";
		
		//debug 
			console.log(id);
		
		switch(id){
			case "bu" 	: url="exhibition_form.art"; break;
			case "goho"	: url="exhibition_goho.art"; break;
			
		}
		
		href(url);
		
		//$('document').load(url);
		
		/* 
		var id 	 = this.id;
		var num  = $(this).parent().attr("class");
		//debug 
			console.log(id);
		if(id=="bu" || id=="goho"){
			
			$("#box_menu").attr("class",id);
					
			//$("#box_menu").slideUp('fast');
						
			$("#box_menu").html(
				"<c:forEach begin='1' end='63' step='1' var='num'>"				
					+"<div class='box' id='${num}' '>"					
						+"<img id='box_img_${num}' name='${num}' src='/center/resources/art/images/ex/"+id+"/"+id+".jpg'>"
					+"</div>"
				+"</c:forEach>"
			);
			
			//$("#box_menu").slideDown('slow');
		}
		arraybox();
		 */
	});

</script>

<!-- 좌측 메뉴  -->
<style>

	 
	
	#menu_left{
		display  	: inline;
		position 	: fixed;	
		top 	: 40px;
		height	: 100%;
				
		width	: 240px;
		
		padding-top	: 20px;	
		position 	: fixed;
		display  	: inline;
		
		color : #fffff5;
		background-color :  #001c26;		

	} 
	
	#menu_left p{
		font-size 		: 1.1em;
		padding-left 	: 20px;
		
		padding-top		: 1em;
		padding-bottom	: 1em;
		
		transition: 0.3s;
	}
	
	#menu_left p:hover{	
		color : #001c26;
		background-color : #fffff5;
		text-decoration : none;
		font-weight: bold;
		cursor : pointer;
		
		/* 
		font-size 	: 1.7em;
		
		padding-top		: 0.9em;
		padding-bottom	: 0.9em;
		transition: 0.3s;
	 	*/
	}
	
</style>

</html>