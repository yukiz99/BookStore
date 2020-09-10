<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>首页体</title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="/jquery-1.12.4.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/holder.min.js"></script>
    <style>
        .container{
          font-family:微软雅黑;
          margin-top:10px;
          text-align=center;
        }
		#categories li{
		font-size:20;
			width:200px;  
			height:50px;
		}
	
	
		.bookImgDiv{
		    width:100%;
		    height:230px;
		}
		.pagination{
		  font-size:20;
		}
		.bookInfo{
		  text-align:center;
		}
	
			
    </style>
  </head>
 
  <body>
  <div class="container">
	 <div id='categories' class="col-sm-1" >
	    <ul id="navTab" class="nav nav-tab" >
	         <li class="category">
	            <a href="${pageContext.request.contextPath }/client/getAllBook">全部图书</a>
	        </li>
	         <c:forEach items="${categories}" var="category">
	         <li class="category"> 
	            <a href="${pageContext.request.contextPath }/client/getAllBookByCategory?category_id=${category.id}">${category.name }</a>
	        </li>
	         </c:forEach>
	    </ul>
	</div>
    <div id="bookandpage" class="col-sm-9 col-sm-offset-1">   	
		
		  <!-- 图书展示 -->
		  <div id="book">
				  <div class="row">
					  <c:forEach items="${pageInfo.list}" var="book">
					    <div class="col-sm-4">
						  	  <a class="thumbnail" href="${pageContext.request.contextPath }/client/findBookById?id=${book.id}">
						  	    <div class="bookImgDiv">
						  	       <img class="bookImg" width="100%" height="100%" src="${pageContext.request.contextPath }/upload/images/${book.image}"/>
						  	    </div>
						  	     <div class="caption bookInfo">
						  			<h4>${book.name }</h4>
						  			<p style="color:red">￥ ${book.price }</p>
						  	    </div>
						  	  </a>
						  </div>
					  </c:forEach>
				  </div>
		  </div>
				  
					
			     <!-- 分页条 -->
			       <nav>
			      	  <ul class="pagination">
			      		<li><a href="${pageContext.request.contextPath }/client/${url}?category_id=${pageInfo.list[0].category_id}&query_name=${query_name}">首页</a></li> 
			      		<li>
			      		  <a href="${pageContext.request.contextPath }/client/${url}?pageNum=${pageInfo.pageNum-1}&category_id=${pageInfo.list[0].category_id}&query_name=${query_name}">
			      			<span>&laquo;</span>
			      		  </a>
			      		</li>
			      		<c:forEach items="${pageInfo.navigatepageNums}" var="pageNum" >
			      		      <c:if test="${pageNum eq pageInfo.pageNum }">
			      		         <li class="active"><a>${pageNum }</a></li>
			      		      </c:if>
			    	          <c:if test="${! (pageNum eq pageInfo.pageNum) }">
			    	            <li>
			    	                <a  href="${pageContext.request.contextPath }/client/${url }?pageNum=${pageNum}&category_id=${pageInfo.list[0].category_id}&query_name=${query_name}">${pageNum }</a>
					            </li>
			    	          </c:if>
					   </c:forEach>
			      		<li>
			      		  <a href="${pageContext.request.contextPath }/client/${url}?pageNum=${pageInfo.pageNum+1}&category_id=${pageInfo.list[0].category_id}&query_name=${query_name}">
			      			<span>&raquo;</span>
			      		  </a>
			      		</li>
			      		<li><a href="${pageContext.request.contextPath }/client/${url}?pageNum=${pageInfo.pages}&category_id=${pageInfo.list[0].category_id}&query_name=${query_name}">尾页</a></li>
			      	  </ul>
			      </nav>
			 
								  
			  </div>
					
			</div>
  </body>
</html>
