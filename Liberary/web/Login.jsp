<%--
  Created by IntelliJ IDEA.
  User: 刘志君
  Date: 2019/9/4
  Time: 18:10
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
    <link href="fonts">
    <script src="jquery-3.1.1.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        body,html{
            height: 100%;
            width: 100%;
            margin: 0;
        }
        .d1{
            height:13%;
            background-color: #761c19;
            color: white;
            font-size: 65px;
        }
        .d2{
            height: 85%;
            background-image: url("images/timg1.jpg");
            width: 100%;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
            padding-top: 95px;
        }
        .d3{
            height: 400px;
            width: 700px;
            background-color: white;
            margin: auto auto;
            border-radius: 50px 50px 0px 0px;
            padding-top: 66px;
        }
        form{
            width: 400px;
            margin: 0 auto;
        }
        .p{
            border: 1px solid black;
        }

    </style>
    <script>
        $(function () {
            var d1=$("#imges");
            var i=1;

            var p1=setInterval(function () {
                d1.css("backgroundImage","url('images/timg"+i+".jpg')");
                if (i==3){
                    i=0;
                }
                i++;
            },3000);
        });
    </script>
</head>
<body>
<div class="d1 lo">
    <div class="col-md-3">
        图书馆
    </div>
</div>
<div class="d2" id="imges">
    <div class="d3">
        <form class="form-horizontal" name="forms" onsubmit="return dd()" method="get" action="BookUIServlet">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="inputEmail3" placeholder="Email" name="email">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="password">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="col-sm-5"><button type="submit" class="btn btn-primary btn-block" id="sub">登录</button></div>
                    <div class="col-sm-5"><button type="button" class="btn btn-primary btn-block">注册</button></div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    function dd() {
        var  email=$("#inputEmail3").val();
        var password=$("#inputPassword3").val();
        if (email==""){
            alert("账户不能为空");
            return false;
        }
        else if (password==""){
            alert("密码不能为空");
            return false;
        } else {
            $.get("http://localhost:8080//Liberary_war_exploded//LoginServlet",
                {"email":email,"password":password},
                function (data) {
               // alert(data.pan);
                    if (data.pan){
                        alert("登录成功");
                        return forms.submit();
                    }else{
                        alert(data.chuan);
                        return false;
                    }
                    // if(data.pan==false){
                    //     return false;
                    // }
                },"json");
        }

    }
</script>
</html>
