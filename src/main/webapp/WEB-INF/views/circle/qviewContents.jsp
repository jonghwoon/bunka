<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting_circle.jsp" %>
<%@ include file="../common/setting.jsp"%>
<html lang="ko">
<head>
<script type="text/javascript">
function del(url) {
	if(!document.getElementById("passwd").value) {
		alert("비밀번호를 입력하세요");
		document.getElementById("passwd").focus();
	} else {
		$("#form1").attr("action",url);
		$("#form1").submit();
	}
}
</script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <!-- Bootstrap -->
        <link href="./bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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
	 	<form id=form1>
        <div class="container">
            <hr>
            <div class="row">
             <div class="col-md-10">
                <table class="table table-condensed">
                  <thead>
                  <input type="hidden" name="subject" value="${subject}">
                  <input type="hidden" name="adddate" value="${adddate}">
                  <input type="hidden" name="writer" value="${writer}">
                  <input type="hidden" name="readCnt" value="${readCnt}">
                  <input type="hidden" name="contents" value="${contents}">
                  <input type="hidden" name="num" value="${num}">
                  
                      <tr align="center">
                          <th width="10%">제목</th>
                          <th width="60%">${subject}</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td>작성일</td>
                          <td>${adddate}</td>
                      </tr>
                      <tr>
                          <td>글쓴이</td>
                          <td>${writer}</td>
                          <!-- 글쓴이와 아이디가 같을때 조회수 증가X -->
                          <c:if test="${sessionScope.id == writer}"> 
                          <span style='float:right'>조회 : ${param.readCnt}</span>
                          </c:if>
                           <!-- 글쓴이와 아이디가 같지않을때 조회수 증가+1 -->
                          <c:if test="${sessionScope.id != writer}">
                          <span style='float:right'>조회 : ${param.readCnt}</span>
                          </c:if>
                      </tr>
                      <tr>
                          <td colspan="2"><p>${contents}</p></td>
                      </tr>
                  </tbody>
              	</table>
                 <table id="commentTable" class="table table-condensed"></table>
                 <table class="table table-condensed">
                     <tr>
                        <td>
                           <span class="form-inline" role="form">
                              <div class="form-group">
                                  <input type="password" id="passwd" name="passwd" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10" required="required" autofocus="autofocus">
                              </div>
                           </span>
                        </td>
                     </tr>
                 </table>
                  <table class="table table-condensed">
                      <thead>
                          <tr>
                             <td>
                               <span style='float:center'>
                                   <a href="qboard.circle"><button type="button" id="list" class="btn btn-default">목록</button></a>
                                   <input type="button" id="modi" value="수정" class="btn btn-default" onclick="del('qboardModi.circle')">
                                   <input type="button" id="delete" value="삭제" class="btn btn-default" onclick="del('qboardDel.circle')">
                               </span>
                             </td>
                          </tr>
                      </thead>
                  </table>
                </div>
            </div>
            <hr/>
       	 </div>
       </form>
    </body>
</html>
</body>
</html>