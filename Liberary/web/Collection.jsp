<%--
  Created by IntelliJ IDEA.
  User: 刘志君
  Date: 2019/9/12
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="jquery-3.1.1.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        .d1{
            margin: 200px auto;
            width: 750px;
        }
    </style>
</head>
<body>
<div class="d1">
    <table class="table table-hover table-bordered">
        <tr bgcolor="#a52a2a">
            <th>编号</th>
            <th>书名</th>
            <th>类型</th>
            <th>作者</th>
            <th>价格</th>
            <th>操作内容</th>
        </tr>
        <c:forEach items="${list}" var="b">
            <tr>
                <td>${b.id}</td>
                <td>${b.bookName}</td>
                <td>${b.bookType}</td>
                <td>${b.bookAthor}</td>
                <td>${b.price}￥</td>
                <td class="row">&nbsp;&nbsp;&nbsp;
                    <div class="col-md-3"><a type="button" class="btn btn-primary" onclick="Subscribe('${b.bookName}')">订购</a></div>
                    <div class="col-md-3"><a type="button" class="btn btn-danger" href="javascript:value(0)" onclick="collection('${b.bookName}',this)">删除</a></div>
                    <div class="col-md-3"><a type="button" class="btn btn-primary" onclick="details1(${b.id})">详情</a></div>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    function Subscribe(obj) {
        $.get("http://localhost:8080/Liberary_war_exploded/collectionButtnServlet",{"bookName":obj},function (data) {
            alert(data.chuan);
        },"json");
    }
    function collection(obj,obj2) {
        $.post("http://localhost:8080/Liberary_war_exploded/collectionButtnServlet",{"bookName":obj,"id":0},function (data) {
            alert(data.chuan);
        },"json");
        var table=obj2.parentNode.parentNode.parentNode.parentNode;
        var tr=obj2.parentNode.parentNode.parentNode;
        table.removeChild(tr);
    }
    function details1(obj) {
        location.href="http://localhost:8080/Liberary_war_exploded/retailsServlet?id="+obj;

    }
</script>
</html>
