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
	<script type="text/javascript" src="/life_wap/js/ajaxfileupload.js"></script>
	<title>无锡自由生活</title>
	<script>
	$(document).ready(function(){

	});
	var s_url = "http://localhost:8080/life_interface/";
	function uploadPic(key,s){
		$.ajaxFileUpload({  
	        url:'http://localhost:8080/life_interface/syscontro/upload/1.do',  
	        secureuri:false,  
	        fileElementId:key,//file标签的id  
	        dataType: 'json',//返回数据的类型  
	        success: function (data, status) {
	        	str=key.substr(key.length-1,key.length-1);
	        	if("1" == s){//环境图
	        		$("#piclist1").val($("#piclist1").val() + jtrimstr(data) + ",");
	        		$("#image_span"+str).attr("src",jtrimstr(s_url+data));
	        		$("#image_span"+str).css("display","block"); 
	        	}
	        		
	        },  
	        error: function (data, status, e) {  
	            alert("上传失败，请重新上传" + e);
	        }  
	    });  
	}
	//去掉字符串空格
	function jtrimstr(str) {
		var i = 0;
		var j;
		var len = str.length;
		trimstr = "";
		while (i < len) {
			if (str.charAt(i) != " ") {
				trimstr = trimstr + str.charAt(i);
			}
			i++;
		}
		return (trimstr);
	}
	
	</script>
</head>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<form action="/life_wap/WapConntroller/addComment.do" method="post">
				<fieldset>
					 <legend>xxx</legend> 
					 	<textarea style="width: 100%;" name="con"  rows="20"></textarea> 	
				</fieldset>
				<input id="file_upload1" onchange="uploadPic('file_upload1','1')"  name="file_upload" type="file" multiple="true">
				<img style="display: none;"  id="image_span1" alt="" src="" height="200"  width="200">
				<input type="hidden" id="piclist1" name="img" value="">
				<input  style="display:none"  type="text" name="addComBrandId" value="${addComBrandId }" />
				<input  style="display:none"  type="text" name="addCommComId" value="${addCommComId }"/>
				<div class="text-center">
				<button type="submit" class="btn">提交</button>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>