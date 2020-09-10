<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>订单明细</title>
     <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="/jquery-1.12.4.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
  </head>
  <style>
       .bookImgDiv{
          height:100px;
       }
       .bookImg{
         height:100%;
       }
       .userDiv{
         
        margin:20px;
       }
       .user{
        color:grey;
        font-size:20;
       }
    </style>
  </head>
  <body>
  
    <div class="container col-sm-9 col-sm-offset-1">
	  <h2 class="page-header">订单明细</h2>
	  
	  <div class="row userDiv">
	        <span class="user">${order.user.username }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${order.user.cellphone} 
	                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收货地址：${order.user.address}</span>
	  </div>
	            
     <table class="table table-hover  table-inverse"  id="page_table">
					<thead>
					 <tr class="active">
					    <th></th>
			    		<th>书名</th>
			    		<th>售价</th>
			    		<th>数量</th>
			    		<th>小计</th>
    	             </tr>
					</thead>
					<tbody>
					<c:forEach var="orderitem" items="${order.orderItems }">
				    	<tr>
				    		<td>
					    		<div class="bookImgDiv">
					    		   <img class="bookImg" src="${pageContext.request.contextPath}/upload/images/${orderitem.book.image}">
					    		</div>
					    	</td>
					    	<td>${orderitem.book.name }</td>
				    		<td>￥${orderitem.book.price }</td>
				    		<td>${orderitem.quantity }</td>
				    		<td>￥${orderitem.price }</td>
		    	        </tr>
		    	   </c:forEach>
		    	   <tr>
	  	                <td colspan="5" class="active">
	  	                     <div>订单创建时间：${order.ordertime}</div>
                             <div class="row col-sm-2 col-sm-offset-10">
                                  <span class=""><b>总计:</b></span><span style="color:red">￥${order.price }</span>
                             </div>
	  	                </td>
			    		
    	           </tr>
   
				</tbody>
	   </table>
	      <c:if test="${! order.state }">
         	<div class="col-sm-3 col-sm-offset-5">
         	  <a class="btn btn-warning btn-lg" href="${pageContext.request.contextPath }/manager/updateOrderState?id=${order.id}">确认发货</a>
         	</div>
	     </c:if>
  </div>
  
  
  <!-- 
  
      
  
  
  <div class="container">
	  <h1>订单明细</h1>
	  <h3>收货信息</h3>
	  
	  <div class="row">
	        <div class="col-sm-3">
	            <span>${order.user.username }   ${order.user.cellphone}</span>
	        </div>
	         <div class="col-sm-6">
	            <span>收货地址:${order.user.address}</span>
	        </div>
	  </div>
     <table class="table table-hover  table-inverse"  id="page_table">
					<thead>
					 <tr>
					    <th></th>
			    		<th>书名</th>
			    		<th>售价</th>
			    		<th>数量</th>
			    		<th>小计</th>
    	             </tr>
					</thead>
					<tbody>
					<c:forEach var="orderitem" items="${order.orderItems }">
				    	<tr>
				    		<td>
					    		<div class="bookImgDiv">
					    		   <a href="${pageContext.request.contextPath}/client/findBookById?id=${orderitem.book.id}">
					    		      <img class="bookImg" src="${pageContext.request.contextPath}/upload/images/${orderitem.book.image}">
					    		   </a>
					    		</div>
					    	</td>
					    	<td>
					        	<a href="${pageContext.request.contextPath}/client/findBookById?id=${orderitem.book.id}">${orderitem.book.name }</td></a>
				    	    </td>
				    		<td>￥${orderitem.book.price }</td>
				    		<td>${orderitem.quantity }</td>
				    		<td>￥${orderitem.price }</td>
		    	        </tr>
		    	   </c:forEach>
		    	   <tr>
	  	                <td colspan="5">
                             <div class="row col-sm-2 col-sm-offset-10">
                                  <span class=""><b>总计:</b></span><span style="color:red">￥${order.price }</span>
                             </div>
	  	                </td>
			    		
    	           </tr>
				</tbody>
	   </table>
  </div>
  
  
  
  
  
  	<h3>订单明细</h3>
    <table border="1" width="50%" align="center" style="text-align: center;">
    	<tr>
    		<td>书名</td>
    		<td>售价</td>
    		<td>数量</td>
    		<td>应收货款</td>
    	</tr>
    	<c:forEach var="orderitem" items="${order.orderItems }">
    	<tr>
    		<td>${orderitem.book.name }</td>
    		<td>${orderitem.book.price }</td>
    		<td>${orderitem.quantity }</td>
    		<td>${orderitem.price }</td>
    	</tr>
    	</c:forEach>
    	
    	<tr>
    		<td>订单总价</td>
    		<td colspan="3">${order.price }</td>
    	</tr>
    	
    </table>
    
    <h3>收货人详细信息</h3>
    <table border="1" width="50%" align="center" style="text-align: center;">  
    	<tr>
    		<td>用户</td>
    		<td>手机</td>
    		<td>地址</td>
    		<td>邮箱</td>
    	</tr>
    	<tr>
    		<td>${order.user.username }</td>
    		<td>${order.user.cellphone }</td>
    		<td>${order.user.address }</td>
    		<td>${order.user.email }</td>
    	</tr>
	</table>
   -->
   
   
	
  </body>
</html>
