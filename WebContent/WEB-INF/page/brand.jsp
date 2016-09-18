<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="st" uri="http://www.springframework.org/tags" %>
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
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
<body s-id="s8785925">
    <div id="viewport" style="position: relative;"><div><div>


<%@include file="top.jsp" %>
  </br>

<div class="pj-site-container">
    <div class="pj-site-info">
        <h1 class="pj-site-name"><span class="isclaim">${rspBrandBean.brand_name}</span><em><i class="pj-claim-icon"></i></em></h1>
        <h4 class="pj-site-domain">${rspBrandBean.official_website}</h4>
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
            </span>
        </div>

        <div class="pj-site-auth">
            <p class=" ">
                <span>${rspBrandBean.brand_info}</span>
            </p>
            
        </div>
        
    </div>
    <div class="pj-comt-list-wrapper site" id="comts">
        

<h4 class="pj-comt-menu">
    <span class="menus">
        <a href="/life_wap/WapConntroller/showAddComment/${rspBrandBean.brand_id}/0.do" class="menu active">
            评论
        </a>
    </span>
</h4>

<c:forEach items="${rspBrandCommentList}" var="comm" varStatus="status">
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
	            <img  width="34" height="34" src="${comm.avatar}">
	        </a>
	    </div>
	    
	    <div class="pj-comt-item-action">
	        <span class="pj-comt-act pj-op-reply" onclick="location.href='/life_wap/WapConntroller/showAddComment/${rspBrandBean.brand_id }/${comm.comment_id}.do'" data-comt="996831" data-ctype="1">回复<span>（<em>${comm.isComment }</em>）</span></span>
	    </div>
	</li>
	
	</ul>
</c:forEach>

<div class="pj-site-pager">
    
<div class="pj-pager">
    <a href="/life_wap/WapConntroller/showBrandComList/${rspBrandBean.brand_id }/0/${rspBrandCommentListPre}.do"  class="ui-btn pager-prev disabled" data-ui="primary">上一页</a>
    <a href="/life_wap/WapConntroller/showBrandComList/${rspBrandBean.brand_id }/0/${rspBrandCommentListNex}.do"  class="ui-btn pager-next" data-ui="primary" data-page="1">下一页</a>
<div>
	</br>
	</br>
	</br>
</div>

</div>


</div>
    </div>
</div>



<div class="pj-action-add">
    <a href="/life_wap/WapConntroller/showAddComment/${rspBrandBean.brand_id }/0.do" id="pj-add-comt">
        	写评论
    </a>
</div>


</div></div></div>
    <iframe src="./百度口碑_files/cache.html" style="display:none;"></iframe>
    <script src="./百度口碑_files/esl.js"></script>
    <script>
    //
    function onCom(bId)
    {
    	windows.location.href = '/life_wap/';
    }
    
    require.config({
        'baseUrl': '//ts.bdimg.com/womc/mobile/v3/20160715/dist',
        'paths': {},
        'packages': [
            {
                'name': 'etpl',
                'location': '../dep/etpl/3.0.0/dist',
                'main': 'main'
            },
            {
                'name': 'hammer',
                'location': '../dep/hammer/1.1.3/dist',
                'main': 'hammer'
            },
            {
                'name': 'saber-ajax',
                'location': '../dep/saber-ajax/2.0.0-beta.2/dist',
                'main': 'main'
            },
            {
                'name': 'saber-dom',
                'location': '../dep/saber-dom/1.0.0/dist',
                'main': 'main'
            },
            {
                'name': 'saber-emitter',
                'location': '../dep/saber-emitter/2.0.0-beta.1/dist',
                'main': 'emitter'
            },
            {
                'name': 'saber-firework',
                'location': '../dep/saber-firework/2.0.0-beta.1/dist',
                'main': 'main'
            },
            {
                'name': 'saber-lang',
                'location': '../dep/saber-lang/2.0.0-beta.1/dist',
                'main': 'main'
            },
            {
                'name': 'saber-promise',
                'location': '../dep/saber-promise/2.0.0-beta.1/dist',
                'main': 'promise'
            },
            {
                'name': 'saber-router',
                'location': '../dep/saber-router/2.0.0-beta.1/dist',
                'main': 'main'
            },
            {
                'name': 'saber-run',
                'location': '../dep/saber-run/1.0.0/dist',
                'main': 'main'
            },
            {
                'name': 'saber-tap',
                'location': '../dep/saber-tap/1.0.0/dist',
                'main': 'tap'
            },
            {
                'name': 'saber-uri',
                'location': '../dep/saber-uri/1.0.6/dist',
                'main': 'main'
            },
            {
                'name': 'saber-viewport',
                'location': '../dep/saber-viewport/1.1.0/dist',
                'main': 'main'
            },
            {
                'name': 'saber-storage',
                'location': '../dep/saber-storage/2.0.0-beta.1/dist',
                'main': 'main'
            },
            {
                'name': 'saber-env',
                'location': '../dep/saber-env/1.0.0/dist'
            },
            {
                'name': 'saber-widget',
                'location': '../dep/saber-widget/0.2.1/dist',
                'main': 'main'
            },
            {
                'name': 'saber-matchmedia',
                'location': '../dep/saber-matchmedia/0.1.0/dist',
                'main': 'main'
            },
            {
                'name': 'saber-cookie',
                'location': '../dep/saber-cookie/2.0.0-alpha.2/dist',
                'main': 'cookie'
            },
            {
                'name': 'saber-mm',
                'location': '../dep/saber-mm/0.4.0/dist',
                'main': 'main'
            },
            {
                'name': 'saber-string',
                'location': '../dep/saber-string/1.0.0/dist',
                'main': 'main'
            },
            {
                'name': 'wx',
                'location': '//res.wx.qq.com/open/js',
                'main': 'jweixin-1.0.0'
            },
            {
                'name': 'recorder',
                'location': '../dep/recorder',
                'main': 'recorder'
            },
            {
                'name': 'mvoice',
                'location': '../dep/mvoice',
                'main': 'mvoice'
            }
        ]
    });
    </script>
    <script>
    /* eslint-disable fecs-camelcase */
    var _hmt = _hmt || [];
    /* eslint-enable fecs-camelcase */
    (function () {
        var hm = document.createElement('script');
        hm.src = '//hm.baidu.com/hm.js?a236098d9e01fb7877977ac4f7d38d64';
        hm.setAttribute('async', 'async');
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(hm, s);
    })();
    </script>

    <script>
    require(['app'], function (app) {
        app.init();
    });
    </script>


<div class="pj-to-top hidden"><i class="i-pj-solid-up"></i></div></body></html>
