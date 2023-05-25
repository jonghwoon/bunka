<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../common/setting.jsp"%>
<%@ include file="setting.jsp" %>

            <head>
                <title></title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <style>
                     /* 검색창 */
            
            #custom-search-input {
                margin: 0;
                margin-top: 10px;
                padding: 0;
            }
            
            #custom-search-input .search-query {
                padding-right: 3px;
                padding-right: 4px \9;
                padding-left: 3px;
                padding-left: 4px \9;
                /* IE7-8 doesn't have border-radius, so don't indent the padding */
                margin-bottom: 0;
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                border-radius: 3px;
            }
            
            #custom-search-input button {
                border: 0;
                background: none;
                /** belows styles are working good */
                padding: 2px 5px;
                margin-top: 2px;
                position: relative;
                left: -28px;
                /* IE7-8 doesn't have border-radius, so don't indent the padding */
                margin-bottom: 0;
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                border-radius: 3px;
                color: #D9230F;
            }
            
            .search-query:focus+button {
                z-index: 3;
            }
            /*슬라이더*/
            
            * {
                margin: 0;
                padding: 0;
            }
            
            body {
                font-family: arial, verdana, tahoma;
            }
            /*
Width of image : 500;
Width of hovered image: 500
Width of unhovered image: 25x;
Width of container : 500 + 50*4 = 700px;
Default 700/5 : 140px;
*/
            
            .accordian {
                width: 705px;
                height: 333px;
                overflow: hidden;
                margin: 100px auto;
                -webkit-box-shadow: 0 8px 6px -6px black;
                -moz-box-shadow: 0 8px 6px -6px black;
                box-shadow: 0px 8px 2px -6px black;
            }
            
            .accordian ul {}
            
            .accordian li {
                position: relative;
                display: block;
                width: 140px;
                float: left;
                border-left: 1px solid #888;
                transition: all 0.5s;
                -webkit-transition: all 0.5s;
                -moz-transition: all 0.5s;
            }
            
            .accordian ul:hover li {
                width: 50px;
            }
            
            .accordian ul li:hover {
                width: 500px;
            }
            
            .accordian li img {
                display: block;
            }
            
            .image_title {
                position: absolute;
                left: 0;
                bottom: 0;
                width: 500px;
            }
            
            .image_title a {
                display: block;
                color: #fff;
                text-decoration: none;
                padding: 20px;
                font-size: 16px;
            }
                </style>
            </head>

<body onload="loadPage('menu_load','menu_top.common');">
	<div id="menu_load"></div>
		<br>
          <div class="container">
            <br>
            <div class="row">
            <div class="col-md-2"></div>    
                <div class="col-md-10">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                     	자료검색&nbsp;<span class="caret"></span>
                		</button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="/center/bookList.item">소장자료</a></li>
                            <li><a href="/center/bookList.item">신작자료</a></li>
                            <li><a href="/center/bookList.item">추천도서</a></li>
                            <li><a href="/center/bookList.item">베스트도서</a></li>
                        </ul>
                    </div>

                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                     	도서관이용&nbsp;<span class="caret"></span>
                		</button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="rendList.item">대여목록</a></li>
                            <li><a href="reservList.item">예약확인</a></li>
                        </ul>
                    </div>

                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                   	  이용안내&nbsp;<span class="caret"></span>
                		</button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="guide.item">이용시간/휴일안내</a></li>
                            <li><a href="#">열람실이용</a></li>
                        </ul>
                    </div>

                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                   	  도서관서비스&nbsp;<span class="caret"></span>
                		</button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">상호대차</a></li>
                            <li><a href="#">희망도서 신청</a></li>
                        </ul>
                    </div>

                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	 참여마당&nbsp;<span class="caret"></span>
                		</button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="/center/bbs.item">도서관소식</a></li>
                            <li><a href="/center/bbs.item">Q&A</a></li>
                            <li><a href="/center/bbs.item">자주묻는질문</a></li>
                            <li><a href="/center/bbs.item">이용자서평</a></li>
                        </ul>
                    </div>

                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	 도서관소개&nbsp;<span class="caret"></span>
                		</button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">인사말</a></li>
                            <li><a href="#">도서관현황</a></li>
                            <li><a href="#">도서관A</a></li>
                            <li><a href="#">도서관B</a></li>
                            <li><a href="#">도서관C</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <br>

        <!-- 검색바 -->
        <div class="container">
            <div class="row">
                <div class="col-md-8"></div>
                <div class="col-md-3">
                    <div class="btn btn-group">
                    	<button class="btn btn-info" onclick="advSearch();">
                    		<span class=" glyphicon glyphicon-search"></span>
                    		&nbsp;상세검색
                    	</button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div id="custom-search-input">
                    <div class="col-md-2"></div>
                    <div class="input-group col-md-8">
                        <input type="text" class="  search-query form-control" placeholder="Search" />
                        <span class="input-group-btn">
                                    <button class="btn btn-danger" type="button">
                                        <span class=" glyphicon glyphicon-search"></span>
                        </button>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <!-- 추천 도서-->
        <div class="accordian">

            <h3>추천도서</h3>
            <hr>
            <ul>
                <li>
                    <div class="image_title">
                        <a href="#">추천도서 1</a>
                    </div>
                    <a href="#">
                        <dl>
                            <dt>제목 : 어쩌고</dt>
                            <dd>설명 : 저자/역자/발행일/등등등...</dd>
                        </dl>
                        <img src="${project}/item/book_2.jpg" style="width: 80%">
                    </a>
                </li>
                <li>
                    <div class="image_title">
                        <a href="#">추천도서 2</a>
                    </div>
                    <a href="#">
                        <dl>
                            <dt>제목 : 어쩌고</dt>
                            <dd>설명 : 저자/역자/발행일/등등등...</dd>
                        </dl>
                        <img src="${project}/item/book_3.jpg" style="width: 80%">
                    </a>
                </li>
                <li>
                    <div class="image_title">
                        <a href="#">추천도서 3</a>
                    </div>
                    <a href="#">
                        <dl>
                            <dt>제목 : 어쩌고</dt>
                            <dd>설명 : 저자/역자/발행일/등등등...</dd>
                        </dl>
                        <img src="${project}/item/book_4.jpg" style="width: 80%">
                    </a>
                </li>
                <li>
                    <div class="image_title">
                        <a href="#">추천도서 4</a>
                    </div>
                    <a href="#">
                        <dl>
                            <dt>제목 : 어쩌고</dt>
                            <dd>설명 : 저자/역자/발행일/등등등...</dd>
                        </dl>
                        <img src="${project}/item/book_5.jpg" style="width: 80%">
                    </a>
                </li>
                <li>
                    <div class="image_title">
                        <a href="#">추천도서 5</a>
                    </div>
                    <a href="#">
                        <dl>
                            <dt>제목 : 어쩌고</dt>
                            <dd>설명 : 저자/역자/발행일/등등등...</dd>
                        </dl>
                        <img src="${project}/item/book_6.jpg" style="width: 80%">
                    </a>
                </li>
            </ul>
        </div>
</body>

</html>