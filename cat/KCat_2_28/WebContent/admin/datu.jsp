<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">   <!--中文语言-->
<head>
<meta charset="UTF-8"/>
<script type="text/javascript" src="lib/base64/base64.js"></script>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
</head>
<body>
<img id="datu" style="width:100%;" src=""></img>
<script type="text/javascript">
	var src = "<%=request.getParameter("src")%>";
	$("#datu").attr('src',datu_src);
</script>
</body>
</html>
