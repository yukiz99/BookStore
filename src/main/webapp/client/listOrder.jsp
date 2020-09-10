<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>客户端显示订单</title>
     <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="/jquery-1.12.4.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/holder.min.js"></script>
    
      <style>
        .msg{
       text-align:center;
       margin-top:200px;
     }
      </style>
  </head>
  
  <body style="text-align:center;">
   <c:if test="${user == null }">
  		<h1 class="msg">对不起，请先登录</h1>
  	</c:if>
  	<c:if test="${user != null && pageInfo.list!=null }">
         
         <div class="container col-sm-8 col-sm-offset-2">
             
         
	          <div class="row">
				<div class="col-sm-3">
					<h1>订单列表</h1>
				</div>
			  </div>
			  
			<div class="row">
	                <div class="col-sm-4 col-sm-offset-8">
	                   <a class="btn btn-primary" href="${pageContext.request.contextPath }/client/getAllOrderByUser">全部</a>
		               <a class="btn btn-primary" href="${pageContext.request.contextPath }/client/getAllOrderByUserAndState?state=false">未发货</a>
		               <a class="btn btn-primary" href="${pageContext.request.contextPath }/client/getAllOrderByUserAndState?state=true">已发货</a>
	                </div>
	             </div>
				
			<div class="row">
			<div class="col-sm-12">              
				<table class="table table-hover  table-inverse"  id="page_table">
					<thead>
					  <tr>
					   <th>订单号</th>
			    	   <th>订单人</th>
			    	   <th>订单时间</th>
			    	   <th>订单总价</th>
			    	   <th>订单状态</th>
			    	   <th>操作</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="order" items="${pageInfo.list }">
			    		<tr>
			    		  	<td>${order.id }</td>
				    		<td>${order.user.username }</td>
				    		<td>${order.ordertime }</td>
				    		<td>${order.price }</td>
				    		<td>${order.state==true?'已发货':'未发货' }</td>
				    		<td>
				    			<a href="${pageContext.request.contextPath }/client/findOrderById?id=${order.id}">查看明细</a>
				    			
	    	            	</td>
			    		</tr>
    	           </c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		
		 <nav>
			      	  <ul class="pagination">
			      		<li><a href="${pageContext.request.contextPath }/client/${url}?state=${pageInfo.list[0].state}">首页</a></li> 
			      		<li>
			      		  <a href="${pageContext.request.contextPath }/client/${url}?pageNum=${pageInfo.pageNum-1}&state=${pageInfo.list[0].state}">
			      			<span>&laquo;</span>
			      		  </a>
			      		</li>
			      		<c:forEach items="${pageInfo.navigatepageNums}" var="pageNum" >
			      		      <c:if test="${pageNum eq pageInfo.pageNum }">
			      		         <li class="active"><a>${pageNum }</a></li>
			      		      </c:if>
			    	          <c:if test="${! (pageNum eq pageInfo.pageNum) }">
			    	            <li>
			    	                <a  href="${pageContext.request.contextPath }/client/${url }?pageNum=${pageNum}&state=${pageInfo.list[0].state}">${pageNum }</a>
					            </li>
			    	          </c:if>
					   </c:forEach>
			      		<li>
			      		  <a href="${pageContext.request.contextPath }/client/${url}?pageNum=${pageInfo.pageNum+1}&state=${pageInfo.list[0].state}">
			      			<span>&raquo;</span>
			      		  </a>
			      		</li>
			      		<li><a href="${pageContext.request.contextPath }/client/${url}?pageNum=${pageInfo.pages}&state=${pageInfo.list[0].state}">尾页</a></li>
			      	  </ul>
			      </nav>
			    <p>共${pageInfo.total }条记录</p>
	</div>
         
	  </c:if>
		<c:if test="${user!=null && pageInfo.list==null}">
			  <h1 class="msg">提示：你还没有任何订单，快去购买商品吧</h1>
	    </c:if>
  
  
	
	 
			      
  
  </body>
</html>
