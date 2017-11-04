<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!--[if lt IE 8]><script>window.location.href="${pageContext.request.contextPath}/error/index.jsp"</script><![endif]-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>下载页面</title>
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/images/tubiao.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/ylrj.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.js"></script>
<script type="text/javascript">
$(function(){
	var html="";
	$.ajaxSetup({async:false});
	$.post("${pageContext.request.contextPath}/getPlaySoft_title.do",function(data){  //循环小标题
		$.each(data,function(i,f){
			html+="<div class='zhuanye'><p>"+data[i].titleName+"</p><img src='${pageContext.request.contextPath}/images/hr.png' class='hr'>";
			$.post("${pageContext.request.contextPath}/getPlaySoft.do",{'soft_to_title':data[i].id},function(data_2){  //循环软件内容
				$.each(data_2,function(j,g){
					var href = "${pageContext.request.contextPath}/getPlaySoft_All.do?num="+data_2[j].id;
					html+="<div class='ruanjian'><a href='"+href+"' target='_blank'><img class='tubiao' src='http://kcat-1251241286.cosgz.myqcloud.com/images/"+data_2[j].softImage+"' ></img></a><div class='ming'><a href='"+href+"' target='_blank'>"+data_2[j].softName+"</a></div><div class='fenlei'>"+data_2[j].softType+"</div> <a href='"+href+"' target='_blank'><img class='huoqu' src='${pageContext.request.contextPath}/images/huoqu.jpg'></img></a></div>";
				});
			});
			html+="</div>"
		});
	$(".zuo").append(html);
	});
});
</script>

</head>

<body>
<div class="all">


<!--导航部分-->
	<%@ include file="../visitor/pageheader_top.jsp" %>
	<%@ include file="../visitor/pageheader_centenr.jsp" %>
	<%@ include file="../visitor/pageheader_bottom.jsp" %>
<!--导航部分end-->

    <div class="main">
    	<div class='zuo'>
    	</div>
    </div>
    
<!--尾部部分start-->

<!--尾部部分end-->
</div>

</body>
</html>
