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
			<div class="search"> 
				<form class="form-inline" role="form" action="<%=basePath%>systemTypeAct/systemTypeList.html" method="post">
				  <div class="form-group">
<!-- 					<label>类型名称\编码</label> -->
					<input type="input" name="searchItems" value="${searchItems }" class="form-control" placeholder="类型名称/编码">
				  </div>
				  <div class="form-group">
					<button type="submit" class="content_top_btn"><img src="<%=basePath%>images/search.png" alt="查询"><span>查询</span></button>
				  </div>
				</form>
				<input type="hidden" id="basePath" value="<%=basePath%>"/>
			</div>
			<div class="content_top"> 
				<ul class="clearfix">
					<li><a class="content_top_btn" href="<%=basePath%>systemTypeAct/toAdd.html"><img src="<%=basePath%>images/add.png" alt=""><span>增加</span></a></li>
				</ul>
			</div>
			
			<div class="table-responsive"> 
				<table class="table"> 
					<thead class="table-head"> 
						<tr>
<!-- 							<th class="th_check"><input type="checkbox" id="totalAll"></th> -->
							<th>系统名称</th>
							<th>系统编码</th>
							<th>系统类型</th>
							<th>排序</th>
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
							<c:forEach items="${pagenation.list}" var="systemType">
							<tr>
							<td>${systemType.typeName}</td>
							<td>${systemType.typeCode}</td>
							<td>${systemType.sysType}</td>
							<td>${systemType.priority}</td>
							<td>
<!-- 								<a class="content_top_btn " href="<%=basePath%>systemTypeAct/toAdd.html?systemTypeId=${systemType.id}"><img src="<%=basePath%>images/edit.png" alt=""><span>编辑</span></a> -->
<!-- 								<a class="content_top_btn" href="<%=basePath%>systemTypeAct/delSystemType.html?systemTypeId=${systemType.id}" onclick="return confirm('确认要删除吗？', this.href)"><img src="<%=basePath%>images/del.png" alt=""><span>删除</span></a> -->
							</td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="page clearfix">
			<form action="<%=basePath%>systemTypeAct/systemTypeList.html" method="post" id="pageSizee">
			   <ul class="page-left fl">
				  <li>当前页显示<select name="pageSize" onchange="document.getElementById('pageSizee').submit();">
				  <option value="10" <c:if test="${pagenation.pageSize ==10 }">selected="selected"</c:if>>10</option>
				  <option value="15" <c:if test="${pagenation.pageSize ==15 }">selected="selected"</c:if>>15</option>
				  <option value="20" <c:if test="${pagenation.pageSize ==20 }">selected="selected"</c:if>>20</option>
				  </select>
				     条</li>
				  <li>总数量：<i>${pagenation.totalCount}</i></li>
				  <li>总页数：<i>${totalPage}</i></li>
			   </ul>
			   </form>
			   <div class="fr">
			   <form action="<%=basePath%>systemTypeAct/systemTypeList.html" method="post" onsubmit="return topage();">
				 <ul class="page-right">
					<li ><a href="<%=basePath%>systemTypeAct/systemTypeList.html?pageNo=1&pageSize=${pagenation.pageSize}">首页</a></li>
					<li class="previous">
					<a href="<%=basePath%>systemTypeAct/systemTypeList.html?pageNo=${pagenation.pageNo-1}&pageSize=${pagenation.pageSize}" onclick="return prevPage(${pagenation.pageNo})">上一页</a></li>
					<li>
					<input type="text" value="${pagenation.pageNo}" name="pageNo">
					<input name="pageSize" type="hidden" value="${pagenation.pageSize}">
					</li>
					<li><button type="submit" class="go-page">跳转</button></li>
					<li class="next">
					<a href="<%=basePath%>systemTypeAct/systemTypeList.html?pageNo=${pagenation.pageNo+1}&pageSize=${pagenation.pageSize}" onclick="return nextPage(${pagenation.pageNo},${totalPage })">下一页</a></li>
					<li><a href="<%=basePath%>systemTypeAct/systemTypeList.html?pageNo=${totalPage}&pageSize=${pagenation.pageSize}">尾页</a></li>
				 </ul>
				 </form>
			   </div>		 
			</div>	
		</div>
</body>
</html>