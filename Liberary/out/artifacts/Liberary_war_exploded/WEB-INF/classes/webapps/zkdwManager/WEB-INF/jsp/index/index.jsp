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
	String adminName = (String) request.getSession().getAttribute(
			"adminName");
%>
<html lang="zh-CN">
<jsp:include page="../top/header.jsp" />
<body class="index_body" onload="setHeight();" onresize="setHeight();">
	<div class="head clearfix" id="head">
		<div class="logo fl"><a href="<%=basePath%>profitAct/profit.html">
<!-- 		<img src="<%=basePath%>images/logo2.png" alt=""> -->
		</a>台区精益化管理平台</div>
		<div class="head_r">
			<p id="bgclock">
				<span class="today" id="today" style="color:#fff;"></span>
				<span style="color:#fff;"></span>
				<span id="timeShow" style="color:#fff;margin:0 1px;"></span>
			</p>
			<div class="admin clearfix">
				<a href="" class="fl"><img src="<%=basePath%>images/user2.png" alt=""><%=adminName%></a>
				<a href="<%=basePath%>loginAct/webLogOut.html" onclick="return confirm('确认要退出登录吗？', this.href)" class="fr"><img src="<%=basePath%>images/out.png" alt="">退出</a>
			</div>
		</div>
		<div class="color_list">
			<ul class="clearfix">
				<li><a href="javascript:;" class="color_b" onclick="color('css/blue.css')"></a></li>
				<li><a href="javascript:;" class="color_r" onclick="color('css/black.css')"></a></li>
			</ul>
		</div>
	</div>
	
	<div class="section" id="section">
		<div class="page-sidebar">
			<div class="page-sidebar-left tab-content">
				<div role="tabpanel" class="tab-pane active" id="company">
					<ul class="page-sidebar-menu">
					
					
						<li class="nav-item active">
							<a href="javascript:;"><img src="<%=basePath%>images/zh1.png" alt=""><span>管理员</span></a>
							<ul class="sub-menu">
								<li class="active"><a href="<%=basePath%>adminAct/adminList.html" target="frame_name"><span>管理员列表</span></a></li>
							</ul>
						</li>
					
						<li class="nav-item active">
							<a href="javascript:;"><img src="<%=basePath%>images/bm.png" alt=""><span>台区信息</span></a>
							<ul class="sub-menu">
<!-- 								<li ><a href="<%=basePath%>areaAct/areaList.html" target="frame_name"><span>台区列表</span></a></li> -->
								<li ><a href="<%=basePath%>areaMeterAct/areaList.html" target="frame_name"><span>台区列表</span></a></li>
<!-- 								<li ><a href="<%=basePath%>areaPowerAct/areaPowerList.html" target="frame_name"><span>台区耗电信息列表</span></a></li> -->
								<li ><a href="<%=basePath%>areaMeterAct/areaMeterList.html" target="frame_name"><span>低压台区线损明细列表</span></a></li>
								<li ><a href="<%=basePath%>systemTypeAct/getAreaCode.html" target="frame_name"><span>默认台区设置</span></a></li>
							</ul>
						</li>
					
<!-- 						<li class="nav-item active"> -->
<!-- 							<a href="javascript:;"><img src="<%=basePath%>images/bm.png" alt=""><span>系统类型信息</span></a> -->
<!-- 							<ul class="sub-menu"> -->
<!-- 								<li ><a href="<%=basePath%>systemTypeAct/systemTypeList.html" target="frame_name"><span>系统类型列表</span></a></li> -->
<!-- 							</ul> -->
<!-- 						</li> -->
						
						<li class="nav-item active">
							<a href="javascript:;"><img src="<%=basePath%>images/bm.png" alt=""><span>用户用电信息</span></a>
							<ul class="sub-menu">
								<li ><a href="<%=basePath%>electricityInfoAct/electricityInfoList.html" target="frame_name"><span>用户用电列表</span></a></li>
							</ul>
						</li>
						
						
						


					</ul>
				</div>
			</div>
		</div>
		<div class="page-sidebar_mini"><a href="javascript:;" class="page-sidebar-m">&gt;&gt;</a></div>		
		<div class="page-content">
			<iframe id="iframe" src="<%=basePath%>adminAct/adminList.html" frameborder="0" style="width:100%;height:100%;" name="frame_name"></iframe>
		</div>
	</div>
</body>
</html>