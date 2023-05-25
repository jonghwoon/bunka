<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="sports_setting.jsp" %> 
 <%@ include file="../common/setting.jsp" %>
<html>
<body>
	<c:if test="${cnt ==0}">
		<script type="text/javascript">
			alert("팀 등록후 이용해 주세요");
			popup('newteam.sports', 400, 595);
		</script>
	</c:if>
	
	<c:if test="${cnt ==1 }">
			<form id="teamchk">
				<input type="hidden" name="team" value="${ply.team}">
			</form>
			<form id="gradechk">
				<input type="hidden" name="gradechk" value="${team.grade}">
				<input type="hidden" name="team" value="${ply.team}"> 
			</form>
		<form id="${dto.fieldname}">
			<input type="hidden" name="fieldname" value="${dto.fieldname}">
			
			<div id="list_ground">
				<h3>${dto.fieldname}</h3>
				<br>
				<img src="${sports}image/${dto.idx}1.jpg" style="width:300px; height: 150px">
				<img src="${sports}image/${dto.idx}2.jpg" style="width:300px; height: 150px">
				<img src="${sports}image/${dto.idx}3.jpg" style="width:300px; height: 150px">
				
				<p>
					<br>
					${dto.pr}
					 
					<br><br>
					<b><h4>잔디 상태 : ${dto.ground}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  크기 : ${dto.fsize} </h4></b> 
				</p>
				<table border="1" width="910px" height="200px">
					<tr>
						<th>사용구분</th>
						<th>평일</th>
						<th>토&일&공휴일</th>
						<th>비고</th>
					</tr>
					<tr>
						<td>주간</td>
						<td>${dto.amprice}</td>
						<td>${dto.weamprice}</td>
						<td rowspan="2">
							-1회대관 2시간기준<br>
							-조명사용료 별도(43,000)<br>
							-전광판 사용료(전기료포함) 별도<br>
						</td>
					</tr>
					<tr>
						<td>야간</td>
						<td>${dto.pmprice}</td>
						<td>${dto.wepmprice}</td>
					</tr>
				</table>
				<br><br>
				
				<!-- <input class="btn btn-primary btn-lg" type="button" value="예약 현황보기" onclick="loadpage('window.open('calendar.sports','calendar','width=700, height=700')','calendar.sports');"> -->
				<!-- popup(page,width,height,form) -->
				
				<table width="910px" >
					<tr>
						<td align="center">
						
						<input class="btn btn-primary btn-lg" type="button" value="예약 현황보기" onclick="popup('calendar.sports',1200,730,'${dto.fieldname}')">
						<input class="btn btn-primary btn-lg" type="button" value="예약 확인" onclick="popup('reservationchk.sports', 630, 300, 'teamchk')">
						<input class="btn btn-primary btn-lg" type="button" value="매칭" onclick="popup('matchinglist.sports', 630, 300, 'gradechk')"> 
						<input class="btn btn-primary btn-lg" type="button" value="매칭 확인" onclick="popup('matchingcom.sports', 630, 300)">
			
						</td>
					</tr>
				</table>
	      </div>
		</form>
	</c:if>
	
</body>
</html>