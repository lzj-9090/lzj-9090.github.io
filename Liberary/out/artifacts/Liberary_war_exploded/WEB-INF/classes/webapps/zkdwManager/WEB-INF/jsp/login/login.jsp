<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="zh-CN">
    <head>       
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>台区登录</title>
        <meta content="" name="" />
        <meta content="" name="" /> 		        
<!--         <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" /> -->
<!--         <link href="<%=basePath%>css/login.css" rel="stylesheet" type="text/css" /> -->
        <link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
        <script type='text/javascript' src="<%=basePath%>js/jquery.min.js"></script>
<!--         <script type='text/javascript' src="<%=basePath%>js/loginAndRe/login.js"></script> -->
 </head>
    <body class="login-body">
    <div class="title">台区精益化管理平台</div>
    <div class="container">
        <div class="pc-img">
        </div>
        <form class="login-wrap" action="<%=basePath%>loginAct/login.html" id="loginForm" method="post">
            <div class="login">
                <div class="user">
                    <span class="icon"></span>
                    <input type="text" placeholder="用户名" name="adminName" id="adminName"/>
                </div>
                <div class="psw">
                    <span class="icon"></span>
                    <input type="password" placeholder="密码" name="passWord" id="passWord"/>
                </div>
                <div class="login-btn"> 登录 </div>
            </div>
            <input type="hidden" name="errorMsg" value="${errorMsg}" id="errorMsg">
        </form>
    </div>

</body>
<script type="text/javascript">
$(document).ready(function() {
	$("#adminName").focus();
	$(document).keyup(function(event) {
		if (event.keyCode == 13) {
			$(".login-btn").trigger("click");
		}
	});
	// 错误提示
	var errormsg = $("#errorMsg").val();
	if (errormsg != null && errormsg != "") {
		alert(errormsg);
	}

});


$(".login-btn").click(function(){
	var adminName = $("#adminName").val();
	var passWord = $("#passWord").val();
	if (adminName == "" || adminName == null) {
		alert("请输入用户名!");
		return false;
	}
	if (passWord == "" || passWord == null) {
		alert("请输入密码!");
		return false;
	}
	$("#loginForm").submit();
});

$(".login-btn").mouseover(function(){
	$(this).css("cursor","pointer");
});

</script>
</html>