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
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<!--/meta 作为公共模版分离出去-->

<title>KCat-Admin</title>
</head>
<body>
<article class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-member-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="addname" name="addname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="sex" type="radio" id="sex-1" checked value="男" >
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input name="sex" type="radio" id="sex-2" value="女">
					<label for="sex-2">女</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="@" name="addemail" id="addemail">
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
	//获取list页面传来当前的id
	var id = "<%=request.getParameter("id")%>";
	var userName = decodeURI("<%=request.getParameter("userName")%>");
	var userName_df = decodeURI("<%=request.getParameter("userName")%>");
	var sex = decodeURI("<%=request.getParameter("sex")%>");
	var email = decodeURI("<%=request.getParameter("email")%>");
	$("#addname").val(userName);
	if(sex == "男"){
		$("#sex-1").attr('checked','true');
	}else if(sex == "女"){
		$("#sex-2").attr('checked','true');
	}
	$("#addemail").val(email);
	
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//向jQuery Validator中添加自己的规则
	$.validator.addMethod("checkRepeat",function(value,element,params){
		return checkLoginName(value);
	},"账号已存在");
	
	//检测用户名是否重复方法  
	function checkLoginName(name){  
        var flagTemp = false;
        $.ajax({  
	        type : "post",  
	        dataType : "json",  
	        data : {  
	        	userName : name
	        },  
	        async : false, 
	        cache : false, 
	        url : "${pageContext.request.contextPath}/checkUser.do",  
	        success : function(data) {
	        	if(name == userName_df){
	        		flagTemp = true;
	        	}else{
	        		if(data){  
		                flagTemp = true;  
		            }else{  
		                flagTemp = false;  
		            } 
	        	}
	        },  
	        error : function() {  
	            alertMsg("服务器出错");  
	        }  
	    });  
	    return flagTemp;  
    }
	
	$("#form-member-add").validate({
		rules:{
			addname:{
				required:true,
				minlength:2,
				maxlength:16,
				checkRepeat:true
			},
			sex:{
				required:true,
			},
			addemail:{
				required:true,
				email:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$.post("${pageContext.request.contextPath}/modifyUser.do",{id:id,userName:$("#addname").val(),email:$("#addemail").val(),sex:$("input[name='sex']:checked").val()},function(data){
				if(data){
					parent.layer.msg(
							'信息修改成功',{time: 500, icon: 1},function(){
						window.parent.location="${pageContext.request.contextPath}/admin/user_list.jsp";
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	                    parent.layer.close(index);
					});
					
                    
				}else{
					parent.layer.msg('信息修改失败',{time: 300}, {icon: 2},function(){
						window.parent.location="${pageContext.request.contextPath}/admin/user_list.jsp";
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	                    parent.layer.close(index);
					});
				}
			});
		}
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>