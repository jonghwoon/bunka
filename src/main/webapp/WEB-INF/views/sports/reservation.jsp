<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp" %>
    
<html>
<style>	
	#reservationdata{ margin : 20px;}
	#reservationdata input[type='text']	 { width : 150px;}
	#reservationdata input[type='number']{ width : 150px;}
	.center {text-align: center; margin: auto;	}
	
	#reservationdata table{
		width 	: 400px;
		display	: inline;
	}
	
	#reservationdata td{
		width 	: 200px;
	}
	
	
</style>
<body>


<form id="reservationdata" class="center">
	<input type="hidden" name="fieldname"	value="${param.fieldname}">
	<input type="hidden" name="team" 		value="${dto.team}" >
	<input type="hidden" name="name" 		value="${dto.leader}">
	<input type="hidden" name="grade" 	value="${dto.grade}">
	
	<h2 class="center">
		구장 예약
	</h2>
	<br>
	<br>
	<input type="hidden" name="time" value="${param.time}">
	<table class="center">
		<tr>
			<td>구 장</td>
			<td><input type="text" value="${param.fieldname}"	disabled="disabled" ></td>
		</tr>
		<tr>
			<td>팀 명</td>
			<td><input type="text" value="${dto.team}" 			disabled="disabled" ></td>
		</tr>
		<tr>
			<td>이 름</td>
			<td><input type="text" value="${dto.leader}" 		disabled="disabled" ></td>
		</tr>
		<tr>
			<td>등 급</td>
			<td><input type="text" value="${dto.grade}" 		disabled="disabled"></td>
		</tr>
		<tr>
			<td>인 원</td>
			<td><input type="number" name="lineup" min="13" max="30" value="13"></td>
		</tr>

		<tr>	
			<td colspan="2">
				<br>
				매칭을 사용하려면 체크 <input type="checkbox" name="matching">
			</td>
		</tr>
		<tr>
			<td colspan="2">	<br><br>
			<p class="center">
			<input type="button" value="신청" onclick="loadPage('resProHidden','reservationPro.sports','reservationdata')">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="취소">
			</p>
			</td>
		</tr>
		
	</table>
</form>
<div id="resProHidden"></div>
</body>
</html>