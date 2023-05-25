<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="setting_circle.jsp" %>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
</head>
<body onload="loadPage('menu_load','menu_top.common');">		
	<div id='menu_load'></div>
	<nav class="navbar navbar-default sidebar" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
        <span class="sr-only"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>      
    </div>
    <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="main.circle">동아리 메인<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">게시판 <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a>
          <ul class="dropdown-menu forAnimate" role="menu">
            <li><a href="qboard.circle">Q&A</a></li>
            <li><a href="board.circle">동아리 신청게시판</a></li>
          </ul>
        </li>          
        <li><a href="search.circle">동아리 검색<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-search"></span></a></li>
        <li><a href="rounge.circle">동아리 장소 추천<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-globe"></span></a></li>        
      </ul>
    </div>
  </div>
</nav>
	<div style="margin-left: 30%; margin-right: 30%;">
	<table class="table table-hover">
		<thead>
			<tr>
				<th width="5%">번호   </th>
				<th width="10%">제목</th>
				<th width="15%">내용</th>
				<th width="10%">작성자</th>
				<th width="5%">조회</th>	
				<th width="20%">작성일</th>										
			</tr>
		</thead>

	<tbody>
	<c:forEach items="${qdtos}" var="qboard">
     <tr class="light">
		    <td align="center">${qboard.num}</td>
		    <c:if test="${sessionScope.id == qboard.writer}">   
		    <td><a href = "qviewContents.circle?num=${qboard.num}&subject=${qboard.subject}&contents=${qboard.contents}&writer=${qboard.writer}&readCnt=${qboard.readCnt}&adddate=${qboard.adddate}">${qboard.subject}</a></td>
		    </c:if>
		    <c:if test="${sessionScope.id != qboard.writer}">   
		    <td><a href = "qviewContents.circle?num=${qboard.num}&subject=${qboard.subject}&contents=${qboard.contents}&writer=${qboard.writer}&readCnt=${qboard.readCnt+1}&adddate=${qboard.adddate}">${qboard.subject}</a></td>
		    </c:if>
		  	<td>${qboard.contents}</td>
		  	<td align="left" width="100px">${qboard.writer}</td>
		<!--   댓글 갯수 있다면 보여주기 -->
		    <c:if test="${qboard.recount != 0}">
		   	 <a id="board_comments">[${qboard.recount}]</a>
		    </c:if>
		    <td align="left">${qboard.readCnt}</td>
		    <td align="left" width="10%">${qboard.adddate}</td>
      </tr>
	 </c:forEach>
<!--   테이블 풋(글쓰기 버튼) -->
    </tbody>
	</table>
		<c:if test="${sessionScope.id != null}">
		<div align="right" style="margin-right: 30px">
			   <a href="qwriteForm.circle"><button type="button" id="writeform" class="btn btn-default">글 쓰기</button></a>
		</div>
		</c:if>
	</div>
	 <div id="footer">Copyright &copy; Your Company 2017. All Rights Reserved
    <h5>저작권은 KOSMO 25기 4팀에게 있습니다.</h5>
    </div>
</body>
</html>