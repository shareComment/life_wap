<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="st" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="zh-CN">

<head>

<meta name="referrer" content="always">
    <title>无锡自由生活</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="dns-prefetch" href="http://hm.baidu.com/">
    <link rel="dns-prefetch" href="http://trustrcv.baidu.com/">
    <link rel="dns-prefetch" href="http://himg.bdimg.com/">
    <link rel="dns-prefetch" href="http://ts.bdimg.com/">

    <link rel="stylesheet" href="/life_wap/css/app.css">
    <link rel="apple-touch-icon" href="http://koubei.baidu.com/photo/apple-touch-icon.png">
    <link rel="apple-touch-icon-precomposed" href="http://koubei.baidu.com/photo/apple-touch-icon.png">
    <link href="http://apps.bdimg.com/libs/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<script src="http://apps.bdimg.com/libs/jquery/1.7.2/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/bootstrap/2.3.2/js/bootstrap.min.js"></script>
</head>
<body s-id="s8785925">
    <div id="viewport" style="position: relative;"><div style="float: none; width: auto; position: static;">

<%@include file="top.jsp" %>
<div class="pj-weixin-share-tip"></div>

<div class="pj-detail-container ">
    <div class="pj-site-top"></div>
    <div class="pj-site-info">
        <h1 class="pj-site-name">${rspBrandBean.brand_name}</h1>
        <div class="pj-site-ext">
&nbsp;
            <span class=" ">
        		<c:choose>
        			<c:when test="${rspBrandBean.score == 100}">
        			<img alt="140x140" src="/life_wap/img/x.png" /><img alt="140x140" src="/life_wap/img/x.png" /><img alt="140x140" src="/life_wap/img/x.png" /><img alt="140x140" src="/life_wap/img/x.png" /><img alt="140x140" src="/life_wap/img/x.png" />
        			</c:when>
        			<c:when test="${rspBrandBean.score >= 80}">
        			<img alt="140x140" src="/life_wap/img/x.png" /><img alt="140x140" src="/life_wap/img/x.png" /><img alt="140x140" src="/life_wap/img/x.png" /><img alt="140x140" src="/life_wap/img/x.png" />
        			</c:when>
        			<c:when test="${rspBrandBean.score >= 60}">
        			<img alt="140x140" src="/life_wap/img/x.png" /><img alt="140x140" src="/life_wap/img/x.png" /><img alt="140x140" src="/life_wap/img/x.png" />
        			</c:when>
        			<c:when test="${rspBrandBean.score >= 40}">
        			<img alt="140x140" src="/life_wap/img/x.png" /><img alt="140x140" src="/life_wap/img/x.png" />
        			</c:when>
        			<c:when test="${rspBrandBean.score >= 20}">
        				<img alt="140x140" src="/life_wap/img/x.png" />
        			</c:when>
        			<c:otherwise>
        				<img alt="140x140" src="/life_wap/img/bx.png" />
    				</c:otherwise>
        		</c:choose>
            	
            </span>
            <span class="enough">
                <em class="pj-comt-praise">
                    ${rspBrandBean.score}%
                </em> 好评
                <em class="pj-comt-count">
                    ${rspBrandCommentListCom }&nbsp;条评论
                </em>
            </span>
        </div>
    </div>
    <div class="pj-comt-list-wrapper">
        <div class="pj-comt-item">
            
            <div class="pj-comt-item-body">
                <div class="pj-comt-item-title">
                    <p class="name">
                        <a hidefocus="hidefocus" href="#">${rspUserBean.nickname}</a>
                        <i class="pj-level pj-level-4">&nbsp;</i>
                    </p>
                    <p class="info">
                        <i class="i-pj-star-4">
                        </i>
                        <span class="time">${commentPreInfo.add_time }</span>
                    </p>
                </div>
                <div class="pj-comt-detail">
                    <pre data-share-title="">${commentPreInfo.comment}</pre>
                </div>
            </div>
            <div class="pj-comt-item-action">
                <span class="pj-comt-act pj-op-reply" data-comt="996831" data-ctype="1">回复<span>（<em>${rspCommentListCom}</em>）</span></span>
            </div>
        </div>



<div id="replies">
    <h3 class="pj-reply-title"><i></i>网民回复</h3>
    <ul class="pj-reply-list">
        <c:forEach items="${rspCommentList}" var="com" varStatus="status">
        <li class="pj-reply-item">
            <div class="pj-reply-item-body">
                <div class="pj-reply-item-title">
                <p class="name">
                    <a hidefocus="hidefocus" href="#">${com.nickname }</a>
                    <!-- <i class="pj-level pj-level-">&nbsp;</i> -->
                    <span>回复</span>
                    <a hidefocus="hidefocus" href="#">${commentPreInfo.nickname}</a>
                </p>
                <p class=""><!-- info -->
                    <span class="time">${com.add_time}</span>
                </p>
            </div>
            <div class="pj-comt-detail">
                <pre>${com.comment} <span class="pj-comt-act pj-op-reply" data-comt="996831" data-reply="406309" data-ctype="1"></span></pre>
            </div>
            </div>
            <div class="pj-reply-avatar">
                <a href="#">
                    <img alt="" width="25" height="25" src="${com.avatar}">
                </a>
            </div>
        </li>
        </c:forEach>
    </ul>
    
    
    <div class="pj-site-pager">
        
<div class="pj-pager">

    <a href="http://koubei.baidu.com/m2/detail/996831/ctype/1#" onclick="return false" class="ui-btn pager-prev disabled" data-ui="disabled primary">上一页</a>
    <a href="http://koubei.baidu.com/m2/detail/996831/ctype/1#" onclick="return false" class="ui-btn pager-next" data-ui="primary" data-page="1">下一页</a>
  
</div>

    </div>
    
</div>

    </div>
</div>

    
    <div class="pj-action-add">
        
        <a href="http://koubei.baidu.com/m2/mem/0f5686ebf1b032c5bad20b4e7184b5b1/comt/add" id="pj-add-comt">
            写评论
        </a>
    </div>
    



</div></div>
  
<div class="pj-to-top hidden"><i class="i-pj-solid-up"></i></div><div class="saber-viewport-mask" style="position: fixed; top: 0px; right: 0px; bottom: 0px; left: 0px; z-index: 100; display: none;"></div><div class="share-tip" style="display: none;"><div class="masker"></div><div class="wrapper"><ul class="share-group"><li class="share-item"><a href="http://koubei.baidu.com/m2/detail/996831/ctype/1#" onclick="return false;" data-cmd="tsina" class="icon-tsina"></a><p>微博</p></li><li class="share-item"><a href="http://koubei.baidu.com/m2/detail/996831/ctype/1#" onclick="return false;" data-cmd="qzone" class="icon-qzone"></a><p>QQ空间</p></li></ul><div class="share-close-btn-wrap"><a href="http://koubei.baidu.com/m2/detail/996831/ctype/1#" onclick="return false" class="share-close-btn">取消</a></div></div></div></body></html>