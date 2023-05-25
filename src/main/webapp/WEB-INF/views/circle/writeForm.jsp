<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting_circle.jsp" %>
<%@ include file="../common/setting.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	 	<form action="writePro.circle">
        <div class="container">
            <hr>
            	<input type="hidden" name="num" value="${dtos.num}">
               	<input type="hidden" name="writer" value="${sessionScope.id}">
                <table class="table table-condensed">
                  <thead>
                  	
                      <tr align="center">
                          <th width="10%">제목</th>
                          <td width="100px"><input type="text" class="form-control col-lg-2" name="subject" data-rule-required="true" maxlength="20" required="required" autofocus="autofocus"></td>
                      </tr>
                      <tr align="center">
                          <th width="10%">비밀번호</th>
                          <td width="100px"><input type="password" class="form-control col-lg-2" name="passwd" data-rule-required="true" maxlength="20" required="required" autofocus="autofocus"></td>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td>작성자</td>
                          <td>${sessionScope.id}</td>
                      </tr>
                      </tbody>
                      <table>
                      <tr>
                          <th><textarea rows="10" cols="125" name="contents"></textarea></th>
                      </tr>
                      </table>
              	</table>
              	<br><br>
              	<div align="center">
                 <table id="commentTable" class="table table-condensed">
	 				<input type="submit" id="write" class="btn btn-default" value="확인">
	 				<input type="reset" id="reset" class="btn btn-default" value="취소">
	 			</table>
	 			</div>
	 		</div>
	 	</form>
	
</body>
</html>