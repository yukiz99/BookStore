<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>所有书类</title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="/jquery-1.12.4.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/holder.min.js"></script>
  </head>
      
  <body>
  
  
<div class="container col-sm-7 col-sm-offset-2">
  	
  
  	<h2 class="page-header text-success">分类信息</h2>
  
  	
  	      <!-- 编辑模态框 -->
  	      <div id="editModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
					   	<div class="modal-body">
							<form id="editForm" action="">
								<div class="form-group">
								    <input type="hidden" name="id">
									<input class="form-control" placeholder="新类名" name="name"/>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button id="editModal_editBtn" class="btn btn-primary save">更新</button>
							<button class="btn btn-default" data-dismiss="modal">close</button>
						</div>
					</div>
				</div>
			</div>
			
	
	    <!-- 添加 -->
	  	<div class="row">
	  	   <div class="col-sm-4 col-sm-offset-6">
	  	       <form id="addForm" action="" method="post">
		  	   <input name="name">
		  	   <button id="addBtn" class="btn btn-primary">新增</button>
		  	</form>
	  	   </div>
	  	</div>
  	
  	<div class="row">
  	   <div class="col-sm-9 col-sm-offset-1">
  	    <table class="table table-hover">
	  		<thead>
	  		  <tr>
	  			<th>分类名称</th>
	  			<th>操作</th>
	  		  </tr>
	  		</thead>
		    <tbody>
		      <c:forEach var="c" items="${categories}">
		    	<tr>
		  			<td>${c.name }</td>
		  			<td>
		  				<button class="btn btn-primary" onclick="deleteCategory('${c.id }')">删除</button>
		  				<button class="btn btn-warning" onclick="getCategory('${c.id}')">修改</button>
		  			</td>
	  			</tr>
		      </c:forEach>
		   </tbody>
    	</table>
  	   </div>
  	</div>
  	
  	
 </div>
  	<script>
  	
  	//删除书类
  	function deleteCategory(id){
  		$.ajax({
  			url:"${pageContext.request.contextPath}/manager/deleteCategory?id="+id,
  		    type:"GET",
  		    success:function(data){
  		    	alert(data.obj);
  		    	if(data.code==1){
  		    		window.location.href="${pageContext.request.contextPath}/manager/getAllCategory";
  		    	}
  		    }
  		});
  	};
  	
  	//添加书类
  	$("#addBtn").click(function(){
  		$.ajax({
  			url:"${pageContext.request.contextPath}/manager/addCategory",
  			type:"POST",
  			async:false,
  			data:$("#addForm").serialize(),
  			success:function(data){
  				alert(data.obj);
  				window.location.href="${pageContext.request.contextPath}/manager/getAllCategory";
  			}
  		});
  	});
  	
   	
  	//编辑前得到书类
  	function getCategory(id){
  		$.ajax({
  			url:"${pageContext.request.contextPath}/manager/findCategoryById?id="+id,
  			async:false,
  		    type:"GET",
  		    success:function(data){
  		    	var c=data.obj;
  		    	$("#editModal input[name=name]").val(c.name);
  		    	$("#editModal input[name=id]").val(c.id);
  		    	$("#editModal").modal('show');
  		    }
  		});
  	}
  	//编辑书类
  	$("#editModal_editBtn").click(function(){
  		$.ajax({
  			url:"${pageContext.request.contextPath}/manager/updateCategory",
  			type:"POST",
  			data:$("#editForm").serialize(),
  			success:function(data){
  				if(data.code==1){
  					window.location.href="${pageContext.request.contextPath}/manager/getAllCategory";
  				}else{
  					alert(data.obj);
  					$("#editModal").modal('hide');
  				}
  				
  			}
  		});
  	});
  	 	
  	
  	</script>
  </body>
</html>
