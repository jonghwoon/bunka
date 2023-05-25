<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<c:if test="${project==null}">
	<c:set var ="project" value="/center/resources"/>
	<script type ="text/javascript" src="${project}/common/js/jquery-3.2.1.js"></script>
	<script type ="text/javascript" src="${project}/common/script.js"></script>
	<script type ="text/javascript" src="${project}/common/script_makeView.js"></script>	
	<link rel="stylesheet" type="text/css" href="${project}/common/style.css">
 
</c:if>

<!-- 필요시 각자의 setting 과 style 은 따로 로드한다. ex: setting_art.jsp / style_art.css -->

