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
			$("#areaName").focus();
			$("#areaForm").validate(
							{
								rules : {
									areaName : {
										remote : "<%=basePath%>areaAct/checkName.html?oldAreaName="
												+ encodeURIComponent('${area.areaName}')
									},
									areaCode : {
										remote : "<%=basePath%>areaAct/checkCode.html?oldAreaCode="
												+ encodeURIComponent('${area.areaCode}')
									}
								},
								messages : {
									areaName : {
										remote : "该台区名称已存在"
									},
									areaCode : {
										remote : "该台区编号已存在"
									}
								},
								submitHandler : function(form) {
									form.submit();
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
		<form id="areaForm" class="form-horizontal add-form" role="form" action="<%=basePath%>areaAct/areaAdd.html">
			<table class="table table-bordered"> 
				<tbody> 
					<tr> 
						<td class="first">台区编号</td>
						<td>
						<input type="text" class="required form-control" name="areaCode" value="${area.areaCode }" data-toggle="tooltip" data-placement="right" title="台区编号不能为空">
						<input type="hidden" name="oldAreaCode" id="oldAreaCode" value="${area.areaCode }">
						<input type="hidden" name="areaId" value="${area.id }">
						</td>
					</tr>
					<tr> 
						<td class="first">台区名称</td>
						<td>
						<input type="text" class="required form-control" name="areaName" value="${area.areaName}" data-toggle="tooltip" data-placement="right" title="台区名称不能为空">
						<input type="hidden" name="oldAreaName" id="oldAreaName" value="${area.areaName }">
						</td>
					</tr>
					<tr> 
						<td class="first">上級公司</td>
						<td>
						<input type="text" class="required form-control" name="superiorCompany" value="${area.superiorCompany}" data-toggle="tooltip" data-placement="right" title="上级公司不能为空">
						</td>
					</tr>
					
					<tr> 
						<td class="first">供电单位</td>
						<td>
						<input type="text" class="required form-control" name="powerSupply" value="${area.powerSupply}" data-toggle="tooltip" data-placement="right" title="供电单位不能为空">
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
</html>