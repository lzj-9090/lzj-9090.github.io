<%@ page import="javax.jws.soap.SOAPBinding" %>
<%@ page import="cn.itcaste.table.User" %>
<%@ page import="cn.itcaste.util.AegUtilt" %><%--
  Created by IntelliJ IDEA.
  User: 刘志君
  Date: 2019/9/13
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="jquery-3.1.1.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<style type="text/css">
    div{
        height: 300px;
        width: 400px;
        margin: 150px auto;
        font-size: 40px;
    }
</style>
<body>
<%
    User user=(User)request.getAttribute("User");
%>
<div>
    <table class="table">
        <tr>
            <th>昵称：</th>&nbsp;&nbsp;&nbsp;
            <td><%=user.getName()%></td>
        </tr>
        <tr>
            <th>邮箱：</th>&nbsp;&nbsp;&nbsp;
            <td><%=user.getEmail()%></td>
        </tr>
        <tr>
            <th>年龄：</th>&nbsp;&nbsp;&nbsp;
            <td><%=AegUtilt.Fun1(user.getBirthday())%></td>
        </tr>
        <tr>
            <th>管理员：</th>&nbsp;&nbsp;&nbsp;
            <td>否</td>
        </tr>
    </table>
</div>
</body>
</html>
