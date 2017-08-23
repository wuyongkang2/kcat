<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">   <!--中文语言-->
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>KCat-Admin</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-admin-add">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>选择软件：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<select class="select" id="softName" name="softName" size="1">
				<option value="0">请选择软件</option>
				<option value="0">加载中...</option>
			</select>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学院：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<select class="select" id="softCollege" name="softCollege" size="1">
				<option value="0">请选择学院</option>
				<option value="0">加载中...</option>
			</select>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<select class="select" id="softMajor" name="softMajor" size="1">
				<option value="0">请选择专业</option>
			</select>
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	college();
	softName();
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//检查select是否选中
	$.validator.addMethod("checkSelect",function(value,element,params){
		 var flagTemp = false;
		 if($('#'+element.id).prop('selectedIndex') != 0){
			flagTemp = true;
		 }
		 return flagTemp;
	},"这是必选选项");
	
	//获取当前日期
	function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "/";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        return currentdate;
    }
	
	$("#form-admin-add").validate({
		rules:{
			softName:{
				checkSelect:true
			},
			softCollege:{
				checkSelect:true,
			},
			softMajor:{
				checkSelect:true,
			},
		},
		onkeyup:false,
		focusCleanup:false,
		success:"valid",
		submitHandler:function(form){
			$.post("${pageContext.request.contextPath}/getSoftName_id.do",{softName:$('#softName option:selected').text()},function(data1){
				console.log($('#softName option:selected').text());
				$.post("${pageContext.request.contextPath}/addStudySoft.do",{softName:data1[0].softName,softType:data1[0].softType,soft_to_titleS:$("#softMajor").get(0).selectedIndex,softImage:data1[0].softImage,soft_jietu:data1[0].soft_jietu,softUrl:data1[0].softUrl,soft_jianjie:data1[0].soft_jianjie,soft_video:data1[0].soft_video,soft_date:getNowFormatDate(),soft_version:data1[0].soft_version},function(data2){
					if(data2){
						parent.layer.msg('添加成功',{time: 500, icon: 1},function(){
							window.parent.location="${pageContext.request.contextPath}/admin/studySoft_list.jsp";
							var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		                    parent.layer.close(index);
						});
						
	                    
					}else{
						parent.layer.msg('添加失败',{time: 300}, {icon: 2},function(){
							window.parent.location="${pageContext.request.contextPath}/admin/studySoft_list.jsp";
							var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		                    parent.layer.close(index);
						});
					}
				});
			});
		}
	});
});
//绑定软件
function softName(){
	var selDom = $("#softName");
	selDom.empty();
	selDom.append("<option value='0'>请选择软件</option>");
	$.ajaxSetup({async:false});
 	$.post("${pageContext.request.contextPath}/getAllSoftName.do",function(data){
 		$.each(data,function(i,e){
 			selDom.append("<option value="+data[i].id+">"+data[i].softName+"</option>");
 		});
 	});
}
//绑定学院
function college(){
	var selDom = $("#softCollege");
	selDom.empty();
	selDom.append("<option value='0'>请选择学院</option>");
	$.ajaxSetup({async:false});
 	$.post("${pageContext.request.contextPath}/getStudySoftB.do",function(data){
 		$.each(data,function(i,e){
 			selDom.append("<option value="+data[i].id+">"+data[i].titleBName+"</option>");
 		});
 	});
}
//绑定专业
$("#softCollege").change(function(){
	var college_selected_index = $("#softCollege").find("option:selected").val();
	var selDom = $("#softMajor");
	selDom.empty();
	selDom.append("<option value='0'>请选择专业</option>");
	$.ajaxSetup({async:false});
 	$.post("${pageContext.request.contextPath}/getStudySoftS.do",{titleS_to_titleB:college_selected_index},function(data){
 		$.each(data,function(i,e){
 			selDom.append("<option value="+data[i].id+">"+data[i].titleSName+"</option>");
 		});
 	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>