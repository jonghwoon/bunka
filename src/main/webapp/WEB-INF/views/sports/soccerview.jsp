<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp"%>
<%@ include file="../common/setting.jsp"%>    
<html>
<body>

<div class="row">
		<div class="col-lg-4">
			<%-- 
			<img class="mySlides" src="${sports}image/풋볼.jpg" style="width: 600px; height: 400px; margin-left: 100px">
			<img class="mySlides" src="${sports}image/풋볼2.jpg" style="width: 600px; height: 400px; margin-left: 100px">
			<img class="mySlides" src="${sports}image/풋볼4.jpg" style="width: 600px; height: 400px; margin-left: 100px">
			 --%>
		</div>

		
		<div class="col-lg-8">
			<div class="panel panel-primary" style="width: 580px; height: 400px;">
					<div class="panel-heading">
						<h3 class="panel-title"><span class="glyphicon glyphicon-apple"></span>&nbsp;&nbsp;</h3>
					</div>
				

					<div class="panel-body">
						<div class="media">
							<div class="media-left">
								<a onclick="load('placelist.sports');"><img class="media-object" src="${sports}image/시설.jpg" style="width: 110px; height: 80px"></a>
							</div>

							<div class="media-body">
								<h4 class="media-heading"><a onclick="load('placelist.sports');">시설 보기</a>&nbsp;<span class="badge">New</span></h4>
								안양시에 위치한 대표적인 체육공원들의 시설과 예약 정보를 확인할 수 있는 곳입니다.
							</div>
						</div>
						<hr>

						<div class="media">
							<div class="media-left">
								<a onclick="load('teamlist.sports');"><img class="media-object" src="${sports}image/팀.jpg" style="width: 110px; height: 80px"></a>
							</div>

							<div class="media-body">
								<h4 class="media-heading"><a onclick="load('teamlist.sports');">팀 정보</a>&nbsp;<span class="badge">New</span></h4>
								현재 사이트에 가입되어있는 팀 들의 정보와 자신의 팀을 관리하는 곳 입니다.
							</div>
						</div>
						<hr>

						<div class="media">
							<div class="media-left">
								<a href="lecture.sports?lectureName=안드로이드"><img class="media-object" src="${sports}image/리그.jpg" style="width: 110px; height: 80px"></a>
							</div>

							<div class="media-body">
								<h4 class="media-heading"><a onclick="load('blacklist.sports');">블랙리스트 보기</a>&nbsp;<span class="badge">New</span></h4>
								 블랙리스트 목록은 매칭을 일방적으로 취소 또는 통보없이 경기에 참여하지 않거나 많은 팀에서 비매너행동 신고가 들어온 경우 
								  몇 번의 경고조취 후 해당 사이트를 이용할 수 없게 된 팀들의 정보입니다 매칭시 참고하세요!
							</div>
						</div>
						
					</div>
			</div>
		</div>
	</div>


</body>
</html>