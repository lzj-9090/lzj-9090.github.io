<%--
  Created by IntelliJ IDEA.
  User: 刘志君
  Date: 2019/9/13
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        body,html{
            height: 100%;
            width: 100%;
        }
        .d1{
            background-color: #761c19;
            color: white;
        }
        .if{
            height: 95%;
            width: 100%;
            margin: 0;
            border: 0;

        }
    </style>

</head>
<body>
<div class="d1">
    <nav class="navbar navbar-default d1">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Brand</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="http://localhost:8080/Liberary_war_exploded/doBookServlet" target="my_iframe">书架 <span class="sr-only">(current)</span></a></li>
                    <li><a href="http://localhost:8080/Liberary_war_exploded/UserBookServlet?id=${0}" target="my_iframe">收藏</a></li>
                    <li><a href="http://localhost:8080/Liberary_war_exploded/UserBookServlet?id=${1}"  target="my_iframe">订购</a></li>
                </ul>
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="请输入书名:《....》" id="input1">
                    </div>
                    <a  class="btn btn-default" id="bu1" onclick="but1()" target="my_iframe">搜索</a>
                    <a  class="btn btn-default" id="bu2" onclick="but2()" target="my_iframe">返回</a>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="http://localhost:8080/Liberary_war_exploded/PasswordUpdate.jsp" target="my_iframe">修改密码</a></li>
                    <li><a href="http://localhost:8080/Liberary_war_exploded/doUserServlet" target="my_iframe">个人信息</a></li>

                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<iframe src="http://localhost:8080/Liberary_war_exploded/doBookServlet" name="my_iframe" class="if"></iframe>
</body>
<script>
    function but1() {
        var name=$("#input1").val();
        if (name==""){
            alert("书名不能为空");
        }else {
            var but=document.getElementById("bu1");
            but.href="http://localhost:8080/Liberary_war_exploded/doBookServlet?bookName="+name;
        }
    }
    function but2() {
        var but=document.getElementById("bu2");
        but.href="http://localhost:8080/Liberary_war_exploded/doBookServlet";
    }
</script>
</html>
