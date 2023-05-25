<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="../../common/setting.jsp" %>
    <%@ include file="../../item/setting.jsp" %>
        <style>
            ul>li {
                margin-right: 25px;
                font-weight: lighter;
                cursor: pointer
            }

            li.active {
                border-bottom: 3px solid silver;
            }

            .item-photo {
                display: flex;
                justify-content: center;
                align-items: center;
                border-right: 1px solid #f6f6f6;
            }

            .menu-items {
                list-style-type: none;
                font-size: 11px;
                display: inline-flex;
                margin-bottom: 0px;
                margin-top: 20px
            }

            .btn-success {
                width: 100%;
                border-radius: 0px;
            }
            
            .btn-warning {
                width: 100%;
                border-radius: 0px;
            }
            

            .section {
                width: 100%;
                margin-left: -15px;
                padding: 2px;
                padding-left: 15px;
                padding-right: 15px;
                background: #f8f9f9
            }

            .title-price {
                margin-top: 30px;
                margin-bottom: 0px;
                color: black
            }

            .title-attr {
                margin-top: 0px;
                margin-bottom: 0px;
                color: black;
            }

            .btn-minus {
                cursor: pointer;
                font-size: 7px;
                display: flex;
                align-items: center;
                padding: 5px;
                padding-left: 10px;
                padding-right: 10px;
                border: 1px solid gray;
                border-radius: 2px;
                border-right: 0px;
            }

            .btn-plus {
                cursor: pointer;
                font-size: 7px;
                display: flex;
                align-items: center;
                padding: 5px;
                padding-left: 10px;
                padding-right: 10px;
                border: 1px solid gray;
                border-radius: 2px;
                border-left: 0px;
            }

            div.section>div {
                width: 100%;
                display: inline-flex;
            }

            div.section>div>input {
                margin: 0px;
                padding-left: 5px;
                font-size: 10px;
                padding-right: 5px;
                max-width: 18%;
                text-align: center;
            }

            .attr,
            .attr2 {
                cursor: pointer;
                margin-right: 5px;
                height: 20px;
                font-size: 10px;
                padding: 2px;
                border: 1px solid gray;
                border-radius: 2px;
            }

            .attr.active,
            .attr2.active {
                border: 1px solid orange;
            }

            @media (max-width: 426px) {
                .container {
                    margin-top: 0px !important;
                }
                .container>.row {
                    padding: 0px !important;
                }
                .container>.row>.col-xs-12.col-sm-5 {
                    padding-right: 0px;
                }
                .container>.row>.col-xs-12.col-sm-9>div>p {
                    padding-left: 0px !important;
                    padding-right: 0px !important;
                }
                .container>.row>.col-xs-12.col-sm-9>div>ul {
                    padding-left: 10px !important;
                }
                .section {
                    width: 104%;
                }
                .menu-items {
                    padding-left: 0px;
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
        <br><br>
            <div class="container">
                <!-- Simple Pricing Tables -->
                <div class="row">
                    <div class="col-xs-4 item-photo">
                        <img style="max-width:100%;" src="${project}/item/${bdto.book_img}" />
                    </div>
                    <div class="col-xs-5" style="border:0px solid gray">
                        <!-- 제목 -->
                        <h3>
                            ${bdto.book_title}
                            <br>
                            <c:if test="${bdto.book_origin != null}">
                                <small>${bdto.book_origin}</small>
                            </c:if>
                        </h3>
                        <h4 style="color:#337ab7">저자 : <a href="#">${bdto.book_author}</a>
                            <c:if test="${bdto.book_trans != null}">
                                <small style="color:#337ab7"> · (역자 : ${bdto.book_trans})</small>
                            </c:if>
                        </h4>

                        <!-- 도서정보 -->
                        <hr>
                        <h6>도서정보</h6>
                        <h5>ISBN: ${bdto.book_isbn}</h5>
                        <h5>도서분류: ${bdto.catbig} > ${bdto.catmid}</h5>
                        <h5>키워드 : <a class="btn btn-link">${bdto.book_keyword}</a></h5>
                        <h5>대여한 날짜 : ${rdto.rend_start}</h5>
                        <h5>반납일 : ${rdto.rend_end}</h5>

                        <!-- 버튼 -->
                        <div class="section" style="padding-bottom:20px;">
                        	<form id="returnform" name="returnform" action="returnBookPro.item" method="post" onsubmit="return rCheck();">
                        		<input type="hidden" name="book_id" id="book_id" value="${bdto.book_id}">
                        		<input type="hidden" name="check" id="check" value="${check}">
                        		<input type="hidden" name="book_title" id="book_title" value="${bdto.book_title}">
                        		<input type="hidden" name="book_origin" id="book_origin" value="${bdto.book_origin}">
                        		<input type="hidden" name="rend_start" id="rend_start" value="${rdto.rend_start}">
                        		<input type="hidden" name="rend_end" id="rend_end" value="${rdto.rend_end}">
                        		<input type="hidden" name="cnt" id="cnt" value="2">
                        		<c:if test="${check <= 0}">
	                        		<button type="submit" class="btn btn-success">
	                        			<span style="margin-right:20px" class="glyphicon glyphicon glyphicon-share-alt"></span>
	                        			반납하기
	                        		</button>
                        		</c:if>
                        		<c:if test="${check > 0}">
                        			<!-- <input style="margin-right:20px" type="submit" class="btn btn-warning" value="반납하기"> -->
 	                        		<button type="submit" class="btn btn-warning" onclick="returnCheck();">
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
