<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="circle" value="./resources/circle/" />
<script type ="text/javascript" src="${circle}js/script.js"></script>
<script type ="text/javascript" src="${circle}js/jquery.twbsPagination.js"></script>
<script type ="text/javascript" src="${circle}js/respond.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${circle}js/bootstrap.js"></script>
<script src="${circle}js/jquery.min.js"></script>
<script src="${circle}js/jquery.poptrox.min.js"></script>
<script src="${circle}js/jquery.scrolly.min.js"></script>
<script src="${circle}js/jquery.scrollex.min.js"></script>
<script src="${circle}js/skel.min.js"></script>
<script src="${circle}js/util.js"></script>
<script src="${circle}js/main.js"></script>
    
<!-- 마우스 오른쪽 사용 금지 스크립트 -->
<script type="text/javascript">
function init() {
	loadPage('circlemenu_load','circlemenu.circle',null,'sync');
	topMenuLoad();
}
</script>
<script type="text/javascript">
var message = "";

function clickIE() {
    if (document.all) {
        (message);
        return false;
    }
}

function clickNS(e) {
    if (document.layers || (document.getElementById && !document.all)) {
        if (e.which == 2 || e.which == 3) {
            (message);
            return false;
        }
    }
}
if (document.layers) {
    document.captureEvents(Event.MOUSEDOWN);
    document.onmousedown = clickNS;
} else {
    document.onmouseup = clickNS;
    document.oncontextmenu = clickIE;
}

document.oncontextmenu = new Function("return false")
</script> 
<!-- 마우스 오른쪽 사용 금지 스크립트 끝-->
    <!-- Bootstrap Core CSS -->
    <link href="${circle}css/bootstrap.min.css" rel="stylesheet">

<style>
#footer { background-color:#F6F6F6; margin:10px 0px;
          -moz-border-radius:10px;  -webkit-border-radius:10px; padding:30px;
          width:100%; margin:0px auto; text-align: center;}
</style>

  <!-- 
	필요시 각자의 setting 과 style 은 따로 로드한다. ex: art_setting.jsp / art_style.css
 -->
