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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 主页 <span class="c-gray en">&gt;</span> 内容管理 <span class="c-gray en">&gt;</span> 专业软件 <span class="c-gray en">&gt;</span> 软件列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a class="btn btn-primary radius" onclick="soft_add('添加软件','studySoft_add.jsp','800','460')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加软件</a> </span> <span class="r">共有数据：<strong id="soft_count">加载中...</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="50">ID</th>
					<th width="150">名字</th>
					<th width="50">类型</th>
					<th width="100">图标</th>
					<th width="150">软件简介</th>
					<th width="150">大图</th>
					<th width="40">软件</th>
					<th width="70">安装教程</th>
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
 	$.post("${pageContext.request.contextPath}/getAllSoftName.do",function(data){
 		$("#soft_count").text(data.length);
		$.each(data,function(i,e){
			html+="<tr class='text-c'><td>"+data[i].id+"</td><td>"+data[i].softName+"</u></td>"
			html+="<td>"+data[i].softType+"</td><td><img style='width:60px;height:60px;border-radius:100px;' src='http://kcat-1251241286.cosgz.myqcloud.com/images/"+data[i].softImage+"'</td>"
			var jianjie = data[i].soft_jianjie.substring(0,30)+"...";
			data[i].soft_jianjie = data[i].soft_jianjie.replace(/ /g,'_');
			var datu_new = "'"+data[i].soft_jietu+"'";
			html+="<td><a onclick='soft_jianjie("+"$(this)"+")' title="+data[i].soft_jianjie+">"+jianjie+"</a></td><td><a onclick='datu("+"$(this)"+")'><img style='width:60px;height:60px;' src='http://kcat-1251241286.cosgz.myqcloud.com/images/"+data[i].soft_jietu+"'</a></td>"

			html+="<td><a style='text-decoration:none;' href='http://kcat-1251241286.cosgz.myqcloud.com/"+data[i].softUrl+"'><i style='font-size:28px;' class='Hui-iconfont'>&#xe640;</i></a></td><td><a onclick='soft_video("+"$(this)"+")' title='http://op86rjyxw.bkt.clouddn.com/"+data[i].soft_video+"' style='text-decoration:none;'><i style='font-size:28px;' class='Hui-iconfont'>&#xe6e6;</i></a></td>"
			html+="<td class='td-manage'><a title='编辑' href='javascript:;' onclick='soft_edit("+"$(this)"+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6df;</i></a> <a title='删除' href='javascript:;' onclick='soft_del("+"$(this)"+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6e2;</i></a></td></tr>";
			
		});
 	});
 	$(".Soft_list").append(html);
	$('.table-sort').dataTable({
		"aaSorting": [[ 0, "desc" ]],//默认第几个排序
		"bStateSave": false,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[3,4,5,6,7,8]}// 制定列不参与排序
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
/*软件简介详细显示*/
function soft_jianjie(object){
	layer.open({
		type: 1,
		area: ['300px','200px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '软件简介',
		content: object[0].title
	});
}
/*视频播放*/
function soft_video(object){
	//iframe层-多媒体
	layer.open({
	  type: 2,
	  title: false,
	  area: ['900px', '550px'],
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
	var id = path.eq(0).text();
	var softName = encodeURI(encodeURI(path.eq(1).text()));
	var softType = encodeURI(encodeURI(path.eq(2).text()));
	var ico = encodeURI(encodeURI(path.eq(3).children()[0].src));
	var soft_jianjie = encodeURI(encodeURI(path.eq(4).children()[0].title));
	var jpg = encodeURI(encodeURI(path.eq(5).children().children()[0].src));
	var soft = encodeURI(encodeURI(path.eq(6).children()[0].href));
	var video_Name = encodeURI(encodeURI(path.eq(7).children()[0].title));
	member_edit('编辑软件','studySoft_modify.jsp?id='+id+'&softName='+softName+'&softType='+softType+'&ico='+ico+'&soft_jianjie='+soft_jianjie+'&jpg='+jpg+'&soft='+soft+'&video_Name='+video_Name+'','800','460');
}
/*软件-编辑*/
function member_edit(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-删除*/
function soft_del(object){
	var path = object.parent().parent().children();
	var id = path.eq(0).text();
	var name = path.eq(1).text();
	member_del(id,name);
}
/*用户-删除*/
function member_del(id,name){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type : "post",  
	        dataType : "json",  
	        data : {  
	        	softName : name
	        },  
	        async : false, 
	        cache : false, 
	        url : "${pageContext.request.contextPath}/getAllot_name.do",  
			success: function(data){
				if(data){
					$.ajax({
						type : "post",  
				        dataType : "json",  
				        data : {  
				        	id : id
				        },  
				        async : false, 
				        cache : false, 
				        url : "${pageContext.request.contextPath}/deleteStudySoft.do",  
						success: function(data){
							layer.msg('已删除!',{icon:1,time:1000});
							location.replace(location.href);
						},
						error:function(data) {
							console.log(data.msg);
						},
					});
				}else{
					layer.msg('删除失败，原因：当前软件下存在软件分配',{icon: 2,time: 5000});
				}
			},
			error:function(data) {
				console.log(data.msg);
			},
		});	
	});
}
</script>
</body>
</html>