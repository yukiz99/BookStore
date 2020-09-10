<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>后台首页</title>
    
  </head>
  
  <frameset rows="8%,*">
  	<frame src="${pageContext.request.contextPath }/manager/head.jsp" scrolling="no" frameborder="0" name="head">
  	<frameset cols="10%,*">
  		<frame src="${pageContext.request.contextPath }/manager/left.jsp" scrolling="no" frameborder="0" name="left">
  		<frame src="${pageContext.request.contextPath }/manager/right.jsp"  frameborder="0" name="right">
  	</frameset>
  </frameset>
</html>
