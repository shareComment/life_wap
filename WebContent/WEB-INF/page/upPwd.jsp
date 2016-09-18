<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="st" uri="http://www.springframework.org/tags" %>
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
	<div class="container-fluid" id="XS">
		<div class="row-fluid">
			<div class="span2">
			</div>
			<div class="span8">
			    <form method="post" class="form-horizontal" action="/life_wap/WapConntroller/upPwd.do">
			      <div class="control-group">
			        <div class="controls text-center">
			          <input type="password" id="password" name="password" class="input-large" placeholder="请输入密码">
			        </div>
			      </div>
			      <div class="control-group">
			        <div class="controls text-center">
			          <input type="password" id="password1" name="password1" class="input-large" placeholder="请再次输入密码">
			        </div>
			      </div>
			      <div class="control-group ">
			        <div class="controls text-center">
			          <button type="submit" class="btn btn-primary btn-block">确定</button>
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
