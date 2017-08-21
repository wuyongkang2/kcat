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
<link rel="stylesheet" href="../dist/main.css">
<link rel="stylesheet" href="../dist/highlight.css">
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
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>软件名字：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="softName" name="softName">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>软件类型：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<select class="select" id="softType" name="softType" size="1">
				<option value="0">请选择软件类型</option>
				<option value="1">办公</option>
				<option value="2">工具</option>
				<option value="3">图形</option>
				<option value="4">开发</option>
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
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图标上传：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input style="width:190px;" type="text" id="result1" name="ico_flag" class="input-text" placeholder="请选择要上传的图标" />
			<input id="uploadFile1" class="btn btn-secondary radius" type="button" value="&nbsp;&nbsp;选择图标并上传&nbsp;&nbsp;" /><br />
			<img src="../images/upload_df.png" id="uploadFile_img1" class="img-rounded mar_b15" style="width: 60px;height: 60px;margin:10px 0;"/>
		</div>
		
	        <input id="js-file1" type="file" style="display:none;"/>
	    
	</div>
	<div class="row cl" style="margin-top:10px;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>大图上传：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input style="width:190px;" type="text" id="result2" name="jpg_flag" class="input-text" placeholder="请选择要上传的大图" />
			<input id="uploadFile2" class="btn btn-secondary radius" type="button" value="&nbsp;&nbsp;选择大图并上传&nbsp;&nbsp;" /><br />
			<img src="../images/upload_df.png" id="uploadFile_img2" class="img-rounded mar_b15" style="width: 300px; height: 200px;margin:10px 0;"/>
		</div>
	        <input id="js-file2" type="file" style="display:none;"/>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>软件上传：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input style="width:190px;" type="text" id="result3" name="soft_flag" class="input-text" placeholder="请选择要上传的软件" />
			<input id="uploadFile3" class="btn btn-secondary radius" type="button" value="&nbsp;&nbsp;选择软件并上传&nbsp;&nbsp;" /><br />
			<a id="uploadFile_soft" style="text-decoration:none;" href="javascript:volid(0);"><i style="font-size:28px;" class="Hui-iconfont"></i></a>
		</div>
	        <input id="js-file3" type="file" style="display:none;"/>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>软件简介：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<textarea class="textarea" value="" placeholder="" id="softContent" name="softContent" ></textarea>
		</div>
	</div>
	<div class="row cl" style="margin-top:10px;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>视频上传：</label>
        <input type="hidden" id="domain" value="http://op86rjyxw.bkt.clouddn.com/">
        <input type="hidden" id="uptoken_url" value="uptoken">
        <div class="formControls col-xs-8 col-sm-9">
            <div id="container" style="position: relative;">
                <a id="pickfiles" href="http://jssdk.demo.qiniu.io/#" style="position: relative; z-index: 1;"><input class="btn btn-secondary radius" type="button" value="选择视频并上传" /></a>
        	</div>
        <div style="display:none" id="success">
            <div class="alert-success" style="border-radius: 10px;">视频上传完毕</div>
        </div>
    </div>
    </div>
	<table class="table table-striped table-hover text-left" style="margin-top:40px;display:none">
	    <thead>
	      <tr>
	        <th class="col-md-4">视频名称</th>
	        <th class="col-md-2">大小</th>
	        <th class="col-md-6">详细信息</th>
	      </tr>
	    </thead>
	    <tbody id="fsUploadProgress">
	    </tbody>
	</table>
	
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
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script src="../dist/crypto.js"></script>
<script type="text/javascript" src="../dist/cos-js-sdk-v4.js"></script>
<script type="text/javascript" src="../dist/sdk1.js"></script>
<script type="text/javascript" src="../dist/sdk2.js"></script>
<script type="text/javascript" src="../dist/sdk3.js"></script>
<script type="text/javascript" src="../dist/bootstrap.min.js"></script>
<script type="text/javascript" src="../dist/moxie.js"></script>
<script type="text/javascript" src="../dist/plupload.dev.js"></script>
<script type="text/javascript" src="../dist/zh_CN.js"></script>
<script type="text/javascript" src="../dist/ui.js"></script>
<script type="text/javascript" src="../dist/qiniu.js"></script>
<script type="text/javascript" src="../dist/highlight.js"></script>
<script type="text/javascript" src="../dist/main.js"></script>
<script type="text/javascript">
$(function(){
	college();
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
	
	//检查图标上传是否成功
	$.validator.addMethod("checkUpload1",function(value,element,params){
		 var flagTemp = false;
		 if(ico_flag == true){
			flagTemp = true;
		 }
		 return flagTemp;
	},"你尚未上传，或者上传未完毕");
	//检查大图上传是否成功
	$.validator.addMethod("checkUpload2",function(value,element,params){
		 var flagTemp = false;
		 if(jpg_flag == true){
			flagTemp = true;
		 }
		 return flagTemp;
	},"你尚未上传，或者上传未完毕");
	//检查软件上传是否成功
	$.validator.addMethod("checkUpload3",function(value,element,params){
		 var flagTemp = false;
		 if(soft_flag == true){
			flagTemp = true;
		 }
		 return flagTemp;
	},"你尚未上传，或者上传未完毕");
	
	$("#form-admin-add").validate({
		rules:{
			softName:{
				required:true,
			},
			softType:{
				checkSelect:true,
			},
			softCollege:{
				checkSelect:true,
			},
			softMajor:{
				checkSelect:true,
			},
			ico_flag:{
				checkUpload1:true,
			},
			jpg_flag:{
				checkUpload2:true,
			},
			soft_flag:{
				checkUpload3:true,
			}
			
		},
		onkeyup:false,
		focusCleanup:false,
		success:"valid",
		submitHandler:function(form){
			alert(time_name1);
		}
	});
});
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