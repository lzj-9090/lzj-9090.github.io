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
				<form id="zerohuform" class="form-inline" role="form" action="<%=basePath%>lossrateAct/jiaofei.html" method="post">
				  <div class="form-group">
					<label>抄表段编号</label>
					<input type="text" name="searchItems" value="${searchItems }" readonly="readonly" class="form-control" placeholder="台区名称/编码">
					<input type="hidden" name="type" value="${type }">
<!-- 					<input type="hidden" id="inputyear" value="${year }"> -->
<!-- 					<input type="hidden" id="inputmonth" value="${month }"> -->
<!-- 					<input type="hidden" id="year" name="year" value="${year }"> -->
<!-- 					<input type="hidden" id="month" name="month" value="${month }"> -->
					<input type="hidden" id="inputstartYear" value="${startYear }">
					<input type="hidden" id="inputstartMonth" value="${startMonth }">
					<input type="hidden" id="inputendYear" value="${endYear }">
					<input type="hidden" id="inputendMonth" value="${endMonth }">
					<input name="pageSize" type="hidden" value="${pagenation.pageSize}">
					<input name="pageNo" type="hidden" value="${pagenation.pageNo}">
					
					<input type="hidden" id="startYear" name="startYear" value="${startYear }">
					<input type="hidden" id="startMonth" name="startMonth" value="${startMonth }">
					<input type="hidden" id="endYear" name="endYear" value="${endYear }">
					<input type="hidden" id="endMonth" name="endMonth" value="${endMonth }">
					
				  </div>
<!-- 				  <div class="form-group"> -->
<!-- 					<label>选择年月</label> -->
<!-- 					<select class="form-control" name="year" id="year"></select> -->
<!-- 					<select class="form-control" name="month" id="month"></select> -->
<!-- 				  </div> -->
<!-- 					<div class="form-group"> -->
<!-- 					<label>起始年月</label> -->
<!-- 					<select class="form-control" name="startYear" id="startYear"></select> -->
<!-- 					<select class="form-control" name="startMonth" id="startMonth"></select> -->
<!-- 				  </div> -->
				  
<!-- 				  <div class="form-group"> -->
<!-- 					<label>结束年月</label> -->
<!-- 					<select class="form-control" name="endYear" id="endYear"></select> -->
<!-- 					<select class="form-control" name="endMonth" id="endMonth"></select> -->
<!-- 				  </div> -->
		
<!-- 				  <div class="form-group"> -->
<!-- 					<button type="submit" class="content_top_btn"><img src="<%=basePath%>images/search.png" alt="查询"><span>查询</span></button> -->
<!-- 				  </div> -->
				  <div class="form-group">
					<button type="button" onclick="exports()" class="content_top_btn"><img src="<%=basePath%>images/search.png" alt="导出"><span>导出</span></button>
				  </div>
				  
				</form>
				<input type="hidden" id="basePath" value="<%=basePath%>"/>
			</div>
			<div class="table-responsive"> 
				<table class="table"> 
					<thead class="table-head"> 
						<tr>
<!-- 							<th class="th_check"><input type="checkbox" id="totalAll"></th> -->
							<th>用户编号</th>
							<th>用户名称</th>
							<th>用户地址</th>
							<th>用户分类</th>
							<th>抄表段编号</th>
							<th>合同容量</th>
							<th>运行容量</th>
							<th>抄表顺序号</th>
							<th>用电类别</th>
							<th>缴费方式</th>
							<th>电价</th>
							<th>缴费日期</th>
							<th>当月电量</th>
							<th>当月电费</th>
							<th>抄表员姓名</th>
<!-- 							<th>发布时间</th> -->
<!-- 							<th>操作人</th> -->
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty(pagenation.list)}">
							<tr>
								<td colspan="17">暂时无数据!</td>
							</tr>
						</c:if>
						<c:if test="${!empty(pagenation.list)}">
							<c:forEach items="${pagenation.list}" var="electricityInfo">
							<tr>
							<td>${electricityInfo.userCode}</td>
							<td>${electricityInfo.userName}</td>
							<td>${electricityInfo.address}</td>
							<td>${electricityInfo.userType}</td>
							<td>${electricityInfo.meterNum}</td>
							<td>${electricityInfo.contractCapacity}</td>
							<td>${electricityInfo.operationCapacity}</td>
							<td>${electricityInfo.meterOrder}</td>
							<td>${electricityInfo.powerCategory}</td>
							<td>${electricityInfo.payAway}</td>
							<td>${electricityInfo.powerPrice}</td>
							<td>${electricityInfo.payData}</td>
							<td>${electricityInfo.powerCount}</td>
							<td>${electricityInfo.powerAmount}</td>
							<td>${electricityInfo.meterName}</td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<div class="page clearfix">
			<form action="<%=basePath%>lossrateAct/jiaofei.html" method="post" id="pageSizee">
			   <ul class="page-left fl">
				  <li>当前页显示<select name="pageSize" onchange="document.getElementById('pageSizee').submit();">
