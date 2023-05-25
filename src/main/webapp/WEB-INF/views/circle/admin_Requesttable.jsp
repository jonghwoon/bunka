<%@ page import="cobra.mvc.center.common.domain.DTO"%>
<%@ page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>

<html>
<%	// 이하 붙여넣기로 합시다. 
	// ================================================================		
		String bigTitle = (String)request.getParameter("bigTitle");
		String subTitle	= (String)request.getParameter("subTitle");
	// 페이지 기본 설정 ===============================================	
		int measureOfPage   = 15;	// 한번에 볼 게시물 수 
		int measureOfSelect = 5;	// 페이지 선택 맥스
		
		// 현재 Url 반환
		String thisUrl = request.getRequestURL().toString();		
			String[] urlArray = thisUrl.split("/");
			thisUrl = urlArray[urlArray.length-1].replace(".jsp", ".circle");
		
	// 서블릿 으로 부터 값 받기 =======================================
	String pageNum = (String)request.getAttribute("pageNum");

	@SuppressWarnings("unchecked")
	ArrayList<DTO> dtos= (ArrayList<DTO>) request.getAttribute("dtos");
	Object tmp;
	
	int thisPage 		= 0;
	int totalBookCount 	= 0; 
	
	tmp = request.getAttribute("nextPage");
	if(tmp == null || tmp =="")
		thisPage=1;
	else if(tmp.getClass()== Integer.class)
		thisPage = (int)tmp;
	else if(tmp.getClass()== String.class)
		thisPage = Integer.parseInt((String)tmp);
	
	tmp = request.getAttribute("cnt");
	if(tmp == null || tmp =="")
		totalBookCount =0;
	else if(tmp.getClass()== Integer.class)
		totalBookCount = (int)tmp;
	else if(tmp.getClass()== String.class)
		totalBookCount = Integer.parseInt((String)tmp);
%>

<body onload="init();">
<div id = "main_title">
<h1>Central Culture System</h1><h2><%=subTitle%></h2>					
</div>

<div id = "mid_menu" >
<form id="menu" method="post">
<table>	
  <tr id="menuTr">
  	<td><input type="button" value="동아리 관리"  		onclick="goAdmin('admin_circle_form.circle')">	</td>
    <td><input type="button" value="회원 관리"  		onclick="goAdmin('admin_member_form.circle')">	</td>
    <td><input type="button" value="신청게시판 관리" 		onclick="goAdmin('admin_board_form.circle')">	</td>
    <td><input type="button" value="질문게시판 관리" 		onclick="goAdmin('admin_qboard_form.circle')">	</td>
    <td><input type="button" value="동아리 가입요청 보기" 	onclick="goAdmin('admin_request_form.circle')">	</td>	
  </tr>  
</table>
</form>
</div>

<script>



var thisUrl = '<%=thisUrl%>';

var dtos = new Array();
<% // 스크립트로 배열 전달하기 =======================================
	DTO dto = (DTO) request.getAttribute("dto");
	if(dtos!=null && dtos.size()!=0)
		for(DTO d : dtos)
			out.println("			dtos.push(new Array(" + d.getValuesForScript() + "));");
%>

var names = new Array();	
<%for(String name :dto.getNames()){%>
	names.push('<%=name%>');
<%}%>

var dto = new Array();	
<%for(String name :dto.getNames()){%>
	dto.push('<%=dto.getValue(name)%>');
<%}%>

var rows = new Array();
var checked = new Array();


// 어드민 페이지 이동 
function goAdmin(nextPage){
	var form  = $("#menu");
	form.attr("action" , nextPage);
	form.submit();
}

// DB 검색에 관련
function clearAdd(){
	$(".a0:input").each(function(){
		$(this).val("");
	})
}

