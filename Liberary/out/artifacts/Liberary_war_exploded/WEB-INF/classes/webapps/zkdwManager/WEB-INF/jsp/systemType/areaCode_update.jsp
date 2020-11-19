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
<jsp:include page="../top/header.jsp" />
<head>
</head>
<body>
	<div class="center">
		<form id="sssssForm" class="form-horizontal add-form" role="form" action="<%=basePath%>systemTypeAct/updateCode.html" onSubmit="return confirm();" method="post" >
			<table class="table table-bordered"> 
				<tbody> 
					<tr> 
						<td class="first1">默认抄表册</td>
						<td>
						<input type="text" class="required form-control" id="areaCode" name="areaCode" value="${areaCode }"  >
						<input type="hidden" id="msg" value="${msg }"  >
						</td>
					</tr>
					
					<tr> 
						<td colspan="2" class="first">
							<button type="submit" class="btn btn-sure U-user-login-btn">确定</button>
						</td>
					</tr>
				</tbody>
			</table>				
		</form>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	var msg = $("#msg").val();
	if(msg!=""){
		alert("默认台区设置成功！");
	}
	
	$("#sssssForm").validate(
					{
						rules : {
							areaCode : {
								remote : "<%=basePath%>systemTypeAct/checkCode2.html"
							}
						},
						messages : {
							areaCode : {
								remote : "该抄表册不存在!"
							}
						},
						submitHandler : function(form) {
							form.submit();
						}
					});
});

function confirm()
{
	var areaCode = $("#areaCode").val();
// 	if(areaCode=="" || areaCode == undefined || areaCode == null){
// 		alert("抄表编号不能为空!");
// 		return false;
// 	}
	var pattern = /^[F]\d{6}$/;
	var vd = pattern.test(areaCode);
	
	if(vd){
		return true;
	}else{
		alert("抄表册格式错误！（格式：F000000）");
		return false;
	}
}
</script>
</html>