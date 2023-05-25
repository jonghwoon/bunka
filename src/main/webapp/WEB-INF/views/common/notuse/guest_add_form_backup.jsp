<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../common/setting.jsp"%>
<%@ include file="../../common/setting_common.jsp"%>

<html lang="en">


<body>
	<div class="panel-heading">
          <div class="panel-title text-center">
          		<h1 class="title">회원 가입</h1>              		
          </div>
   	</div>
	<div class="main-login main-center">
		<form class="form-horizontal" method="post" action="#">
			
			<div class="form-group">
				<label for="name" class="cols-sm-2 control-label">아이디</label>				
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control" name="id" id="id"  placeholder="아이디를 입력 해 주세요."/>
					</div>
				</div>
								
			</div>

			<div class="form-group">
				<label for="password" class="cols-sm-2 control-label">패스워드</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input type="password" class="form-control" name="password" id="password"  placeholder="패스워드를 입력해주세요."/>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="password" class="cols-sm-2 control-label">패스워드 확인</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input type="password" class="form-control" name="password" id="password"  placeholder="패스워드를 한번 더 입력해주세요."/>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label for="username" class="cols-sm-2 control-label">이름</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control" name="username" id="username"  placeholder="이름을 입력해주세요."/>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="email" class="cols-sm-2 control-label">이메일 주소</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
						<input type="text" class="form-control" name="email" id="email"  placeholder="이메일 주소를 입력해주세요."/>
					</div>
				</div>
			</div>


			<div class="form-group">
				<label for="confirm" class="cols-sm-2 control-label">생년월일</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input type="date" class="form-control" name="number" id="number"  placeholder="생년월일을 입력해주세요."/>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<button type="button" class="btn btn-primary btn-lg btn-block login-button">Register</button>
			</div>
		</form>
	</div>

</body>

<style>
	/* 
	@font-face{font-family:'BebasNeue'; src:url('resocommon/font/BebasNeue.otf')}
	 */
	body, html{
	     height: 100%;
	 	background-repeat: no-repeat;
	 	background-color: #d3d3d3;
	 	/* 
	 	font-family: 'BebasNeue' , cursive;
	 	 */
	}
	
	.main{
	 	margin-top: 70px;
	}
		
	h1 { 
		font-size: 50px;
		/* font-family: 'BebasNeue', cursive; */ 
		font-weight: 400; 
	}
	
	hr{
		width: 10%;
		color: #fff;
	}
	
	.form-group{
		margin-bottom: 15px;
	}
	
	label{
		margin-bottom: 15px;
	}
	
	input,
	input::-webkit-input-placeholder {
	    font-size: 11px;
	    padding-top: 3px;
	}
	
	.main-login{
	 	background-color: #fff;
	    /* shadows and rounded borders */
	    
	    -moz-border-radius: 2px;
	    -webkit-border-radius: 2px;
	    border-radius: 2px;
	    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	
	}
	
	.main-center{
	 	margin-top	: 30px;
	 	margin		: 0 50px;
	 	max-width	: 330px;
	    paddin		g: 40px 40px;
	
	}
	
	.login-button{
		margin-top: 5px;
	}
	
	.login-register{
		font-size: 11px;
		text-align: center;
	}	
	
</style>

</html>

<!-- 출처 : https://bootsnipp.com/snippets/featured/register-page -->
