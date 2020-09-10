<%@page import="com.zhu.domain.Cart"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>购物车显示列表</title>
        <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="/jquery-1.12.4.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/holder.min.js"></script>
    <style>
      body{
        height:auto;
        font-family: 微软雅黑;
      }
      .msg{
       text-align:center;
       margin-top:200px;
     }
     
     .bookImgDiv{
        height:100px;
     }
     .bookImg{
       height:100%;
     }
    </style>
  </head>
  <body>
  
  
    <c:if test="${user == null }">
  		<h1 class="msg">对不起，请先登录</h1>
  	</c:if>
  	<c:if test="${user != null&&cart!=null }">
         
         <div class="container col-sm-8 col-sm-offset-2">
	          <div class="row">
				<div class="col-md-12">
					<h1>购物车列表</h1>
				</div>
			  </div>
		
			
			<div class="row">
			<div class="col-sm-12">              
				<table class="table table-hover">
					<thead class="success">
					   <tr>
					    <th>
					      <input type="checkbox" id="checkbox_all">
					    </th>
					    <th>封面</th>
					    <th>书名</th>
			    		<th>作者</th>
			    		<th>单价</th>
			    		<th>数量</th>
			    		<th>小计</th>
			    		<th>操作</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="me" items="${cart.cartItems }">
    		<tr>
    		    <td><input type="checkbox" class="checkbox_item"  value="${me.value.book.id}"></td>
    		    <td>
    		         <div class="bookImgDiv">
    		           <a href="${pageContext.request.contextPath }/client/findBookById?id=${me.value.book.id}">
    		              <img class="bookImg" src="${pageContext.request.contextPath }/upload/images/${me.value.book.image}">
    		           </a>
    		         </div>
    		     </td>
    			<td><a href="${pageContext.request.contextPath }/client/findBookById?id=${me.value.book.id}">${me.value.book.name }</a></td>
	    		<td>${me.value.book.author }</td>
	    		<td>￥${me.value.book.price }</td>
	    		<td>
	    		   ${me.value.quantity}
	    		</td>
	    		<td>${me.value.price }</td>
	    		<td>
	    			<a href="${pageContext.request.contextPath }/client/deleteFromCart?id=${me.value.book.id}">删除</a>
	    		</td>
    		</tr>
    	</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

           <div class="row">
				   <div class="col-sm-3 col-sm-offset-9">
					   <button class="btn btn-danger"  id="delAllBtn">批量删除</button>
		               <button id="buyBtn" class="btn btn btn-primary">结算</button> 
				   </div>
		   </div>
    </div>
         
	  </c:if>
		<c:if test="${user!=null && cart==null}">
			  <h1 class="msg">您的购物车空空如也</h1>
	    </c:if>

	<script>
	
	   function changeNum(input){
		   var count=input.val();
		   alert("change");
		   $.ajax({
			   url:"${pageContext.request.contextPath}/client/changeCount?id="+id+"&count="+count,
			   type:'GET',
			   success:function(data){
				   
			   }
		   });
	   }
	   
	   
	   //全选或不选
	   $(document).on("click","#checkbox_all",function(){
			$(".checkbox_item").prop("checked",$("#checkbox_all").prop("checked"));
	   });
	   
	 //当所有选项全选时checkbox_all也相应全选
		$(document).on("click",".checkbox_item",function(){
			var flag=$(".checkbox_item").length==$(".checkbox_item:checked").length;
			$("#checkbox_all").prop("checked",flag);
		});
	 
	 //删除所选
	 $(document).on("click","#delAllBtn",function(){
			var ids=getCheckIds();
			if(ids==""||ids==null){
				 alert("您还未选中任何商品");
				 return;
			 }
			 $.ajax({
				 url:"${pageContext.request.contextPath}/client/deleteManyFromCart",
				 type:"POST",
				 data:{ids:ids},
				 success:function(data){
					if(data.code==1){
						window.location.href="${pageContext.request.contextPath}/client/listCart.jsp";
					}
				 },
				 error:function(){
					 alert("error");
				 }
			 });
	 });
	 //得到选中的ids
	 function getCheckIds(){
		 var ids="";
		 $.each($(".checkbox_item:checked"),function(){
			ids+=$(this).val()+"-";
		 });
		 if(ids.length>1){
			 ids=ids.substring(0,ids.length-1);
		 }
		 return ids;
	 }
	 
	 //结算
	 $(document).on("click","#buyBtn",function(){
		 var ids=getCheckIds();
		 if(ids==""||ids==null){
			 alert("您还未选中任何商品");
			 return;
		 }		 
		 if(confirm("确认购买吗？")){
			 window.location.href="${pageContext.request.contextPath }/client/createOrder?ids="+ids;
				 
		 }
		 
			
	 });
	 
	</script>
   </body>
</html>