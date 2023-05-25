<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@ include file="setting_circle.jsp" %>
<%@ include file="../common/setting.jsp"%>

<html>
<style>
.search .form-section {
	background:rgba(0,0,0,0.1);
	border-radius: 5px;
	padding: 10px;
	padding-bottom: -5px;
}
.form-control .form-group. .input-group{
	border-radius: 5px;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body onload="loadPage('menu_load','menu_top.common'); loadPage('searchdata','searchResult.circle','search');">
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
	&nbsp;&nbsp;&nbsp;
    <div class="search">
        <div class="container" align="center">
          <div class="row">
            <div class="col-md-10 col-md-offset-1">
              <div class="form-section" style="width:100%;">
                <div class="row" align="center" style="width:130%;">
                    <form id="search" role="form">
                    <div class="col-md-2">
                        <div class="form-group">
                          <label class="sr-only" for="circlenum">동아리 번호</label>
                          <div class="input-group">
                            <input type="text" id="circlenum" name="circlenum" class="form-control" placeholder="동아리 번호">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-2">
                        <div class="form-group">
                          <label class="sr-only" for="location">지역</label>
                          <select id="location" name="location" class="form-control">
                         	  <option value="">지역별</option>
                              <option value="서울">서울</option>
                              <option value="경기">경기</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-md-2">
                        <div class="form-group">
                          <label class="sr-only" for="name">name</label>
                          <div class="input-group">
                            <input type="text" id="name" name="name" class="form-control" placeholder="동아리 이름">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-2">
                        <div class="form-group">
                          <label class="sr-only" for="category">카테고리</label>
                          <select id="guest" name="category" class="form-control">
                          	  <option value="">카테고리별</option>
                              <option value="취미">취미</option>
                              <option value="봉사">봉사</option>
                              <option value="종교">종교</option>
                              <option value="문화">문화</option>
                              <option value="운동">운동</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-md-2" style="margin-right: 100px;">
                        <input type="button" class="btn btn-default btn-primary" value="검색" onclick="loadPage('searchdata','searchResult.circle','search');">
                      </div>
                    </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div id="searchdata">
        	
        </div>
      </div>
</body>
</html>