<!-- 				  <option value="10" <c:if test="${pagenation.pageSize ==10 }">selected="selected"</c:if>>10</option> -->
<!-- 				  <option value="15" <c:if test="${pagenation.pageSize ==15 }">selected="selected"</c:if>>15</option> -->
<!-- 				  <option value="20" <c:if test="${pagenation.pageSize ==20 }">selected="selected"</c:if>>20</option> -->
				  <option value="10" <c:if test="${pagenation.pageSize ==10 }">selected="selected"</c:if>>10</option>
				  <option value="50" <c:if test="${pagenation.pageSize ==50 }">selected="selected"</c:if>>50</option>
				  <option value="100" <c:if test="${pagenation.pageSize ==100 }">selected="selected"</c:if>>100</option>
				  <option value="500" <c:if test="${pagenation.pageSize ==500 }">selected="selected"</c:if>>500</option>
				  </select>
				     条</li>
				  <li>总数量：<i>${pagenation.totalCount}</i></li>
				  <li>总页数：<i>${totalPage}</i></li>
				  <input type="hidden" name="searchItems" value="${searchItems }"  >
					<input type="hidden" name="type" value="${type }">
					<input type="hidden" name="endYear" value="${endYear }">
				  <input type="hidden" name="endMonth" value="${endMonth }">
				  <input type="hidden" name="startMonth" value="${startMonth }">
				  <input type="hidden" name="startYear" value="${startYear }">
			   </ul>
			   </form>
			   <div class="fr">
			   <form action="<%=basePath%>lossrateAct/jiaofei.html" method="post" onsubmit="return topage();">
				 <ul class="page-right">
					<li ><a href="<%=basePath%>lossrateAct/jiaofei.html?pageNo=1&pageSize=${pagenation.pageSize}&searchItems=${searchItems}&type=${type}&endYear=${endYear}&endMonth=${endMonth}&startMonth=${startMonth}&startYear=${startYear}">首页</a></li>
					<li class="previous">
					<a href="<%=basePath%>lossrateAct/jiaofei.html?pageNo=${pagenation.pageNo-1}&pageSize=${pagenation.pageSize}&searchItems=${searchItems}&type=${type}&endYear=${endYear}&endMonth=${endMonth}&startMonth=${startMonth}&startYear=${startYear}" onclick="return prevPage(${pagenation.pageNo})">上一页</a></li>
					<li>
					<input type="text" value="${pagenation.pageNo}" name="pageNo">
					<input name="pageSize" type="hidden" value="${pagenation.pageSize}">
					<input type="hidden" name="searchItems" value="${searchItems }"  >
					<input type="hidden" name="type" value="${type }">
					<input type="hidden" name="endYear" value="${endYear }">
				  <input type="hidden" name="endMonth" value="${endMonth }">
				  <input type="hidden" name="startMonth" value="${startMonth }">
				  <input type="hidden" name="startYear" value="${startYear }">
					</li>
					<li><button type="submit" class="go-page">跳转</button></li>
					<li class="next">
					<a href="<%=basePath%>lossrateAct/jiaofei.html?pageNo=${pagenation.pageNo+1}&pageSize=${pagenation.pageSize}&searchItems=${searchItems}&type=${type}&endYear=${endYear}&endMonth=${endMonth}&startMonth=${startMonth}&startYear=${startYear}" onclick="return nextPage(${pagenation.pageNo},${totalPage })">下一页</a></li>
					<li><a href="<%=basePath%>lossrateAct/jiaofei.html?pageNo=${totalPage}&pageSize=${pagenation.pageSize}&searchItems=${searchItems}&type=${type}&endYear=${endYear}&endMonth=${endMonth}&startMonth=${startMonth}&startYear=${startYear}">尾页</a></li>
				 </ul>
				 </form>
			   </div>		 
			</div>	
</body>
<script type="text/javascript">
$(document).ready(function() {
	//设置年份的选择
    var myDate= new Date();
    var startYearsd=myDate.getFullYear()-10;//起始年份
    var endYearsd=myDate.getFullYear();//结束年份
    var startMonth= $("#inputstartMonth").val();
    var startYear= $("#inputstartYear").val();
    var endMonth= $("#inputendMonth").val();
    var endYear= $("#inputendYear").val();
    if(startMonth=="" || startMonth == undefined || startMonth == null){
    	startMonth = parseInt(myDate.getMonth())+1;
    }
    if(startYear=="" || startYear == undefined || startYear == null){
    	startYear = "2017";
    }
    if(endMonth=="" || endMonth == undefined || endMonth == null){
    	endMonth = parseInt(myDate.getMonth())+1;
    }
    if(endYear=="" || endYear == undefined || endYear == null){
    	endYear = "2017";
    }
    var yearStr='';
    var monthStr='';
    for (var i=startYearsd;i<=endYearsd;i++)
    {
        yearStr+='<option value="'+i+'">'+i+' 年</option>'
    }
    $("#startYear").html(yearStr);
    $("#startYear").val(startYear);
    $("#endYear").html(yearStr);
    $("#endYear").val(endYear);
    //设置月份的选择
    for (var i=1;i<=12;i++)
    {
        monthStr+='<option value="'+i+'">'+i+' 月</option>'
    }
    $("#startMonth").html(monthStr);
    $("#startMonth").val(parseInt(startMonth));
    $("#endMonth").html(monthStr);
    $("#endMonth").val(parseInt(endMonth));

});

function exports(){
	var basePath = $("#basePath").val();
	$("#zerohuform").attr("action",basePath + "ExportexcleAct/jiaofeiexport.html");
	$("#zerohuform").submit();
	$("#zerohuform").attr("action",basePath + "lossrateAct/jiaofei.html");
}
</script>
</html>