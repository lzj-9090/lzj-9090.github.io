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
<script type="text/javascript">
$(document).ready(function() {
			$("#adminName").focus();
			$("#adminForm").validate(
							{
								rules : {
									adminName : {
										remote : "<%=basePath%>adminAct/checkName.html?oldAdminName="
												+ encodeURIComponent('${adminInfo.adminName}')
									}
								},
								messages : {
									adminName : {
										remote : "该账户名已存在"
									}
								},
								submitHandler : function(form) {
									loading('正在提交，请稍等...');
									form.submit();
								},
								errorContainer : "#messageBox",
								errorPlacement : function(error,
										element) {
									$("#messageBox").text(
											"输入有误，请先更正。");
									if (element.is(":checkbox")
											|| element.is(":radio")
											|| element
													.parent()
													.is(
															".input-append")) {
										error.appendTo(element
												.parent().parent());
									} else {
										error.insertAfter(element);
									}
								}
							});
		});
</script>
</head>
<body>
	<div class="center">
		<div class="content_top content_top_d"> 
			<ul class="clearfix">
				<li><a href="#" class="content_top_btn" onClick="javascript :history.back(-1);"><span>返回</span></a></li>
			</ul>
		</div>	
		<form id="adminForm" class="form-horizontal add-form" role="form" action="<%=basePath%>adminAct/adminAdd.html">
			<table class="table table-bordered"> 
				<tbody> 
					<tr> 
						<td class="first">登录账号</td>
						<td>
						<input type="text" class="required form-control" id="adminName" name="adminName" value="${adminInfo.adminName }" data-toggle="tooltip" data-placement="right" title="登录账号不能为空">
						<input type="hidden" name="oldAdminName" id="oldAdminName" value="${adminInfo.adminName }">
						<input type="hidden" name="adminId" value="${adminInfo.id }">
						</td>
					</tr>
					<tr> 
						<td class="first">新密码</td>
						<td>
<!-- 						<input type="text" class="required form-control" name="password" value="${adminInfo.password }" data-toggle="tooltip" data-placement="right" title="登录密码"> -->
						<input type="text" class="required form-control" name="password" title="用户新密码">
						</td>
					</tr>
					<tr> 
						<td class="first">角色</td>
						<td>
						<select class="required form-control" name="roleType">
							<option value="1">普通管理员</option>
							<option value="2">超级管理员</option>
						</select>
						</td>
					</tr>
					<tr> 
						<td class="first">性别</td>
						<td>
							<select class="form-control" name="gender">
								<option value="3">保密</option>
								<option value="1">男</option>
								<option value="2">女</option>
							</select>
						</td>
					</tr>
					<tr> 
						<td class="first">昵称</td>
						<td><input type="text" class="form-control" name="nickName" value="${ adminInfo.nickName}" ></td>
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
</html>