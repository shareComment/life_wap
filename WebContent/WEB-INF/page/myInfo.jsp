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
			<a class="brand" href="javascript:history.go(-1);">&nbsp; < </a>
			<p class="" style="font-size: 16px;padding-left: 40%;padding-top: 10px;">我的信息</p>
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
					<tr>
						<td>
							头像							
						</td>
						<td>
							<p onclick="location.href='/life_wap/WapConntroller/showUpdateMyInfo/1.do'" class="text-right"><img class="" width="40" height="40" src="${myUser.avatar }" alt="" /> ></p>
						</td>
					</tr>
					<tr>
						<td>
							昵称
						</td>
						<td>
							<p onclick="location.href='/life_wap/WapConntroller/showUpdateMyInfo/2.do'" class="text-right">${rspUserBean.nickname }></p>
						</td>
					</tr>
					<tr>
						<td>
							姓名
						</td>
						<td>
							<p onclick="location.href='/life_wap/WapConntroller/showUpdateMyInfo/3.do'" class="text-right">${myUser.username }></p>
						</td>
					</tr>
					<tr>
						<td>
							性别
						</td>
						<td>
							<p onclick="location.href='/life_wap/WapConntroller/showUpdateMyInfo/4.do'" class="text-right">${myUser.gender == "0"?"女":"男" }></p>
						</td>
					</tr>
					<tr>
						<td>
							年龄
						</td>
						<td><!-- == ""?"0":myUser.age  -->
							<p onclick="location.href='/life_wap/WapConntroller/showUpdateMyInfo/5.do'" class="text-right">${myUser.age}></p>
						</td>
					</tr>
					<tr>
						<td>
							学历
						</td>
						<td>
							<p onclick="location.href='/life_wap/WapConntroller/showUpdateMyInfo/6.do'" class="text-right">${myUser.education }></p>
						</td>
					</tr>
					<tr>
						<td>
							毕业院校
						</td>
						<td>
							<p onclick="location.href='/life_wap/WapConntroller/showUpdateMyInfo/7.do'" class="text-right">${myUser.collage }></p>
						</td>
					</tr>
					<tr>
						<td>
							邮箱
						</td>
						<td>
							<p onclick="location.href='/life_wap/WapConntroller/showUpdateMyInfo/8.do'" class="text-right">${myUser.email }></p>
						</td>
					</tr>
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
		</div>
	</div>
</div>
		</br>
		</br>
		</br>
<%@include file="bottom.jsp" %>
</body>
</html>
