<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>

<!-- 
	id 만 일단 바꾼다. 
	dto의...
	혹은 랜덤으로 지정할까?
	혹은 tableName 으로 하자	
-->
<%
	// 난수 생성
	//int num = (int)(Math.random()*100000);
%>

<style>
	/* fixed */
	.carousel-indicators{
		top : 50px;
	}
	.carousel img {
		width : 100%;
		margin: auto;
	}
</style>
 
<div class="carousel slide" data-ride="carousel" data-interval="2000" id="carousel-circle">

	<ol class="carousel-indicators">
		<li data-slide-to="0" data-target="#carousel-circle" class="active" >	</li>
		<li data-slide-to="1" data-target="#carousel-circle">					</li>
		<li data-slide-to="2" data-target="#carousel-circle">					</li>
	</ol>
	
	<div class="carousel-inner" role="listbox">			
		<c:forEach begin="0" end="2" var="num">		
			<c:if test="${num==0}">	<c:set var="active" value="active"/>	</c:if>
			<c:if test="${num!=0}">	<c:set var="active" value=""/> 			</c:if>
			
			<div class="item ${active}" >
				<img  src="/center/resources/common/main_circle/circle_sub${num}.jpg"/>			
				<div class="carousel-caption">
				
					<%-- // 신규 서클 데이터 받아와서 넣으면 좋을듯. 
					<h4>${dtos.get(num).title}</h4>
					<p> ${dtos.get(num).place}</p>
					 --%>
					 
				</div>
			</div>
		</c:forEach>		
	</div> 
		
	<a class="left carousel-control" href="#carousel-circle" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span>
	</a>
	 
	<a class="right carousel-control" href="#carousel-circle" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span>
	</a>
</div>
