<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fyg" uri="http://www.demoTest.cn/jurisdiction"%>
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
			<div class="search"> 
				<form class="form-inline" role="form" action="<%=basePath%>adminAct/adminList.html" method="post">
				  <div class="form-group">
					<label>账户</label>
					<input type="input" name="searchItems" value="${searchItems }" class="form-control" placeholder="账户">
				  </div>
				  <div class="form-group">
					<label>选择角色</label>
					<select class="form-control" name="roleType">
						<option value="1">普通管理员</option>
						<option value="2">超级管理员</option>
					</select>
				  </div>
				  <div class="form-group">
					<button type="submit" class="content_top_btn"><img src="<%=basePath%>images/search.png" alt="查询"><span>查询</span></button>
				  </div>
				</form>
			</div>
			<fyg:jurisdiction privilege="2">
			<div class="content_top"> 
				<ul class="clearfix">
					<li><a class="content_top_btn" href="<%=basePath%>adminAct/toAdd.html"><img src="<%=basePath%>images/add.png" alt=""><span>增加</span></a></li>
				</ul>
			</div>
			</fyg:jurisdiction>
			<div class="table-responsive"> 
				<table class="table"> 
					<thead class="table-head"> 
						<tr>
							<th class="th_check"><input type="checkbox" id="totalAll"></th>
							<th>登录账号</th>
							<th>角色</th>
							<th>性别</th>
							<th>昵称</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty(pagenation.list)}">
							<tr>
								<td colspan="6">暂时无数据!</td>
							</tr>
						</c:if>
						<c:if test="${!empty(pagenation.list)}">
							<c:forEach items="${pagenation.list}" var="admin">
							<tr>
							<td><input type="checkbox" name="item" value="${admin.id}"></td>
							<td>${admin.adminName}</td>
							<td>
							<c:if test="${admin.roleId eq '1'}">普通管理员</c:if>
							<c:if test="${admin.roleId eq '2'}">超级管理员</c:if>
							</td>
							<td>
								<c:if test="${admin.gender eq '1'}">男</c:if>
								<c:if test="${admin.gender eq '2'}">女</c:if>
								<c:if test="${admin.gender eq '3'}">保密</c:if>
							</td>
							<td>${admin.nickName}</td>
							<td>
							<fyg:jurisdiction privilege="2">
								<a class="content_top_btn " href="<%=basePath%>adminAct/toAdd.html?adminId=${admin.id}"><img src="<%=basePath%>images/edit.png" alt=""><span>编辑</span></a>
							</fyg:jurisdiction>
								<a class="content_top_btn " href="<%=basePath%>adminAct/toInfo.html?adminId=${admin.id}"><img src="<%=basePath%>images/mb.png" alt=""><span>详情</span></a>
								<fyg:jurisdiction privilege="2">
								<a class="content_top_btn" href="<%=basePath%>adminAct/delAdmin.html?adminId=${admin.id}" onclick="return confirm('确认要删除吗？', this.href)"><img src="<%=basePath%>images/del.png" alt=""><span>删除</span></a>
								</fyg:jurisdiction>
							</td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="page clearfix">
			<form action="<%=basePath%>adminAct/adminList.html" method="post" id="pageSizee">
			   <ul class="page-left fl">
				  <li>当前页显示<select name="pageSize" onchange="document.getElementById('pageSizee').submit();">
				  <option value="10" <c:if test="${pagenation.pageSize ==10 }">selected="selected"</c:if>>10</option>
				  <option value="50" <c:if test="${pagenation.pageSize ==50 }">selected="selected"</c:if>>50</option>
				  <option value="100" <c:if test="${pagenation.pageSize ==100 }">selected="selected"</c:if>>100</option>
				  <option value="500" <c:if test="${pagenation.pageSize ==500 }">selected="selected"</c:if>>500</option>
				  </select>
				     条</li>
				  <li>总数量：<i>${pagenation.totalCount}</i></li>
				  <li>总页数：<i>${totalPage}</i></li>
			   </ul>
			   </form>
			   <div class="fr">
			   <form action="<%=basePath%>adminAct/adminList.html" method="post" onsubmit="return topage();">
				 <ul class="page-right">
					<li ><a href="<%=basePath%>adminAct/adminList.html?pageNo=1&pageSize=${pagenation.pageSize}">首页</a></li>
					<li class="previous">
					<a href="<%=basePath%>adminAct/adminList.html?pageNo=${pagenation.pageNo-1}&pageSize=${pagenation.pageSize}" onclick="return prevPage(${pagenation.pageNo})">上一页</a></li>
					<li>
					<input type="text" value="${pagenation.pageNo}" name="pageNo">
					<input name="pageSize" type="hidden" value="${pagenation.pageSize}">
					</li>
					<li><button type="submit" class="go-page">跳转</button></li>
					<li class="next">
					<a href="<%=basePath%>adminAct/adminList.html?pageNo=${pagenation.pageNo+1}&pageSize=${pagenation.pageSize}" onclick="return nextPage(${pagenation.pageNo},${totalPage })">下一页</a></li>
					<li><a href="<%=basePath%>adminAct/adminList.html?pageNo=${totalPage}&pageSize=${pagenation.pageSize}">尾页</a></li>
				 </ul>
				 </form>
			   </div>		 
			</div>
		</div>
</body>
</html>