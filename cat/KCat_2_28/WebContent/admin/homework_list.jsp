﻿<%@ page language="java" contentType="text/html; charset=utf-8"
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 主页 <span class="c-gray en">&gt;</span> 内容管理 <span class="c-gray en">&gt;</span> 作业辅助 <span class="c-gray en">&gt;</span> 查看列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="soft_add('添加','homework_add.jsp','800','460')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加</a> </span> <span class="r">共有数据：<strong id="soft_count">加载中...</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="40"><input name="" type="checkbox" value=""></th>
					<th width="50">ID</th>
					<th width="150">分类</th>
					<th width="50">标题</th>
					<th width="100">图片</th>
					<th width="50">云盘链接</th>
					<th width="70">密码</th>
					<th width="80">操作</th>
				</tr>
			</thead>
			<tbody class="Soft_list">
		
			</tbody>
		</table>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="lib/base64/base64.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(function(){
	var html="";
	$.ajaxSetup({async:false});
 	$.post("${pageContext.request.contextPath}/getAllHomework.do",function(data){
 		$("#soft_count").text(data.length);
		$.each(data,function(i,e){
			html+="<tr class='text-c'><td><input type='checkbox' value='1' name=''></td><td>"+data[i].id+"</td><td>"+data[i].category+"</td><td>"+data[i].title+"</td><td><a onclick='datu("+"$(this)"+")'><img style='width:60px;height:60px;' src='http://kcat-1251241286.cosgz.myqcloud.com/images/"+data[i].images+"'</a></td><td><a onclick='yunpan("+"$(this)"+")' style='text-decoration:none;' title='"+data[i].link+"'><i style='font-size:28px;' class='Hui-iconfont'>&#xe6b1;</i></a></td><td>"+data[i].pw+"</td>"
			html+="<td class='td-manage'><a title='编辑' href='javascript:;' onclick='soft_edit("+"$(this)"+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6df;</i></a> <a title='删除' href='javascript:;' onclick='soft_del("+"$(this)"+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6e2;</i></a></td></tr>";
			
		});
 	});
 	$(".Soft_list").append(html);
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": false,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5]}// 制定列不参与排序
		]
	});
});
/*大图放大显示*/
function datu(object){
	var datu_src = "datu.jsp?src="+object[0].getElementsByTagName('img')[0].src;
	var path = "datu.jsp?src=";
	//iframe层-多媒体
	layer.open({
	  type: 2,
	  title: false,
	  area: ['621px', '390px'],
	  shade: 0.8,
	  closeBtn: 0,
	  shadeClose: true,
	  content: datu_src
	});
}
/*视频播放*/
function yunpan(object){
	//iframe层-多媒体
	layer.open({
	  type: 2,
	  title: false,
	  area: ['900px', '450px'],
	  shade: 0.8,
	  closeBtn: 0,
	  shadeClose: true,
	  content: object[0].title
	});
}
/*软件-添加*/
function soft_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*软件-编辑*/
function soft_edit(object){
	
	var path = object.parent().parent().children();
	var id = path.eq(1).text();
	var category = encodeURI(encodeURI(path.eq(2).text()));
	var title = encodeURI(encodeURI(path.eq(3).text()));
	var images = encodeURI(encodeURI(path.eq(4).children().children()[0].src));
	var link = encodeURI(encodeURI(path.eq(5).children()[0].title));
	var pw = encodeURI(encodeURI(path.eq(6).text()));
	member_edit('编辑','homework_modify.jsp?id='+id+'&category='+category+'&title='+title+'&images='+images+'&link='+link+'&pw='+pw+'','800','460');
}
/*软件-编辑*/
function member_edit(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-删除*/
function soft_del(object){
	var path = object.parent().parent().children();
	var id = path.eq(1).text();
	member_del(id);
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
	        url : "${pageContext.request.contextPath}/deleteHomework.do",  
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
	layer.confirm('您当前选中了'+num+'个信息，确认要全部删除吗？',function(index){
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
			        url : "${pageContext.request.contextPath}/deleteHomework.do",  
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