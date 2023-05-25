<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">

@charset "utf-8";

#team {
    background: #9cbc2c;
    /* 
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	-khtml-border-radius: 5px;
	border-radius: 5px;
	 */
	counter-reset: fieldsets;
	padding: 10px;
	width: 400px;	
}

		
#team fieldset {
	border: none;
	
	margin-bottom: 10px;
	
}
		
#team fieldset:last-of-type {
	margin-bottom: 0;
}
			
#team legend {
	color: #384313;
	font-size: 16px;
	font-weight: bold;
	padding-bottom: 10px;
	text-shadow: 0 1px 1px #c0d576;
}
				
#team > fieldset > legend:before {
	content: "Step " counter(fieldsets) ": ";
	counter-increment: fieldsets;
}
				
#team fieldset fieldset legend {
	color: #111111;
	font-size: 13px;
	font-weight: normal;
	padding-bottom: 0;
}
			
#team ol li {
	background: #b9cf6a;
	background: rgba(255,255,255,.3);
	border-color: #e3ebc3;
	border-color: rgba(255,255,255,.6);
	border-style: solid;
	border-width: 2px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	-khtml-border-radius: 5px;
	border-radius: 5px;
	line-height: 30px;
	list-style: none;
	padding: 5px 10px;
	margin-bottom: 2px;
}
							
#team ol ol li {
	background: none;
	border: none;
	float: left;
}
			
#team label {
	float: left;
	font-size: 13px;
	width: 110px;
}
				
#team fieldset fieldset label {
	background:none no-repeat left 50%;
	line-height: 20px;
	
	padding: 0 0 0 30px;
	
	width: auto;
}
					
					
#team fieldset fieldset label:hover {
	cursor: pointer;
}
				
#team input:not([type=radio]) {
	background: #ffffff;
	border: none;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	-khtml-border-radius: 3px;
	border-radius: 3px;
	font: italic 13px 맑은고딕,굴림,돋움;
	outline: none;
	padding: 5px;
	width: 150px;
}
					
#team input:not([type=submit]):focus, {
	background: #eaeaea;
}
					
				
#team button {
	background: #384313;
	border: none;
	-moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	-khtml-border-radius: 20px;
	border-radius: 20px;
	color: #ffffff;
	display: block;
	font: 16px 맑은고딕,굴림,돋움;
	letter-spacing: 1px;
	margin: auto;
	padding: 7px 25px;
	text-shadow: 0 1px 1px #000000;
	text-trans#team: uppercase;
}
					
#team button:hover {
	background: #1e2506;
	cursor: pointer;
}

</style>
<title>회원 가입</title>
</head>
<script type="text/javascript">

function newteamPro(){
		console.log("뭐 징?");
	if(document.getElementsByName("PR")[0].value==null){
		console.log("뭐5145?");
		document.getElementsByName("PR")[0].focus();
		return false;
	}
	console.log("뭐 징?112");
	loadPage('hidden', 'newteamPro.sports', 'team');
	console.log("뭐 징119?");
	//alert("팀이 생성되었습니다. 선수등록을 해주x세요");
	//popup('playeradd.sports',500,700,'team');
}

</script>

<body>
<div id="hidden"></div>
	
<form id="team">
		<fieldset>
			<legend>새 팀 생성</legend>
			<ol>
				<li><label for="userid">아이디</label> <input id="userid"	name="userid" type="text" value="${dto.id}" readonly></li>
				<li><label pwd="leader">리더 명</label> <input id="leader" name="leader" type="text" value="${dto.name}" readonly></li>
				<li><label pwd="team">팀 명</label><input id="team" name="team" type="text" required autofocus></li>				
				<li><label pwd="lineup">팀 인원</label> <input id="lineup" name="lineup" type="number" required min="13" max="200" value="13"></li>	
				<li><label pwd="place">활동 지역</label> <input id="place" name="place" type="text" required></li>
				<li><label pwd="PR">간단한 팀 소개</label>
					<textarea name="PR" cols="35" row="5" required></textarea>
				</li>	
			</ol>
		</fieldset>
		
		<fieldset>
			<legend>팀 등급(상,중,하)</legend>
			<ol><li><input id="skill" name="skill" type="range" min="1" max="3" step="1"></li></ol>
		</fieldset>
		
		<fieldset>
			<button type="button" onclick="newteamPro();">등록</button>
		</fieldset>
		
	</form>
</body>
</html>
