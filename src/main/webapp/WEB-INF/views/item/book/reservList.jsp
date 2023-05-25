<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../item/setting.jsp" %>
<%@ include file="../../common/setting.jsp" %>

<html>
<body onload="loadPage('menu_load','menu_top.common');">
<div id="menu_load"></div>

	<h2 class="text-center">예약 목록</h2>
	
<!-- 로그인 안했을 때 -->
<c:if test="${id == null}">
	<script type="text/javascript">
		loginError();
	</script>
</c:if>

<c:if test="${id != null}">
	<c:if test="${reservCount >= 1}">
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
		                        <div class="btn-toolbar" role="toolbar">
			                    	<div class="btn-group" role="group">
					                    <form action="rendBook.item" method="post">
					                    	<input type="hidden" id="book_id" name="book_id" value="${dto.book_id}">
					                    	<button type="submit" class="btn btn-primary">대여하기</button>
					                    </form>
					                 </div>
					                 <div class="btn-group" role="group">  
					                    <form action="reservBookPro.item" method="post" onsubmit="return reservCancel();">
					                    	<input type="hidden" id="book_id" name="book_id" value="${dto.book_id}">
					                    	<input type="hidden" id="cancel" name="cancel" value="cancel">
					                    	<button type="submit" class="btn btn-default">취소하기</button>
					                    </form>
			                    	</div>
			                    </div>
		                    </div>
		                </div><!-- row2 -->
		                <hr>
					</div> <!-- row1 -->
		</c:forEach>
	</div> <!-- container -->
	</c:if>
	
	<c:if test="${reservCount <= 0}">
		<h3 class="text-center">예약한 도서가 없습니다.</h3>
		<div class="text-center">
			<button class="btn btn-default" onclick="window.location.href='main.item'">뒤로가기</button>
		</div>
	</c:if>

</c:if>

</body>
</html>