<%@ page import="javax.jws.soap.SOAPBinding" %>
<%@ page import="cn.itcaste.table.User" %>
<%@ page import="cn.itcaste.util.AegUtilt" %>
<%@ page import="cn.itcaste.table.Book" %><%--
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
        height: 400px;
        width: 650px;
        margin: 150px auto;
        font-size: 40px;
    }
    th{
        width: 100px;
    }
</style>
<body>
<%
    Book book=(Book) request.getAttribute("Book");
%>
<div>
    <table class="table">
        <tr>
            <th>书名：</th>&nbsp;&nbsp;&nbsp;
            <td><%=book.getBookName()%></td>
        </tr>
        <tr>
            <th>作者：</th>&nbsp;&nbsp;&nbsp;
            <td><%=book.getBookAthor()%></td>
        </tr>
        <tr>
            <th>类型：</th>&nbsp;&nbsp;&nbsp;
            <td><%=book.getBookType()%></td>
        </tr>
        <tr>
            <th>价格：</th>&nbsp;&nbsp;&nbsp;
            <td><%=book.getPrice()%></td>
        </tr>
        <tr>
            <th>简介：</th>
            <td><%=book.getIntroduce()%></td>
        </tr>
    </table>
</div>
</body>

</html>
