<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>台区精益化管理平台</title>
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/css.css" rel="stylesheet" type="text/css" />
	<link id="style_css" href="<%=basePath%>css/blue.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	.content_top_btn:hover {
		color: #fff; /*鼠标经过的颜色变化*/
	}
	</style>
	<script src="<%=basePath%>js/jquery.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery.form.js"></script>
    <script src="<%=basePath%>js/app.js" type="text/javascript"></script>
    <link href="<%=basePath%>js/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
	<script src="<%=basePath%>js/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/jquery-validation/1.11.0/jquery.validate.method.js" type="text/javascript"></script>
    <script src="<%=basePath%>js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<!--     <script type="text/javascript" src="<%=basePath%>ckeditor/ckeditor.js"> </script> -->
<!-- 	<script type="text/javascript" src="<%=basePath%>ckfinder/ckfinder.js"> </script> -->
    <script type="text/javascript">
    function nextPage(pageNo,totalPage){
    	if(pageNo < totalPage){
    		return true;
    	}
    	return false;
    }	

    function prevPage(pageNo){

    	if(pageNo == 1){
    		return false;
    	}
    	return true;
    }
    
    function topage(){
    	var pageNo = $("input[name='pageNo']").val();
    	var totalPage = "${totalPage}";
    	if(parseInt(pageNo) > parseInt(totalPage) || parseInt(pageNo) <= 0){
    		return false;
    	}
    }
    
    function openwinImg(path) {
    	var basePath1 = $("#basePath").val();
    	var iWidth=1600;                          //弹出窗口的宽度; 
        var iHeight=800;                         //弹出窗口的高度; 
    	//获得窗口的垂直位置 
        var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
        //获得窗口的水平位置 
        var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
        window.open(basePath1+path, "newwindow", "height="+iHeight+", width="+iWidth+", top="+iTop+",left="+iLeft+", toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no") //写成一行
       } 
    </script>
</head>