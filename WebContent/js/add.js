$(document).ready(function(){
	queryType();
	queryArea();
});

var s_url = "http://localhost:8080/wxsh_interface";
var pic_list1 = "";
var pic_list2 = "";

//上传牛人的图片
function uploadPic(key,s){
	$.ajaxFileUpload({  
        url:'http://localhost:8080/wxsh_interface/SystemConntro/upload/1.do',  
        secureuri:false,  
        fileElementId:key,//file标签的id  
        dataType: 'json',//返回数据的类型  
        success: function (data, status) {
        	str=key.substr(key.length-1,key.length-1);
        	if("1" == s){//环境图
        		$("#piclist1").val($("#piclist1").val() + jtrimstr(data) + ",");
        		$("#image_span"+str).attr("src",jtrimstr(s_url+data));
        		$("#image_span"+str).css("display","block"); 
        	}else if("2" == s){
        		$("#piclist2").val($("#piclist2").val() + jtrimstr(data)  + ",");
        		$("#image_span"+str).attr("src",jtrimstr(s_url+data));
        		$("#image_span"+str).css("display","block"); 
        	}else{
        		$("#piclist3").val(jtrimstr(data));
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



//异步加载区域
function queryArea(){
	var htmls = "";
	$.ajax({
	    type: 'GET',
	    url: 'http://localhost:8080/wxsh_interface/SystemConntro/queryAreaList/ar1.do',
	    dataType: 'json',
	    success:function(date){
	    	$.each(date.rspList.rspInfo,function(n,value){
	    		htmls += "<option value='"+value.areaKey+"'>"+value.areaName+"</option>";
	    	});
	    	$("#oneArea").append(htmls);
	    },
	    error:function(){
	    	alert("区域加载出错")
	    }
	});
}


//异步加载类别
function queryType(){
	var htmls = "";
	$.ajax({
	    type: 'GET',
	    url: 'http://localhost:8080/wxsh_interface/TypeConntroller/queryShopTypeList/2/0.do',
	    dataType: 'json',
	    success:function(date){
	    	$.each(date.rspList.rspInfo,function(n,value){
	    		htmls += "<option value='"+value.typeKey+"'>"+value.typeName+"</option>";
	    	});
	    	$("#oneType").append(htmls);
	    },
	    error:function(){
	    	alert("类别加载出错")
	    }
	});
}


function sub(){
	var shopName = $.trim($("#shopName").val());
	var shopDesc = $.trim($("#shopDesc").val());
	var lon = $.trim($("#lon").val());
	var lat = $.trim($("#lat").val());
	var typeKey = $.trim($("#oneType  option:selected").val());
	var areaKey = $.trim($("#oneArea  option:selected").val());
	var piclist1 = $.trim($("#piclist1").val());
	var piclist2 = $.trim($("#piclist2").val());
	var piclist3 = $.trim($("#piclist3").val());
	
	if("" == shopName){
		alert("请输入商家名称");
		return false;
	}
	if("" == shopDesc || shopDesc.length > 30){
		alert("请输入商家描述或商家描述超过25字符");
		return false;
	}
	if("" == lon || isNaN(lon)){
		alert("请输入正确的经度");
		return false;
	}
	if("" == lat || isNaN(lat)){
		alert("请输入正确的维度");
		return false;
	}
	if("" == typeKey){
		alert("请选择商家类别");
		return false;
	}
	if("" == areaKey){
		alert("请选择商家区域");
		return false;
	}
	if("" == piclist1){
		alert("请上传一张商家环境图片");
		return false;
	}
	if("" == piclist2){
		alert("请上传以上商家商品图片");
		return false;
	}
	if("" == piclist3){
		alert("请上传一张商家列表图片");
		return false;
	}
	
	$("#typeKey").val(typeKey);
	$("#areaKey").val(areaKey);
	
	return true;
}
