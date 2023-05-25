<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp" %> 
<%@ include file="../common/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<head>
<script src='/center/resources/sports//jquery.min.js'></script>
<script src="/center/resources/sports/tsort.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$('table.table').tableSort();
});

$(document).ready(function() {
  $(".search").keyup(function () {
	var searchTerm = $(".search").val();
	var listItem = $('.results tbody').children('tr');
	var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
	
  $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
		return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
	}
  });
	
  $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
	$(this).attr('visible','false');
  });

  $(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
	$(this).attr('visible','true');
  });

  var jobCount = $('.results tbody tr[visible="true"]').length;
	$('.counter').text(jobCount + ' item');

  if(jobCount == '0') {$('.no-result').show();}
	else {$('.no-result').hide();}
		  });
  });	

 
</script>
<style>
	body{
	  //padding:20px 20px;
	}

	.results tr[visible='false'],
	.no-result{
	  display:none;
	}

	.results tr[visible='true']{
	  display:table-row;
	}

	.counter{
	  padding:8px; 
	  color:#ccc;
	}
	
	
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
	</style>
</head>
<body>
<div class="form-group pull-right" style="margin-right: 20%;">
    <input type="text" class="search form-control" placeholder="테이블 조회">
</div>
<span class="counter pull-right"></span>

<table class="table table-hover table-bordered results" align="center" style="width: 70%;">
    <tr>
      <th class="col-md-2 col-xs-3">팀</th>
      <th class="col-md-2 col-xs-3">리더</th>
      <th class="col-md-2 col-xs-3">신고내용 </th>
      <th class="col-md-4 col-xs-4">최근 신고날짜</th>
     <!--  <th>신고횟수</th> -->
      <th>블랙리스트 관리</th>
    </tr>
<c:forEach var="dto" items="${dtos}">
<tr bgcolor=white>
	<td><form id="form_${dto.team}">
	<input type="hidden" name="team" value="${dto.team}">
	</form>${dto.team}</td>
	<td>${dto.leader}		</td>
	<td>${dto.content}		</td>
	<td>${dto.black_date}	</td> 
	<%-- <td>${dto.count}		</td> --%>
	<td>
		<input type="button" value="삭제" onclick="loadPage('blackadmin','blacklistdel.sports','form_${dto.team}')">
		<input type="button" value="블랙리스트 등록" onclick="loadPage('blackadmin', 'blacklistupdate.sports', 'form_${dto.team}');">
	</td>
</tr>
</c:forEach>
</table>
<div id="blackadmin" align="center">
	
</div>
</body>
</html>