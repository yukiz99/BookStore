<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="/jquery-1.12.4.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/holder.min.js"></script>
    
    
    <style>
       .container{
           height:900px;
           font-family:微软雅黑;
          
       }
       td{border: 1px solid transparent !important;}
       .showImgDiv{
         height:500px;
       }
       #img{
          height:100%;
       }
    </style>
    
</head>
<body>

<div class="container col-sm-9 col-sm-offset-1">

<h2 class="page-header text-success">图书修改</h2>

<form  style="margin-top:50px"  class="  col-sm-6  col-sm-offset-1" action="${pageContext.request.contextPath }/manager/updateBook" method="post" enctype="multipart/form-data">
           <input type="hidden" name="id" value="${book.id}">
           <input type="hidden" name="image" value="${book.image}">
        <table class="table">
    	<tr>
    		<td class="col-sm-2">图书名称</td>
    		<td>
    			<input type="text" name="name" value="${book.name }">
    		</td>
    	</tr>
    	<tr>
    		<td>作者</td>
    		<td>
    			<input type="text" name="author" value="${book.author}">
    		</td>
    	</tr>
    	<tr>
    		<td>售价</td>
    		<td>
    			<input type="text" name="price" value="${book.price }">
    		</td>
    	</tr>
    	<tr>
    		<td>图片</td>
    		<td>
    			<input type="file" name="file" id="file"  onchange="lookImg()" accept="image/jpg,image/jpeg,image/png,image/PNG">
    		</td>
    	</tr>
    	<tr>
    		<td>图书描述</td>
    		<td>
    			<textarea rows="7" cols="50" name="description">${book.description}</textarea>
    		</td>
    	</tr>
    	
    	
    	<tr>
    		<td>所属分类</td>
    		<td>
    			<select name="category_id">
    				<c:forEach var="c" items="${categories}">
    				    <c:choose>
	    				    <c:when test="${c.id eq book.category_id}">
	    				        <option value="${c.id }" selected="selected">${c.name }</option>
	    				    </c:when>
	    				    <c:otherwise>
	    				        <option value="${c.id }">${c.name }</option>
	    				    </c:otherwise>
    				  </c:choose>
    				</c:forEach>
    			</select>
    		</td>
    	</tr>
    
    	<tr>
    		<td colspan="2">
    		   <div class="col-sm-offset-2" style="margin-top:30px">
    		       <input type="submit" class="btn btn-primary"  value="编辑">
    		   </div>
    		</td>
    	</tr>
    </table>
    </form>
    
    <div class="showImgDiv col-sm-4">
			    <img id="img" src="${pageContext.request.contextPath }/upload/images/${book.image}">
	   </div>
       
    
     
    
</div>


 <script>
	function lookImg(){
		 var f=document.getElementById("file");
		 var reads = new FileReader();
		 var file= f.files[0];
		 reads.readAsDataURL(file);
		 reads.onload = function(e) {
		 document.getElementById('img').src = this.result;
	  }
	   }
</script>

 
</body>
</html>