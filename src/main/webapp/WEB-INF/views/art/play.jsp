<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<html lang="en-us">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Unity WebGL Player | SpaceShooter</title>
    <link rel="shortcut icon" href="/center/resources/art/TemplateData/favicon.ico">
    <link rel="stylesheet" href="/center/resources/art/TemplateData/style.css">
    <script src="/center/resources/art/TemplateData/UnityProgress.js"></script>  
    <script src="/center/resources/art/Build/UnityLoader.js"></script>
    <script>
      //var gameInstance = UnityLoader.instantiate("gameContainer", "/center/resources/art/Build/build15.json", {onProgress: UnityProgress});
      var gameInstance = UnityLoader.instantiate("gameContainer", "/center/resources/art/Extend4/Build/Extend4.json", {onProgress: UnityProgress});
    </script>
    
    <style>
    	body {
    		background-color: #001c26;
    		color : white;
    	}
    </style>
        
  </head>
	  
  <body>
  <h2> 시간낭비 페이지 </h2>
  <div>※ 당신의 소중한 시간을 낭비하지 마십시오.</div>
  <div>※ 아무리 하셔도 보스는 등장하지 않습니다.</div>
  <div>※ 스코어도 기록되지 않습니다..</div>
  <div>※ 이어 하기도 제공되지 않습니다.</div>
  <div>※ 아무런 이득이 없습니다.</div>
  <div>※ 이 페이지는 https://unity3d.com/kr/learn/tutorials 의 튜토리얼에 따라 제작되었습니다.</div>
  <div>※ 이 페이지의 개발 툴인 unity 는 무료입니다. </div>
  <div>※ 궁금하시면 가서 공부를 해봅시다! </div>
  <div>※ 하지만 하지 않으실거죠? </div>
  <div>※ 안됩니다. 열심히 살아야 합니다. </div>
  <div>※ 그러므로 아래의 뒤로가기 버튼을 누르십시오. </div>
  <br>
  <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<input type="button" value="뒤로가기" onclick="window.history.back()"> 
 	</div>  
  
    <div class="webgl-content">
      <div id="gameContainer" style="width: 600px; height: 900px"></div>
      <div class="footer">
        <div class="webgl-logo"></div>
        <div class="fullscreen" onclick="gameInstance.SetFullscreen(1)"></div>
        <div class="title">SpaceShooter</div>
      </div>
    </div>
  </body>
</html>