function add(){
	var nextUrl = 'admin_request_addPro.circle';
	var nextPage = $("#mode").val();
	var measureOfPage = '<%= measureOfPage %>';
	
	
	var datas =new Object();	
	for(var i in names){
		var value = $(".a0[name="+names[i]+"]").val();
		if(value!=null || value!="")
			datas[names[i]] = value;
	}
	
	$.ajax({
		//async: true,
		data : datas,	//$("#listForm").serialize(),	//datas,
		type : 'post',
		url  : nextUrl,
		success : function(response){
			$("#secret").html(response);
			clearAdd();
		}
	});
	return false;
}

function clearSearch(){
	$(".s0:input").each(function(){
		$(this).val("");
	})
}

function submitPass(i){$("#mode").val(i); $("#listForm").submit();}

function search(){
	
	// 페이지 준비	=================================
	var nextUrl  = thisUrl;	
	//var mode = typeof mode == "undefined" ? 1 : mode;
	var nextPage = $("#mode").val();
	var measureOfPage = '<%= measureOfPage %>';
	
	// 페이지 클리어, 초기화 
	if(nextPage==0){
		clearSearch();
		nextPage=1;
	}
	// 페이지 기타정보 input 으로 변환 
	$("#listForm").append(
		 "<input type='hidden' name ='nextPage'			value="+ nextPage 		+">"
		+"<input type='hidden' name ='measureOfPage'	value="+ measureOfPage 	+">"
	);
		
	// 페이지 로드 - 는 폼에서 하기로
	//$("#listForm").submit();
	return true;
	
}

function goA(row,msg){//체크항목 모두적용 //나중에 다시 만들어야함. 
	
	for(var i in rows)
		go(row,msg);
}

function go(row,msg){
	
	var urls="";
	switch(msg){
		case "수정"	: urls = 'admin_request_updatePro.circle'; break;
		case "삭제"	: urls = 'admin_request_deletePro.circle';
			if(confirm("["+$(".r"+row).eq(1).val() + "] - 삭제하시겠습니까?"))				
				break; // 삭제는 pro page 에서//			
			else								
				return;
			
		case "초기화"	: 	
			for(var col in names){				
				$(".r"+row+ ":eq("+col+")").val(dtos[row][col]);
				$(".r"+row).css("background-color", "transparent");
				//console.log(dtos[row][col]);
			}	return;
	}
	
	var datas = {}; 	// json 으로!?
			
	for(var i in names){
		var value = $(".r"+row+ ":eq("+i+")").val().trim();		
		datas[names[i]] = value;
		//debug
		 console.log(names[i] +":"+datas[names[i]]);
	}
	
	datas["row"] = row;
	
    $.ajax({ 
    	data: datas, // look here!
        type: 'post',
        url :  urls,
        success: function(response) {
        	$("#secret").html(response);
        	//삭제면 지워주기 // $(".r"+row).remove();	// 결과성공시 분기하여 삭제해줘야한다. // 편의상 
        	//수정이면 노란색 없애주기는 공통 
        	$(".r"+row).css("background-color", "transparent");	// input
        	$(".c"+row).css("background-color", "transparent");	// ceck 
        },
    	error : function(){
    		alert(msg + "데이터 전송에 실패하였습니다. 다시 시도해주세요.")
    	}
    });
    
    
}

$(document).ready(function(){
		
	$(":input").change(function(){
		var row = $(this).attr('class') + "";
			if(row=="s0" || row=="a0")	return;
		var col = $(this).attr('id') + "";;
		row = row.replace("r","");
		col = col.replace("c","");
		 		 
		 $(".r"+row+ ":eq("+col+")").css("background-color","#FFD24D");
		 $(".c"+row).css("background-color","#FFD24D");
	})	
	
	$("input").focus(function(){
		var row = $(this).attr('class') + "";
			if(row=="s0" || row=="a0")	return;
		var par = $("."+row).parents("tr");
		 
		//par.css("border","5px solid #4d6ea4");		 
		par.css("outline", "5px solid #4d6ea4");//.css("transition","0.1s");
		par.css("height","40px").css("transition","0.5s");
		
	})
	
	$("input").focusout(function(){
		//var originH = $(this).height()  + ""; // 너무 측정이 고정되서 되지 않는다. 가변한다. 
		//console.log(originH);
		var row = $(this).attr('class') + "";
			if(row=="s0" || row=="a0")	return;
		var par = $("."+row).parents("tr");
		
		par.css("outline", "0" );//.css("transition","0.1s");
		par.css("height","25px").css("transition","0.3s");
	})
		
})

