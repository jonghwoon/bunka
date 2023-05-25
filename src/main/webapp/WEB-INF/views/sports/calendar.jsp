<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp"%> 
<%@ page import="java.util.Calendar"%>   
<html>
<style>
	a{
		font-size:12px;
	}
	
	#timeTable{
	  	width:1040px;
	}
	  
	#timeTable td{
		padding-right : 5px;
	  	min-width:140px;
	  	max-width:140px; 
	}
	 	  
  	#timeTable p{
  		text-align : right;
  		margin :  0px;
  		font-size:12px;
  		color : #5937d3;
	}
	#calendar_view{
		margin : 15px;
	}
	
	#calendar_view th{
		background-color : #001c26; 
		color : white;
		text-align: center;
	}
</style>

			<%-- alert('${dto.get(i).getTeam()}');
			alert('${dto.get(i).getTime()}'); --%>
	
<script type="text/javascript">
	
window.addEventListener("onload",calendar_chk());
	

	

	function calendar_chk(){
		var longtime="${time}";
		var longteam="${team}";
		var spl="-";
		var time=[];
		time=longtime.split("-");
		var team=[]; 
		team=longteam.split("-");
	 	for(var m=0; m<time.length-1; m++){
			console.log(time[m]);
			console.log(team[m]);	
		} 
	 	
	 	var timeArray=[
	 	   '07,00~09,00' ,
	 	   '09,00~11,00' ,
	 	   '11,00~13,00' ,
	 	   '13,00~15,00' ,
	 	   '15,00~17,00' ,
	 	   '17,00~19,00' ,
	 	   '19,00~21,00' ,
	 	   '21,00~23,00' ];
	 	
		if(longtime != null){			
			for(var a=0; a<8; a++){
				console.log("time.length"+ time.length);
				for(var i=0; i<time.length-1; i++){
					if(time[i] != null){
						var aaa=time[i];
						var times=aaa.substring(0,1)*1; 
						//console.log("times"+ times);
						//console.log(team[i]);						
						document.getElementById(time[i]).innerHTML=team[i]+"&nbsp;&nbsp;"+ timeArray[times];
						
						
					}
				}
				
			} 
		}else{
			
		}
	}
	
</script>
<body onload="calendar_chk();">
<div id="calendar_view" >
	<%
Calendar cr = Calendar.getInstance();
int year = cr.get(Calendar.YEAR);
int month = cr.get(Calendar.MONTH);
int date = cr.get(Calendar.DATE);
String today = year + ":" +(month+1)+ ":"+date; // 오늘 날짜
// 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
cr.set(year, month, 1);
 
// 셋팅한 날짜로 부터 아래 내용을 구함
 
// 해당 월의 첫날를 구함
int startDate = cr.getMinimum(Calendar.DATE);
 
// 해당 월의 마지막 날을 구함
int endDate = cr.getActualMaximum(Calendar.DATE);
 
// 1일의 요일을 구함
int startDay = cr.get(Calendar.DAY_OF_WEEK);
int count = 0;
%>
<table id="timeTable" cellpadding="2" border="1" align="center">
 <tr height="30">
  <th><font size="2">일</font></th>
  <th><font size="2">월</font></th>
  <th><font size="2">화</font></th>
  <th><font size="2">수</font></th>
  <th><font size="2">목</font></th>
  <th><font size="2">금</font></th>
  <th><font size="2">토</font></th>
 </tr>
 <tr height="30">
<%
for (int i=1;i<startDay;i++){
 count++;
%>
        <td>&nbsp;</td>
<%
}
for (int i=startDate;i<=endDate;i++){
 String bgcolor = (today.equals(year+":"+(month+1)+":"+i))? "#CCCCCC" : "#FFFFFF";
 String color = (count%7 == 0 || count%7 == 6)? "red" : "black";
 count++;
%>
  <td bgcolor="<%=bgcolor %>">
  &nbsp;<font size="2" color=<%=color %>><%=i %></font>
  <br>		
  		<p id="0.<%=i%>"><a onclick="popup('reservation.sports?time=0.<%=i%>&fieldname=${param.fieldname}')">07:00~09:00</a></p>
  		<p id="1.<%=i%>"><a onclick="popup('reservation.sports?time=1.<%=i%>&fieldname=${param.fieldname}')">09:00~11:00</a></p>
  		<p id="2.<%=i%>"><a onclick="popup('reservation.sports?time=2.<%=i%>&fieldname=${param.fieldname}')">11:00~13:00</a></p>
  		<p id="3.<%=i%>"><a onclick="popup('reservation.sports?time=3.<%=i%>&fieldname=${param.fieldname}')">13:00~15:00</a></p>
  		<p id="4.<%=i%>"><a onclick="popup('reservation.sports?time=4.<%=i%>&fieldname=${param.fieldname}')">15:00~17:00</a></p>
  		<p id="5.<%=i%>"><a onclick="popup('reservation.sports?time=5.<%=i%>&fieldname=${param.fieldname}')">17:00~19:00</a></p>
  		<p id="6.<%=i%>"><a onclick="popup('reservation.sports?time=6.<%=i%>&fieldname=${param.fieldname}')">19:00~21:00</a></p>
  		<p id="7.<%=i%>"><a onclick="popup('reservation.sports?time=7.<%=i%>&fieldname=${param.fieldname}')">21:00~23:00</a></p>  		
  	
  </td>
<%
  if(count%7 == 0 && i < endDate){
%>
 </tr>
 <tr height="30">
<%
  }
}
while(count%7 != 0){
%>
       <td>&nbsp;</td>
<%
count++;
 }
%>
</tr>
</table>
</div>
</body>
</html>