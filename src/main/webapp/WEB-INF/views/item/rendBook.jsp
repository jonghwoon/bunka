<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<%@ include file="setting.jsp" %>
	<%@ include file="../common/setting.jsp" %>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body onload="loadPage('menu_load','menu_top.common');">
<div id="menu_load"></div>

<!-- 로그인 안했을 때 -->
<c:if test="${id == null}">
	<script type="text/javascript">
		loginError();
	</script>
</c:if>

<!-- 로그인 하고 이용등록 안했을 때 -->
<c:if test="${id != null}">
	<c:if test="${user_reg != 1}">
		<script type="text/javascript">
			if(confirm(regMsg) == true){
				window.location.href="regForm.item";	
			} else {
				regError();
			}
		</script>
	</c:if>
</c:if>

<c:if test="${id != null && user_reg == 1}">
	<div class="container">
	<br><br>
		<div class="row">
			<div class="col-xs-4 item-photo">
				<img style="max-width:100%;" src="${project}/item/${dto.book_img}" />
            </div>
			<div class="col-xs-5" style="border:0px solid gray">
				<!-- 제목 -->
				<h3>
                           ${dto.book_title}<br>
					<c:if test="${dto.book_origin != null}">
						<small>${dto.book_origin}</small>
					</c:if>
				</h3>
				<h4 style="color:#337ab7">저자 : <a href="#">${dto.book_author}</a>
				    <c:if test="${dto.book_trans != null}">
				        <small style="color:#337ab7"> · (역자 : ${dto.book_trans})</small>
				    </c:if>
				</h4>
				<hr>
				<!-- 도서정보 -->
				<h6>도서정보</h6>
				<h5>ISBN: ${dto.book_isbn}</h5>
				<h5>도서분류: ${dto.catbig} > ${dto.catmid}</h5>
				<h5>키워드 : <a class="btn btn-link">${dto.book_keyword}</a></h5>
				<hr>
				<form id="modal" name="modal">
					<div class="btn-group" role="group">
					<!-- 대출 버튼 -->
					<c:if test="${rend_state == 0}">
						<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#rend">대출하기</button>
					</c:if>
					<c:if test="${rend_state != 0}">
						<button type="button" class="btn btn-warning btn-lg" disabled="disabled">대출 중</button>
					</c:if>
					<!-- 예약버튼 -->
						<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#reserv">예약하기</button>
						<button type="button" class="btn btn-default btn-lg" onclick="goBack();">뒤로가기</button>
					</div>
				</form>
				
				<!-- 모달창 -->
				<div id="rend" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 대출 모달 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">도서 대출하기</h4>
				      </div>
				      
				      <form action="rendBookPro.item" method="post" class="form-inline"
				      	id="rend" name="rend" onsubmit="return selLib();"><br>
				      	<input type="hidden" id="book_id" name="book_id" value="${dto.book_id}">
				      	<input type="hidden" id="rend_key" name="rend_key" value="${rend_key}">
				      	<div class="form-group">
				      		<label for="rend" class="control-label"> &nbsp;&nbsp;&nbsp;&nbsp;대출 도서관</label>
				      		<select id="rend" name="rend" class="form-control">
				      			<option value=""></option>
				      			<option value="1">도서관A</option>
				      			<option value="2">도서관B</option>
				      			<option value="3">도서관C</option>
				      		</select>
				      	</div>
					      <div class="modal-body">
					        <p>대출 기간은 7일이며 연체 시 대출 제한 등의 제약이 있을 수 있습니다.</p>
					      </div>
					      
					      <div class="modal-footer">
					      	<input type="submit" class="btn btn-success" value="대여하기" />
					        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					      </div>
				      </form>
				    </div>
				
				  </div>
				</div>
				
				<div id="reserv" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 예약 모달 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">예약하기</h4>
				      </div>
				      <form action="reservBookPro.item" method="post" class="form-inline"
				      	id="reservBook" name="reservBook" onsubmit="return checkLib();"><br>
				      	<input type="hidden" id="book_id" name="book_id" value="${dto.book_id}">
				      	<div class="form-group">
				      		<label for="reserv" class="control-label"> &nbsp;&nbsp;&nbsp;&nbsp;예약 도서관</label>
				      		<select id="reserv" name="reserv" class="form-control">
				      			<option value=""></option>
				      			<option value="1">도서관A</option>
				      			<option value="2">도서관B</option>
				      			<option value="3">도서관C</option>
				      		</select>
				      	</div>
					      <div class="modal-body">
					        <p>대출 가능 시 메일로 알려드리며</p> 
					        <p>도서를 7일간 대출 않으면 예약이 취소 됩니다.</p>
					      </div>
					      
					      <div class="modal-footer">
					      	<input type="submit" class="btn btn-success" value="예약하기" />
					        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					      </div>
				      </form>
				    </div>
				
				  </div>
				</div>	
			</div>
		</div>
	</div>
</c:if>	
</body>
</html>