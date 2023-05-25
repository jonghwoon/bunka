<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="../../common/setting.jsp" %>
    <%@ include file="setting.jsp" %>
    <script type ="text/javascript" src="${project}/item/js/bookInsert.js"></script>
    <style>
        /* The switch - the box around the slider */
        
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }
        /* Hide default HTML checkbox */
        
        .switch input {
            display: none;
        }
        /* The slider */
        
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }
        
        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }
        
        input:checked+.slider {
            background-color: #2196F3;
        }
        
        input:focus+.slider {
            box-shadow: 0 0 1px #2196F3;
        }
        
        input:checked+.slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }
        /* Rounded sliders */
        
        .slider.round {
            border-radius: 34px;
        }
        
        .slider.round:before {
            border-radius: 50%;
        }
        
        .hide {
            display: none;
        }
        
        .btn-large {
            padding: 11px 19px;
            font-size: 17.5px;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
        }
    </style>

    <script type="text/javascript">
        function subList(sVal) {
            var f = document.bookInsert;
            var opt = $("#selectsub option").length;

            if (sVal == "") {
                num = new Array("소분류");
                vnum = new Array("");
            } else if (sVal == "000") {
                num = new Array("총류", "도서학,서지학", "문헌정보학", "백과사전", "강연집,수필집,연설문집", "일반 연속 간행물", "일반 학회, 단체, 협회, 기관", "신문, 저널리즘", "일반전집, 총서", "향토자료");
                vnum = new Array("000", "010", "020", "030", "040", "050", "060", "070", "080", "090");
            } else if (sVal == "100") {
                num = new Array("철학", "형이상학", "인신록, 인과록, 인간학", "철학의 체계", "경학", "동양철학, 사상", "서양철학", "논리학", "심리학", "윤리학, 도덕철학");
                vnum = new Array("100", "110", "120", "130", "140", "150", "160", "170", "180", "190");
            } else if (sVal == "200") {
                num = new Array("종교", "비종교학", "불교", "기독교", "도교", "천도교", "", "힌두교,브라만교", "이슬람교(회교)", "기타 제종교");
                vnum = new Array("200", "210", "220", "230", "240", "250", "260", "270", "280", "290");
            } else if (sVal == "300") {
                num = new Array("사회과학", "통계자료", "경제학", "사회학, 사회문제", "정치학", "행정학", "법학", "교육학", "풍속,예절", "국방,군사");
                vnum = new Array("300", "310", "320", "330", "340", "350", "360", "370", "380", "390");
            } else if (sVal == "400") {
                num = new Array("자연과학", "수학", "물리학", "화학", "천문학", "지구과학", "광물학", "생명과학", "식물학", "동물학");
                vnum = new Array("400", "410", "420", "430", "440", "450", "460", "470", "480", "490");
            } else if (sVal == "500") {
                num = new Array("기술과학", "의학", "농업,농학", "공학,공업", "건축공학", "기계공학", "전기공학,전자공학", "화학공학", "제조업", "생활과학");
                vnum = new Array("500", "510", "520", "530", "540", "550", "560", "570", "580", "590");
            } else if (sVal == "600") {
                num = new Array("예술", "", "조각 및 조형미술", "공예, 장식미술", "서예", "회화,도화", "사진예술", "음악", "공연예술 및 매체예술", "오락, 스포츠");
                vnum = new Array("600", "610", "620", "630", "640", "650", "660", "670", "680", "690");
            } else if (sVal == "700") {
                num = new Array("언어", "한국어", "중국어", "일본어 및 기타 아시아제어", "영어", "독일어", "프랑스어", "스페인어", "이탈리아어", "기타 제어");
                vnum = new Array("700", "710", "720", "730", "740", "750", "760", "770", "780", "790");
            } else if (sVal == "800") {
                num = new Array("문학", "한국문학", "중국문학", "일본문학 및 기타 아시아제문학", "영미문학", "독일문학", "프랑스문학", "스페인문학", "이탈리아문학", "기타 제문학");
                vnum = new Array("800", "810", "820", "830", "840", "850", "860", "870", "880", "890");
            } else if (sVal == "900") {
                num = new Array("역사", "아시아", "유럽", "아프리카", "북아메리카", "남아메리카", "오세아니아, 양극지방", "", "지리", "전기");
                vnum = new Array("900", "910", "920", "930", "940", "950", "960", "970", "980", "990");
            }

            for (var i = 0; i < opt; i++) {
                f.selectsub.options[0] = null;
            }

            for (k = 0; k < num.length; k++) {
                f.selectsub.options[k] = new Option(num[k], vnum[k]);
            }
        }
        
		$(function(){
	        $('#imageUpload').change(function() {
	            readImgUrlAndPreview(this);
	
	            function readImgUrlAndPreview(input) {
	                if (input.files && input.files[0]) {
	                    var reader = new FileReader();
	                    reader.onload = function(e) {
	                        $('#imagePreview').attr('src', e.target.result);
	                    }
	                };
	                reader.readAsDataURL(input.files[0]);
	            }
	        });
		});
    </script>

    <head>
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

    <body onload="loadPage('menu_load','menu_top.common');">
        <div id="menu_load"></div>
        <div class="row">
        <br><br>
            <div class="col-md-2"></div>
            <div class="col-md-9">
                <form action="bookInsertPro.item" method="post"
                 id="bookInsert" name="bookInsert" class="form-horizontal"
                 onsubmit="return bookInsertCheck();">
                    <fieldset>

                        <!-- Form Name -->
                        <legend>도서 등록</legend>


                        <!-- 이미지 -->
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-5">
                                    <img src="" id="imagePreview" alt="미리보기" width="120px" height="120px" />
                                    <input type="file" name="imageUpload" id="imageUpload" class="hide" /><br>
                                    <label for="imageUpload" class="btn btn-default">이미지 선택</label>
                                </div>
                            </div>
                        </div>
                        <!-- 도서관 선택 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="library">도서관 선택</label>
                            <div class="col-md-2">
                                <select id="library" name="library" class="form-control">
						      <option value="">선택</option>
						      <option value="1">도서관A</option>
						      <option value="2">도서관B</option>
						      <option value="3">도서관C</option>
						    </select>
                            </div>
                            <!-- 수량 -->
                            <label class="col-md-1 control-label" for="value">수량</label>
                            <div class="col-md-2">
                                <input id="value" name="value" type="number" placeholder="수량" class="form-control input-md" min="1">
                            </div>

                        </div>

                        <!-- 제목 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="title">제목</label>
                            <div class="col-md-5">
                                <input id="title" name="title" type="text" placeholder="제목" class="form-control input-md">
                            </div>
                        </div>

                        <!-- 원서명 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="origin">원서명</label>
                            <div class="col-md-5">
                                <input id="origin" name="origin" type="text" placeholder="원서명" class="form-control input-md">
                            </div>
                        </div>

                        <!-- 저자 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="author">저자</label>
                            <div class="col-md-5">
                                <input id="author" name="author" type="text" placeholder="저자" class="form-control input-md">
                            </div>
                        </div>

                        <!-- 역자 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="trans">역자</label>
                            <div class="col-md-5">
                                <input id="trans" name="trans" type="text" placeholder="역자" class="form-control input-md">
                            </div>
                        </div>

                        <!-- 출판사 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="publisher">출판사</label>
                            <div class="col-md-5">
                                <input id="publisher" name="publisher" type="text" placeholder="출판사" class="form-control input-md">
                            </div>
                        </div>

                        <!-- 키워드 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="keyword">키워드</label>
                            <div class="col-md-5">
                                <input id="keyword" name="keyword" type="text" placeholder="키워드" class="form-control input-md">
                            </div>
                        </div>

                        <!-- ISBN -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="isbn">ISBN</label>
                            <div class="col-md-5">
                                <input id="isbn" name="isbn" type="text" placeholder="ISBN" class="form-control input-md">
                            </div>
                        </div>

                        <!-- 발행날짜 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="publishDate">발행일</label>
                            <div class="col-md-2">
                                <input id="publishDate" name="publishDate" type="text" placeholder="발행일" class="form-control input-md">
                            </div>
                            <!-- 입고일 -->
                            <label class="col-md-1 control-label" for="incomedate">반입일</label>
                            <div class="col-md-2">
                                <input id="incomedate" name="incomedate" type="text" placeholder="반입일" class="form-control input-md">
                            </div>
                            
                        </div>
                        <script type="text/javascript">
                            $(function() {
                                $('#publishDate').datepicker({
                                    format: 'yyyy-mm-dd',
                                    language: 'ko',
                                    autoclose: true,
                                    altField: '#publishDate'
                                });
                            });
                            
                            $(function() {
                                $('#incomedate').datepicker({
                                    format: 'yyyy-mm-dd',
                                    language: 'ko',
                                    autoclose: true,
                                    altField: '#incomedate'
                                });
                            });
                        </script>

                        <!-- 목차 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="index">목차</label>
                            <div class="col-md-5">
                                <textarea id="index" name="index" placeholder="목차" class="form-control input-md"></textarea>
                            </div>
                        </div>

                        <!-- 카테고리 -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="selectbasic">대분류</label>
                            <div class="col-md-2">
                                <select id="selectbasic" name="selectbasic" class="form-control" onchange="subList(this.value)">
                             <option value="">대분류</option>
                             <option value="000">총류</option>
                             <option value="100">철학</option>
                             <option value="200">종교</option>
                             <option value="300">사회과학</option>
                             <option value="400">자연과학</option>
                             <option value="500">기술과학</option>
                             <option value="600">예술</option>
                             <option value="700">언어</option>
                             <option value="800">문학</option>
                             <option value="900">역사</option>
						    </select>
                            </div>

                            <label class="col-md-1 control-label" for="selectsub">중분류</label>
                            <div class="col-md-2">
                                <select id="selectsub" name="selectsub" class="form-control">
                             <option value="">중분류</option>
						    </select>
                            </div>
                        </div>
                        <!-- Button -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="submit"></label>
                            <div class="col-md-8 text-center">
                                <button id="submit" name="submit" class="btn btn-primary">입력</button>
                                <input type="reset" class="btn btn-danger" value="초기화">
                                <a class="btn btn-default" href="/center/bookList.item">이전</a>
                            </div>
                        </div>

                    </fieldset>
                </form>
            </div>
        </div>
    </body>

    </html>