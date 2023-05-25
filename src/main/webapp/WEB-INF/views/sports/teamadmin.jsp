<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>    
<html>

<body>
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("권한이 없습니다.");
			loadPage('soccer_view','teamlist.sports');
		</script>
	</c:if>
	
	<c:if test="${cnt == 1}">
		<div class="container-fluid">
		    <div class="row">
		      <div class="col-md-12">
	        	<center><h1>팀 관리</h1></center>
		        <div class="row">
		          <div class="col-md-6">
		            	<center>가입 요청</center>
		            	<table>
		            		<tr>
		            			<th style="width:70px;">아이디</th>
		            			<th style="width:70px;">이름</th>
		            			<th style="width:70px;">직책</th>
		            			<th style="width:70px;">나이</th>
		            			<th style="width:70px;">포지션</th>
		            			<th style="width:70px;">실력</th>
		            			<th style="width:70px;">관리</th>
		            		</tr>
		            		
		            		<c:forEach var="ask" items="${ask}">
		            			<tr>
		            				<td><form id="a${ask.id}">
		            				<input type="hidden" name="id" value="${ask.id}"> 
		            				<input type="hidden" name="name" value="${ask.name}">
		            				${ask.id}</form></td>
		            				<td>${ask.name}</td>
		            				<td>${ask.grade}</td>
		            				<td>${ask.age}</td>
		            				<td>${ask.position}</td>
		            				<td>${ask.ability}</td>
		            				<td><input type="button" name="ask" value="가입 승인" onclick="loadPage('hidden','askok.sports','a${ask.id}')"></td>
		            			</tr>
		            		</c:forEach>
		            		
		            		
		            	</table>
		          </div>
		          <div class="col-md-6">
	            	<center>소속팀원</center>
		            	<table>
		            		<tr>
		            			<th style="width:70px;">아이디</th>
		            			<th style="width:70px;">이름</th>
		            			<th style="width:70px;">직책</th>
		            			<th style="width:70px;">나이</th>
		            			<th style="width:70px;">포지션</th>
		            			<th style="width:70px;">실력</th>
		            			<th style="width:70px;">관리</th>
		            		</tr>
		            		<c:forEach var="ply" items="${play}">
		            			<tr>
		            				<td><form id="a${ply.id}">
		            				<input type="hidden" name="delid" value="${ply.id}"> 
		            				<input type="hidden" name="name" value="${ply.name}">
		            				${ply.id}</form></td>
		            				<td>${ply.name}</td>
		            				<td>${ply.grade}</td>
		            				<td>${ply.age}</td>
		            				<td>${ply.position}</td>
		            				<td>${ply.ability}</td>
		            				<c:if test="${ply.grade == '리더'}">
		            				<td>${ply.grade}</td>
		            				</c:if>
		            				<c:if test="${ply.grade != '리더'}">
		            				<td><input type="button" name="ask" value="선수 제명" onclick="loadPage('hidden','playerdelete.sports','a${ply.id}')"></td>
		            				</c:if>
		            			</tr>
		            		</c:forEach>
		            		
		            	</table>
		            	
		        	  </div>
		       		 </div>
		     	 </div>
		     	 <div id="hidden">
		     	 
		     	 </div>
		    </div>
		</div>
	</c:if>
</body>
</html>