<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting_circle.jsp" %>
<%@ include file="../common/setting.jsp"%>
<%
		ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");
%>
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
		<%
		for(DTO dto : dtos) {
		%>
			<section id="intro" class="main style1 dark fullscreen">
				<div class="content">
					<header>
						<h2><%=dto.getValue("name")%> 동아리</h2>
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
					<p><%=dto.getValue("name")%><%=dto.getValue("infos")%></p>
				</div>
				<a href="#two" class="button style2 down anchored">Next</a>
			</section>

		<!-- Two -->
			<section id="two" class="main style2 left dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>동아리 홍보</h2>
					</header>
					<p>
					<%=dto.getValue("recruit")%>
					</p>
				</div>
				<a href="#work" class="button style2 down anchored">Next</a>
			</section>

		<!-- Work -->
			<section id="work" class="main style3 primary">
				<div class="content">
					<header>
						<h2>동아리 활동이미지</h2>
						<p><%=dto.getValue("imageinfo")%></p>
					</header>

					<!-- Gallery  -->
						<div class="gallery">
							<article class="from-left">
								<a href="./resources/circle/image/${param.name}1.jpeg" class="image fit"><img src="./resources/circle/image/${param.name}1.jpeg" title="${param.name}이미지1" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="./resources/circle/image/${param.name}2.jpeg" class="image fit"><img src="./resources/circle/image/${param.name}2.jpeg" title="${param.name}이미지2" alt="" /></a>
							</article>
							<article class="from-left">
								<a href="./resources/circle/image/${param.name}3.jpeg" class="image fit"><img src="./resources/circle/image/${param.name}3.jpeg" title="${param.name}이미지3" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="./resources/circle/image/${param.name}4.jpeg" class="image fit"><img src="./resources/circle/image/${param.name}4.jpeg" title="${param.name}이미지4" alt="" /></a>
							</article>
							<article class="from-left">
								<a href="./resources/circle/image/${param.name}5.jpeg" class="image fit"><img src="./resources/circle/image/${param.name}5.jpeg" title="${param.name}이미지5" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="./resources/circle/image/${param.name}6.jpeg" class="image fit"><img src="./resources/circle/image/${param.name}6.jpeg" title="${param.name}이미지6" alt="" /></a>
							</article>
						</div>
						<a href="#contact" class="button style2 down anchored">Next</a>
				</div>
			</section>

		<!-- Contact -->
		
			<section id="contact" class="main style3 secondary">
				<div class="content">
					<header>
						<h2>가입신청</h2>
						<p>${param.name} 동아리에 가입신청 </p>
					</header>
					<c:if test="${sessionScope.id != null}">
					<c:if test="${param.maxpeople*1 > param.people*1}">
					<div class="box">
						<form method="post" action="request.circle" onsubmit="">
						<input type="hidden" name="name" 		value="${param.name}">
						<input type="hidden" name="circlenum" 	value="<%=dto.getValue("circlenum")%>">
						<input type="hidden" name="id" 			value="${sessionScope.id}">
							<div class="field"><textarea name="message" placeholder="가입인사를 적어주세요" rows="6"></textarea></div>
							<ul class="actions">
								<li><input type="submit" value="가입신청" /></li>
								<li><input type="reset" value="취소" /></li>
								<li><input type="button" value="뒤로가기" onclick="window.location='search.circle'" /></li>
							</ul>
						</form>
					</div>
					</c:if>
					<c:if test="${param.maxpeople*1 <= param.people*1}">
					<div class="box">
						<form method="post" action="request.circle">
							<div class="field"><textarea name="message" placeholder="인원초과로  가입불가" rows="6" disabled="disabled"></textarea></div>
							<ul class="actions">
								<li><input type="hidden" value="가입신청" disabled="disabled" /></li>
								<li><input type="button" value="취소" /></li>
								<li><input type="button" value="뒤로가기" onclick="window.location='search.circle'" /></li>
							</ul>
						</form>
					</div>
					</c:if>
					</c:if>
					<c:if test="${sessionScope.id == null}">
					<div class="box">
						<form method="post" action="request.circle">
							<div class="field"><textarea name="message" placeholder="로그인이후 신청가능" rows="6" disabled="disabled"></textarea></div>
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
			<%
			}
			%>
		<!-- Footer -->
		<div id="footer">Copyright &copy; Your Company 2017. All Rights Reserved
	    <h5>저작권은 KOSMO 25기 4팀에게 있습니다.</h5>
	    </div>
	    
	</body>
</html>