<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Chat</title>
    
    <script type="text/javascript" src="js/jquery-1.4.1.js"></script>
    <script type="text/javascript" src="js/jquery1.42.min.js"></script>    
    <script type="text/javascript" src="${pageContext.request.contextPath }/dwr/engine.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/dwr/util.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/dwr/interface/ChatService.js"></script>
    <script type="text/javascript">
    function onload(){
    	//这个方法用来启动该页面的ReverseAjax功能
        dwr.engine.setActiveReverseAjax(true);
        //设置在页面关闭时，通知服务端销毁会话
        dwr.engine.setNotifyServerOnPageUnload(true);
        var tag = $("#userName").val();    //自定义一个标签
        
    }
        function send() {
            var time = new Date();
            var content = dwr.util.getValue("content");
            var name = dwr.util.getValue("userName");
            var info = encodeURI(encodeURI(name + " say:\n" + content));
            var msg = {"msg": info, "time": time};
            dwr.util.setValue("content", "");
            if (!!content) {
                ChatService.sendMessage(msg);
            } else {
                alert("发送的内容不能为空！");
            }
        }
 
        function showMessage(data) {
            var message = decodeURI(decodeURI(data.msg));
            var text = dwr.util.getValue("info");
            if (!!text) {  
                dwr.util.setValue("info", text + "\n" + data.time + "  " + message);
            } else {
                dwr.util.setValue("info", data.time + "  " + message);
            }
        }
    </script>
  </head>
  
  <body onload="onload();">
      <textarea rows="20" cols="60" id="info" readonly="readonly"></textarea>
      <hr/>
      昵称：<input type="text" id="userName" value="${username}"/><br/>
      消息：<textarea rows="5" cols="30" id="content"></textarea>
      <input type="button" value=" Send " onclick="send()" style="height: 85px; width: 85px;"/>
  </body>
</html>
		
	</body>
</html>