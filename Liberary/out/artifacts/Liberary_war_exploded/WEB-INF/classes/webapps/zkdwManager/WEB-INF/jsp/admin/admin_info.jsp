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
<body>
	<div class="center">
		<div class="content_top content_top_d"> 
			<ul class="clearfix">
				<li><a href="#" class="content_top_btn" onClick="javascript :history.back(-1);"><span>返回</span></a></li>
			</ul>
		</div>	
		<form id="roleForm" class="form-horizontal add-form" role="form" action="<%=basePath%>roleAct/roleAdd.html">
			<table class="table table-bordered"> 
				<tbody> 
					<tr> 
						<td class="first">管理员名称</td>
						<td> ${adminInfo.adminName }</td>
					</tr>
					<tr> 
						<td class="first">角色</td>
						<td>${adminInfo.roleId }</td>
					</tr>
					<tr> 
						<td class="first">昵称</td>
						<td>${adminInfo.nickName }</td>
					</tr>
					<tr> 
						<td class="first">性别</td>
						<td>
							<c:if test="${adminInfo.gender eq '1'}">男</c:if>
							<c:if test="${adminInfo.gender eq '2'}">女</c:if>
							<c:if test="${adminInfo.gender eq '3'}">保密</c:if>
						</td>
					</tr>
					<tr> 
						<td class="first">注册时间</td>
						<td><fmt:formatDate value="${adminInfo.registerTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					</tr>
					<tr> 
						<td class="first">成功登录次数</td>
						<td>${adminInfo.accessCounts }</td>
					</tr>
					<tr> 
						<td class="first">最后成功登录时间</td>
						<td><fmt:formatDate value="${adminInfo.lastAccessTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					</tr>
					<tr> 
						<td class="first">最后成功登录IP</td>
						<td>${adminInfo.lastAccessIp }</td>
					</tr>
					
					
					<tr> 
						<td class="first">失败登录次数</td>
						<td>${adminInfo.failCounts }</td>
					</tr>
					<tr> 
						<td class="first">最后失败登录时间</td>
						<td><fmt:formatDate value="${adminInfo.lastFailTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					</tr>
					<tr> 
						<td class="first">最后成功失败IP</td>
						<td>${adminInfo.lastFailIp }</td>
					</tr>
					<tr> 
						<td class="first">是否禁用</td>
						<td>
							<c:if test="${adminInfo.isValid eq '1'}">正常</c:if>
							<c:if test="${adminInfo.isValid eq '0'}">禁用</c:if>
						</td>
					</tr>
					
				</tbody>
			</table>				
		</form>
	</div>
</body>
</html>