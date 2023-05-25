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
            $(document).ready(function () {

                var parentsData = {
                    "success": true,
                    "parents": [{
                        "id": 1531,
                        "Firstname": "Austin",
                        "Surname": "Ana\u00eblle",
                        "schoolId": "046039",
                        "schoolName": "ARCAMBAL",
                        "commune": "ARCAMBAL"
                    }, {
                        "id": 2032,
                        "Firstname": "Ramos",
                        "Surname": "L\u00e8i",
                        "schoolId": "046043",
                        "schoolName": "J CALVET",
                        "commune": "CAHORS"
                    }, {
                        "id": 3036,
                        "Firstname": "Baker",
                        "Surname": "Salom\u00e9",
                        "schoolId": "046043",
                        "schoolName": "Z LAFAGE",
                        "commune": "CAHORS"
                    }, {
                        "id": 1724,
                        "Firstname": "Berry",
                        "Surname": "Marl\u00e8ne",
                        "schoolId": "046044",
                        "schoolName": "J CALVET",
                        "commune": "CAHORS"
                    }]
                };

                var $table = $('.js-table');

                $table.find('.js-view-parents').on('click', function (e) {
                    e.preventDefault();
                    var $btn = $(e.target),
                        $row = $btn.closest('tr'),
                        $nextRow = $row.next('tr.expand-child');

                    $btn.toggleClass('glyphicon-eye-close glyphicon-eye-open');
                    // if .expand-chid row exist already, toggle
                    if ($nextRow.length) {
                        $nextRow.toggle($btn.hasClass('glyphicon-eye-open'));
                        // if not, create .expand-child row
                    } else {
                        /*$.ajax({
                            url: '/echo/json/',
                            dataType: "json",
                            data: parentsData,
                            success: function (parentsData) {*/
                        var newRow = '<tr class="expand-child" id="collapse' + $btn.data('id') + '">' +
                            '<td colspan="12">' +
                            '<table class="table table-condensed table-bordered" width=100% >' +
                            '<thead>' +
                            '<tr>' +
                            '<th>Surname</th>' +
                            '<th>FirstName</th>' +
                            '<th>School Id</th>' +
                            '<th>School name</th>' +
                            '</tr>' +
                            '</thead>' +
                            '<tbody>';

                        if (parentsData.parents) {
                            $.each(parentsData.parents, function (i, parent) {
                                newRow += '<tr>' +
                                    '<td>' + parent.Firstname + '</td>' +
                                    '<td>' + parent.Surname + '</td>' +
                                    '<td>' + parent.schoolId + '</td>' +
                                    '<td>' + parent.schoolName + ' ' + parent.commune + '</td>' +
                                    '</tr>';
                            });
                        }
                        newRow += '</tbody></table></td></tr>';
                        // set next row
                        $nextRow = $(newRow).insertAfter($row);


                        /*}
                            });*/
                    }
                });

            });
        </script>

        <head>
            <title></title>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
        </head>

        <body onload="loadPage('menu_load','menu_top.common');">
        <div id="menu_load"></div>
            <div class="container">
                <!-- Simple Pricing Tables -->
                <div class="row">
                <br><br>
                    <div class="col-xs-4 item-photo">
                        <img style="max-width:100%;" src="${project}/item/${dto.book_img}" />
                    </div>
                    <div class="col-xs-5" style="border:0px solid gray">
                        <!-- 제목 -->
                        <h3>
                            ${dto.book_title}
                            <br>
                            <c:if test="${dto.book_origin != null}">
                                <small>${dto.book_origin}</small>
                            </c:if>
                        </h3>
                        <h4 style="color:#337ab7">저자 : <a href="#">${dto.book_author}</a>
                            <c:if test="${dto.book_trans != null}">
                                <small style="color:#337ab7"> · (역자 : ${dto.book_trans})</small>
                            </c:if>
                        </h4>

                        <!-- 도서정보 -->
                        <hr>
                        <h6>도서정보</h6>
                        <h5>ISBN: ${dto.book_isbn}</h5>
                        <h5>도서분류: ${dto.catbig} > ${dto.catmid}</h5>
                        <h5>키워드 : <a class="btn btn-link">${dto.book_keyword}</a></h5>

                        <!-- 버튼 -->
                        <div class="section" style="padding-bottom:20px;">
                        	<form action="rendBook.item" method="post">
                        		<input type="hidden" name="book_id" id="book_id" value="${dto.book_id}">
                        		<input type="hidden" name="catbig" id="catbig" value="${dto.catbig}">
                        		<input type="hidden" name="catmid" id="catmid" value="${dto.catmid}">
                        		<input type="hidden" name="pageNum" id="pageNum" value="${pageNum}">
                        		<input type="hidden" name="number" id="number" value="${number}">
                        		<input type="hidden" name="rend_key" id="rend_key" value="${rend_key}">
                        		<button type="submit" class="btn btn-success">
                        			<span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart"></span>
                        			대출하러가기
                        		</button>
                        	</form>
                        	<c:if test="${id eq 'admin'}">
                        		<br>
                        		<div class="btn btn-toolbar">
	                        		<div class="bnt btn-group">
		                        		<form action="updateBook.item" method="post">
		                        			<input type="hidden" name="book_id" id="book_id" value="${dto.book_id}">
		                        			<button type="submit" class="btn btn-info">
			                        			<span style="margin-right:20px" class="glyphicon glyphicon-retweet"></span>
			                        			도서수정
			                        			<span style="margin-right:20px"></span>
		                        			</button>
		                        		</form>
		                        	</div>
		                        	
		                        	<div class="bnt btn-group">
		                        		<form action="deleteBookPro.item" method="post" onsubmit="return delBook();">
		                        		<input type="hidden" name="book_id" id="book_id" value="${dto.book_id}">
		                        			<button type="submit" class="btn btn-danger">
			                        			<span style="margin-right:20px" class="glyphicon glyphicon glyphicon-remove"></span>
			                        			도서삭제
			                        			<span style="margin-right:20px"></span>
		                        			</button>
		                        		</form>
		                        	</div>	
                        		</div>
                        	</c:if>
                        </div>
                        <hr>
                        <div>
                        	<button class="btn btn-default btn-md" onclick="goBack();">뒤로가기</button>
                        </div>
                        
                    </div>

                    <div class="col-xs-9">
                        <ul class="menu-items">
                            <li class="active">목차</li>
                        </ul>
                        <div style="width:100%;border-top:1px solid silver">
                            <br><br>
                            <p>
                                ${dto.book_index}
                            </p>
                        </div>
                    </div>
                    <br>
                    <hr>
                    <div class="col-xs-9">
                        <table class="table table-striped table-hover js-table">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>등록번호</th>
                                    <th>소장위치</th>
                                    <th>도서상태</th>
                                    <th>반납예정일</th>
                                	<th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr data-toggle="collapse" data-target="#collapse4039" class="clickable">
                                    <td>1</td>
                                    <td>c12</td>
                                    <td>A도서관</td>
                                    <td>대출가능</td>
                                    <td>2017-07-27</td>
                                    <td>
                                        <div class="btn-group btn-group-sm" role="group" aria-label="...">
                                            <div class="btn-group " role="group" aria-label="Voir le detail">
                                                <a href="#" class="parents js-view-parents" data-href="formation_json_parents" data-id=4039 data-toggle="tooltip" data-placement="top"
                                                    alt="Voir les details" title="Details">
              										<span class="glyphicon glyphicon-eye-close" aria-hidden="true" 
              										style="color:black; margin: 5px;"></span>
            									</a>
                                            </div>

                                            <div class="btn-group " role="group" aria-label="Valider les candidats">
                                                <a href="valider" data-href='' alt="Valider les candidats" data-toggle="tooltip" data-placement="right" title="Valider les candidats">
									              <span class="glyphicon glyphicon-check" aria-hidden="true" 
									              style="color:black; margin: 5px;"></span>
									            </a>
                                            </div>
                                            <div class="btn-group " role="group" aria-label="Imprimer la liste d'emargement pour cette formation">
                                                <a href="/edsa-AgrementEPS/app_dev.php/formation/4039/liste?print=pdf" data-href="" alt="Download PDF list of applicants"
                                                    data-toggle="tooltip" data-placement="right" name="Activités nautiques - 16/10/2016"
                                                    title="Download PDF list of applicants">
									              <span class="glyphicon glyphicon-download-alt" aria-hidden="true" 
									              style="color:black; margin: 5px;"></span>
									            </a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </body>

    </html>
