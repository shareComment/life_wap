<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="st" uri="http://www.springframework.org/tags" %>

<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	<link href="http://apps.bdimg.com/libs/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<script src="http://apps.bdimg.com/libs/jquery/1.7.2/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<title>无锡自由生活</title>
</head>
<%@include file="top.jsp" %>
  </br>
  </br>	
  </br>		
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<form action="/life_wap/WapConntroller/addAgreed.do" method="post">
				<fieldset>
					 <legend>反馈意见</legend> 
					 	<textarea style="width: 100%;" name="con"  rows="20">
					 	</textarea> 	
				</fieldset>
				<div class="text-center">
				<button type="submit" class="btn">提交</button>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>