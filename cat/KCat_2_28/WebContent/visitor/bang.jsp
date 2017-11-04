<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--[if lt IE 8]><script>window.location.href="${pageContext.request.contextPath}/error/index.jsp"</script><![endif]-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帮帮帮</title>
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/images/tubiao.ico">

<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bang.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/normalize.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/htmleaf-demo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/app.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery1.42.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/clipboard.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/bang.js"></script>
 --%>
</head>

<body>
<!--导航部分-->
	<%@ include file="../visitor/pageheader_top.jsp" %>
	<%@ include file="../visitor/pageheader_centenr.jsp" %>
	<%@ include file="../visitor/pageheader_bottom.jsp" %>
<!--导航部分end-->
<div class="slider">
	<div class="slider-img">
	  <ul class="slider-img-ul">
	  </ul>
	</div>
</div>

<div class="rightNav">
	<a id="elevator" style="right: -110px;"><em>^</em>回到顶部</a>
</div>
<!--专业栏start-->



<!--主体部分start-->
<div class="main"></div>

<script type="text/javascript">
var html="";
$.ajaxSetup({async:false});
$.post("${pageContext.request.contextPath}/getBang_b.do",function(data){
	html+="<li><img src='http://kcat-1251241286.cosgz.myqcloud.com/images/"+data[data.length-1].jpg+"'></li>";
	$.each(data,function(i,e){	
		html+="<li><img src='http://kcat-1251241286.cosgz.myqcloud.com/images/"+data[i].jpg+"'></li>";
	});
	html+="<li><img src='http://kcat-1251241286.cosgz.myqcloud.com/images/"+data[0].jpg+"'></li>";
	$(".slider-img-ul").append(html);
});
</script>
<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>');</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/xSlider.js"></script>
<script type="text/javascript">
//右侧导航
var btb=$(".rightNav");
var tempS;
$(".rightNav").hover(function(){
		var thisObj = $(this);
		tempS = setTimeout(function(){
		thisObj.find("a").each(function(i){
			var tA=$(this);
			setTimeout(function(){ tA.animate({right:"0"},200);},50*i);
		});
	},200);

},function(){
	if(tempS){ clearTimeout(tempS); }
	$(this).find("a").each(function(i){
		var tA=$(this);
		setTimeout(function(){ tA.animate({right:"-110"},200,function(){
		});},50*i);
	});

});
$(function(){
	$.ajaxSetup({async:false});
	var html="";

	$.post("${pageContext.request.contextPath}/getTitle.do",function(data){  //循环标题
		$.each(data,function(i,e){	
			html+="<div class='shang'><p style='padding-top:60px;' class='xiahua' id='ac"+data[i].id+"'>"+data[i].titleName+"</p><hr/></div><div class='xiaall'>";
			$.post("${pageContext.request.contextPath}/getBang.do",{'videoType':data[i].id},function(data_2){   //循环标题内容
				$.each(data_2,function(j,f){
					html+="<a class='xia'><img style='width:240px; height:135px;' src='http://kcat-1251241286.cosgz.myqcloud.com/images/" + data_2[j].videoImage + "' /><strong>"+ data_2[j].videoName +"</strong><p>"+ data_2[j].videoExplain +"</p><p class='lianjie' hidden='hidden' value='"+data_2[j].videoUrl+"'></p></a>";
					/* 这里将div改成a标签包着 */
				});
			});
			html+="</div><div class='clean'></div> ";
		});
		$(".main").append(html);

	});
	
	html="";
	$.post("${pageContext.request.contextPath}/getTitle.do",function(data){  //循环标题
		$.each(data,function(i,e){	
			html+="<a class='active_gun' id='active"+data[i].id+"' style='right: -110px;'><em>"+data[i].titleName.substring(0,1)+"</em>"+data[i].titleName+"</a>";
		});
		$(".rightNav").append(html);

	});
});
$(function(){
	
	$('.xia').on('click',function(){
		var lianjie=$(this).find(".lianjie").attr("value");
		layer.open({
		  type: 2 //Page层类型
		  ,area: ['1280px', '550px']
		  ,title: 'KCat-帮帮帮'
		  ,shade: 0.6 //遮罩透明度
		  ,maxmin: true //允许全屏最小化
		  ,anim: 1 //0-6的动画形式，-1不开启
		  ,content: [lianjie,false]
		});
	});
});
$("#elevator").click(function(){
	$("html,body").animate({scrollTop: 0}, 500);	
});
$(function() {	
	 $(".active_gun").click(function(){
		 $("html,body").animate({scrollTop:$("#ac"+this.id.substring(6)).offset().top}, 800);
	});
});
</script>

</body>
</html>