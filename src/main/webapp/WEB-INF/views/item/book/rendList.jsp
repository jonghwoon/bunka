<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../item/setting.jsp" %>
<%@ include file="../../common/setting.jsp" %>

<html>
<body onload="loadPage('menu_load','menu_top.common');">
<div id="menu_load"></div>

	<h2 class="text-center">대여리스트</h2>
	<div class="row">
		<div class="text-center">
			<button class="btn btn-default glyphicon glyphicon-home" onclick="window.location.href='main.item'"></button>
		</div>
	</div>
<!-- 로그인 안했을 때 -->
<c:if test="${id == null}">
	<script type="text/javascript">
		loginError();
	</script>
</c:if>

<c:if test="${id != null}">
	<c:if test="${rendCount >= 1}">
	<div class="container">
		<c:forEach var="dto" items="${dtos}">
			<div class="row"><!-- row1 -->
				<div class="row"> <!-- row2 -->
					<div class="col-xs-12 col-sm-3 col-md-3">
                        <a href="rendDetail.item?book_id=${dto.book_id}">
                            <img src="${project}/item/${dto.book_img}" class="img-responsive img-box img-thumbnail"> 
                        </a>
					</div> 
                    <div class="col-xs-12 col-sm-9 col-md-9">
                        <h3><a href="rendDetail.item?book_id=${dto.book_id}">${dto.book_title}</a></h3>
                        <h4>
                        	저자 : ${dto.book_author}
                        	<c:if test="${dto.book_trans != null}">
                        	 / 역자 : ${dto.book_trans}
                        	</c:if>
                        </h4>
                        <h5>출판사 : ${dto.book_publisher}</h5>
                        <hr>
                        <h5>대여일 : ${dto.rend_start}</h5>
                        <h5>반납일 : ${dto.rend_end}</h5>
                    	<hr>
                    	<div class="col-xs-12">
	                    	<div class="btn-toolbar" role="toolbar">
		                    	<div class="btn-group" role="group">
				                    <form action="rendDetail.item" method="post">
				                    	<input type="hidden" id="book_id" name="book_id" value="${dto.book_id}">
				                    	<button type="submit" class="btn btn-primary">반납하기</button>
				                    </form>
								</div>
								<div class="btn-group" role="group">
				                    <form action="#" method="post">
				                    	<button type="submit" class="btn btn-success">연장하기</button>
				                    </form>
			                    </div>
							</div>
                    	</div> <!-- 버튼 -->
                    </div> <!-- 내용 -->
                </div> <!-- row2 -->
                <hr>
			</div> <!-- row1 -->
		</c:forEach>
	</div> <!-- container -->
	</c:if>
	
	<c:if test="${rendCount < 1}">
		<h3 class="text-center">대여한 도서가 없습니다.</h3>
		<div class="text-center">
			<button class="btn btn-default" onclick="window.location.href='main.item'">뒤로가기</button>
		</div>
	</c:if>

</c:if>

</body>
</html>