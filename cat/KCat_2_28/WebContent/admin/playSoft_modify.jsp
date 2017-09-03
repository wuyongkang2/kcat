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
				<option value="1">影音工具</option>
				<option value="2">网络工具</option>
				<option value="3">系统工具</option>
				<option value="4">游戏娱乐</option>
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
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>软件简介：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<textarea class="textarea" value="" placeholder="" id="softContent" name="softContent" ></textarea>
		</div>
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
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>云盘链接：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="softUrl" name="softUrl">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="softPw" name="softPw">
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
$(function(){
	//获取list页面传来当前的id
	var id = "<%=request.getParameter("id")%>";
	var softName = decodeURI("<%=request.getParameter("softName")%>");
	var softName_df = decodeURI("<%=request.getParameter("softName")%>");
	var softType = decodeURI("<%=request.getParameter("softType")%>");
	var time_name1 = decodeURI("<%=request.getParameter("time_name1")%>");
	var soft_jianjie = decodeURI("<%=request.getParameter("soft_jianjie")%>");
	var time_name2 = decodeURI("<%=request.getParameter("time_name2")%>");
	var softUrl = decodeURI("<%=request.getParameter("softUrl")%>");
	var soft_pw = decodeURI("<%=request.getParameter("soft_pw")%>");
	$("#softName").val(softName);
	
	$("#softType option").each(function (){
	    if($(this).text()==softType){   
	    $("#softType").val($(this).val())  
	 }});  
	
	$("#result1").val(sub(time_name1));
	$("#uploadFile_img1").attr('src',time_name1); 
	ico_flag = true;
	$("#result2").val(sub(time_name2));
	$("#uploadFile_img2").attr('src',time_name2); 
	jpg_flag = true;
	$("#softContent").val(soft_jianjie);
	$("#softUrl").val(softUrl);
	$("#softPw").val(soft_pw);
	
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//向jQuery Validator中添加自己的规则
	$.validator.addMethod("checkRepeat",function(value,element,params){
		return checkSoftName(value);
	},"软件已存在，请更换名字");
	
	//检测软件名字是否重复方法  
	function checkSoftName(softName){  
        var flagTemp = false;
        $.ajax({  
	        type : "post",  
	        dataType : "json",  
	        data : {  
	        	softName : softName
	        },  
	        async : false, 
	        cache : false, 
	        url : "${pageContext.request.contextPath}/checkPlaySoftName.do",  
	        success : function(data) {  
	            if(softName == softName_df){
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
				required:true,
				checkRepeat:true,
			},
			softType:{
				checkSelect:true,
			},
			ico_flag:{
				checkUpload1:true,
			},
			jpg_flag:{
				checkUpload2:true,
			},
			softContent:{
				required:true,
			},
			softUrl:{
				required:true,
			},
			softPw:{
				required:true,
			}
			
		},
		onkeyup:false,
		focusCleanup:false,
		success:"valid",
		submitHandler:function(form){
			$.post("${pageContext.request.contextPath}/updatePlaySoft.do",{id:id,softName:$("#softName").val(),softType:$('#softType option:selected').text(),softImage:sub(time_name1),soft_to_title:$('#softType option:selected').val(),soft_jietu:sub(time_name2),softUrl:$("#softUrl").val(),soft_jianjie:$('#softContent').val(),soft_pw:$('#softPw').val(),soft_date:getNowFormatDate(),soft_version:'1.0.0'},function(data){
				if(data){
					parent.layer.msg(
							'修改成功',{time: 500, icon: 1},function(){
						window.parent.location="${pageContext.request.contextPath}/admin/playSoft_list.jsp";
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	                    parent.layer.close(index);
					});
					
                    
				}else{
					parent.layer.msg('修改失败',{time: 300}, {icon: 2},function(){
						window.parent.location="${pageContext.request.contextPath}/admin/playSoft_list.jsp";
						var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	                    parent.layer.close(index);
					});
				}
			});
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
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>