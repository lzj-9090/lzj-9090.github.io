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
				<form class="form-inline" role="form" action="<%=basePath%>areaAct/areaList.html" method="post">
				  <div class="form-group">
					<label>台区名称</label>
					<input type="input" name="searchItems" value="${searchItems }" class="form-control" placeholder="台区名称">
				  </div>
				  <div class="form-group">
					<button type="submit" class="content_top_btn"><img src="<%=basePath%>images/search.png" alt="查询"><span>查询</span></button>
				  </div>
				</form>
				<input type="hidden" id="basePath" value="<%=basePath%>"/>
			</div>
			
			
<!-- 			<div class="content_top">  -->
<!-- 				<ul class="clearfix"> -->
<!-- 					<li><a class="content_top_btn" href="<%=basePath%>areaAct/toAdd.html"><img src="<%=basePath%>images/add.png" alt=""><span>增加</span></a></li> -->
					<!-- 按钮触发模态框 -->
<!-- 				<li> -->
<!-- 					<button class="content_top_btn" data-toggle="modal" data-target="#myModal"> -->
<!-- 						导入台区信息 -->
<!-- 					</button> -->
<!-- 				</li> -->
<!-- 				<li style="margin-left: 10px"> -->
<!-- 					<button class="content_top_btn" onclick="window.location.href='<%=basePath%>data/台区信息模板.xls'" >模板下载</button> -->
<!-- 				</li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
			
			
			
			<div class="table-responsive"> 
				<table class="table"> 
					<thead class="table-head"> 
						<tr>
<!-- 							<th class="th_check"><input type="checkbox" id="totalAll"></th> -->
							<th>台区编号</th>
							<th>台区名称</th>
							<th>上级公司</th>
							<th>供电单位</th>
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
							<c:forEach items="${pagenation.list}" var="area">
							<tr>
							<td>${area.areaCode}</td>
							<td>${area.areaName}</td>
							<td>${area.superiorCompany}</td>
							<td>${area.powerSupply}</td>
							<td>
<!-- 								<a class="content_top_btn " href="<%=basePath%>areaAct/toAdd.html?areaId=${area.id}"><img src="<%=basePath%>images/edit.png" alt=""><span>编辑</span></a> -->
								<a class="content_top_btn" href="<%=basePath%>areaAct/delArea.html?areaId=${area.id}" onclick="return confirm('确认要删除吗？', this.href)"><img src="<%=basePath%>images/del.png" alt=""><span>删除</span></a>
							</td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="page clearfix">
			<form action="<%=basePath%>areaAct/areaList.html" method="post" id="pageSizee">
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
			   <form action="<%=basePath%>areaAct/areaList.html" method="post" onsubmit="return topage();">
				 <ul class="page-right">
					<li ><a href="<%=basePath%>areaAct/areaList.html?pageNo=1&pageSize=${pagenation.pageSize}">首页</a></li>
					<li class="previous">
					<a href="<%=basePath%>areaAct/areaList.html?pageNo=${pagenation.pageNo-1}&pageSize=${pagenation.pageSize}" onclick="return prevPage(${pagenation.pageNo})">上一页</a></li>
					<li>
					<input type="text" value="${pagenation.pageNo}" name="pageNo">
					<input name="pageSize" type="hidden" value="${pagenation.pageSize}">
					</li>
					<li><button type="submit" class="go-page">跳转</button></li>
					<li class="next">
					<a href="<%=basePath%>areaAct/areaList.html?pageNo=${pagenation.pageNo+1}&pageSize=${pagenation.pageSize}" onclick="return nextPage(${pagenation.pageNo},${totalPage })">下一页</a></li>
					<li><a href="<%=basePath%>areaAct/areaList.html?pageNo=${totalPage}&pageSize=${pagenation.pageSize}">尾页</a></li>
				 </ul>
				 </form>
			   </div>		 
			</div>	
		</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						台区耗电数据导入
					</h4>
				</div>
				<div class="modal-body">
					<form enctype="multipart/form-data" id="importForm" action="<%=basePath%>importAct/importData.html" method="post" class="form-horizontal">    
						<input type="file" name="file">  
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="importBtn" class="btn btn-primary">
						提交
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
		
</body>
<script type="text/javascript">
$("#importBtn").click(function(){
	var files = $("input[name='file']").prop('files');
	if(files.length == 0){
		alert("请选择文件");
		return;
	}
	$("#importBtn").attr("disabled",true);
	$("#importBtn").text("正在导入数据，请勿做其他操作......");
	$("#importForm").submit();
});
</script>
</html>