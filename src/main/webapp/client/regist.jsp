<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>注册表单</title>
    
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css" />
    <script src="${pageContext.request.contextPath }/jquery-1.12.4.min.js"></script>
    
    <style>
    html{
      width:100%;
      height:100%;
      margin:0px auto;
      
    }
    
    
  body{
  height: 100%;
	width: 100%;
	 background: url(../images/img.jpg) no-repeat top left;
	 background-size: cover;
}

    .regist-box{
	     width:450px;
	     height:500px;
	     text-align:center;
	     margin:50px 800px auto auto;
	     background:#f0f0f0;
   }
   .regist-title{
     height:100px;
     margin:0px auto 10px auto;
     padding:20px 10px;
     background:#625C3F;
   }  
   
   .regist-title h1 small{
     color:white;
   }
   
   .form-group{
      margin:25px;
   }
   
   .input-group,.form-control{
      height: 40px;
   }

   
    </style>
  </head>
  <body>
    
 <div class="regist-box">
   <div class="regist-title">
      <h1><small>注册</small></h1>
   </div>
 <form id="form" class="form-horizontal" >
  <div class="form-group">
    <div class="col-sm-10 col-sm-offset-1">
        <div class="input-group">
			<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
			<input  class="form-control" id="username" name="username"  placeholder="用户名">
		</div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-10 col-sm-offset-1">
	     <div class="input-group">
	       <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
	       <input type="password" class="form-control" name="password" id="password" placeholder="密码">
	    </div>
    </div>
  </div>
   <div class="form-group">
    <div class="col-sm-10 col-sm-offset-1">
     <div class="input-group">
     <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
      <input  class="form-control" name="cellphone" id="cellphone" placeholder="手机">
    </div>
    </div>
  </div>
   <div class="form-group">
    <div class="col-sm-10 col-sm-offset-1">
     <div class="input-group">
     <span class="input-group-addon"><span class="glyphicon glyphicon-send"></span></span>
      <input type="email" class="form-control" name="email" id="email" placeholder="邮箱">
    </div>
    </div>
  </div>
   <div class="form-group">
    <div class="col-sm-10 col-sm-offset-1">
    <div class="input-group">
     <span class="input-group-addon"><span class="glyphicon glyphicon-tent"></span></span>
      <input  class="form-control" name="address" id="address" placeholder="住址">
    </div>
    </div>
  </div>
</form>
<div class="form-group">
    <div class="col-sm-10 col-sm-offset-1">
      <button id="btn" class="btn  btn-info">注册</button>
    </div>
  </div>
</div>   
    
      
    <script>
         $("#btn").click(function(){
        	 //在这里记得加上很多判断
        	 
        	 var username=$("#username").val();
        	 var password=$("#password").val();
        	 var cellphone=$("#cellphone").val();
        	 var email=$("#email").val();
        	 var address=$("#address").val();
        	 
        	 function empty(value){
        		 if(value==""||value==null){
        			 return true;
        		 }else return false;
        	 }
        	 
        	 if(empty(username)||empty(password)||empty(cellphone)||empty(email)||empty(address)){
        		 alert("用户信息必须全部填写完整");
        		 return;
        	 }
        	 
        	 
        	 $.ajax({
        		 url:"${pageContext.request.contextPath}/client/regist",
        		 type:"POST",
        		 data:$("#form").serialize(),
        		 success:function(data){
        			 if(data.code==1){
        				 alert(data.obj+",请前去登陆");
        				 
        				 window.location.href="${pageContext.request.contextPath}/client/login.jsp";
        				 
        			 }else{
        				 alert(data.obj);
        			 }
        		 }
        	 });
        	 
         });
    </script>
  </body>
</html>
