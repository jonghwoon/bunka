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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

    <body onload="loadPage('menu_load','menu_top.common');">
      <div id="menu_load"></div>
       <br>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-4">
                <h1>도서목록</h1>
                <hr>
            </div>
            <div class="col-md-4">
            	<br>
				<a class="btn btn-primary btn-lg" href="/center/bookInsert.item">도서등록</a>
			</div>
        </div>
        <div class="container">
            <div class="col-md-9 col-md-pull-3">
                <section class="search-result-item">
                    <a class="image-link" href="#"><img height="215px" class="image" src="${project}/item/${dto.book_img}">
                    </a>
                    <div class="search-result-item-body">
                        <div class="row">
                            <div class="col-sm-9">
                                <h4 class="search-result-item-heading"><a href="#">서울에서 월스트리트로</a></h4>
                                <p class="info">저자, 역자</p>
                                <p class="description">
									 발행처 :
                                </p>
                                <p class="description">
                                	발행일 :
                                </p>
                                <p class="description">
                                	반입일 :
                                </p>
                                <p class="description">
                                	목차/내용 etc..
                                </p>
                            </div>
                            <div class="col-sm-3 text-align-center">
                                <p class="value3 mt-sm">분류 : </p>
                                <p class="fs-mini text-muted">대분류/중분류</p>
                                <a class="btn btn-primary btn-info btn-sm" href="#">상세 정보보기</a>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="search-result-item">
                    <a class="image-link" href="#"><img height="215px" class="image" src="${project}/item/book_4.jpg">
                    </a>
                    <div class="search-result-item-body">
                        <div class="row">
                            <div class="col-sm-9">
                                <h4 class="search-result-item-heading"><a href="#">서울에서 월스트리트로</a></h4>
                                <p class="info">저자, 역자</p>
                                <p class="description">
                                    발행처 :
                                </p>
                                <p class="description">
                                    발행일 :
                                </p>
                                <p class="description">
                                    반입일 :
                                </p>
                                <p class="description">
                                    목차/내용 etc..
                                </p>
                            </div>
                            <div class="col-sm-3 text-align-center">
                                <p class="value3 mt-sm">분류 : </p>
                                <p class="fs-mini text-muted">대분류/중분류</p>
                                <a class="btn btn-primary btn-info btn-sm" href="#">상세 정보보기</a>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="search-result-item">
                    <a class="image-link" href="#"><img height="215px" class="image" src="${project}/item/book_3.jpg">
                    </a>
                    <div class="search-result-item-body">
                        <div class="row">
                            <div class="col-sm-9">
                                <h4 class="search-result-item-heading"><a href="#">서울에서 월스트리트로</a></h4>
                                <p class="info">저자, 역자</p>
                                <p class="description">
                                    발행처 :
                                </p>
                                <p class="description">
                                    발행일 :
                                </p>
                                <p class="description">
                                    반입일 :
                                </p>
                                <p class="description">
                                    목차/내용 etc..
                                </p>
                            </div>
                            <div class="col-sm-3 text-align-center">
                                <p class="value3 mt-sm">분류 : </p>
                                <p class="fs-mini text-muted">대분류/중분류</p>
                                <a class="btn btn-primary btn-info btn-sm" href="#">상세 정보보기</a>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="search-result-item">
                    <a class="image-link" href="#"><img height="215px" class="image" src="${project}/item/book_2.jpg">
                    </a>
                    <div class="search-result-item-body">
                        <div class="row">
                            <div class="col-sm-9">
                                <h4 class="search-result-item-heading"><a href="#">서울에서 월스트리트로</a></h4>
                                <p class="info">저자, 역자</p>
                                <p class="description">
                                    발행처 :
                                </p>
                                <p class="description">
                                    발행일 :
                                </p>
                                <p class="description">
                                    반입일 :
                                </p>
                                <p class="description">
                                    목차/내용 etc..
                                </p>
                            </div>
                            <div class="col-sm-3 text-align-center">
                                <p class="value3 mt-sm">분류 : </p>
                                <p class="fs-mini text-muted">대분류/중분류</p>
                                <a class="btn btn-primary btn-info btn-sm" href="#">상세 정보보기</a>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- 페이지 컨트롤 -->
                <div class="text-align-center">
                    <ul class="pagination pagination-sm">
                        <li class="disabled"><a href="#">Prev</a>
                        </li>
                        <li class="active"><a href="#">1</a>
                        </li>
                        <li><a href="#">2</a>
                        </li>
                        <li><a href="#">3</a>
                        </li>
                        <li><a href="#">4</a>
                        </li>
                        <li><a href="#">5</a>
                        </li>
                        <li><a href="#">Next</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </body>

    </html>