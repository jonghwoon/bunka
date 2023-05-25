<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="./setting_art.jsp"%>
<html>
<body>

	= 행사 찾기 로드 완료! // 좌석 선택 = <br>
			
	<%	// 예약 테이블
		int[][] tables =	{
			{2,2,2,0,0,0,0,2,2,2},
			{2,2,0,0,0,0,0,0,2,2},
			{2,0,0,0,0,0,0,0,0,2},
			{0,0,0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0,0,0},
			{0,0,0,0,0,3,0,0,0,0},
			{0,0,0,0,0,0,0,3,0,0},
			{0,0,0,0,0,0,0,0,3,0}
		};
	
		// 이건 나중에 시간 많으면 하자. 
		//0:selectAble //1:selected  //2:disable //3:selelctAlready		
		/* 
		for(int[] table : tables){	
			for(int i : table){
				String cname ="";
				switch(i){
					case 0 : cname = "selable";		break;					
					case 2 : cname = "disable";		break;
					case 3 : cname = "already";		break;
					
				}
				p("<span class='"+cname+"' name='"+table+"-"+i+"'>■</span>");
			}
			p("<br>");
		}
		 */
		// Member DTO 모든 회원 정보 조회하기 
		
		ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");
		if(dtos!=null)
			for(DTO dto : dtos){				
				for(String name : dto.getNames())
					out.println(name + " : " + dto.getValue(name) + "<br>");
				out.println("<br><br>");
			}			
	%>	
	
</body>
	
<style>
	sapn:hover{	cursor: pointer; }
	span[class="selable"] {	color : blue ;	}
	span[class="selected"]{					}
	span[class="disable"] {	color : black ;	}
	span[class="already"] {	color : red ;	}
	
</style>
</html>





