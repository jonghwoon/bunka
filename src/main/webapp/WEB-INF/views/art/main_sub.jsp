<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<%-- <%@ include file="../common/setting.jsp"%> --%>



<!-- 
	id 만 일단 바꾼다. 
	dto의...
	혹은 랜덤으로 지정할까?
	혹은 tableName 으로 하자
	
-->
<%
	int num = (int)(Math.random()*100000);
	//디버그 
		//System.out.println("!" + num);
	
	ArrayList<String> title = new ArrayList<String>();
	ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");	
	if(dtos!=null){	
		for(DTO dto : dtos)
			;
	}
	
%>


<div class="carousel slide" id="carousel-<%=num%>">

	<ol class="carousel-indicators">
		<li class="active" data-slide-to="0" data-target="#carousel-<%=num%>">
		</li>
		<li data-slide-to="1" data-target="#carousel-<%=num%>">
		</li>
		<li data-slide-to="2" data-target="#carousel-<%=num%>">
		</li>
	</ol>
	
	<div class="carousel-inner">
	
		<div class="item active">
			<!-- <img alt="Carousel Bootstrap First" src="http://lorempixel.com/output/sports-q-c-1600-500-2.jpg" /> -->
			<%-- <img alt="Carousel Bootstrap First" src="/center/resources/art/images/show/<%= dtos.get(0).getValue("filename") %>.jpg" /> --%>
			
			<img alt="Carousel Bootstrap First" src="http://lorempixel.com/output/sports-q-c-1600-500-1.jpg" />			
			<div class="carousel-caption">
				<h4>
					<%= dtos.get(0).getValue("title") %>
				</h4>
				<p>
					<%= dtos.get(0).getValue("place") %>
				</p>
			</div>
		</div>
		
		<div class="item">
			<%-- <img alt="Carousel Bootstrap First" src="/center/resources/art/images/show/<%= dtos.get(1).getValue("filename") %>.jpg" /> --%>
			<img alt="Carousel Bootstrap First" src="http://lorempixel.com/output/sports-q-c-1600-500-2.jpg" />
			<div class="carousel-caption">
				<h4>
					<%= dtos.get(1).getValue("title") %>
				</h4>
				<p>
					<%= dtos.get(1).getValue("place") %>
				</p>
			</div>
		</div>
		
		<div class="item">
			<%-- <img alt="Carousel Bootstrap First" src="/center/resources/art/images/show/<%= dtos.get(2).getValue("filename") %>.jpg" /> --%>
			<img alt="Carousel Bootstrap First" src="http://lorempixel.com/output/sports-q-c-1600-500-3.jpg" />
			<div class="carousel-caption">
				<h4>
					<%= dtos.get(2).getValue("title") %>
				</h4>
				<p>
					<%= dtos.get(2).getValue("place") %>
				</p>
			</div>
		</div>
		
	</div> 
	
	<a class="left carousel-control" href="#carousel-<%=num%>" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span>
	</a>
	 
	<a class="right carousel-control" href="#carousel-<%=num%>" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span>
	</a>
</div>
				