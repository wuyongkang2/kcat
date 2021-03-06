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
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/green/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>KCat-Admin</title>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="../admin/index.jsp">KCat-Admin</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="../admin/index.jsp">KCat-Admin</a> 
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				<ul class="cl">
					<li class="navbar-levelone current"><a href="javascript:;">主页</a></li>
					<li class="navbar-levelone"><a href="javascript:;">用户管理</a></li>
					<li class="navbar-levelone"><a href="javascript:;">内容管理</a></li>
			</ul>
		</nav>
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>超级管理员</li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="${pageContext.request.contextPath}/admin/login.jsp">切换账户</a></li>
						<li><a href="${pageContext.request.contextPath}/visitor/index.jsp">退出</a></li>
				</ul>
			</li>
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
	
	</div>
	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-aaaaa">
			<dt><i class="Hui-iconfont">&#xe616;</i> 用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="user_list.jsp" data-title="用户列表" href="javascript:void(0)">用户列表</a></li>
				</ul>
			</dd>
		</dl>
	</div>

	<div class="menu_dropdown bk_2" style="display:none">
		<dl id="menu-bbbbb">
			<dt><i class="Hui-iconfont">&#xe616;</i> 专业软件<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="studySoft_banner.jsp" data-title="学院管理" href="javascript:void(0)">banner管理</a></li>
					<li><a data-href="studySoft_college.jsp" data-title="学院管理" href="javascript:void(0)">学院管理</a></li>
					<li><a data-href="studySoft_major.jsp" data-title="专业管理" href="javascript:void(0)">专业管理</a></li>
					<li><a data-href="studySoft_type.jsp" data-title="类型管理" href="javascript:void(0)">类型管理</a></li>
					<li><a data-href="studySoft_list.jsp" data-title="软件列表" href="javascript:void(0)">软件列表</a></li>
					<li><a data-href="studySoftAllot_list.jsp" data-title="软件分配" href="javascript:void(0)">软件分配</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-bbbbb">
			<dt><i class="Hui-iconfont">&#xe616;</i> 娱乐软件<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="playSoft_type.jsp" data-title="类型管理" href="javascript:void(0)">类型管理</a></li>
					<li><a data-href="playSoft_list.jsp" data-title="软件列表" href="javascript:void(0)">软件列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-bbbbb">
			<dt><i class="Hui-iconfont">&#xe616;</i> 作业辅助<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="homework_banner.jsp" data-title="分类管理" href="javascript:void(0)">banner管理</a></li>
					<li><a data-href="homework_type.jsp" data-title="分类管理" href="javascript:void(0)">分类管理</a></li>
					<li><a data-href="homework_list.jsp" data-title="查看列表" href="javascript:void(0)">查看列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-bbbbb">
			<dt><i class="Hui-iconfont">&#xe616;</i> 帮帮帮<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="bang_banner.jsp" data-title="分类管理" href="javascript:void(0)">banner管理</a></li>
					<li><a data-href="bang_type.jsp" data-title="分类管理" href="javascript:void(0)">分类管理</a></li>
					<li><a data-href="bang_list.jsp" data-title="查看列表" href="javascript:void(0)">查看列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-bbbbb">
			<dt><i class="Hui-iconfont">&#xe616;</i> 校园电话<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="tel_type.jsp" data-title="分类管理" href="javascript:void(0)">分类管理</a></li>
					<li><a data-href="tel_list.jsp" data-title="查看列表" href="javascript:void(0)">查看列表</a></li>
				</ul>
			</dd>
		</dl>
	</div>	
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="主页" data-href="${pageContext.request.contextPath}/admin/welcome.html">主页</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="${pageContext.request.contextPath}/admin/welcome.html"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){
	/*$("#min_title_list li").contextMenu('Huiadminmenu', {
		bindings: {
			'closethis': function(t) {
				console.log(t);
				if(t.find("i")){
					t.find("i").trigger("click");
				}		
			},
			'closeall': function(t) {
				alert('Trigger was '+t.id+'\nAction was Email');
			},
		}
	});*/


	$("body").Huitab({
		tabBar:".navbar-wrapper .navbar-levelone",
		tabCon:".Hui-aside .menu_dropdown",
		className:"current",
		index:0,
	});
});

/*资讯-添加*/
function article_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
</script> 
</body>
</html>