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
	<%@include file="top.jsp" %>
		 <div></br></div>
    <div></br></div>
    <div></br></div>
	<!-- 产品 -->
	<div class="container-fluid">
		
		<c:forEach  items="${rspSearchBrandList}" var="hb" varStatus="status">
			<c:if test="${(status.index+1) % 2 == 1}">
				<div class="row-fluid">
					<div class="span6">
						<p>
							NO.${status.index + 1}   
						</p>
						<h5 onclick="location.href='../WapConntroller/showBrand/${hb.brand_id}/0/1.do'">
							${hb.brand_name }
						</h5>
						<img alt="140x140" src="../img/x.png" /><img alt="140x140" src="../img/x.png" />
						<div class="row-fluid">
							<div class="span6">
								 <button onclick="location.href='/life_wap/WapConntroller/showAddComment/${hb.brand_id }/0.do'" class="btn btn-small" type="button">我要点评</button>
							</div>
							<div class="span6">
								 <button class="btn btn-primary btn-small" type="button">官网购物</button>
							</div>
						</div>
						<p>
							${hb.commentNum}评论
						</p>
					</div>
				
			</c:if>
			<c:if test="${(status.index+1) % 2 == 0}">
				<div class="span6">
						<p>
							NO.${status.index + 1}   
						</p>
						<h5 onclick="location.href='../WapConntroller/showBrand/${hb.brand_id}/0/1.do'">
							${hb.brand_name }
						</h5>
						<img alt="140x140" src="../img/x.png" /><img alt="140x140" src="../img/x.png" />
						<div class="row-fluid">
							<div class="span6">
								 <button class="btn btn-small" type="button">我要点评</button>
							</div>
							<div class="span6">
								 <button class="btn btn-primary btn-small" type="button">官网购物</button>
							</div>
						</div>
						<p>
							${hb.commentNum}评论
						</p>
					</div>
					
				</div>
			</c:if>
		</c:forEach>
	</div>
	
	<%@include file="bottom.jsp" %>
</body>
</html>
