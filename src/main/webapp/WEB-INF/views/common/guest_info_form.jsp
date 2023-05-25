<%@page import="java.io.File"%>
<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<%@ include file="setting_common.jsp"%>

<%
	DTO dto = (DTO)request.getAttribute("dto");
	String id = dto.getValue("id");
	
	//path: String filepath = application.getRealPath("/WEB-INF/" + dir[0] + ".txt");	// JSP REALPATH
	
	// 파일이 존재하는지 확인한다 - 이전방식
	/* 
	String filePath= application.getRealPath("/resources/common/img/member_profile/"+id+".jpg");
	
	File file = new File(filePath);
	boolean  isExist = file.exists();
		
	if(!isExist) 
		id = "x";	
	 */
	
	//debug
		/* 
		System.out.println("filePath : " + filePath);
		System.out.println("id : " + id);
		System.out.println("isExist : " + isExist);
	 	*/
	
%>

<html>
<script type ="text/javascript" src="${project}/common/js/jquery.form.js"></script>
<body>
 <div id="col-custom">
   <div class="panel panel-default">
     <div class="panel-heading">
       <h4>회원 정보!</h4>
     </div>
     <div class="panel-body">
       <div class="box box-info">

         <div class="box-body">
           <div class="col-sm-6">
           									 <!-- "src/main/webapp/resources/common/img/member_profile/guest1.jpg" -->
             <div align="center"> 
             	<%-- <img alt="User Pic" src='c:/resources/common/img/member_profile/<%= id %>.jpg' id="profile-image1" class="img-rounded img-responsive"> --%>
             	
            	<%-- <img alt="User Pic" src='./resources/common/img/member_profile/<%= id %>.jpg' id="profile-image1" class="img-rounded img-responsive"> --%>
            	<img alt="User Pic" src="<%=id%>.img" id="profile-image1" class="img-rounded img-responsive">
            	<script>
            		
            	</script>
			  	<form id="imageForm" class="hidden" enctype="multipart/form-data" method="post" action = "guest_info_pro.common">	
               		<input type="file" name="file" 	accept=".jpg" id="profile-image-upload" >
               		<input type="text" name="id"	value='${dto.getValue("id")}'>
              	</form>
              	<div id ="secret"></div>
               
              	<div style="color:#999;">프로필 사진을 바꾸려면 클릭</div>
               <!--Upload Image Js And Css-->
             </div>
             
             <br>

             <!-- /input-group -->
           </div>
           <div class="col-sm-6">           	 
             <h4 style="color:#00b1b1;">${dto.getValue("nick")}</h4>             
             <span><p>- 회원 정보 소개 란 - </p></span> 
           </div>
           <div class="clearfix"></div>
           <hr style="margin:5px 0 5px 0;">


           <div class="col-sm-5 col-xs-6 tital">이름 :</div>
           <div class="col-sm-7 col-xs-6 ">${dto.getValue("name")}</div>
           <div class="clearfix"></div>
           <div class="bot-border"></div>
           
           <div class="col-sm-5 col-xs-6 tital">가입일자 :</div>
           <div class="col-sm-7">${fn:substring(dto.getValue("regdate"),0,10)}</div>
           <div class="clearfix"></div>
           <div class="bot-border"></div>
           
           <div class="col-sm-5 col-xs-6 tital ">주소 :</div>
           <div class="col-sm-7">${dto.getValue("address")}</div>
           <div class="clearfix"></div>
           <div class="bot-border"></div>


           <div class="col-sm-5 col-xs-6 tital">생년월일 </div>
           <div class="col-sm-7">${fn:substring(dto.getValue("jumin"),0,6)}</div>
           <div class="clearfix"></div>
           <div class="bot-border"></div>

         
           <div class="col-sm-5 col-xs-6 tital">핸드폰 번호 :</div>
           <div class="col-sm-7">${dto.getValue("hp")}</div>
           <div class="clearfix"></div>
           <div class="bot-border"></div>

           <div class="col-sm-5 col-xs-6 tital">이메일 주소 :</div>
           <div class="col-sm-7">${dto.getValue("email")}</div>
           <div class="clearfix"></div>
           <div class="bot-border"></div>


           <!-- /.box-body -->
         </div>
         <!-- /.box -->

       </div>


     </div>
   </div>
 </div>
</body>

<script>
  $(function () {
    $('#profile-image1').on('click', function () {
    	
      	$('#profile-image-upload').click();
      
      	// 순서 때문에 파일이 들어오지 않는다.
      	// loadPage('secret','guest_info_pro.common','imageForm');
      	// 디버그      	
      		//console.log($("#profile-image-upload").val());
      
    });
    
    $("#profile-image-upload").change(function(){
    	
    	/* 
    	//이걸로 해야한다. 
    	$("#imageForm").submit();
    	 */
    	
    	//ajax 로는 파일 전송이 불가한듯 
    		//loadPage('secret','guest_info_pro.common','imageForm');
    		//console.log($(this).val());
    	
		$('#imageForm').ajaxForm({
			url: "guest_info_pro.common",
			enctype: "multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
			success: function(result){				
				if(confirm("프로필이 업로드 되었습니다. 새로고침 하시겠습니까?"))				
					location.reload();
			}
		});
		
		// 여기까지는 ajax와 같다. 하지만 아래의 submit명령을 추가하지 않으면 백날 실행해봤자 액션이 실행되지 않는다.
		$("#imageForm").submit();
   	
    })
    
  });
</script>

<style>
	/* my custom */
	#imageForm{
		visibility: hidden;
	}
	
	#secret{	
		display : inline;
		position: absolute;
		visibility: hidden;
	}
	
	#col-custom{
		width : 600px;
		overflow: hidden;
	}
	
	.panel-heading{
		text-align: center;
	}
	/* my custom */

  .container{
  	overflow: hidden;
  }
  input.hidden {
      position: absolute;
      left: -9999px;
  }

  #profile-image1 {
      cursor: pointer;
          	 
      width: 111px;
      height: 139px;
    /*   
    border: 2px solid #03b1ce;
     */
  }
    
  .title{ font-size:16px; font-weight:500;}
  .bot-border{ border-bottom:1px #f8f8f8 solid;  margin:5px 0  5px 0}	
  
</style>

</html>