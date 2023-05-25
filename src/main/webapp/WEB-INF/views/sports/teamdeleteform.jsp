<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp"%>	
<html>
<head>
<style type="text/css">
	@charset "utf-8";




#team {
    background: #9cbc2c;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	-khtml-border-radius: 5px;
	border-radius: 5px;
	counter-reset: fieldsets;
	padding: 20px;
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
	width: 200px;
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
ol li input{
	color:black;
}
</style>
<title>회원 가입</title>
<script type="text/javascript">
	
</script>

</head>

<body>
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("권한이 없습니다.");
		</script>
	</c:if> 
	
	<c:if test="${cnt == 1}">
	<form id="team" action="teamdelete.sports">
		<fieldset>
			<legend>팀 삭제</legend>
			<ol>
				<li><label for="team">팀명</label> <input 
					name="team" type="text" value="${dto.team}" required readonly></li>	
				<li><label for="id">아이디</label> <input 
					name="id" type="text" value="${dto.id}" required readonly></li>
				<li><label pwd="passwd">비밀번호 확인</label> <input id="passwd"
					name="passwd" type="password" required autofocus></li>
			</ol>
		</fieldset>
		<fieldset>
			<button type="submit">삭제</button>
		</fieldset>
	</form>
	</c:if>
</body>
</html>
