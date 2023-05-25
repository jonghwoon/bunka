<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp" %>   
<%@ include file="../common/setting.jsp"%> 
<html>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
    function loadground(div,urls,datas,form){
        	
        $.ajax({
            data :{name : datas}
            ,type : 'post'
            ,url  : urls
            ,success: function(response) {				
                $("#"+div).html(response);
            }
        });
    }
</script>
<style>
		
	#teamlist_Table{
		width: 800px;	
	}
	
	#result table,tr,td,th{
		border:1px solid black;
		border-collapse: collapse;
		text-align: center;
	}
	
	#result table th{
	 	height : 40px;
		background-color: #001c26;
		text-align: center;
		color: white;
	}
	#result td{			
		height : 30px;
	}
	
	#ground:hover{
		 background-color: #83d35a;
		 color:white;
		 cursor:pointer;
	}
	#product:hover{
		text-decoration:none;			
		cursor:pointer;
	}
	.heading{
		color:white;
	}
	
	#result a{
		display:inline;
		text-decoration:none;
		
	}
	#menu_sub li{	
		font-size: 15px;
	}	
</style>
<body>
	
	<div class="container-fluid">
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	      <h4>팀 정보</h4>
	      <br>
	      <ul class="nav nav-pills nav-stacked" id="menu_sub">
	      	<li class="active"  onclick="load('teamlist.sports');">					<p id="ground">팀 리스트</p></li>
	        <li class="active"  onclick="popup('newteam.sports', 400, 595);">		<p id="ground">새 팀등록</p></li>
	        <li class="active"  onclick="loadPage('result','teamadmin.sports');">	<p id="ground">팀 관리</p></li>
	        <li class="active"  onclick="popup('teamdeleteform.sports', 400, 375);"><p id="ground">팀 삭제</p></li>
	        
		  </ul><br>
	    </div>
	
	    <div class="col-sm-8">
	      <div id="result" align="center">
	       		<h2 align="center"> 팀 리스트 </h2>
	       		<br>
		      	<table id="teamlist_Table">
		      		<tr>
		      			<th style="width:120px;">팀명</th>
		      			<th style="width:80px;">리더</th>
		      			<th>팀 소개</th>
		      			<th style="width:100px;">활동 지역</th>	
		      			<th style="width:60px;">인원</th>
		      		</tr>
		      		<c:forEach var="team" items="${dto}">
		      		
		      			<tr>
		      	 	  		<td>${team.team}</td>
				      		<td>${team.leader}</td>
				      		<td>
				      			<form id="teaminfo${team.team}">
				      				<a id="product" onclick="loadPage('result','playerinfo.sports','teaminfo${team.team}')">${team.PR} </a> <input type="hidden" name="team" value="${team.team}">
				      			</form>
				      		</td>
				      		<td>${team.place}</td>
				      		<td>${team.lineup}</td>
				   		</tr>	
		      		</c:forEach>
		      	</table>
		    
		 </div>
	    </div>
	    
	    <div class="col-sm-2">	</div>
	    
	  </div>
	</div>


</body>

</html>