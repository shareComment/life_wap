<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="st" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	<link href="http://apps.bdimg.com/libs/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<script src="http://apps.bdimg.com/libs/jquery/1.7.2/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<title>无锡自由生活</title>
</head>
<body>
	<!--导航条-->
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">	
			<a class="brand" href="/life_wap/WapConntroller/showHome.do">自由生活</a>
		    <form method="post" action="/life_wap/WapConntroller/searchBrandList/1.do" class="navbar-form pull-left" style="width: 40%;">
			      <input type="text" name="b" class="span2" />
		    </form>
    		<!-- <a class="brand" href="showLogin.do" style="color: #000;float: right;">登陆</a> -->
    		<c:if test="${rspUserBean == null}">
    			<a class="brand" href="/life_wap/WapConntroller/showLogin.do" style="color: #000;float: right;">登陆</a>
    		</c:if>
    		<c:if test="${rspUserBean != null}">
    			<a class="brand" href="/life_wap/WapConntroller/showMy.do" style="color: #000;float: right;">${rspUserBean.nickname}</a>
    		</c:if>
		</div>
	</div>
</body>
</html>
