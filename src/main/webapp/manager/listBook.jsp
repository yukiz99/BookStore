<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>图书列表</title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="/jquery-1.12.4.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/holder.min.js"></script>
    
    <style>
        .bookImgDiv{
           height:100px
        }
        .bookImg{
         height:100%;
        }
    </style>
  </head>
  
  <body>

    <div class="container col-sm-9 col-sm-offset-1">
   <h2 class="page-header text-success">图书列表</h2>
         
<form method="get" action="${pageContext.request.contextPath }/manager/queryBook">
<input name="name" value="${query_name}" id="searchInput">
<button class="btn btn-default" type="submit">搜索</button>
</form>
       <table class="table table-hover">
    	<tr class="active">
    	    <th>封面</th>
  			<th>书名</th>
  			<th>作者</th>
  			<th>价格</th>
  			<th>类别</th>
  			<th>操作</th>
  		</tr>
  		<c:forEach var="book" items="${pageInfo.list }">
  			<tr>
  			    <td>
  			        <div class="bookImgDiv">
  			           <img class="bookImg" src="${pageContext.request.contextPath }/upload/images/${book.image}">
  			        </div>
  			    </td>
  				<td>${book.name}</td>
	  			<td>${book.author }</td>
	  			<td>${book.price }</td>
	  			<td>${book.category.name}</td>
	  			<td>
	  				<a  class="btn btn-warning"href="${pageContext.request.contextPath }/manager/forUpdateBook?id=${book.id}">修改</a>
	  				<button class="btn btn-success" onclick="deleteBook('${book.id}')">删除</button>
	  			</td>
  			</tr>
  		</c:forEach>
    </table>  
     
      
    <br>
               <!-- 分页条 -->
			       <nav>
			      	  <ul class="pagination">
			      		<li><a href="${pageContext.request.contextPath }/manager/${url}?name=${query_name}">首页</a></li> 
			      		<li>
			      		  <a href="${pageContext.request.contextPath }/manager/${url}?pageNum=${pageInfo.pageNum-1}&name=${query_name}">
			      			<span>&laquo;</span>
			      		  </a>
			      		</li>
			      		<c:forEach items="${pageInfo.navigatepageNums}" var="pageNum" >
			      		      <c:if test="${pageNum eq pageInfo.pageNum }">
			      		         <li class="active"><a>${pageNum }</a></li>
			      		      </c:if>
			    	          <c:if test="${! (pageNum eq pageInfo.pageNum) }">
			    	            <li>
			    	                <a  href="${pageContext.request.contextPath }/manager/${url }?pageNum=${pageNum}&name=${query_name}">${pageNum }</a>
					            </li>
			    	          </c:if>
					   </c:forEach>
			      		<li>
			      		  <a href="${pageContext.request.contextPath }/manager/${url}?pageNum=${pageInfo.pageNum+1}&name=${query_name}">
			      			<span>&raquo;</span>
			      		  </a>
			      		</li>
			      		<li><a href="${pageContext.request.contextPath }/manager/${url}?pageNum=${pageInfo.pages}&name=${query_name}">尾页</a></li>
			      	  </ul>
			      </nav>
	      
			      
    </div>
    
    <script>
    
       function deleteBook(id){
    	   $.ajax({
    		   url:"${pageContext.request.contextPath}/manager/deleteBook?id="+id,
    	       type:'GET',
    	       success:function(data){
    	    	   alert(data.obj);
    	    	   window.location.href="${pageContext.request.contextPath}/manager/getAllBook";
    	       }
    	   });
       }
    </script>
  </body>
</html>
