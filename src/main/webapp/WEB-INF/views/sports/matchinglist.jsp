<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>    
<html>
<head>
<style>
	#matchingDiv table{
		margin : 20px;
		text-align:center;
		align:center;
		
	}	
	#matchingDiv th{
		background-color : #001c26; 
		color : white;
		text-align: center;
		height: 40px;
	}
	
	#matchingDiv td{
		height: 30px;
	}
</style>
</head>
<body>
<div id="matchingDiv">
	<h2 align="center">매칭 정보</h2>
	<br>
	
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
		alert("등록된 매칭 상대가 없습니다.");
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
			<c:forEach var="mat" items="${dtos}">
				
				<tr>
					<td>${mat.fieldname}</td>
					<td>${mat.team}</td>
					<td>${mat.name}</td>
					<td>${mat.grade}</td>
					<td>${mat.lineup}</td>
					<td><form id="a${mat.time.replace('.','')}">
						<input type="hidden" name="time" value="${mat.time}">
						<input type="hidden" name="fieldname" value="${mat.fieldname}">
						<input type="hidden" name="team" value="${mat.team}">						
						${times[count]}
						</form>
					</td>
					<td>
						<input type="button" name="matchingask" value="매칭 신청" onclick="loadPage('matchinginser' ,'matchingask.sports', 'a${mat.time.replace('.','')}')">
					</td>
				</tr>
				<c:set var="count" value="${count+1}" />	
			</c:forEach>
		
		
		</table>
	</c:if>
	<div id="matchinginser"></div>
</div>
</body>
</html>