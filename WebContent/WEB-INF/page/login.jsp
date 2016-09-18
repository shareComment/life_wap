<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="st" uri="http://www.springframework.org/tags" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	<link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="../css/bootstrap-responsive.css" rel="stylesheet">
	<script src="http://apps.bdimg.com/libs/jquery/1.7.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<title>无锡自由生活</title>
</head>
<body>
	<div class="container-fluid" id="XS">
		<div class="row-fluid">
			<div class="span2">
				</br>
				</br>
				</br>
			</div>
			<div class="span8">
				<div class="text-left">
					<img src="../img/LOGO.png" class="img-circle">
					<a class="" href="showRegister.do">免费注册</a>
				</div>
			    <form class="form-horizontal" action="login.do">
			      <div class="control-group text-center">
			        <div class="controls">
			          <input type="text" id="telephone" name="telephone" class="input-large" placeholder="用户名">
			        </div>
			      </div>
			      <div class="control-group">
			        <div class="controls text-center">
			          <input type="password" id="password" name="password" class="input-large" placeholder="密码">
			        </div>
			      </div>
			      <!-- 错误提示 -->
			      ${error}
			      <div class="control-group ">
			        <div class="controls text-center">
			          <button type="submit" class="btn btn-primary btn-block">登录</button>
			        </div>
			      </div>
			    </form>
			</div>
			<div class="span2">
			</div>
		</div>
	</div>
</body>
</html>
