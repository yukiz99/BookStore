<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>订单明细</title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="/jquery-1.12.4.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/holder.min.js"></script>
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
  <div class="container">
	  <h1>订单明细</h1>
	  
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
		    	   <tr class="active">
	  	                <td colspan="5">
	  	                <div>订单创建时间：${order.ordertime }</div>
                             <div class="row col-sm-2 col-sm-offset-10">
                                  <span class=""><b>总计:</b></span><span style="color:red">￥${order.price }</span>
                             </div>
	  	                </td>
			    		
    	           </tr>
				</tbody>
	   </table>
  </div>
  </body>
</html>
