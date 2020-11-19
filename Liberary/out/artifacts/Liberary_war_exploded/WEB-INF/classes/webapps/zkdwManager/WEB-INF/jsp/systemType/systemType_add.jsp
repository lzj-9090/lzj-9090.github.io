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
			$("#typeName").focus();
			$("#systemTypeForm").validate(
							{
								rules : {
									typeName : {
										remote : "<%=basePath%>systemTypeAct/checkName.html?oldTypeName="
												+ encodeURIComponent('${systemType.typeName}')
									},
									typeCode : {
										remote : "<%=basePath%>systemTypeAct/checkCode.html?oldTypeCode="
												+ encodeURIComponent('${systemType.typeCode}')
									}
								},
								messages : {
									typeName : {
										remote : "该系统名称已存在"
									},
									typeCode : {
										remote : "该系统编码已存在"
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
		<form id="systemTypeForm" class="form-horizontal add-form" role="form" action="<%=basePath%>systemTypeAct/systemTypeAdd.html">
			<table class="table table-bordered"> 
				<tbody> 
					<tr> 
						<td class="first">系统名称</td>
						<td>
						<input type="text" class="required form-control" name="typeName" value="${systemType.typeName }" data-toggle="tooltip" data-placement="right" title="系统名称不能为空">
						<input type="hidden" name="oldTypeName" id="oldTypeName" value="${systemType.typeName }">
						<input type="hidden" name="systemTypeId" value="${systemType.id }">
						</td>
					</tr>
					<tr> 
						<td class="first">系统编码</td>
						<td>
						<input type="text" class="required form-control" name="typeCode" value="${systemType.typeCode}" data-toggle="tooltip" data-placement="right" title="系统编码不能为空">
						<input type="hidden" name="oldTypeCode" id="oldTypeCode" value="${systemType.typeCode }">
						</td>
					</tr>
					<tr> 
						<td class="first">系统类型</td>
						<td>
						<input type="text" class="required form-control" name="sysType" value="${systemType.sysType}" data-toggle="tooltip" data-placement="right" title="系统类型不能为空">
						</td>
					</tr>
					
					<tr> 
						<td class="first">排序</td>
						<td>
						<input type="text" class="form-control" name="priority" value="${systemType.priority}" onkeyup="value=value.replace(/[^\d.]/g,'')" >
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