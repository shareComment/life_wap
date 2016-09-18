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
<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">	
			<a class="brand" href="javascript:history.go(-1);">&nbsp; < </a>
			<p class="" style="font-size: 16px;padding-left: 40%;padding-top: 10px;">我的收益</p>
		</div>
</div>
</br>
</br>
</br>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<h5>
				您当前拥有${myUser.bonus_point}个成长值,爵位为：${myUser.grade_Name}
			</h5>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<p>
				<table class="table table-striped table-hover table-bordered">
						<thead>
						    <tr>
								<th>成长值</th>
								<th>爵位</th>
								<th>收益(前一万名注册用户)</th>
								<th>收益(其他用户)</th>
						    </tr>
					  	</thead>
					  	<tbody>
						    <tr>
						    	<td>0-500</td>
						      	<td>平民</td>
						      	<td>无</td>
						      	<td>敬请期待</td>
						    </tr>
						    <tr>
						    	<td>501-5000</td>
						      	<td>勋爵</td>
						      	<td>=贡献系数(1/1000万)*总市值</td>
						      	<td>敬请期待</td>
						    </tr>
						    <tr>
						    	<td>5001-15000</td>
						      	<td>子爵</td>
						      	<td>=贡献系数(2/1000万)*总市值</td>
						      	<td>敬请期待</td>
						    </tr>
						    <tr>
						    	<td>15001-30000</td>
						      	<td>伯爵</td>
						      	<td>=贡献系数(3/1000万)*总市值</td>
						      	<td>敬请期待</td>
						    </tr>
						    <tr>
						    	<td>30001-60000</td>
						      	<td>侯爵</td>
						      	<td>=贡献系数(5/1000万)*总市值</td>
						      	<td>敬请期待</td>
						    </tr>
						    <tr>
						    	<td>60001-120000</td>
						      	<td>公爵</td>
						      	<td>=贡献系数(7/1000万)*总市值</td>
						      	<td>敬请期待</td>
						    </tr>
						    <tr>
						    	<td>240000以上</td>
						      	<td>王/女王</td>
						      	<td>=贡献系数(10/1000万)*总市值</td>
						      	<td>敬请期待</td>
						    </tr>
					  	</tbody>
					</table> 
			</p>
		</div>
	</div>
</div>
</body>
</html>
