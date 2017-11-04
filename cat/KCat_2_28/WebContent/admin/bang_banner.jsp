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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 主页 <span class="c-gray en">&gt;</span> 内容管理 <span class="c-gray en">&gt;</span> 帮帮帮 <span class="c-gray en">&gt;</span> banner管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hovert">
			<thead>
				<tr class="text-c">
					<th width="50">ID</th>
					<th width="150">大图</th>
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
 	$.post("${pageContext.request.contextPath}/getBang_b.do",function(data){
 		$("#soft_count").text(data.length);
		$.each(data,function(i,e){
			html+="<tr class='text-c'><td>"+data[i].id+"</td><td><a onclick='datu("+"$(this)"+")'><img style='width:60px;height:60px;' src='http://kcat-1251241286.cosgz.myqcloud.com/images/"+data[i].jpg+"'</a></td>";
			html+="<td class='td-manage'><a title='编辑' href='javascript:;' onclick='soft_edit("+"$(this)"+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6df;</i></a></td></tr>";
			
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
	var jpg = encodeURI(encodeURI(path.eq(1).children().children()[0].src));
	member_edit('编辑banner','bang_banner_modify.jsp?id='+id+'&jpg='+jpg+'','800','480');
}
/*软件-编辑*/
function member_edit(title,url,w,h){
	layer_show(title,url,w,h);
}
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
</script>
</body>
</html>