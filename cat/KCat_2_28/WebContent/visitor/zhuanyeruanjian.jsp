<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!--[if lt IE 8]><script>window.location.href="${pageContext.request.contextPath}/error/index.jsp"</script><![endif]-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>专业软件</title>
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/images/tubiao.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/zyrj.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/jquery.SuperSlide.min.js"></script>
</head>

<body>
<div class="all">
<!--导航部分-->
	<%@ include file="../visitor/pageheader_top.jsp" %>
	<%@ include file="../visitor/pageheader_centenr.jsp" %>
	<%@ include file="../visitor/pageheader_bottom.jsp" %>
<!--导航部分end-->

<!-- banner -->
<div>
</div>
<div id="slider-1" class="bg-fff box-shadow radius">
	
</div>


<!--main区域 start-->
    <div class="main">
  
<!-- 右边固定的导航start-->
		<div class="you">
			<p class="kslj">快速链接</p>           
			<img src="${pageContext.request.contextPath}/images/hr.png" class="hr" style="width:100%">
			<div class="toggle">
				
			</div>
		</div>
		<div id="elevator_item">
        <a id="elevator" onclick="return false;" title="回到顶部"></a>
		</div>
<!-- 右边固定的导航end-->
    </div>
<!--main区域  end-->
</div>
<script type="text/javascript">
$(function(){
	var html="";
	$.ajaxSetup({async:false});
	
	html="<div class='slider'><div class='bd bg-fff'><ul>";
	$.post("${pageContext.request.contextPath}/getStudySoft_b.do",function(data){
		$.each(data,function(i,e){	
			html+="<li><img src='http://kcat-1251241286.cosgz.myqcloud.com/images/"+data[i].jpg+"'></li>";
		});
		html+="</ul></div><ol class='hd cl'>";
		$.each(data,function(i,e){	
			html+="<li><i></i><img src='http://kcat-1251241286.cosgz.myqcloud.com/images/"+data[i].ico+"'></li>";
		});
		html+="</ol></div>";
		$(".bg-fff").append(html);
	});
	jQuery("#slider-1 .slider").slide({
		mainCell:".bd ul",titCell:".hd li",
		trigger:"click",
		effect:"leftLoop",
		autoPlay:true,
		delayTime:550,
		interTime:2000,
		pnLoop:false,
		titOnClassName:"active"
	})
	
	html="";
	$.post("${pageContext.request.contextPath}/getStudySoftB.do",function(data){
		$.each(data,function(i,e){	
			html+="<dt><a>"+data[i].titleBName+"</a></dt><dd><ul>";
			$.post("${pageContext.request.contextPath}/getStudySoftS.do",{'titleS_to_titleB':data[i].id},function(data_2){  //循环小标题
				$.each(data_2,function(j,f){
					html+="<a class='active_gun' id='active"+data_2[j].id+"'><li>"+data_2[j].titleSName+"</li></a>";
					
					
				});
				html+="</ul></dd>";
			});
		});
		$(".toggle").append(html);
	});
 	
 	
 	
	html="";
	$.ajaxSetup({async:false});
 	$.post("${pageContext.request.contextPath}/getStudySoftB.do",function(data){
		$.each(data,function(i,e){	
			html+="<div class='zuo'><div class='nav_b'><ul><li class='xueyuan'>"+data[i].titleBName+"</li></ul></div>";
			$.post("${pageContext.request.contextPath}/getStudySoftS.do",{'titleS_to_titleB':data[i].id},function(data_2){  //循环小标题
				$.each(data_2,function(j,f){
					html+="<div style='padding-top:60px;' class='zhuanye' id='ac"+data_2[j].id+"'><p>"+data_2[j].titleSName+"</p><img src='${pageContext.request.contextPath}/images/hr.png' class='hr'>";
					$.post("${pageContext.request.contextPath}/getStudySoft.do",{'soft_to_titleS':data_2[j].id},function(data_3){  //循环软件内容
						$.each(data_3,function(k,g){
							var href = "${pageContext.request.contextPath}/getStudySoft_All.do?num="+data_3[k].id;
							html+="<div class='ruanjian'><a href='"+href+"' target='_blank'><img src='http://kcat-1251241286.cosgz.myqcloud.com/images/"+data_3[k].softImage+"'/></a>";
							html+="<a href='"+href+"' target='_blank'><p class='big'>"+data_3[k].softName+"</p></a>";
							html+="<p class='small'>"+data_3[k].softType+"</p><a href='"+href+"' target='_blank'><img src='${pageContext.request.contextPath}/images/bxiazai.png' class='xiazai'/></a></div>";
						});
					});
					html+="</div>";
				});
			});
			html+="</div>";
		});
		$(".main").append(html);
	});
});
 $(function(){ 
	$(".toggle dd").hide(); 
	$(".toggle dt").click(function(){ 
		$(".toggle dd").not($(this).next()).hide(); 
		$(".toggle dt").not($(this).next()).removeClass("current"); 
		$(this).next().slideToggle(100); 
		$(this).toggleClass("current"); 
	}); 
});
 
$(function() {
	$(window).scroll(function(){
		var scrolltop=$(this).scrollTop();		
		if(scrolltop>=700){		
			$("#elevator_item").show();
		}else{
			$("#elevator_item").hide();
		}
	});		
	$("#elevator").click(function(){
		$("html,body").animate({scrollTop: 0}, 500);	
	});		
});
 $(function() {	
	 $(".active_gun").click(function(){
		 $("html,body").animate({scrollTop:$("#ac"+this.id.substring(6)).offset().top}, 800);
	});
 });
</script>
</body>
</html>
