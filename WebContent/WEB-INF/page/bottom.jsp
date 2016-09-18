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
	<script>
	$(document).ready(function(){

	});
	//加载一级
	function queryTypeList(){
		var htmls = "";
		var i = 1;
		$.ajax({
		    type: 'GET',
		    url: 'http://localhost:8080/life_interface/brandcontro/querytopcategory.do',
		    dataType: 'json',
		    success:function(date){
		    	$.each(date.infoList,function(n,value){
		    		htmls += "<li id='qtype"+i+"' class='dropdown-submenu'><a tabindex='-1' id='atype"+i+"' onmouseover='queryTypeLists("+value.cate_id+","+i+")' href='javascript:;'>"+value.cate_name+"</a></li>";
		    		i+=1;
		    	});
		    	$("#qtype").empty();
		    	$("#qtype").append(htmls);
		    },
		    error:function(){
		    	alert("区域加载出错")
		    }
		});
	}
	//加载二级
	function queryTypeLists(type,t){
		for(var j = 1; j < 1000; j++){
			$("#wtype"+j).empty();
			$("#wtype"+j).remove();
		}
		var htmls = "<ul id='wtype"+t+"' class='dropdown-menu'>";
		var i = 1;
		$.ajax({
		    type: 'GET',
		    url: 'http://localhost:8080/life_interface/brandcontro/querysecondctegory/'+type+'.do',
		    dataType: 'json',
		    success:function(date){
		    	$.each(date.infoList,function(n,value){
		    		htmls += "<li class='dropdown-submenu'><a onmouseover='queryTag("+value.cate_id+","+i+")' id='btype"+i+"' tabindex='-1' id='btype"+i+"' href='javascript:;''>"+value.cate_name+"</a></li>";
		    		i+=1;
		    	});
		    	htmls+="</ul>";
		    	$("#atype"+t).after(htmls);
		    },
		    error:function(){
		    	alert("区域加载出错")
		    }
		});
	}
	//加载标签
	function queryTag(type,t){
		for(var j = 1; j < 1000; j++){
			$("#etype"+j).empty();
			$("#etype"+j).remove();
		}
		var i = 1;
		var htmls = "<ul id='etype"+t+"' class='dropdown-menu'>";
		$.ajax({
		    type: 'GET',
		    url: 'http://localhost:8080/life_interface/brandcontro/querytaglist/'+type+'.do',
		    dataType: 'json',
		    success:function(date){
		    	$.each(date.infoList,function(n,value){
		    		htmls += "<li><a id='ctype"+i+"' tabindex='-1' id='btype"+i+"' href='/life_wap/WapConntroller/searchBrandLists/1/"+value.tag_name+".do''>"+value.tag_name+"</a></li>";
		    		i+=1;
		    	});
		    	htmls+="</ul>";
		    	$("#btype"+t).after(htmls);
		    },
		    error:function(){
		    	alert("区域加载出错");
		    }
		});
	}
	</script>
</head>
<body>
	<!-- 底部 -->
	<div class="navbar navbar-fixed-bottom">
		<div class="navbar-inner">	
			<button class="btn btn-link" type="button" >首页</button>
   			 <div style="display:inline;width: 200px;" class="dropdown">
            <a id="dLabel" onclick="queryTypeList()" role="button" data-toggle="dropdown" class="btn btn-link" data-target="#"
               href="javascript:;">
                分类 <span class="caret"></span>
            </a>
            <ul id="qtype" class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
            </ul>
        </div>
   		 	<button onclick="location.href='/life_wap/WapConntroller/showAddAgreed.do'" class="btn btn-link" type="button" style="padding-left: 10%;">提意见</button>
	   		<button onclick="location.href='/life_wap/WapConntroller/showMy.do'" class="btn btn-link" type="button">我的</button>
		</div>
	</div>
</body>
</html>
