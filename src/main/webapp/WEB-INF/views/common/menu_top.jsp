<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<%
	// 현재 Url 종류 반환하여 상단 바의 컬러를 변환한다.
		String referer = request.getHeader("REFERER");
		String[] refArray = referer.split("[.]");
		String pageNow = refArray[refArray.length-1];
		// log 
			//System.out.println("referer " + referer );
			//System.out.println(refArray.length);		
			//System.out.println("refArray " + refArray[refArray.length-1] );
			
		// 현재 페이지에 따라 색상을 결정.
		String keyColor="";
		switch(pageNow){
			case "circle" 	:keyColor="#72bbff"; break;
			case "item" 	:keyColor="#c83f42"; break;
			case "camp" 	:keyColor="#5937d3"; break;
			case "art" 		:keyColor="#001c26"; break;
			case "sports" 	:keyColor="#83d35a"; break;
			default 		:keyColor="#3b2c4a"; break;
		}
%>

<html>

<body>
<div id='menu_top' >	
	<div id='menu_top_left'>
		<ul>
			<!-- admin 일경우 추가 -->			
			<c:choose>
				<c:when test="${sessionScope.grade=='9999'}">	<li onclick="href('admin_member_form.common')">	관리페이지 	</li>	</c:when>	
				<c:when test="${sessionScope.grade=='5000'}">	<li onclick="href('admin_member_form.circle')">	관리페이지 	</li>	</c:when>
				<c:when test="${sessionScope.grade=='4000'}">	<li onclick="href('admin_main_form.camp')">		관리페이지 	</li>	</c:when>
				<c:when test="${sessionScope.grade=='3000'}">	<li onclick="href('admin_main_form.item')">		관리페이지 	</li>	</c:when>
				<c:when test="${sessionScope.grade=='2000'}">	<li onclick="href('admin_main_form.art')">		관리페이지 	</li>	</c:when>
				<c:when test="${sessionScope.grade=='1000'}">	<li onclick="href('admin_main_form.sports')">	관리페이지 	</li>	</c:when>
			</c:choose>				
						
			<!-- 메뉴 로드 -->
	 		<li onclick="href('main.common')">	메인 	</li>
			<li onclick="href('main.item')">	도서관 	</li>
			<li onclick="href('main.circle')">	동아리 	</li>
			<li onclick="href('main.art')">		전시 	</li>
			<li onclick="href('main.camp')">	시설대관</li>
			<li onclick="href('main.sports')">	체육시설</li>
		</ul>		
	</div>

	<c:if test="${sessionScope.id==null}">
		<!-- 메뉴 프린트 -->
		<div id='menu_top_right'>
			<form id="login" method="post" onsubmit ="login(); return false" >
				ID&nbsp;<input type="text" 		name ="id" 		value="" autofocus="autofocus">&nbsp;
				PW&nbsp;<input type="password" 	name ="passwd" 	value="" >&nbsp;
				  &nbsp;<input type="submit" 	value="로그인">
				  &nbsp;<input type="button" 	value="회원가입" onclick="popup('guest_member_addForm.common',500,650);">
			</form>	
		</div>						
	</c:if>
	
	<c:if test="${sessionScope.id!=null}">
		<div id='menu_top_right'>			
			'${sessionScope.name}' 님 환영합니다. &nbsp;
									
			<input type="button" value="회원정보" onclick="popup('guest_info_form.common',650,550,'infoForm');"> 	<!-- popup(page,width,height,form) -->
			&nbsp;
			<input type="button" value="로그아웃" onclick="logout();">	
			
			<!-- 자료 전송을 위한 폼 -->
			<form id="logout">	<input type="hidden" name="logout" value="0"></form>
			<form id="infoForm"><input type="hidden" name="id" value="${sessionScope.id}"></form>
			<!-- 전송 폼 끝 -->
									
		</div>
	</c:if>

	<c:if test="${idCnt==0}">	
		<script>
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		</script>
	</c:if>		
</div>
</body>
</html>

<script>
//색상 변경
$("#menu_top").css("background-color",'<%=keyColor%>');

function login(){
	var id 		= document.getElementsByName("id")[0];
	var psswd	= document.getElementsByName("passwd")[0];
	
	console.log("id:"+id);
	console.log("psswd:"+psswd);
	
	if(id.value ==""){
		alert("아이디를 입력해 주십시오.");
		id.focus();
		return;
	}
	
	if(psswd.value ==""){		
		alert("비밀번호를 입력해 주십시오.");
		psswd.focus();
		return;
	}
	
	loadPage('menu_load','menu_top.common','login','sync');
	location.reload();
}

function logout(){
	// 세션만료를 위한 데이터 전송
	loadPage('menu_load','menu_top.common','logout','sync');
	
	// 만약 grade ==1 이 아니라면 메인으로 돌아간다. 가 맞을것 같군.. 아니면...
	// 다른 로그인 서비스도 필요하니 메인으로 가는게 나을것 같군... 
	
	//location.reload();
	href('main.common');
}
</script>

<style>	

	body{
		margin 	: 0px;
		padding : 0px;
	}
	
	#menu_top{				
		position :  relative;
		z-index : 100;
										
		height : 40px;
		line-height: 40px;		
		width	: 100%;		
		vertical-align: middle;
		/*  		
		background-color : #3b2c4a;
		 */		
	}
	
	#menu_top_left{		
		display : inline;
		position: absolute;
		left : 20px;			
	}
		
	#menu_top_left ul{		
		margin 	: 0px;
		padding : 0px;		
	}
		
	#menu_top_left li{	
		cursor : pointer;			
		font-size : 15px;	
		display: inline;
		padding-right: 5px;
		
		margin-right :  5px;
		color : #fffff5;
		text-decoration: none;	
	}
			
	#menu_top_right{
		color : #fffff5;
		
		display : inline; 
		position : absolute;
				
		height 		: 40px;
		
		right : 20px;
		top   :  0px;
		font-size : 15px;	
		display: inline;
	}
	
	
	#menu_top_right input{
		line-height: 0px;
				
		height : 20px;
		color  : #3b2c4a;
		
		border-radius : 2px;		
		border : 0px;
		margin : 0px;
		padding: 0px;
	}
	
	#menu_top_right input[type='text'],
	#menu_top_right input[type='password']{		
		width  : 90px;
		border : 2px #fffff5 solid;
	}
	 
	#menu_top_right input[type='submit'],
	#menu_top_right input[type='button']{	
		vertical-align : middle;
						
		margin: 0px;
		padding: 0px;
						
		width  : 60px;
		font-size : 12px;
		background-color  : #80d4f6;		
	}		
		
</style>