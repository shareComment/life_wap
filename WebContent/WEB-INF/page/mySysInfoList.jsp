﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">	
			<a class="brand" href="javascript:history.go(-1);">&nbsp; < </a>
			<p class="" style="font-size: 16px;padding-left: 40%;padding-top: 10px;">我的系统消息</p>
		</div>
</div>
</br>
</br>
</br>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<table class="table">
				<tbody>
					<c:forEach items="rspSysInfoBeanList" var="sb" varStatus="status">
					<tr>
						<td>
							<p class="text-center">${sb.title }<p>
						</td>
						<td>
							<p class="text-right">${sb.send_time }</p>
						</td>
					</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@include file="bottom.jsp" %>
</body>
</html>
