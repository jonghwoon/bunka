<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="setting_circle.jsp" %>

<html>

<head>
	<title>동아리 소개</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="./resources/circle/css/main.css" />
</head>

<body>
	<!-- Header -->
		<header id="header">
			<h1>circle intro</h1>
			<nav>
				<ul>
					<li><a href="#intro">소개합니다</a></li>
					<li><a href="#one">무엇을 하는지</a></li>
					<li><a href="#two">동아리 홍보</a></li>
					<li><a href="#work">이미지</a></li>
					<li><a href="#contact">가입신청</a></li>
				</ul>
			</nav>
		</header>

	<!-- Intro -->
		<section id="intro" class="main style1 dark fullscreen">
			<div class="content">
				<header>
					<h2>${param.name} 동아리</h2>
				</header>
				<p>1. 어떤 활동을 하는 동아리 인가요? </p>
				<footer>
					<a href="#one" class="button style2 down">More</a>
				</footer>
			</div>
		</section>

	<!-- One -->
		<section id="one" class="main style2 right dark fullscreen">
			<div class="content box style2">
				<header>
					<h2>무엇을 하는 동아리?</h2>
				</header>
				<p>동아리 ${param.name}는 낚시 활동 뿐만 아니라 다양한 친목 활동을 통해 정을 쌓아가는 친목 & 취미 겸용의 동아리입니다!</p>
			</div>
			<a href="#two" class="button style2 down anchored">Next</a>
		</section>

	<!-- Two -->
		<section id="two" class="main style2 left dark fullscreen">
			<div class="content box style2">
				<header>
					<h2>동아리 홍보</h2>
				</header>
				<p>■ 지원자격<br>
				- 여행과 낚시를 즐길 줄 아는 자<br>
				- 적극적이고 활동적인 자신의 끼와 열정을 분출하고 싶은 자<br>
				- 각종 생활 스트레스와 만성피로로부터 탈출을 원하는 자<br>
				</p>
			</div>
			<a href="#work" class="button style2 down anchored">Next</a>
		</section>

	<!-- Work -->
		<section id="work" class="main style3 primary">
			<div class="content">
				<header>
					<h2>동아리 활동이미지</h2>
					<p>손 맛과 입 맛과 사람 맛을 느낄 수 있는 추어동아리와 함께 무더위를 잊어보는것은 어떨까요??<br>
					저희 동아리의 활동 사진입니다.</p>
				</header>

				<!-- Gallery  -->
					<div class="gallery">
						<article class="from-left">
							<a href="${circle}image/${param.name}1.jpeg" class="image fit"><img src="${circle}image/${param.name}1.jpeg" title="The Anonymous Red" alt="" /></a>
						</article>
						<article class="from-right">
							<a href="${circle}image/${param.name}2.jpeg" class="image fit"><img src="${circle}image/${param.name}2.jpeg" title="Airchitecture II" alt="" /></a>
						</article>
						<article class="from-left">
							<a href="${circle}image/${param.name}3.jpeg" class="image fit"><img src="${circle}image/${param.name}3.jpeg" title="Air Lounge" alt="" /></a>
						</article>
						<article class="from-right">
							<a href="${circle}image/${param.name}4.jpeg" class="image fit"><img src="${circle}image/${param.name}4.jpeg" title="Carry on" alt="" /></a>
						</article>
						<article class="from-left">
							<a href="${circle}image/${param.name}5.jpeg" class="image fit"><img src="${circle}image/${param.name}5.jpeg" title="The sparkling shell" alt="" /></a>
						</article>
						<article class="from-right">
							<a href="${circle}image/${param.name}6.jpeg" class="image fit"><img src="${circle}image/${param.name}6.jpeg" title="Bent IX" alt="" /></a>
						</article>
					</div>
			</div>
		</section>

	<!-- Contact -->
	
		<section id="contact" class="main style3 secondary">
			<div class="content">
				<header>
					<h2>가입신청</h2>
					<p>${param.name} 동아리에 가입신청 </p>
				</header>
				<c:if test="${param.maxpeople*1 > param.people*1}">
				<div class="box">
					<form method="post" action="search.circle">
						<div class="field"><textarea name="message" placeholder="가입인사를 적어주세요" rows="6"></textarea></div>
						<ul class="actions">
							<li><input type="submit" value="가입신청" /></li>
							<li><input type="reset" value="취소" /></li>
						</ul>
					</form>
				</div>
				</c:if>
				<c:if test="${param.maxpeople*1 <= param.people*1}">
				<div class="box">
					<form method="post" action="search.circle">
						<div class="field"><textarea name="message" placeholder="인원초과로  가입불가" rows="6" disabled="disabled"></textarea></div>
						<ul class="actions">
							<li><input type="hidden" value="가입신청" disabled="disabled" /></li>
							<li><input type="button" value="취소" /></li>
							<li><input type="button" value="뒤로가기" onclick="window.location='search.circle'" /></li>
						</ul>
					</form>
				</div>
				</c:if>
			</div>
		</section>
		
	
	
	<!-- Footer -->
		<footer id="footer">

			<!-- Icons -->
				<ul class="actions">
					<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
					<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
					<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
					<li><a href="#" class="icon fa-pinterest"><span class="label">Pinterest</span></a></li>
				</ul>

			<!-- Menu -->
				<ul class="menu">
					<li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
				</ul>

		</footer>
</body>
</html>