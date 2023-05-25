<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>    
<html>
<head>
<style>
	#reservDiv table{
		margin : 20px;
		text-align:center;
		align:center;
		
	}	
	#reservDiv th{
		background-color : #001c26; 
		color : white;
		text-align: center;
		height: 40px;
	}
	
	#reservDiv td{
		height: 30px;
	}
</style>
</head>
<body>
<div id="reservDiv">
	<h2 align="center">예약 확인</h2>
	<br>
	
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
		alert("예약된 시간이 없습니다.");
		popdown();
		</script>
	</c:if>
	
	<c:if test="${cnt == 0}">
		<table border="1">
			<tr>
				<th style="width:120px">구장</th>
				<th style="width:90px">팀명</th>
				<th style="width:60px">리더 명</th>
				<th style="width:60px">팀 등급</th>
				<th style="width:40px">인원</th>
				<th style="width:120px">시간</th>
				<th style="width:90px">변경</th>
			</tr>
			<c:set var="count" value="0" />
			<c:forEach var="res" items="${dto}">
				
				<tr>
					<td>${res.fieldname}</td>
					<td>${res.team}</td>
					<td>${res.name}</td>
					<td>${res.grade}</td>
					<td>${res.lineup}</td>
					<td><form id="a${res.time.replace('.','')}">
						<input type="hidden" name="time" value="${res.time}">
						<input type="hidden" name="fieldname" value="${res.fieldname}">
						<input type="hidden" name="team" value="${res.team}">
						<%-- <%= ((String[])request.getAttribute("times"))[0] %> --%>
						${times[count]}
						</form>
					</td>
					<td>
						<input type="button" name="rescancle" value="예약 취소" onclick="loadPage('result', 'rescancle.sports', 'a${res.time.replace('.','')}')">
					</td>
				</tr>
				<c:set var="count" value="${count+1}" />	
			</c:forEach>
		
		
		</table>
	</c:if>
</div>
</body>
</html>