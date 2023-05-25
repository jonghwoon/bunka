<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<body>
<script>

</script>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" >스포츠</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li > <a class="menu" onclick="load('soccerview.sports');">메뉴</a></li>
				<li > <a class="menu" onclick="load('placelist.sports');">시설 보기</a></li>
				<li > <a class="menu" onclick="load('teamlist.sports');"> 팀 정보</a></li>
				<li > <a class="menu" onclick="load('blacklist.sports');">블랙리스트 보기</a></li>
											
				<c:if test="${sessionScope.grade >= 1000}">					
					<li > <a class="menu" onclick="load('blacklistadmin.sports');">블랙리스트 관리</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
</body>
<style>
	form {	margin : 0px; auto;	}
	.navbar-brand{
		cursor: default;
	}
</style>
<script>
	function load(page){
		href('soccer_empty.sports?menu='+page);		
	};
</script>
</html>