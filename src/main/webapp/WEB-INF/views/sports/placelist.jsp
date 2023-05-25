<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp" %>   
<%@ include file="../common/setting.jsp"%> 
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	loadground('result','place.sports','suksoo');
	
    function loadground(div,urls,datas,form){
        	
        $.ajax({
            data :{name : datas}
            ,type : 'post'
            ,url  : urls
            ,success: function(response) {				
                $("#"+div).html(response);
            }
        });
    }
</script>

	
	<style>
		.jumbotron {
			background-image: url("${sports}image/축구4.jpg");
			background-size: contain;
			text-shadow: black 0.1em 0.1em 0.1em;
			color: aliceblue;
			height: 250px;
		}

		
		#list_ground table th{
			background-color: green;
			text-align: center;
			color: aliceblue;
		
		}
		#list_ground td{
			
			text-align: center;
		}
		
		#ground:hover{
			 background-color: #83d35a;
			 color:white;
			 cursor:pointer
		}
		.heading{
			color:white;
		}
		ul li{
			font-size: 15px;
		}
		
	</style>

</head>


<body onload="init();">
<div id="menu_load"> </div>
	
	<div class="container-fluid">
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	      <h4 ><b>시설 보기</b></h4>
	      <br>
	      <ul class="nav nav-pills nav-stacked">
	        <li class="active"  onclick="loadground('result','place.sports','suksoo');"><p id="ground">석수체육공원</p></li>
	        <li class="active"  onclick="loadground('result','place.sports','gunpo');"><p id="ground">군포시민체육공원</p></li>
	        <li class="active"  onclick="loadground('result','place.sports','pyeongchon');"><p id="ground">평촌자유공원</p></li>
	        
		  </ul><br>
	    </div>
		<div class="col-sm-1">
		
		</div>
	    <div class="col-sm-10">
	      <div id="result">
	      <%-- 
	        <div class="row">
	          <div class="col-sm-4">
	          	<a id="ground" onclick="loadground('result','place.sports','suksoo');"><img src="${sports}image/suksoomain.jpg" style="width:300px; height:200px"></a><br>
	          		<p align="center">석수체육공원</p>
	          </div>
	          
	          <div class="col-sm-4">
	          	<a id="ground" onclick="loadground('result','place.sports','gunpo');"><img src="${sports}image/gunpomain.jpg" style="width:300px; height:200px"></a><br>
	          		<p align="center">군포시민체육광장</p>
	          </div>
	          
	          <div class="col-sm-4">
	          	<a id="ground" onclick="loadground('result','place.sports','pyeongchon');"><img src="${sports}image/pyeongchonmain.jpg" style="width:300px; height:200px"></a><br>
	          		<p align="center">평촌자유공원</p>
	          </div>
	           
	        </div>
		  --%>  
		 </div>
	    </div>
	  </div>
	</div>


</body>

</html>