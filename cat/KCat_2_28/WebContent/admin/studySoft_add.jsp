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
			<select class="select" id="softCollege" name="softType" size="1">
				<option value="0">请选择学院</option>
				<option value="0">加载中...</option>
			</select>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专业：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<select class="select" id="softMajor" name="softType" size="1">
				<option value="0">请选择专业</option>
			</select>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图标上传：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input style="width:190px;" disabled="true" type="text" id="result1" class="input-text" placeholder="请选择要上传的图标" />
			<input id="uploadFile1" class="btn btn-secondary radius" type="button" value="&nbsp;&nbsp;选择图标并上传&nbsp;&nbsp;" /><br />
			<img src="../images/upload_df.png" id="uploadFile_img1" class="img-rounded mar_b15" style="width: 60px;height: 60px;border-radius: 100px;"/>
		</div>
		<form id="form1">
	        <input id="js-file1" type="file" style="display:none;"/>
	    </form>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>大图上传：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input style="width:190px;" disabled="true" type="text" id="result2" class="input-text" placeholder="请选择要上传的大图" />
			<input id="uploadFile2" class="btn btn-secondary radius" type="button" value="&nbsp;&nbsp;选择大图并上传&nbsp;&nbsp;" /><br />
			<img src="../images/upload_df.png" id="uploadFile_img2" class="img-rounded mar_b15" style="width: 300px; height: 200px;"/>
		</div>
		<form id="form2">
	        <input id="js-file2" type="file" style="display:none;"/>
	    </form>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>软件上传：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input style="width:190px;" disabled="true" type="text" id="result3" class="input-text" placeholder="请选择要上传的软件" />
			<input id="uploadFile3" class="btn btn-secondary radius" type="button" value="&nbsp;&nbsp;选择软件并上传&nbsp;&nbsp;" /><br />
			<a id="uploadFile_soft" style="text-decoration:none;" href="javascript:volid(0);"><i style="font-size:28px;" class="Hui-iconfont"></i></a>
		</div>
		<form id="form3">
	        <input id="js-file3" type="file" style="display:none;"/>
	    </form>
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
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script src="../dist/crypto.js"></script>
<script type="text/javascript" src="../dist/cos-js-sdk-v4.js"></script>
<script type="text/javascript" src="../dist/sdk1.js"></script>
<script type="text/javascript" src="../dist/sdk2.js"></script>
<script type="text/javascript" src="../dist/sdk3.js"></script>
<script type="text/javascript">
$(function(){
	college();
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-admin-add").validate({
		rules:{
			adminName:{
				required:true,
				minlength:4,
				maxlength:16
			},
			password:{
				required:true,
			},
			password2:{
				required:true,
				equalTo: "#password"
			},
			sex:{
				required:true,
			},
			phone:{
				required:true,
				isPhone:true,
			},
			email:{
				required:true,
				email:true,
			},
			adminRole:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "xxxxxxx" ,
				success: function(data){
					layer.msg('添加成功!',{icon:1,time:1000});
				},
                error: function(XmlHttpRequest, textStatus, errorThrown){
					layer.msg('error!',{icon:1,time:1000});
				}
			});
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-refresh').click();
			parent.layer.close(index);
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