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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 主页 <span class="c-gray en">&gt;</span> 内容管理 <span class="c-gray en">&gt;</span> 专业软件 <span class="c-gray en">&gt;</span> 专业管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a class="btn btn-primary radius" onclick="soft_add('添加专业','studySoft_major_add.jsp','300','220')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加专业</a> </span> <span class="r">共有数据：<strong id="soft_count">加载中...</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hovert">
			<thead>
				<tr class="text-c">
					<th width="50">ID</th>
					<th width="150">学院ID</th>
					<th width="150">所属学院</th>
					<th width="150">专业</th>
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
 	$.post("${pageContext.request.contextPath}/getMajor.do",function(data){
 		$("#soft_count").text(data.length);
		$.each(data,function(i,e){
			html+="<tr class='text-c'><td>"+data[i].id+"</td><td>"+data[i].titleS_to_titleB+"</td><td>"+data[i].titleBName+"</td><td>"+data[i].titleSName+"</td>";
			html+="<td class='td-manage'><a title='编辑' href='javascript:;' onclick='soft_edit("+"$(this)"+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6df;</i></a><a title='删除' href='javascript:;' onclick='soft_del("+"$(this)"+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6e2;</i></a></td></tr>";
			
		});
 	});
 	$(".Soft_list").append(html);
});
/*软件-添加*/
function soft_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*软件-编辑*/
function soft_edit(object){
	
	var path = object.parent().parent().children();
	var id = path.eq(0).text();
	var major = encodeURI(encodeURI(path.eq(3).text()));
	member_edit('编辑专业','studySoft_major_modify.jsp?id='+id+'&major='+major+'','300','180');
}
/*软件-编辑*/
function member_edit(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-删除*/
function soft_del(object){
	var path = object.parent().parent().children();
	var id = path.eq(0).text();
	member_del(id);
}
/*用户-删除*/
function member_del(id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type : "post",  
	        dataType : "json",  
	        data : {  
	        	soft_to_titleS : id
	        },  
	        async : false, 
	        cache : false, 
	        url : "${pageContext.request.contextPath}/getAllot_major.do",  
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
				        url : "${pageContext.request.contextPath}/delMajor.do",  
						success: function(data){
							layer.msg('已删除!',{icon:1,time:1000});
							location.replace(location.href);
						},
						error:function(data) {
							console.log(data.msg);
						},
					});
				}else{
					layer.msg('删除失败，原因：当前专业下存在软件分配',{icon: 2,time: 5000});
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