$(document).keydown(function(){
	
    var key = event.which || event.keyCode;    
    var here = this.activeElement;	//this = document

    var isNotTEXTAREA 	= here.tagName !="TEXTAREA";
    var isNotINPUT		= here.tagName !="INPUT";
  	if(isNotTEXTAREA && isNotINPUT)
  		return;
    
    //alert(key);
	var row = $(here).attr('class')	+ "";	//r or s
	var col = $(here).attr('id') 	+ "";
	console.log(col);
	var row_prefix = row.substr(0,1);
	
	row = Number(row.substr(1));
	col = Number(col.replace("c",""));
	
 	var text_range	= here.selectionStart;
    var text_length	= here.value.length;
	
    switch(key){
		// ↑ up 38
		case 38 : if(row>0)	row -= 1;
	    			else		row_prefix = "s";
					break;
		
		// ↓ down 40   //enter 13 	
		case 13 : if(row_prefix =="s") $("#listForm").submit();
		case 40 : if(row_prefix =="s")	row_prefix = "r";
			    	else					row +=1;	
					break;		
					
		//← left 37 		
		case 37 :	if(text_range == 0 && col>0)	col-=1;
					break;
	    //→ right 39		
		case 39 :	if(text_range == text_length)	col+=1;
					break;
					
		default 	:	//alert(key); 
	}	
	
    console.log(col);
    $("." + row_prefix + row + ":eq("+col+")").focus();
    //console.log("." + row_prefix + row + ":eq("+col+")");
    //rows.push(row);
    
})

 


function init(){
	
	// body 모두 로드시 view밝히기 =====================================
	loadBody();	
}

</script>


<%
out.println( "<div id='serachDiv'><table>");

String[] buttons = {"삭제","수정","초기화"};
int col=0;

	// 추가 도구 ===============================================================
	out.println("<form id='addForm' onsubmit='return add()'>");	//out.print("<form type='post' id='listForm' onsubmit=(search() && false)>");
	out.print("<tr id='addTr'>");	
	out.println("<td colspan='2' class = 't0' > "+ bigTitle +"등록 </td>");
	
	col=0;
	for(String name : dto.getNames()){
		out.println("<td height='40'>" + "<input type = 'text' class='a0' id='c"+col+"' placeholder ='"+name+"' name ='"+ name +"'> </td>");
		col++;
	}
	
	out.println("<td><input type ='submit' value ='등록'></td>");
	out.println("<td><input type ='button' value ='등록초기화' onclick= 'submitPass(0)'></td>");
	out.println("<td><input type ='reset'  value ='조건초기화' onclick= 'clearAdd()'></td>");
	out.println("</tr>");
	out.print("</form>");
	
	out.println("<tr>");
	out.println("<td colspan ='"+(col+5)+"'></td>");
	out.println("</tr>");
	
	
	// 검색도구 =======================================================================
	out.println("<form action = '"+thisUrl+"' method='post' id='listForm' onsubmit='return search()'>");	//out.print("<form type='post' id='listForm' onsubmit=(search() && false)>");
	out.print("<tr id = 'searchTr'>");		
	out.println("<td colspan='2' class = 't0' > "+ bigTitle +"색인 </td>");
	
	col=0;
	for(String name : dto.getNames()){
		String value = dto.getValue(name);
		value = value==null || value.equals("0") ? "" : value ;
		out.println("<td height='40'>" + "<input type = 'text' class='s0' id='c"+col+"' placeholder ='"+name+"' name ='"+ name +"' value= '"+ value +"'> </td>");
		col++;
	}
	out.println("<td><input type = 'hidden' value=1 id='mode'>");
	out.print("    <input type ='button' value ='검색'		 onclick= 'submitPass(1)'></td>");				
	out.println("<td><input type ='button' value ='검색초기화' onclick= 'submitPass(0)'></td>");
	out.println("<td><input type ='button' value ='조건초기화' onclick= 'clearSearch()'></td>");
	out.println("</tr>");
	
	
	//항목 타이틀 표시 ==============================================================
	out.print("<tr>");		
	out.println("<td colspan=2><input type ='button' value ='선택"+buttons[0]+"'  onclick=goA('"+buttons[0]+"')></td>");
	col=0;
	for(String name : dto.getNames()){	
		if(col>8 && name.length()>3) name=name.substring(0,3);	// 칸때문에..
		out.println("<td class = 't0' id='t"+col+"'>" + name.toUpperCase() + "</td>");
		col++;
	}
	out.println("<td class = 't0' width=50>체크</td>");
	
	out.println("<td><input type ='button' value ='선택"+buttons[1]+"'	onclick=goA('"+buttons[1]+"')></td>");
	out.println("<td><input type ='button' value ='선택"+buttons[2]+"' 	onclick=goA('"+buttons[2]+"')></td>");
	
	out.println("</tr>");

	//결과 뷰 =======================================================================
	out.print("</form>");
	
