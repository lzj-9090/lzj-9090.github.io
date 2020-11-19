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
		<title>台区精益化管理平台</title>
        <meta content="" name="" />
        <meta content="" name="" /> 		        
        <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath%>css/login.css" rel="stylesheet" type="text/css" />
        <link href="<%=basePath%>css/css.css" rel="stylesheet" type="text/css" />
        <script type='text/javascript' src="<%=basePath%>js/jquery.min.js"></script>
        <script type='text/javascript' src="<%=basePath%>js/loginAndRe/login.js"></script>
 </head>
    <body>
         <div class="page-lock">
            <div class="page-body">
				<div class="lock-head">沌口电网后台管理</div>            
            </div>
			<div class="lock-body">
                    <form class="lock-form" action="<%=basePath%>loginAct/login.html" id="loginForm" method="post">
                        <div class="form-group">
                            <label for="">用户名</label><input class="control placeholder-no-fix" type="text" autocomplete="off" name="adminName" id="adminName"/> </div>
                        <div class="form-group">
                            <label for="">密　码</label><input class="control placeholder-no-fix" type="password" autocomplete="off" name="passWord" id="passWord"/> </div>
                        <div class="form-group">
                            <label for="">验证码</label>
                            <input class="control placeholder-no-fix" type="text" autocomplete="off" id="randCode" name="randCode" style="width:165px;" maxlength="5" onkeyup="value=value.replace(/[^\d.]/g,'')"/>
							<img id="code" src="<%=basePath%>JcaptchaServlet" alt="" onclick="this.src='<%=basePath%>JcaptchaServlet?'+new Date().getTime()">
							
						</div>
<!-- 						<div class="form-group"> -->
<!--                             <input type="checkbox" autocomplete="off" name="" style="margin-right:5px;vertical-align:top;"/>记住密码 -->
<!-- 						</div> -->
						<div class="form-actions">
                            <button type="submit" class="btn red uppercase" onclick="return checkForm();">登录</button>
                        </div>
                    </form>
                </div>
                <input type="hidden" name="errorMsg" value="${errorMsg}" id="errorMsg">
        </div>
	</body>
</html>