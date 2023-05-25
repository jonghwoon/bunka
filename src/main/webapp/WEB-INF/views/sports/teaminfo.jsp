<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sports_setting.jsp" %>   
<%@ include file="../common/setting.jsp"%> 

<html>
<script>
var hexagon = {
    bg_default_color: '#99ccff',
    value_default_color: '#ffff99',
    x_offset: 30,
    ssin: function(degree) {
        return Math.sin(degree * Math.PI / 180);
    },
    init: function(id, side_length, names, color) {
        this.side_length = side_length;
        this.hexagon = document.getElementById(id);
        this.hexagon.width = this.side_length * 2 * this.ssin(60) + this.x_offset * 2;
        this.hexagon.height = this.side_length * 2;

        var width = this.hexagon.width;
        var height = this.hexagon.height;
        var S = this.x_offset;

        if (typeof (color) === 'undefined') {
            color = this.bg_default_color;
        }

        hexagoncontext = this.hexagon.getContext('2d');
        hexagoncontext.fillStyle = color;
        hexagoncontext.strokeStyle = color;
        hexagoncontext.beginPath();
        hexagoncontext.moveTo(width / 2, 0);
        hexagoncontext.lineTo(width - S, height / 4);
        hexagoncontext.lineTo(width - S, height * 3 / 4);
        hexagoncontext.lineTo(width / 2, height);
        hexagoncontext.lineTo(S, height * 3 / 4);
        hexagoncontext.lineTo(S, height / 4);
        hexagoncontext.lineTo(width / 2, 0);
        hexagoncontext.stroke();
        hexagoncontext.fill();
        hexagoncontext.fillText(names[0], width / 2 + S / 2, 10);
        hexagoncontext.fillText(names[1], width - S, height / 4);
        hexagoncontext.fillText(names[2], width - S, height * 3 / 4);
        hexagoncontext.fillText(names[3], width / 2 + S / 2, height);
        hexagoncontext.fillText(names[4], 0, height * 3 / 4);
        hexagoncontext.fillText(names[5], 0, height / 4);
    },
    draw: function(values, color) {
        if (values.length < 6) {
            return false;
        }

        for (i in values) {
            values[i] = parseFloat(values[i]);

            if (values[i] > 1 || values[i] < 0) {
                return false;
            }
        }

        if (typeof (color) === 'undefined') {
            color = this.value_default_color;
        }

        var width = this.hexagon.width;
        var L = this.side_length;
        var S = this.x_offset;
        var V = values;

        hexagoncontext = this.hexagon.getContext('2d');
        hexagoncontext.fillStyle = color;
        hexagoncontext.strokeStyle = color;
        hexagoncontext.beginPath();
        hexagoncontext.moveTo(width / 2, L * (1 - V[0]));
        hexagoncontext.lineTo(this.ssin(60) * L * (1 + V[1]) + S, (1 - V[1] / 2) * L);
        hexagoncontext.lineTo(this.ssin(60) * L * (1 + V[2]) + S, (1 + V[2] / 2) * L);
        hexagoncontext.lineTo(width / 2, (1 + V[3]) * L);
        hexagoncontext.lineTo(this.ssin(60) * L * (1 - V[4]) + S, (1 + V[4] / 2) * L);
        hexagoncontext.lineTo(this.ssin(60) * L * (1 - V[5]) + S, (1 - V[5] / 2) * L);
        hexagoncontext.lineTo(width / 2, L * (1 - V[0]));
        hexagoncontext.stroke();
        hexagoncontext.fill();
    }
};
</script>
<style>
	th{
		background-color: #001c26;
		color:white;
	}
	
	td{
		height : 40px;
	}	
</style>
<script>
		var str = document.getElementById('STR').value;
		var agi = document.getElementById('AGI').value;
		var mag = document.getElementById('MAG').value;
		var hp = document.getElementById('HP').value;
		var mp = document.getElementById('MP').value;
		var def = document.getElementById('DEF').value;
		hexagon.init('demo', 100, ['피지컬', '체력', '수비', '스피드', '슈팅', '패스']);
		hexagon.draw([str, agi, mag, hp, mp, def]);
		function fresh() {
			var str = document.getElementById('STR').value;
			var agi = document.getElementById('AGI').value;
			var mag = document.getElementById('MAG').value;
			var hp = document.getElementById('HP').value;
			var mp = document.getElementById('MP').value;
			var def = document.getElementById('DEF').value;
			hexagon.init('demo', 100, ['피지컬', '체력', '수비', '스피드', '슈팅', '패스']);
			hexagon.draw([str, agi, mag, hp, mp, def]);
		}
	</script>
<body onload="fresh()">

	<div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <h1 align="center">${param.team}</h1>
        
        <div class="row">
        
        <div class="col-md-6">
        <h4>개인 능력</h4>
	        <div id="graph">
	        	
	       		
					
	        </div>
        </div>
          <div class="col-md-6">          
            	<h4>소속팀원</h4>            	
            	<table>
            		<tr>
            			<th style="width:70px;">아이디</th>
            			<th style="width:70px;">이름</th>
            			<th style="width:70px;">직책</th>
            			<th style="width:70px;">나이</th>
            			<th style="width:70px;">포지션</th>
            			<th style="width:70px;">실력</th>
            		</tr>
            		
            		<c:forEach var="ply" items="${play}">
            			<tr>
            				<td>${ply.id}</td>
            				<td>
	            				<form id="n${ply.id}">
	            					<input type="hidden" name="id" value="${ply.id}">
	            				</form>
	            				<a onclick="loadPage('graph', 'graph.sports', 'n${ply.id}')">${ply.name}</a>
            				</td>
            				<td>${ply.grade}</td>
            				<td>${ply.age}</td>
            				<td>${ply.position}</td>
            				<td>${ply.ability}</td>
            			</tr>
            		</c:forEach>
            		
            		<tr>
            			<td colspan="100">
	            			<form id="${param.team}">
	            				<input type="hidden" name="team" value="${param.team}">
	            			</form>
	            				
            				<input type="button" name="ask" value="가입 신청" onclick="popup('teamask.sports', 400, 535, '${param.team}')">
            			</td>
            		</tr>
            		
            	</table>
            	
        	  </div>
       		 </div>
     	 </div>
    	</div>
	</div>

</body>
</html>