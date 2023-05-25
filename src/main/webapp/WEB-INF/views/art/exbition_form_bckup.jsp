<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>

<html>
<body>

<head>
		<meta charset="UTF-8">
		<meta name="viewport" cntent="width=device-width", initial-scale="1">
			<title>처음 만드는 부트스트랩</title>
</head>
	
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3>
				h3. Lorem ipsum dolor sit amet!
			</h3>
			<div class="row">
				<div class="col-md-3">
					<!-- 메뉴 바 -->
				</div>
				<div class="col-md-9">
				
					<div class="row">
						<c:forEach begin="1" end="12" step="1">						
							<div class="col-md-1"><img alt="Bootstrap Image Preview" src="http://lorempixel.com/117/117/" /></div>
						</c:forEach>
					</div>
					
					<div class="row">
						<c:forEach begin="1" end="12" step="1">						
							<div class="col-md-1"><img alt="Bootstrap Image Preview" src="http://lorempixel.com/117/117/" /></div>
						</c:forEach>
					</div>
					
				</div>
			</div>
			<div class="carousel slide" id="carousel-695258">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-695258">
					</li>
					<li data-slide-to="1" data-target="#carousel-695258">
					</li>
					<li data-slide-to="2" data-target="#carousel-695258">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="Carousel Bootstrap First" src="http://lorempixel.com/output/sports-q-c-1600-500-1.jpg" />
						<div class="carousel-caption">
							<h4>
								First Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="Carousel Bootstrap Second" src="http://lorempixel.com/output/sports-q-c-1600-500-2.jpg" />
						<div class="carousel-caption">
							<h4>
								Second Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="Carousel Bootstrap Third" src="http://lorempixel.com/output/sports-q-c-1600-500-3.jpg" />
						<div class="carousel-caption">
							<h4>
								Third Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-695258" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-695258" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
			<div class="jumbotron">
				<h2>
					Hello, world!
				</h2>
				<p>
					This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.
				</p>
				<p>
					<a class="btn btn-primary btn-large" href="#">Learn more</a>
				</p>
			</div>
			<grammarly>
				<div class="_e725ae-textarea_btn _e725ae-show _e725ae-anonymous _e725ae-field_hovered">
					<div class="_e725ae-transform_wrap">
						<div class="_e725ae-status">
						</div>
					</div>
				</div>
			</grammarly>
		</div>
	</div>
</div>

</body>
</html>