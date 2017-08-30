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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 主页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> 用户列表 <a class="btn btn-success radius r btn-refresh" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="member_add('添加用户','user_add.jsp','500','360')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a></span> <span class="r">共有数据：<strong id="user_count">加载中...</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="80">ID</th>
				<th width="100">账号</th>
				<th width="40">性别</th>
				<th width="150">邮箱</th>
				<th width="80">用户组</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody class="User_list">
		
		</tbody>
	</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(function(){
	var html="";
	$.ajaxSetup({async:false});
 	$.post("${pageContext.request.contextPath}/getAllUser.do",function(data){
 		$("#user_count").text(data.length);
		$.each(data,function(i,e){
			html+="<tr class='text-c'><td><input type='checkbox' value='1' name=''></td><td>"+data[i].id+"</td><td>"+data[i].userName+"</u></td><td>"+data[i].sex+"</td><td>"+data[i].email+"</td><td>"+data[i].groupName+"</td><td class='td-manage'>"
			if(data[i].groupName == "普通用户"){
				html+="<a title='提升为管理员' href='javascript:;' onclick='group_edit("+"$(this),1"+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe60d;</i></a>"
			}else if(data[i].groupName == "管理员"){
				html+="<a title='降为普通用户' href='javascript:;' onclick='group_edit("+"$(this),0"+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe62d;</i></a>"
			}else if(data[i].groupName == "超级管理员"){
				html+="<a title='我是超级管理员' href='javascript:;' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe653;</i></a>"
			}
			html+="<a title='编辑' href='javascript:;' onclick='user_edit("+"$(this)"+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6df;</i></a> <a style='text-decoration:none' class='ml-5' onClick='userPwd_edit("+"$(this)"+")' href='javascript:;' title='修改密码'><i class='Hui-iconfont'>&#xe63f;</i></a> <a title='删除' href='javascript:;' onclick='user_del("+"$(this)"+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6e2;</i></a></td></tr>";
			
		});
 	});
 	$(".User_list").append(html);
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,4,5]}// 制定列不参与排序
		]
	});
});
/*用户-编辑*/
function user_edit(object){
	
	var path = object.parent().parent().children();
	var id = path.eq(1).text();
	var userName = escape(path.eq(2).text());
	alert(escape(path.eq(2).text()));
	var sex = escape(path.eq(3).text());
	var email = escape(path.eq(4).text());
	member_edit('编辑用户','user_modify.jsp?id='+id+'&userName='+userName+'&sex='+sex+'&email='+email+'','360','260');
}
/*用户组-修改*/
function group_edit(object,oper){
	var path = object.parent().parent().children();
	var id = path.eq(1).text();
	if(oper == "1"){
		layer.confirm('确认要提升为管理员吗？',function(index){
			$.ajax({
				type : "post",  
		        dataType : "json",  
		        data : {  
		        	id : id,
		        	groupName : '管理员' 
		        },  
		        async : false, 
		        cache : false, 
		        url : "${pageContext.request.contextPath}/modifyGroupName.do",  
				success: function(data){
					layer.msg('修改用户组成功',{icon:1,time:1000});
					location.replace(location.href);
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		});
	}else if(oper == "0"){
		layer.confirm('确认要降为普通用户吗？',function(index){
			$.ajax({
				type : "post",  
		        dataType : "json",  
		        data : {  
		        	id : id,
		        	groupName : '普通用户'
		        },  
		        async : false, 
		        cache : false, 
		        url : "${pageContext.request.contextPath}/modifyGroupName.do",  
				success: function(data){
					layer.msg('修改用户组成功',{icon:1,time:1000});
					location.replace(location.href);
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		});
	}
	
}
/*用户密码-编辑*/
function userPwd_edit(object){
	var path = object.parent().parent().children();
	var id = path.eq(1).text();
	change_password('修改密码','pwd_modify.jsp?id='+id+'','400','220');
}
/*用户-删除*/
function user_del(object){
	var path = object.parent().parent().children();
	var id = path.eq(1).text();
	member_del(id);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-编辑*/
function member_edit(title,url,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type : "post",  
	        dataType : "json",  
	        data : {  
	        	id : id
	        },  
	        async : false, 
	        cache : false, 
	        url : "${pageContext.request.contextPath}/deleteUser.do",  
			success: function(data){
				layer.msg('已删除!',{icon:1,time:1000});
				location.replace(location.href);
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
/*批量删除*/
function datadel(){
	
	var user_checked = $(":checked").parent().parent();
	var num = 0; //选中的人数
	for(var i = 0; i < user_checked.length; i++){
		if(user_checked[i].getElementsByTagName("td")[1] !=undefined){
			num++;
		}
	}
	layer.confirm('您当前选中了'+num+'个用户，确认要全部删除吗？',function(index){
		for(var i = 0; i < user_checked.length; i++){
			if(user_checked[i].getElementsByTagName("td")[1] !=undefined){
				$.ajax({
					type : "post",  
			        dataType : "json",  
			        data : {  
			        	id : user_checked[i].getElementsByTagName("td")[1].innerText
			        },  
			        async : false, 
			        cache : false, 
			        url : "${pageContext.request.contextPath}/deleteUser.do",  
					success: function(data){
						layer.msg('已删除!',{icon:1,time:1000});
						location.replace(location.href);
					},
					error:function(data) {
						console.log(data.msg);
					},
				});
			}
		}
	});
}
</script> 
</body>
</html>