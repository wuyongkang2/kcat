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
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>分类：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<select class="select" id="category" name="category" size="1">
				<option value="0">请选择分类</option>
				<option value="0">加载中</option>
			</select>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>名字：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="name" name="name">
		</div>
	</div>
	<div class="row cl" style="margin-top:10px;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图片：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input style="width:190px;" type="text" id="result2" name="jpg_flag" class="input-text" placeholder="请选择要上传的图片" />
			<input id="uploadFile2" class="btn btn-secondary radius" type="button" value="&nbsp;&nbsp;选择图片并上传&nbsp;&nbsp;" /><br />
			<img src="../images/upload_df.png" id="uploadFile_img2" class="img-rounded mar_b15" style="width: 300px; height: 200px;margin:10px 0;"/>
		</div>
	        <input id="js-file2" type="file" style="display:none;"/>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>电话：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="tel" name="tel">
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
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script src="../dist/crypto.js"></script>
<script type="text/javascript" src="../dist/cos-js-sdk-v4.js"></script>
<script type="text/javascript" src="../dist/sdk1.js"></script>
<script type="text/javascript" src="../dist/sdk2.js"></script>
<script type="text/javascript" src="../dist/sdk3.js"></script>
<script type="text/javascript">
softType();
$(function(){
	//获取list页面传来当前的id
	var id = "<%=request.getParameter("id")%>";
	var category = decodeURI("<%=request.getParameter("category")%>");
	var name = decodeURI("<%=request.getParameter("name")%>");
	var images = decodeURI("<%=request.getParameter("images")%>");
	var tel = decodeURI("<%=request.getParameter("tel")%>");
	
	$("#name").val(name);
	
	$("#category option").each(function (){
	    if($(this).text()==category){   
	    $("#category").val($(this).val())  
	 }}); 
	
	time_name2 = sub(images);
	$("#result2").val(sub(images));
	$("#uploadFile_img2").attr('src',images);
	jpg_flag = true;
	$("#tel").val(tel);
	
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
	
	//检查大图上传是否成功
	$.validator.addMethod("checkUpload2",function(value,element,params){
		 var flagTemp = false;
		 if(jpg_flag == true){
			flagTemp = true;
		 }
		 return flagTemp;
	},"你尚未上传，或者上传未完毕");
	
	$("#form-admin-add").validate({
		rules:{
			name:{
				required:true,
			},
			category:{
				checkSelect:true,
			},
			jpg_flag:{
				checkUpload2:true,
			},
			tel :{
				required:true,
			},	
		},
		onkeyup:false,
		focusCleanup:false,
		success:"valid",
		submitHandler:function(form){
			$.post("${pageContext.request.contextPath}/updateTel.do",{id:id,name:$("#name").val(),cid:$('#category option:selected').val(),category:$('#category option:selected').text(),images:time_name2,tel:$("#tel").val()},function(data){
				if(data){
					parent.layer.msg('修改成功',{time: 500, icon: 1},function(){
						window.parent.location="${pageContext.request.contextPath}/admin/tel_list.jsp";
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	                    parent.layer.close(index);
					});
				}else{
					parent.layer.msg('修改失败',{time: 300}, {icon: 2},function(){
						window.parent.location="${pageContext.request.contextPath}/admin/tel_list.jsp";
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	                    parent.layer.close(index);
					});
				}
			});
		}
	});
});
function sub(s){
	var length = s.length;
	var ss = "";
	for(var i = 0; i < length; i ++){
		
		if(s.substring(s.length-i-1,s.length-i) != "/"){
			ss = s.substring(s.length-i-1,s.length-i) + ss;
		}else{
			return ss;
		}
	}
	
}
//绑定类型
function softType(){
	var selDom = $("#category");
	selDom.empty();
	selDom.append("<option value='0'>请选择分类</option>");
	$.ajaxSetup({async:false});
 	$.post("${pageContext.request.contextPath}/getTel_Type.do",function(data){
 		$.each(data,function(i,e){
 			selDom.append("<option value="+data[i].id+">"+data[i].category+"</option>");
 		});
 	});
}
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>