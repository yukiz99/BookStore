<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>图书详情</title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="/jquery-1.12.4.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/holder.min.js"></script>
    <style>
    /*
    .container{
      border:1px red solid;
    }
    */
    #bookImgDiv{
      width:100%;
      height:450px;
    }
      
   
       
    </style>
  </head>
  <body>

 <div class="container col-sm-7 col-sm-offset-2">
 <input id="bookId" type="hidden" value="${book.id}">
     <h2 class="page-header">图书详情</h2>
     <div class="row">
       <div class="col-sm-5">
	       <div  id="bookImgDiv">
	        <img width="100%" height="100%" src="${pageContext.request.contextPath }/upload/images/${book.image}">
	       </div>
       </div>
       <div class="col-sm-7">
          <div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">
							<h1>${book.name }</h1>
						</div>
					</div>
					<div class="panel-body ">
						<h2>${book.author }</h2>
						<p>类别：${book.category.name}</p>
						<p>单价：<span style="color:red;font-size:20">￥${book.price}</span></p>
						<p>数量：<input id="bookCount" type="number" min=1 value="1"/></p>
						<p>${book.description}</p>
													
					</div>
					<div class="panel-footer">
						<button onclick="addToCart()" class="btn btn-primary btn-lg">加入购物车</button>
						<button onclick="buyBook(${book.price })" class="btn btn-warning btn-lg">立即购买</button>
					</div>
				</div>
       </div>
     </div>
 </div>
 
 <script>
function addToCart(){
	 var id=$("#bookId").val();
	 var count=$("#bookCount").val();
	 	$.ajax({
	 		url:"${pageContext.request.contextPath}/client/addToCart?id="+id+"&count="+count,
	 		type:"GET",
	 		success:function(data){
	 			if(data.code==0){
	 				alert(data.obj);
	 			}
	 		}
	 	});
 }
 
 function buyBook(price){
	 var id=$("#bookId").val();
	 var count=$("#bookCount").val();
	 var num=confirm("总价："+price*count+",确认支付吗？");
	 if(num==1){
		 $.ajax({
			 url:"${pageContext.request.contextPath}/client/buyBook?id="+id+"&count="+count,
		     type:"GET",
		     success:function(data){
		    	 if(data.code==0){
		    		 alert(data.obj);
		    	 }else{
		    		 alert(data.obj);
		    	 }
		     }
		 });
	 }
	
 }
 
 
	
 </script>
   </body>
</html>