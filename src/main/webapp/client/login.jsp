<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆</title>
<script src="/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css" />
<style type="text/css">
html {
	height: 100%;
	width: 100%;
}


body{
  height: 100%;
	width: 100%;
	 background: url(../images/img.jpg) no-repeat top left;
	 background-size: cover;
}
.login-box {
    width:450px;
	height: 400px;
	position: absolute;
	top: 18%;
	left:40%;
    background: #F5E79E;
}
	
.form {
	width:450px;
	height: 280px;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}	
.login-content {
	height: 300px;
	width:450px;
	background-color: #f0f0f0;
	float: left;
}		
	
	
.input-group {
	margin: 0px 0px 30px 0px;
}
.form-control,
.input-group {
	height: 40px;
}

.form-group {
	margin-bottom: 0px;
}
.login-title {
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}
.login-title h1 {
	margin-top: 10px !important;
}
.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}
.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
</style>

</head>

<body>
<div class="box">
      <div class="row">
        <div class="logoImg"> </div>
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small>登陆</small></h1>
			</div>
			<div class="login-content ">
			<div class="form">
			<form id="form">
				<div class="form-group">
					<div class="col-md-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" id="username" name="username" class="form-control" placeholder="用户名">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" id="password" name="password" class="form-control" placeholder="密码">
						</div>
					</div>
				</div>
			</form>
				<div class="form-group form-actions">
					<div class="col-md-4 col-md-offset-4 ">
						<button id="loginBtn" class="btn btn-sm btn-info"><span class="glyphicon glyphicon-off"></span>登录</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-6 link">
						<p class="text-center"><small>忘记密码？</small> <a href="#" ><small>找回</small></a>
						</p>
					</div>
					<div class="col-md-6 link">
						<p class="text-center"><small>还没注册?</small> <a href="${pageContext.request.contextPath}/client/regist.jsp" ><small>注册</small></a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
        </div>
</div>

<script>
  
     $("#loginBtn").click(function(){
    	 var username=$("#username").val();
    	 var password=$("#password").val();
    	 
    	 function empty(value){
    		if(value==null||value==""){
              return true;
           }else return false;
       }
    	 
    	 if(empty(username)||empty(password)){
    		 alert("登陆信息不能为空，请填写完整");
    		 return;
    	 }
    	 
    	 $.ajax({
    		 url:"${pageContext.request.contextPath}/client/login",
    		 type:"POST",
    		 data:$("#form").serialize(),
    		 success:function(data){
    			 if(data.code==1){
    				 window.location.href="${pageContext.request.contextPath}/index.jsp";
    			 }else{
    				 alert(data.obj);
    			 }
    		 }
    	 });
    	    	 
     }); 
     
      
</script>

</body>
</html>