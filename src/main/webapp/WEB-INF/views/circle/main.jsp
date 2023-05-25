<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="setting_circle.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>

<head>
    <title></title>
    <style type="text/css">
        body { font-family: Lucida Sans Unicode, Arial, Sans-Serif; font-size:13px;}
        /* Structure */
        #header, #content, #boards, #sidebar, #footer { background-color:#F6F6F6; margin:10px 0px;
             -moz-border-radius:10px;  -webkit-border-radius:10px; padding:30px;}
        #header h1 { float:right; margin: 20px 0 0 0; font-size:36px; font-weight:bold;}
        #header h2 {font-size:16px; font-weight:normal; margin:0px; padding:0px;}
        #header { width:900px; margin:0px auto;}
        
        #main {width:960px; margin:0px auto; overflow:hidden;}
        #toolbox { text-align:right; float:right;}
        #content { width:540px; float:left;}
        #boards { width:540px; float:left;}
        #boards p span {display:block; font-size:16px; color:#B0232A;}
        #sidebar { width:180px; margin-left:-10px; float:right;}
        #sidebar #ads { width:100%; overflow:hidden;}
        #sidebar #ads img { float:left; margin:5px; display:block;}
        #footer { width:100%; margin:0px auto;}
          
        /* Change view sprites */
        .toolbox { float:right; margin-left:10px;}
        .toolbox a { width:30px; height:20px; float:right; }

        #wideView {background: transparent url(./resources/circle/image/buttons.png) no-repeat scroll 0px 0px; }
        #wideView:hover { background-position:-30px 0px; }
        #wideView.wide {background-position:0px -20px; }
        #wideView.wide:hover { background-position:-30px -20px; }
     
        /* Different views */
        #content.wide { width:900px;}
        #toolbox.wide { width:960px;}
        #content.compact, #boards.compact { width:690px;}
        #sidebar.compact { width:130px;}
        
       /* ------------------------ */
       
		#shadow-container {position: relative;left: 3px;top: 3px;margin-right: 3px;margin-bottom: 3px;}
		#shadow-container .shadow2,
		#shadow-container .shadow3,
		#shadow-container .container {position: relative;left: -1px;top: -1px;}
		#shadow-container .shadow1 {background: #F1F0F1;}
		#shadow-container .shadow2 {background: #DBDADB;}
		#shadow-container .shadow3 {background: #B8B6B8;}
		#shadow-container .container {background: #ffffff;border: 1px solid #848284;padding: 10px; width: 100%;}
		#shadow-container .container.a {margin: 30px;}	
    </style>
    
    <script type="text/javascript" src="./resources/circle/js/jquery.mins.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#wideView").click(function() {
                $("#content").toggleClass("wide");
                $(this).toggleClass("wide");
            });
        });
    </script>
    
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
    <div id="header" align="center">
        <img src="./resources/circle/image/로고.png" /><br />
    </div>
    <div id="main">
        <div id="content">
            <div class="toolbox">늘이기 <a id="wideView" href="#"></a></div>
            <h3>추천문구</h3>
            <p>
                <span style="float:left; margin:0 10px 10px 0;"><img src="./resources/circle/image/활기찬-하루-보내는-15가지의-노하우.png" /><br /><em>
               	활기찬 하루를 보내는 15가지 방법 </em></span>
                ​​1. 아침에 일찍 일어나는 것이 좋다<br>
                ​2. 자는 시간에 관계없이 일어나는 시간은 일정하게 일어난다<br>
                3. 일어나는 즉시 찬물로 세수한다<br>
                4. 아침은 꼭 챙겨먹는 습관을 가져야 한다<br>
                5. 다음날의 계획은 하루 전날 밤에 세운다<br>
				6. 다음날 입을 옷을 미리 챙겨둔다<br>
				7. 가급적 12시 이전에는 잠을 자는 생활을 하라<br>
			</p>
			
				<h4 align="center">행복한 삶</h4>
            	<p>
             		   아이가 아직 어리다면 어려운 친구를 돕거나 타인을 배려하는 내용이 담긴 동화책을 함께 읽어보자. <br>
			                    책을 함께 읽으며 어려운 친구를 도왔을 때 어떤 기분이 들지 이야기도 나누자. <br>
                </p>
        </div>
        <div id="sidebar">
            <h3 align="center">추천장소</h3>
            <p id="ads">
                <a href="rounge.circle"><img src="./resources/circle/image/adv1.jpg" alt="adv1" /></a>
                <a href="rounge.circle"><img src="./resources/circle/image/adv2.jpg" alt="ad2" /></a>
                <a href="rounge.circle"><img src="./resources/circle/image/adv3.jpg" alt="ad3" /></a>
                <a href="rounge.circle"><img src="./resources/circle/image/adv4.jpg" alt="ad4" /></a>
            </p>
            <div align="left">
            <h4>추천장소링크</h4>
                <a href="rounge.circle">각종 모임장소 링크 입니다.<br>
              	  						클릭시 장소 링크검색창으로 연결 됩니다.
                </a>
            </div>                               
        </div>
        <div id="boards">
        <h3>동아리 신청 게시판</h3>
		<c:forEach items="${dtos}" var="board" end="4">
		
		<div id="shadow-container">
		<div class="shadow1">
			<div class="shadow2">
				<div class="shadow3">
					<div class="container">
						<span style="width: 20px; margin-right: 10%;">${board.num}</span><a style="width: 50px" href = "viewContents.circle?num=${board.num}&subject=${board.subject}&contents=${board.contents}&writer=${sessionScope.id}&readCnt=${board.readCnt}&adddate=${board.adddate}">${board.subject}</a><span style="width: 20px; margin-right: 10%; margin-left: 10%">${board.contents}</span> <span style="width: 20px; margin-right: 10%;">${board.writer} </span> <span style="width: 20px; margin-right: 10%;">${board.readCnt} </span><br/>
					</div>
				</div>
			</div>
		</div>
		</div>
	 	</c:forEach>
	 	<a style="float: right;" href="board.circle">더보기</a>
        </div>
        <div id="boards">
         <h3>Q&A 게시판</h3>
        <c:forEach items="${qdtos}" var="qboard" end="4">
		<div id="shadow-container">
		<div class="shadow1">
			<div class="shadow2">
				<div class="shadow3">
					<div class="container">
						<span style="width: 20px; margin-right: 10%;">${qboard.num}</span><a style="width: 50px" href = "viewContents.circle?num=${qboard.num}&subject=${qboard.subject}&contents=${qboard.contents}&writer=${sessionScope.id}&readCnt=${qboard.readCnt}&adddate=${qboard.adddate}">${qboard.subject}</a><span style="width: 20px; margin-right: 10%; margin-left: 10%">${qboard.contents}</span> <span style="width: 20px; margin-right: 10%;">${qboard.writer} </span> <span style="width: 20px; margin-right: 10%;">${qboard.readCnt} </span><br/>
					</div>
				</div>
			</div>
		</div>
		</div>
	 	</c:forEach>
	 	<a style="float: right;" href="qboard.circle">더보기</a>
        </div>
    </div>
     <div id="footer">Copyright &copy; Your Company 2017. All Rights Reserved
    <h5>저작권은 KOSMO 25기 4팀에게 있습니다.</h5>
    </div>
</body>
</html>