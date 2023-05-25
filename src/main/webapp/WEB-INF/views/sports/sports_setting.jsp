<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 자바스크립트와 css의 위치 -->
<!-- 기본 패키지 spring.mvc.member의 3번째 이름(=member)이 context name -->
<c:set var="sports" value="/center/resources/sports/" />


<script>
function loadground(div,urls,datas,form){
	
    $.ajax({
        data :{name : datas}
        ,type : 'post'
        ,url  : urls
        ,success: function(response) {				
            $("#"+div).html(response);
        }
    });
}
</script>
<%-- <script src="${sports}script.js"></script> --%>
<%-- <link type="text/css" rel="stylesheet" href="${sports}style.css"> --%>