int row=0;

if(dtos==null || dtos.size()==0){
	out.println("<tr><td colspan = "+(dto.getNames().length + 5)+"> <center>검색 결과가 없습니다. </center></td></tr>");
}
else	
	for(DTO d : dtos){
		
		out.print("<tr>");	
		out.println("<td align ='center'><input type ='button' value ='"+ buttons[0] +"' onclick=go(" + row + ",'"+ buttons[0] +"')></td>");
		out.println("<td align ='center'><input type ='checkbox'></td>");
		col=0;
		for(String name : d.getNames()){	// Array 와 다르다.
			
			String value = d.getValue(name);
			value = value!=null ? value : "";		
			out.println("<td>" + "<input type = 'text' class='r"+row+"' id='c"+col+"' value ='" + value + "'> </td>");
			col++;
		}
		
		out.println("<td width = 50 class='c"+row+"' id='c"+col+"' ></td>");	// 체크 란
		
		
		out.println("<td align ='center'><input type ='button' value ='"+ buttons[1] +"' onclick=go(" + row + ",'"+ buttons[1] +"')></td>");	
		out.println("<td align ='center'><input type ='button' value ='"+ buttons[2] +"' onclick=go(" + row + ",'"+ buttons[2] +"')></td>");
		out.print("</tr>");
		
		// 수정/ 취소 삭제 버튼 추가  // 비교를 위해 배열로 만들 필요가 있음. 
		row++;
	}
out.println("</table>");
// 페이지 리스트 버튼 
 
	out.println("<div id = 'pageButton'><br>");
		String pageSelect ="";
		int	maxPage  = totalBookCount / measureOfPage;
			maxPage += totalBookCount % measureOfPage!=0 ? 1 : 0;
		
		int	startPage = thisPage -(measureOfSelect/2);
			startPage = startPage > 0 ? startPage : 1;
		
		int	endPage = startPage + measureOfSelect-1;	//	1 2 3 4 5 = 1+5-1
			endPage = endPage > maxPage ? maxPage : endPage ;
			
			startPage = startPage > (endPage - measureOfSelect +1) ? (endPage - measureOfSelect +1) : startPage ;
			startPage = startPage <=0 ? 1 : startPage;
		
		String emptyS = "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
		if(startPage!=1){	// [◀◀] [◀] 
			pageSelect += "<span onclick='submitPass("+1+")' 			>[◀◀]</span>";
			pageSelect += "<span onclick='submitPass("+(startPage-1)+")'>[◀]</span>";
		}
		else
			pageSelect += emptyS;
		
		for(int i=startPage ; i<=endPage ; i++){
			if(i==thisPage)
				pageSelect += "<b><span onclick='submitPass("+i+")' 			>["+ i +"]</span></b>";
			else
				pageSelect += "<span onclick='submitPass("+i+")' 			>["+ i +"]</span>";				
		}
		
		if(endPage!=maxPage){	// [▶] [▶▶]
			pageSelect += "<span onclick='submitPass("+(endPage+1)+")' 	>[▶]</span>";
			pageSelect += "<span onclick='submitPass("+maxPage+")'		>[▶▶]</span>";
		}
		else
			pageSelect += emptyS;
		
		out.println(pageSelect);
	out.println("</div>");
	
