<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>显示订单</title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="/jquery-1.12.4.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/holder.min.js"></script>
  </head>
  
  <body>
       <div class="container col-sm-10 col-sm-offset-1">
             <h2 class="page-header">订单列表</h2>
             
             <!-- 
                 <div class="row col-sm-offset-7">
                    <form action="${pageContext.request.contextPath }/manager/getAllOrderByUsernameAndState">
                         <input type="hidden" name="state" value="${pageInfo.list[0].state}">
                          <div class="form-group col-sm-8">
							  <input class="form-control" placeholder="用户名搜索"  name="name"/>
						  </div>
						  <div class="form-group">
							    <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-search"><span></button>
						  </div>
                    </form>
             </div>
              -->
             
              
             
    <table class="table table-hover" width="60%">
    	<tr>
    		<td>订单号</td>
    		<td>订单人</td>
    		<td>订单时间</td>
    		<td>订单总价</td>
    		<td>订单状态</td>
    		<td>操作</td>
    	</tr>
    	<c:forEach var="order" items="${pageInfo.list }">
    		<tr>   
    			<td>${order.id }</td>
	    		<td>${order.user.username }</td>
	    		<td>${order.ordertime }</td>
	    		<td>${order.price }</td>
	    		<td>${order.state==true?'已发货':'未发货' }</td>
	    		<td>
	    			<a href="${pageContext.request.contextPath }/manager/findOrderById?id=${order.id}">查看明细</a>
	    		</td>
    		</tr>
    	</c:forEach>
    	
	</table>
	
	 <!-- 分页条 -->
			       <nav>
			      	  <ul class="pagination">
			      		<li><a href="${pageContext.request.contextPath }/manager/${url}?state=${pageInfo.list[0].state}">首页</a></li> 
			      		<li>
			      		  <a href="${pageContext.request.contextPath }/manager/${url}?pageNum=${pageInfo.pageNum-1}&state=${pageInfo.list[0].state}">
			      			<span>&laquo;</span>
			      		  </a>
			      		</li>
			      		<c:forEach items="${pageInfo.navigatepageNums}" var="pageNum" >
			      		      <c:if test="${pageNum eq pageInfo.pageNum }">
			      		         <li class="active"><a>${pageNum }</a></li>
			      		      </c:if>
			    	          <c:if test="${! (pageNum eq pageInfo.pageNum) }">
			    	            <li>
			    	                <a  href="${pageContext.request.contextPath }/manager/${url }?pageNum=${pageNum}&state=${pageInfo.list[0].state}">${pageNum }</a>
					            </li>
			    	          </c:if>
					   </c:forEach>
			      		<li>
			      		  <a href="${pageContext.request.contextPath }/manager/${url}?pageNum=${pageInfo.pageNum+1}&state=${pageInfo.list[0].state}">
			      			<span>&raquo;</span>
			      		  </a>
			      		</li>
			      		<li><a href="${pageContext.request.contextPath }/manager/${url}?pageNum=${pageInfo.pages}&state=${pageInfo.list[0].state}">尾页</a></li>
			      	  </ul>
			      </nav>
			      <p>共${pageInfo.total }条记录</p>
       </div>
  </body>
</html>
