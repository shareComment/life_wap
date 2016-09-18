<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="st" uri="http://www.springframework.org/tags" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	 <link rel="stylesheet" href="/life_wap/css/app.css">
	<link href="http://apps.bdimg.com/libs/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<script src="http://apps.bdimg.com/libs/jquery/1.7.2/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<title>无锡自由生活</title>
</head>
<body>
<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">	
			<a class="brand" href="javascript:history.go(-1);">&nbsp; < </a>
			<p class="text-center">我的评论</p>
		</div>
</div>
</br>
</br>
</br>
<c:forEach items="${rspMyCommentList}" var="comm" varStatus="status">
	<ul id="pj-comt-list">
	<li class="pj-comt-item">
	    <div class="pj-comt-item-body">
	        <div class="pj-comt-item-title">
	            
	            <p class="name">
	                <a hidefocus="hidefocus" href="#">${comm.nickname }</a>
	            </p>
	            
	            <p class="info">
	                <i class="i-pj-star-3"></i>
	                <span class="time">${comm.add_time }</span>
	            </p>
	        </div>
	        <div class="pj-comt-detail">
	            <a href="/life_wap/WapConntroller/showComInfo/${rspBrandBean.brand_id}/${comm.comment_id }/1.do">
	                <pre>${comm.comment }</pre>
	            </a>
	        </div>
	        
	    </div>
	    
	    <div class="pj-comt-avatar">
	        <a href="#">
	            <img data-original="${comm.avatar}" width="34" height="34" src="#">
	        </a>
	    </div>
	    
	    <div class="pj-comt-item-action">
	        <span class="pj-comt-act pj-op-reply" onclick="location.href='/life_wap/WapConntroller/showAddComment/${rspBrandBean.brand_id }/${comm.comment_id}.do'" data-comt="996831" data-ctype="1">回复<span>（<em>${comm.isComment }</em>）</span></span>
	    </div>
	</li>
	
	</ul>
</c:forEach>
<%@include file="bottom.jsp" %>
</body>
</html>
