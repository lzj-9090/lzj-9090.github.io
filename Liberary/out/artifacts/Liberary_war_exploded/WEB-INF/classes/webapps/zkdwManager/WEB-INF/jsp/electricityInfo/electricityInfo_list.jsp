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
				<form class="form-inline" role="form" action="<%=basePath%>electricityInfoAct/electricityInfoList.html" method="post">
				  <div class="form-group">
					<label>编号</label>
					<input type="input" name="searchItems" value="${searchItems }" class="form-control" placeholder="用户编号/抄表册">
				  </div>
<!-- 				  <div class="form-group"> -->
<!-- 					<label>选择年月</label> -->
<!-- 					<select class="form-control" name="year" id="year"></select> -->
<!-- 					<select class="form-control" name="month" id="month"></select> -->
<!-- 				  </div> -->
				<div class="form-group">
		            <select id="year" name="year" class="year right"></select>
		            <select id="month" name="month" class="month right"></select>
					<input type="hidden" id="basePath" value="<%=basePath%>"/>
					<input type="hidden" id="classmonth"  value="${month }"/>
        			<input type="hidden" id="classyear"  value="${year }"/>
		        </div>
		
				  <div class="form-group">
					<button type="submit" class="content_top_btn"><img src="<%=basePath%>images/search.png" alt="查询"><span>查询</span></button>
				  </div>
				  
				</form>
			</div>
			<div class="content_top"> 
				<ul class="clearfix">
				<li>
					<button class="content_top_btn" data-toggle="modal" data-target="#myModal">导入用户用电信息</button>
				</li>
				<li style="margin-left: 10px">
					<button class="content_top_btn" onclick="window.location.href='<%=basePath%>data/用户用电模板.xls'" >模板下载</button>
				</li>
				</ul>
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
							<th>操作</th>
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
							<td>
							<a class="content_top_btn" href="<%=basePath%>electricityInfoAct/del.html?id=${electricityInfo.id}&searchItems=${searchItems}&month=${month}&year=${year}" onclick="return confirm('确认要删除吗？', this.href)"><img src="<%=basePath%>images/del.png" alt=""><span>删除</span></a>
							</td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="page clearfix">
			<form action="<%=basePath%>electricityInfoAct/electricityInfoList.html" method="post" id="pageSizee">
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
				  <input type="hidden" name="month"  value="${month }"/>
        			<input type="hidden" name="year"  value="${year }"/>
        			<input type="hidden" name="searchItems"  value="${searchItems }"/>
			   </ul>
			   </form>
			   <div class="fr">
			   <form action="<%=basePath%>electricityInfoAct/electricityInfoList.html" method="post" onsubmit="return topage();">
				 <ul class="page-right">
					<li ><a href="<%=basePath%>electricityInfoAct/electricityInfoList.html?pageNo=1&pageSize=${pagenation.pageSize}&month=${month}&year=${year}&searchItems=${searchItems}">首页</a></li>
					<li class="previous">
					<a href="<%=basePath%>electricityInfoAct/electricityInfoList.html?pageNo=${pagenation.pageNo-1}&pageSize=${pagenation.pageSize}&month=${month}&year=${year}&searchItems=${searchItems}" onclick="return prevPage(${pagenation.pageNo})">上一页</a></li>
					<li>
					<input type="text" value="${pagenation.pageNo}" name="pageNo">
					<input name="pageSize" type="hidden" value="${pagenation.pageSize}">
					<input type="hidden" name="month"  value="${month }"/>
        			<input type="hidden" name="year"  value="${year }"/>
        			<input type="hidden" name="searchItems"  value="${searchItems }"/>
					</li>
					<li><button type="submit" class="go-page">跳转</button></li>
					<li class="next">
					<a href="<%=basePath%>electricityInfoAct/electricityInfoList.html?pageNo=${pagenation.pageNo+1}&pageSize=${pagenation.pageSize}&month=${month}&year=${year}&searchItems=${searchItems}" onclick="return nextPage(${pagenation.pageNo},${totalPage })">下一页</a></li>
					<li><a href="<%=basePath%>electricityInfoAct/electricityInfoList.html?pageNo=${totalPage}&pageSize=${pagenation.pageSize}&month=${month}&year=${year}&searchItems=${searchItems}">尾页</a></li>
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
						用户用电数据导入
					</h4>
				</div>
				<div class="modal-body">
					<form enctype="multipart/form-data" id="importForm" action="<%=basePath%>importAct/importElectricity.html" method="post" class="form-horizontal">    
						<input type="file" name="file">  
					</form>
				</div>
				<div class="modal-footer">
<!-- 					<button type="button" class="btn btn-default" data-dismiss="modal">关闭 -->
<!-- 					</button> -->
					<button type="button" id="importBtn" class="btn btn-primary">
						提交
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
		
</body>
<script type="text/javascript">

$(function(){
// 	设置年份的选择
//     var myDate= new Date();
//     var startYear=myDate.getFullYear()-10;//起始年份 
//     var endYear=myDate.getFullYear();//结束年份
//     获取当前月份
//     var nowMonth = parseInt(myDate.getMonth()) + 1;
//     var month = $("#classmonth").val();
//     if(month==undefined || month==""||month==null){
//     	如果月份为空，则默认选择当前月份的上一个月 
//     	凑数据
//     	month=nowMonth - 2;
//     } 
//     var yearStr='';
//     var monthStr='';
//     for (var i=startYear;i<=endYear;i++)
//     {
//         yearStr+='<option value="'+i+'">'+i+' 年</option>'
//     }
//     $("#year").html(yearStr);
//     $("#year").val("2017");
//     设置月份的选择
//     for (var i=1;i<=12;i++)
//     {
//         monthStr+='<option value="'+i+'">'+i+' 月</option>'
//     }
//     $("#month").html(monthStr);
//     $("#month").val(month);
    
    
    
    
  //获取年月
    var month = $("#classmonth").val();
    var year = $("#classyear").val();
    var basePath = $("#basePath").val();
    $.ajax({  
		type : "get",  //提交方式  
		url : basePath+"electricityInfoAct/getValidDate.html",//路径  
		success : function(result) {//返回数据根据结果进行相应的处理
		var data = JSON.parse(result);
		var years = data[0].year;
		var months = data[0].month;
		if(month==undefined || month==""||month==null){
			month = months[0];
		}
		if(year==undefined || year==""||year==null){
			year = years[0];
		}
		var yearStr='';
	    var monthStr='';
	    $.each(years, function (i, item) {  
	    	yearStr+='<option value="'+item+'">'+item+' 年</option>'
        });
	    $("#year").html(yearStr);
	    $("#year").val(year);
	    $("#classmonth").val(year);
	    $.each(months, function (i, item) {  
	    	monthStr+='<option value="'+parseInt(item)+'">'+parseInt(item)+' 月</option>'
        });
	    $("#month").html(monthStr);
	    $("#month").val(parseInt(month));
	    $("#classmonth").val(parseInt(month));

	}  
	});
    
    
    
    
});

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