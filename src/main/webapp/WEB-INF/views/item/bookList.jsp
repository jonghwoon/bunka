<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="setting.jsp" %>
        <style>
            body {
                margin-top: 20px;
                background-color: #eee;
            }

            .search-result-categories>li>a {
                color: #b6b6b6;
                font-weight: 400
            }

            .search-result-categories>li>a:hover {
                background-color: #ddd;
                color: #555
            }

            .search-result-categories>li>a>.glyphicon {
                margin-right: 5px
            }

            .search-result-categories>li>a>.badge {
                float: right
            }

            .search-results-count {
                margin-top: 10px
            }

            .search-result-item {
                padding: 20px;
                background-color: #fff;
                border-radius: 4px
            }

            .search-result-item:after,
            .search-result-item:before {
                content: " ";
                display: table
            }

            .search-result-item:after {
                clear: both
            }

            .search-result-item .image-link {
                display: block;
                overflow: hidden;
                border-top-left-radius: 4px;
                border-bottom-left-radius: 4px
            }

            @media (min-width:768px) {
                .search-result-item .image-link {
                    display: inline-block;
                    margin: -20px 0 -20px -20px;
                    float: left;
                    width: 200px
                }
            }

            @media (max-width:767px) {
                .search-result-item .image-link {
                    max-height: 200px
                }
            }

            .search-result-item .image {
                max-width: 100%
            }

            .search-result-item .info {
                margin-top: 2px;
                font-size: 12px;
                color: #999
            }

            .search-result-item .description {
                font-size: 13px
            }

            .search-result-item+.search-result-item {
                margin-top: 20px
            }

            @media (min-width:768px) {
                .search-result-item-body {
                    margin-left: 200px
                }
            }

            .search-result-item-heading {
                font-weight: 400
            }

            .search-result-item-heading>a {
                color: #555
            }

            @media (min-width:768px) {
                .search-result-item-heading {
                    margin: 0
                }
            }
        </style>

        <script type="text/javascript">
        </script>

        <head>
            <title></title>
            <meta name="viewport" content="width=device-width, initial-scale=1">
        </head>

        <body onload="loadPage('menu_load','menu_top.common');">
            <div id="menu_load"></div>
            <br>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <h1>도서목록</h1>
                    <hr>
                </div>
                <div class="col-md-3">
                    <br>
	                <div class="btn btn-group" role="group">
	                    <c:if test="${id eq 'admin'}">
	                    	<a class="btn btn-primary btn-md" href="/center/bookInsert.item">
	                    		<span class="glyphicon glyphicon-pencil"></span>
	                    		도서등록
	                    	</a>
	                    </c:if>
	                    <a class="btn btn-default btn-md" href="main.item">
	                    	<span class="glyphicon glyphicon-home"></span>
	                    	처음으로
	                    </a>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="col-md-1"></div>
                <!-- 등록된 도서가 없을 때 -->
                <c:if test="${cnt <= 0}">
                	<h1 class="text-center">등록된 도서가 없습니다. </h1>
                </c:if>
                
                <!-- 등록된 도서가 있을 때 -->
                <c:if test="${cnt > 0}">
                <div class="row">
                    <div class="col-md-9">
                        <c:forEach var="dto" items="${dtos}">
                        <c:set var="number" value="${number-1}" />
                            <section class="search-result-item">
                                <a class="image-link" href="bookDetail.item?book_id=${dto.book_id}&pageNum=${pageNum}&number=${number + 1}"><img height="215px" class="image" src="${project}/item/${dto.book_img}"></a>
                                <div class="search-result-item-body">
                                    <div class="row">
                                        <div class="col-sm-9">
                                            <h4 class="search-result-item-heading"><a href="bookDetail.item?book_id=${dto.book_id}&pageNum=${pageNum}&number=${number + 1}">${dto.book_title}</a></h4>
                                            <p class="info">
                                                ${dto.book_author}
                                                <c:if test="${dto.book_trans != null}">
                                                    / ${dto.book_trans}
                                                </c:if>
                                            </p>
                                            <p class="description">
                                                발행처 : ${dto.book_publisher}
                                            </p>
                                            <p class="description">
                                                발행일 : <fmt:formatDate value="${dto.book_publishdate}" pattern='yyyy년 MM월 dd일'/>
                                            </p>
                                            <p class="description">
                                                반입일 : <fmt:formatDate value="${dto.book_incomedate}" pattern='yyyy년 MM월 dd일' />
                                            </p>
                                            <p class="description">
                                               책소개
                                             </p>
                                             <p class="description">
                    ${dto.book_index}
                                            </p>
                                        </div>
                                        <div class="col-sm-3 text-align-center">
                                            <p class="value3 mt-sm">분류 : </p>
                                            <p class="fs-mini text-muted">${dto.catbig} / ${dto.catmid}</p>
                                            <a class="btn btn-primary btn-info btn-sm" href="bookDetail.item?book_id=${dto.book_id}&pageNum=${pageNum}&number=${number + 1}">상세 정보보기</a>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </c:forEach>
                    </div>
                   </div>
                </c:if>

                <!-- 페이지 컨트롤 -->
                <c:if test="${cnt > 0}">
                    <div class="row text-center">
                    	<div class="col-md-9">
	                        <ul class="pagination pagination-md">
	                            <!-- 처음<< / 이전블록< -->
	                            <c:if test="${startPage > pageBlock}">
	                                <li>
	                                	<a href="bookList.item">
	                                		처음
	                                	</a>
	                                </li>
	                                <li>
	                                	<a href="bookList.item?pageNum=${startPage - pageBlock}">
											&laquo;
	                                	</a>
	                                </li>
	                            </c:if>
	
	                            <!-- 중간 페이지 표시 -->
	                            <c:forEach var="i" begin="${startPage}" end="${endPage}">
	                                <c:if test="${i == currentPage}">
	                                    <li class="active">
	                                    	<span>${i}<span class="sr-only">(current)</span></span>
	                                    </li>
	                                </c:if>
	
	                                <c:if test="${i != currentPage}">
	                                    <li><a href="bookList.item?pageNum=${i}">${i}</a></li>
	                                </c:if>
	                            </c:forEach>
	
	                            <!-- 다음블록 / 끝 -->
	                            <c:if test="${pageCount > endPage}">
	                                <li>
	                                	<a href="bookList.item?pageNum=${startPage + pageBlock}"> 
	                                		&raquo; 
	                                	</a>
	                                </li>
	                                <li>
	                                	<a href="bookList.item?pageNum=${pageCount}"> 
	                                		끝
	                                	</a>
	                                </li>
	                            </c:if>
	                        </ul>
                        </div>
                    </div>
                </c:if>
            </div>
        </body>

    </html>