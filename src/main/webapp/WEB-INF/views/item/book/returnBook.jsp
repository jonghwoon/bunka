<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<%@ include file="../../common/setting.jsp" %>    
<html>
<body onload="loadPage('menu_load','menu_top.common');">
	<div id="menu_load"></div>
	
	<h1>반납</h1>
	
	<div class="container">
                <!-- Simple Pricing Tables -->
                <div class="row">
                    <div class="col-xs-4 item-photo">
                        <img style="max-width:100%;" src="${project}/item/book_10.jpg" />
                    </div>
                    <div class="col-xs-5" style="border:0px solid gray">
                        <!-- 제목 -->
                        <h3>
                            ${book_title}
                            <br>
                            <c:if test="${book_origin != null}">
                                <small>${book_origin}</small>
                            </c:if>
                        </h3>

                        <!-- 도서대여정보 -->
                        <hr>
                        <h5>대여정보</h5>
                        <h5>대여한 날짜 : </h5>
                        <h5>반납 기한 : </h5>
                        <h5>예약 상태 : </h5>
                        
                        <!-- 버튼 -->
                        <div class="section" style="padding-bottom:20px;">
                        	<form id="returnform" name="returnform" action="returnBookPro.item" method="post"
                        		onsubmit="return returnCheck();">
                        		<input type="hidden" name="book_id" id="book_id" value="${bdto.book_id}">
                        		<input type="hidden" name="check" id="check" value="${check}">
                        		<input type="hidden" name="cnt" id="cnt" value="2">
                        		<c:if test="${check <= 0}">
	                        		<button type="submit" class="btn btn-success">
	                        			<span style="margin-right:20px" class="glyphicon glyphicon glyphicon-share-alt"></span>
	                        			반납하기
	                        		</button>
                        		</c:if>
                        		<c:if test="${check > 0}">
	                        		<button type="submit" class="btn btn-warning">
	                        			<span style="margin-right:20px" class="glyphicon glyphicon glyphicon-share-alt"></span>
	                        			반납하기
	                        		</button>
                        		</c:if>
                        	</form>
                        </div>
                        <hr>
                        <div>
                        	<button class="btn btn-default btn-md" onclick="goBack();">뒤로가기</button>
                        </div>
                        
                    </div>

                    <hr>

                </div>
            </div>
	
</body>
</html>