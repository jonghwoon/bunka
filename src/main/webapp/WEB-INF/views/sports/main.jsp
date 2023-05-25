<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="sports_setting.jsp" %> 

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <style>
    	
        body {
            background-image: url("${sports}image/스포츠2.jpg");
            background-position : bottom;
            background-origin: content-box;
            background-size: 100%;
            color: azure;
        } 

        #sty{
        	color:white;
        	text-shadow: black 0.1em 0.1em 0.1em;
        }
        a:hover{
        	cursor:pointer;
        }
    </style>
<script type="text/javascript">
	function loginchk(){
		
		var cnt="${cnt}";		
		console.log("${cnt}");
				
		switch(cnt){
			case "0" : popup("club.sports", 400, 385); 			break;
			case "1" : window.location="soccer.sports";			break;
			case "2" : alert("로그인 후 이용해주세요"); 		break;
		}
		
	}

	function init(){
		topMenuLoad();
	}
</script>
</head>

<body onload="init();">
<div id="menu_load"></div>
    <div class="container-fluid">
        	<div id="sty">
	            <h2 class="text-center">스포츠 관리 센터</h2>
	            <p class="text-center">스포츠 관리센터는 체육인들의 편의를 제공하고 원할한 체육활동을 장려하기위해 만들었습니다.</p>
	            <!-- <p class="text-center"><a class="btn btn-primary btn-lg" href="main.common" role="button">메인으로 가기</a></p> -->
	            <p class="text-center"><a onclick="loginchk();"><img src="${sports}image/축구3.jpg" height="100px"></a></p>
            </div>
        <%-- 
            <div class="row" id="select">
                <div class="col-sm-4 text-center"><a href="basket.jsp"><img src="${sports}image/농구.jpg" height="100px"></a></div>
                <div class="col-sm-4 text-center"><a href="baseball.jsp"><img src="${sports}image/야구공.jpg" height="100px"></a></div>                
            </div>
       	--%>
	</div>
</body>
</html>