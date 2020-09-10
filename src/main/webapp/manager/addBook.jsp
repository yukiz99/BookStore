<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>添加图书</title>
  </head>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="/jquery-1.12.4.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/holder.min.js"></script>
    
    <style>
       .container{
           height:900px;
       }
       td{border: 1px solid transparent !important;}
       .showImgDiv{
         height:500px;
       }
       #img{
          height:100%;
       }
    </style>
  <body>
  
  
  <div class="container col-sm-9 col-sm-offset-1">
  
  <h2 class="page-header text-success">图书添加</h2>
    <form id="addForm" onsubmit="return add()" style="margin-top:50px"  class="col-sm-6 col-sm-offset-1" action="${pageContext.request.contextPath }/manager/addBook" method="post" enctype="multipart/form-data">
          <table class="table">
    	<tr>
    		<td class="col-sm-2">图书名称</td>
    		<td>
    			<input type="text" name="name">
    		</td>
    	</tr>
    	<tr>
    		<td>作者</td>
    		<td>
    			<input type="text" name="author">
    		</td>
    	</tr>
    	<tr>
    		<td>售价</td>
    		<td>
    			<input type="text" name="price">
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
    			<textarea rows="7" cols="50" name="description"></textarea>
    		</td>
    	</tr>
    	<tr>
    		<td>所属分类</td>
    		<td>
    			<select name="category_id">
    				<c:forEach var="c" items="${categories }">
    					<option value="${c.id }">${c.name }</option>
    				</c:forEach>
    			</select>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    		   <div class="col-sm-offset-2" style="margin-top:30px">
    		       <input type="reset"  class="btn btn-warning" value="清空">
    			   <button id="addBtn" class="btn btn-primary">添加</button>
    		   </div>
    		</td>
    	</tr>
    </table>
    </form>
    
   
    		      <div class="showImgDiv col-sm-4">
			        <img id="img">
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
			
			
			/*
			function check(){
				var name=$("#addForm input[name=name]").val();
				var author=$("#addForm input[name=author]").val();
				var price=$("#addForm input[name=price]").val();
				var img=$("#addForm input[name=image]").val();
				var desc=$("#addForm input[name=description]").val();
				
				if(isEmpty(name)||isEmpty(author)||isEmpty(price)||isEmpty(img)||isEmpty(desc)){
					alert("图书信息必须全部填写完整才能提交");
					return false;
				}
				alert("l");
			};
			
			
			function isEmpty(val){
				if(val==null||val==""){
					return true;
				}else{
					return false;
				}
			}
			*/
		</script>
  </body>
</html>
