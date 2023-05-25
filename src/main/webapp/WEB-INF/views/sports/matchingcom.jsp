<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>    
<html>
<style>
	#matchingComDiv table{
		margin : 20px;
		text-align:center;
		align:center;
		
	}	
	#matchingComDiv th{
		background-color : #001c26; 
		color : white;
		text-align: center;
		height: 40px;
	}
	
	#matchingComDiv td{
		height: 30px;
	}
</style>
<body>
<div id="matchingComDiv">
	<c:if test="${cnt ==0 }">
		<script type="text/javascript">
			alert("등록된 매칭이 없습니다.");
			popdown();
		</script>
	</c:if>
	
	<c:if test="${cnt !=0 }">

	<table id="matc">
		<tr>
			<th style="width:120px">구장</th>
			<th style="width:60px">1팀</th>
			<th></th>
			<th style="width:60px">2팀</th>
			<th style="width:50px">날짜</th>
			<th style="width:120px">시간</th>
			<th style="width:60px">매칭 취소</th>
		</tr>
		<c:set var="i" value="1" /> 
		<c:forEach var="mat" items="${dtos}">
			<c:set var="i" value="${i+1}"/>	
			<tr>
				<td>${mat.fieldname}</td>
				<td>${mat.team1}</td>
				<td> VS </td>
				<td>${mat.team2}</td>
				<td>${mat.day}일</td>
				<td>${mat.times}</td>
				<td>
					<form id="cancleinfo${i}">
						<input type="hidden" name="team1"	value="${mat.team1}">
						<input type="hidden" name="team2" 	value="${mat.team2}">
						<input type="hidden" name="day" 	value="${mat.day}">
						<input type="hidden" name="times"	value="${mat.times}">
					</form>
					<input type="button" value="매칭 취소" onclick="loadPage('cancleDiv','matchingcancle.sports','cancleinfo${i}')">
				</td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
</div>
<div id="cancleDiv"></div>
</body>
</html>