<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting_circle.jsp" %>
<%@ include file="../common/setting.jsp"%>
<html>
 <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
		<c:if test="${cnt != 0}">
	 	<form action="qboardModiPro.circle">
        <div class="container">
            <hr>
                <table class="table table-condensed">
                <c:forEach var="dtos" items="${dtos}">
                  <thead>
                  	<input type="hidden" name="num" value="${dtos.num}">
                  	  <tr>
                          <th width="10%">글번호</th>
                          <td>${dtos.num}</td>
                      </tr>
                      <tr align="center">
                          <th width="10%">제목</th>
                          <td width="100px"><input type="text" class="form-control col-lg-2" name="subject" value="${dtos.subject}" data-rule-required="true" maxlength="10" required="required" autofocus="autofocus"></th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td>작성일</td>
                          <td>${dtos.adddate}</td>
                      </tr>
                      <tr>
                          <td>글쓴이</td>
                          <td>${dtos.writer}</td>
                          <!-- 글쓴이와 아이디가 같을때 조회수 증가X -->
                          <c:if test="${sessionScope.id == id}"> 
                          <span style='float:right'>조회 : ${dtos.readCnt}</span>
                          </c:if>
                           <!-- 글쓴이와 아이디가 같지않을때 조회수 증가+1 -->
                          <c:if test="${sessionScope.id != id}">
                          <span style='float:right'>조회 : ${dtos.readCnt+1}</span>
                          </c:if>
                      </tr>
                      </tbody>
                      <table>
                      <tr>
                          <th><textarea rows="10" cols="125" name="contents">${dtos.contents}</textarea></td>
                      </tr>
                      </table>
                     </c:forEach>
              	</table>
              	<br><br>
              	<div align="center">
                 <table id="commentTable" class="table table-condensed">
	 				<input type="submit" id="modi" class="btn btn-default" value="수정">
	 				<input type="reset" id="reset" class="btn btn-default" value="다시작성">
	 			</table>
	 			</div>
	 		</div>
	 	</form>
	 	</c:if>
	 	<c:if test="${cnt == 0}">
	 	<script type="text/javascript">
	 		alert("비밀번호가 맞지 않습니다.");
	 		window.location='qviewContents.circle?num=${param.num}&subject=${param.subject}&contents=${param.contents}&writer=${param.writer}&readCnt=${param.readCnt}&adddate=${param.adddate}';
	 	</script>
	 	</c:if>
</body>
</html>