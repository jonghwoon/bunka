<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="setting_circle.jsp"%>
<style>
*{
  margin:0;
  padding:0;
  box-sizing: border-box;
  font-family: 'Open Sans', sans-serif;
}

.container{
  padding: 2rem;
}
.gallery{
  width: 100%;
  max-width: 2000px;
  min-height: 100vh;
  margin: 2rem auto;
  
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  
  -webkit-flex-wrap: wrap;
      -ms-flex-wrap: wrap;
          flex-wrap: wrap;
  
  -webkit-box-pack: center;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.gallery-item{
  box-shadow: 2px 2px 8px -1px #3498DB;
  width: 300px;
  height: 300px;
  margin: 10px;
  background: #000;
  position: relative;
  overflow: hidden;
}

.gallery-item-image{
  position: absolute;
  width: 100%;
  height: 100%;
  background: lightblue;
  z-index:20;
  -webkit-transition:all .5s ease;
  transition: all .5s ease;
  bottom:0;
  overflow: hidden;
}

.gallery-item:hover .gallery-item-image{
  bottom: 150px;
}

.gallery-item-description{
  color:white;
  font-size: .8rem;
  width: 100%;
  height: 150px;
  padding: .7rem .10rem;
  background: #3498DB;
  position: absolute;
  bottom:0;
}

.search .form-section {
	background:rgba(0,0,0,0.1);
	border-radius: 5px;
	padding: 10px;
	padding-bottom: -5px;
}

.form-control .form-group. .input-group{
	border-radius: 5px;
}

.jumbotron { 
  background-image: url("${circle}image/장소100.jpg");
  background-size: 100%;
  background-repeat: no-repeat;
  text-shadow: black 0.2em 0.2em 0.2em;
  color:white;
}
</style>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title></title>
<title>Insert title here</title>
</head>
<body onload="loadPage('menu_load','menu_top.common'); loadPage('searchrounge','searchrounge.circle','search');">
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
<div class="container">
<div class="jumbotron">
<h1 class="text-center">동아리 모임장소를 소개합니다.</h1>
</div>
<div class="search">
        <div class="container" align="center">
          <div class="row">
            <div class="col-md-10 col-md-offset-1">
              <div class="form-section" style="width:100%;">
                <div class="row" align="center" style="width:130%;">
                    <form id="search" role="form">
                    <div class="col-md-2">
                        <div class="form-group">
                          <label class="sr-only" for="num">장소번호</label>
                          <div class="input-group">
                            <input type="text" id="num" name="num" class="form-control" placeholder="장소번호">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-2">
                        <div class="form-group">
                          <label class="sr-only" for="location">지역별</label>
                          <select id="location" name="location" class="form-control">
                         	  <option value="">지역별</option>
                              <option value="신촌역">신촌역</option>
                              <option value="가산디지털단지역">가산디지털단지역</option>
                              <option value="이대역">이대역</option>
                              <option value="이대역">역삼역</option>
                              <option value="이대역">강남역</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-md-2">
                        <div class="form-group">
                          <label class="sr-only" for="name">name</label>
                          <div class="input-group">
                            <input type="text" id="name" name="name" class="form-control" placeholder="이름">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-2">
                        <div class="form-group">
                          <label class="sr-only" for="price">가격별</label>
                          <select id="guest" name="price" class="form-control">
                          	  <option value="">가격별</option>
                              <option value="시간 당 1,000원">시간당 1,000원</option>
                              <option value="시간 당 2,000원">시간당 2,000원</option>
                              <option value="시간 당 3,000원">시간당 3,000원</option>
                              <option value="시간 당 4,000원">시간당 4,000원</option>
                              <option value="시간 당 5,000원">시간당 5,000원</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-md-2" style="margin-right: 100px;">
                        <input type="button" class="btn btn-default btn-primary" value="검색" onclick="loadPage('searchrounge','searchrounge.circle','search');">
                      </div>
                    </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div id="searchrounge">
        </div>
      </div>
</div>

 <footer style="background-color: #000000; color:#ffffff">
        <div class="container">
            <div class="row">
                <div class="col-lg-12" style="text-align: center;">
                    <ul class="list-inline">
                        <li>
                            <a href="#">위로가기</a>
                        </li>
                    </ul>
                    <p class="copyright text-muted small">Copyright &copy; Your Company 2017. All Rights Reserved</p>
                    <h5>저작권은 KOSMO 25기 4팀에게 있습니다.</h5>
                    </div> 
                </div>
            </div>
 </footer>
</body>
</html>

</body>
</html>