out.println("</div>");
%>

<!-- input Style -->
<style>

	* {
		margin : 0px;
		border-spacing: 0px;
	}
	
	h1{	 		
		font-family : quadranta;
		font-size : 4em;
		color : #4d6ea4;		
	}
	
	h2{	 		
		font-family : quadranta;
		font-size : 2em;
		color : #dedcee;		
	}
	
	#main_title {
		padding-top : 30px;
		text-align: center;
		z-index: 490;
		position: absolute;
		//background-color: pink;
		width: 100%;
		height: 120px;
	}
	
	#mid_menu{
		z-index : 500;
		border : none;
		right : 0px;
		position: absolute;
		height : 40px;
	}
	
	#serachDiv{
		display : inline;
		position : absolute;
		
		top : 200px;
		left : 50%;
		transform : translateX(-50%);
		
		height : 600px;
		
		//background-color: red;
	}
	
	#pageButton{
		text-align: center;
		height : 60px;
		width: 100%;			
	}
	
	#pageButton span{
		cursor : pointer;
	}
	
	table{		
		// table-layout:fixed;
		//word-break:break-all;
	}
	body {
		margin: 0;
	}
	#secret{
		visibility: hidden;
	}

	table, tr, td {		
		cursor : text;
		border : 1px solid black;
		
		border-collapse: collapse;
		padding: 0;
	}
	
	tr {
		height : 25px;
	}
	
	 
	td {
		height : 25px; // 느려서 못쓴다. 100% 도 동일;
	} 
	 
	
	input {
		border: none;
		
	}
		
	input[type="text"] {
		padding-left : 5px;
		padding-right: 5px;
		height : 100%;
		
	}
	
	input[type="button"], 
	input[type="submit"], 
	input[type="reset" ] {
		cursor : pointer;
		width : 100%;
		height : 100%;
		font-size : 0.8em;
			
	}
	
	body{
		//background-color: skyblue;
	}
	
	/* TITLES */
	.t0 { 
		background-color: skyblue;
		text-align: center;
		height : 40px;
	} 
	
	
	/* TOP RIGHT SELECT FORM */
	#menuTr {	height : 40px;	border : 5px solid #4d6ea4;	}
		
	/* ADD FORM */
	#addTr {	height : 40px;	border : 5px solid #fbd14b;	}	
	#addTr td:first-child {		background-color:  #fbd14b;	}	
	#addTr td{					border-color: 	   #fbd14b;	}
	
	#searchTr {	height : 40px;	border : 5px solid #4d6ea4;	}
	#searchTr td:first-child {	background-color:  #4d6ea4;	}	
	#searchTr td{				border-color:	   #4d6ea4;	}
	
	/* EMPTY SPACE */
	tr:nth-child(2) {
		border : none;
		height : 30px;
	}
	
	table, tr:nth-child(2) td {
		border : none;
	}
	
	/* SEARCH FORM */
	tr:nth-child(4) {
		border : 5px solid #4d6ea4;
		height : 40px;
	}
	
</style>

<div id='secret'></div>
</body>
</html>