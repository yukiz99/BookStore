<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>前台首页</title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="/jquery-1.12.4.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
	<style>
	   html {height:100%; }
	   #nav{
	      margin-bottom:0px;
	      height:70px;
	      font-size:20;
	   }
	   /*overflow-y: hidden; */
	   iframe{
	      width:100%;
	      margin:0px;
	   }
	   
	</style>
  </head>
  
			
			<nav id="nav" class="navbar navbar-inverse">
				<div class="navbar-header">
					<a href="" class="navbar-brand">SmallBookStore</a>
					<button class="navbar-toggle collapsed" data-target="#mynavbar">
					 </button>
				</div>
				<div id="mynavbar" class="collapse navbar-collapse">
				      <ul class="nav navbar-nav">
				     	  <li><a href="${pageContext.request.contextPath }/client/getAllBook" target="body">首页</a></li>
						  <li><a href="${pageContext.request.contextPath }/client/listCart.jsp" target="body">我的购物车</a></li>
						  <li><a href="${pageContext.request.contextPath }/client/getAllOrderByUser" target="body">我的订单</a></li>  
					  </ul>	
					  
					  						
					   <ul class="nav navbar-nav navbar-right">
					     <c:if test="${user==null}"> 
							<li><a href="${pageContext.request.contextPath }/client/login.jsp" target="_parent">登陆</a></li>
							<li><a href="${pageContext.request.contextPath }/client/regist.jsp" target="_parent">注册</a></li>
						 </c:if>
					     <c:if test="${user!=null }">
							<li><a class="btn btn-link navbar-btn navbar-right" href="${pageContext.request.contextPath }/client/loginout">安全退出</a></li>
			             </c:if>
                               
                           </ul>
					
						<form action="${pageContext.request.contextPath}/client/queryBook" method="get"  target="body" class="navbar-form navbar-center">
						  <div class="form-group">
							  <input class="form-control" placeholer="书名"  name="name"/>
						  </div>
						  <div class="form-group">
							    <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-search"><span></button>
						  </div>
						 </form>
				 </div>
			</nav>
				
  	 <div id="body">
  	      <iframe id="myIframe" src="${pageContext.request.contextPath }/client/getAllBook"  scrolling="no" width="100%" name="body"  marginwidth="0" marginheight="0" frameborder="0"></iframe>
  	 </div>
  	 
  	 <script>
  	/*
  	 
  	var iframes = document.getElementsByTagName('iframe');

    for (var i = 0, j = iframes.length; i < j; ++i) {
        // 放在闭包中，防止iframe触发load事件的时候下标不匹配
        (function(_i) {
            iframes[_i].onload = function() {
                // 提前还原高度
                this.setAttribute('height', 'auto'); // 或设为''
                // 再在下一轮事件循环中设置新高度
                setTimeout(function() {
                    iframes[_i].setAttribute('height', iframes[_i].contentWindow.document.body.scrollHeight);
                }, 0);
            }
        })(i);
    }
  	*/

   /* var iframes = document.getElementsByTagName('iframe');

    for (var i = 0, j = iframes.length; i < j; ++i) {
        // 放在闭包中，防止iframe触发load事件的时候下标不匹配
        (function(_i) {
            iframes[_i].onload = function() {
            	 this.style.visibility = 'hidden';
            	 // this.style.display = 'none';

                // 提前还原高度
                this.setAttribute('height', 'auto'); // 或设为''

                // 再在下一轮事件循环中设置新高度
                setTimeout(function() {
                    iframes[_i].setAttribute('height', iframes[_i].contentWindow.document.body.scrollHeight);

                    iframes[_i].style.visibility = 'visible';
                    //iframes[_i].style.display = 'block';
                }, 0);
            }
        })(i);
    }	  
    
    */
    var iframes = document.getElementsByTagName('iframe');

    for (var i = 0, j = iframes.length; i < j; ++i) {
        // 放在闭包中，防止iframe触发load事件的时候下标不匹配
        (function(_i) {
            iframes[_i].onload = function() {
                this.contentWindow.onbeforeunload = function() {
                    iframes[_i].style.visibility = 'hidden';
                    // iframes[_i].style.display = 'none';

                    iframes[_i].setAttribute('height', 'auto');
                };

                this.setAttribute('height', this.contentWindow.document.body.scrollHeight);

                this.style.visibility = 'visible';
                // this.style.display = 'block';
            };
        })(i);
    }
  	 </script>
</html>
