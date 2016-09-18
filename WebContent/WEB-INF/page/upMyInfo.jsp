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
<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">	
			<a class="brand" href="#">&nbsp; < </a>
			<p class="" style="font-size: 16px;padding-left: 40%;padding-top: 10px;">我的信息</p>
		</div>
</div>
</br>
</br>
</br>
<form action="/life_wap/WapConntroller/updateMyInfo/${upCode}.do">
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<table class="table">
				<tbody>		
					<c:if test="${upCode == 1}">
					<tr>
						<td>
							头像							
						</td>
						<td>
							<p class="text-right"><img class="" width="40" height="40" src="${myUser.avatar }" alt="" /> ></p>
						</td>
					</tr>
					</c:if>
					<c:if test="${upCode == 2}">
					<tr>
						<td>
							昵称
						</td>
						<td>
							<input type="text" name="up" value="${rspUserBean.nickname }"></input>
						</td>
					</tr>
					</c:if>
					<c:if test="${upCode == 3}">
					<tr>
						<td>
							姓名
						</td>
						<td>
							<input type="text" name="up" value="${myUser.username }"></input>
						</td>
					</tr>
					</c:if>
					<c:if test="${upCode == 4}">
					<tr>
						<td>
							性别
						</td>
						<td>
							<input type="text" name="up" value="${myUser.gender == '0'?'女':'男'}"></input>
						</td>
					</tr>
					</c:if>
					<c:if test="${upCode == 5}">
					<tr>
						<td>
							年龄
						</td>
						<td><!-- == ""?"0":myUser.age  -->
							<input type="text" name="up" value="${myUser.age }"></input>
						</td>
					</tr>
					</c:if>
					<c:if test="${upCode == 6}">
					<tr>
						<td>
							学历
						</td>
						<td>
							<input type="text" name="up" value="${myUser.education }"></input>
						</td>
					</tr>
					</c:if>
					<c:if test="${upCode == 7}">
					<tr>
						<td>
							毕业院校
						</td>
						<td>
							<input type="text" name="up" value="${myUser.collage }"></input>
						</td>
					</tr>
					</c:if>
					<c:if test="${upCode == 8}">
					<tr>
						<td>
							邮箱
						</td>
						<td>
							<input type="text" name="up" value="${myUser.email }"></input>
						</td>
					</tr>
					</c:if>
				<!--	<tr>
						<td>
							所在地区
						</td>
						<td>
							<p class="text-right">${myUser.address }></p>
						</td>
					</tr>-->
				</tbody>
			</table>
			<p class="text-center"><button type="button" class="btn btn-danger">保存</button></p>
		</div>
	</div>
</div>
</form>
		</br>
		</br>
		</br>
<%@include file="bottom.jsp" %>
</body>
</html>
