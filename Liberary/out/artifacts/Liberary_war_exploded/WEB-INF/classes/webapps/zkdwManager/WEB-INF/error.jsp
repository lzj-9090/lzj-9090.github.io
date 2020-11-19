<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>乐疯收台管理系统</title>
		<link href="<%=basePath%>css/newcss.css" rel="stylesheet"
			type="text/css" />
		<style type="text/css">
body {
	background: #fff;
}
</style>

	</head>
	<body>
		<div class="error">

			<div>
				系统已超时，请
				<a href="<%=basePath%>admin/loginAct.htm?operate=toLogin"
					target="_parent">重新登录</a>
			</div>
		</div>

	</body>
</html>