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
    <head>       
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>台区利润</title>
        <link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
        <script type='text/javascript' src="<%=basePath%>js/jquery.min.js"></script>
        <script type='text/javascript' src="<%=basePath%>js/highcharts.js"></script>
        <script src="<%=basePath%>js/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>js/jquery-validation/1.11.0/jquery.validate.method.js" type="text/javascript"></script>
 </head>
    <body class="profit-body">
    <div class="header">
        <form id="profitForm" class="form-inline" role="form" action="<%=basePath%>profitAct/profit.html" onSubmit="return confirm();" method="post">
        <div class="left logo-box">
<!--         <img src="<%=basePath%>/images/logo.png" alt=""/> -->
        </div>
        <span class="text">
	    <c:if test="${not empty areaName}"><font size="4px">（${areaName}）</font>    </c:if>
	    ${searchItems }</span>
        	<input type="hidden" id="classmonth" name="month" value="${month }"/>
        	<input type="hidden" id="classyear" name="year" value="${year }"/>
	        <div class="right search-box">
	            <select id="month" name="month" class="month right"></select>
	            <select id="year" name="year" class="year right"></select>
		            <div class="search right">
		                <span class="btn icon" id="btnsd"></span>
		                <input type="text" id="searchItems" name="searchItems" value="${searchItems }" placeholder="输入抄表册"/>
		                <input type="hidden" id="oldsearchItems" name="oldsearchItems" value="" />

		                <input type="hidden" id="basePath" value="<%=basePath%>"/>
		            </div>
	           
	        </div>
         </form>
    </div>
   <div class="container">
       <div class="left-menu">
           <ul>
               <li>
                   <a  class="active"  >功能切换</a>
               </li>
               <li>
                   <a href="<%=basePath%>profitAct/profit.html?searchItems=${searchItems}&month=${month}&year=${year}">利润分析</a>
               </li>
               <li>
                   <a href="<%=basePath%>lossrateAct/lossrate.html?searchItems=${searchItems}&month=${month}&year=${year}">异常分析</a>
               </li>
           </ul>
       </div>
       <div class="right-content">
           <div class="top-desc">
               <div class="left-chart-desc">
                   <div class="profit">
                       <p id="jiyue"> </p>
                       <strong><span id="yuelirun">正在加载...</span></strong>
                   </div>
                   <div class="details">
                       <p class="clearfix">
<!--                        		<span class="right">${shoudian}<span class="unit">kw-h</span></span>售电量</p> -->
					 	   <span class="left">售电量</span>
						   <span class="num"><span id="shoudian">***</span><span class="unit">千瓦时</span></span>
					   </p>
					   <p class="clearfix">
<!--                        <span class="right">${gongdian }<span class="unit">kw-h</span></span>供电量 -->
							<span class="left">供电量</span>
						    <span class="num"><span id="gongdian">***</span><span class="unit">千瓦时</span></span>
                       </p>
                       
                       <p class="clearfix">
<!--                        <span class="right">0.870<span class="unit">元／千瓦时</span></span>非居民销售电价 -->
							<span class="left">非居民销售电价</span>
						    <span class="num">0.870<span class="unit">元/千瓦时</span></span>
                       </p>
                       <p class="clearfix">
<!--                        <span class="right">0.558/0.608/0.858<span class="unit">元／千瓦时</span></span>居民销售电价 -->
							<span class="left">居民销售电价</span>
						    <span class="num">0.558/0.608/0.858<span class="unit">元/千瓦时</span></span>
                       </p>
                       
                   </div>
               </div>
               <div class=" right-chart" id="rightChart"></div>
           </div>

           <div class="bottom-desc clearfix">
               <ul>
                   <li class="active">
                       <p>年销售利润</p>
                       <strong><span id="nianLirun">正在加载...</span><span class="unit"></span></strong>
                   </li>
                   <li>
                       <p>年供电量</p>
                       <strong><span id="Ygongdian">***</span><span class="unit">千瓦时</span></strong>
                   </li>
                   <li>
                       <p>年售电均价</p>
                       <strong>0.563<span class="unit">元/千瓦时</span></strong>
                   </li>
                   <li>
                       <p>年售电量</p>
                       <strong><span id="Yshoudian">***</span><span class="unit">千瓦时</span></strong>
                   </li>
               </ul>

           </div>
       </div>
   </div>
   <fyg:jurisdiction privilege="2">
    <div class="footer">
        <div class="in-wrap">
            <a class="platform-in" target="_blank" href="<%=basePath%>indexAct/index.html">进入系统管理平台</a>
            <img src="<%=basePath%>/images/footer.png" alt=""/>
        </div>
    </div>
    </fyg:jurisdiction>
</body>

<script type="text/javascript">

$("#btnsd").click(function(){
	$("#profitForm").submit();
});

$("#btnsd").mouseover(function(){
	$(this).css("cursor","pointer");
});

$("#month").change(function(){
	var year = $("#year").val(); 
	var month = $("#month").val(); 
	var searchItems = $("#searchItems").val(); 
	var oldsearchItems = $("#oldsearchItems").val(); 
	var basePath = $("#basePath").val();
	window.location.href = basePath + "profitAct/profit.html?year="+year+"&month="+month+"&searchItems="+searchItems+"&oldsearchItems="+oldsearchItems;//页面跳转并传参 
});


$(function(){
    
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
	    
	    var months = NumberToChinese(month);
	    $("#jiyue").text(months+"月销售利润");
	}  
	});
 

    var colors = Highcharts.getOptions().colors;
    $.each(colors, function(i, color) {
        colors[i] = {
            linearGradient: { x1: 0, y1: 0, x2: 1, y2: 0 },
            stops: [
                [0, '#10ffff'],
                [0.3, 'rgba(16, 255, 255, 0.8)'],
                [1, '#10ffff']
            ]
        };
    });
    
    
    
    
//      console.log("ssss");
     Highcharts.setOptions({
    	    lang: {
    	        thousandsSep : ""

    	    }
    	});
    
//Create the chart
    var chart = new Highcharts.Chart({
        chart: {
            renderTo: 'rightChart',
            type: 'column',
            backgroundColor: 'transparent',
            marginTop: 30
        },
        legend: {
            enabled: false
        },
        tooltip:{
            pointFormat: '{point.y}',
        },
        credits: {
            enabled: false
        },
        title:{
            text:' '
        },
        plotOptions: {
            series: {
                borderColor: '',
                dataLabels: {
                    enabled: true,
                    color:'rgba(255, 255, 255, 0.76)',
                    overflow:'none',
                    allowOverlap: true,
					crop:false
                }
            }
        },
        xAxis: {
            lineColor: 'rgba(16, 255, 255, 0.2)',
            lineWidth: 1,
            tickWidth: 0,
            labels: {
                style: {
                    color:'rgba(16, 255, 255, 0.48)',
                    fontSize:'15px'
                }
            },
//             categories: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
//             categories: xAxisDataJson
//             categories: [{
// 				data:(function(){
// 				var data = [];
// 				data.push('1月');
// 				data.push('2月');
// 				data.push('3月');
// 				data.push('4月');
// 				data.push('5月');
// 				data.push('6月');
// 				data.push('7月');
// 				data.push('8月');
// 				data.push('9月');
// 				data.push('10月');
// 				data.push('11月');
// 				data.push('12月');
// 				return data;
// 				})()
// 				}]
        },
        yAxis: {
            title: {
                align: 'high',
                offset: -55,
                text: '单位：元',
                rotation: 0,
                y: -10,
                style:{
                    color:'rgba(16, 255, 255, 0.48)'
                }

            },
            gridLineColor: 'rgba(16, 255, 255, 0.2)',
            lineColor: 'rgba(16, 255, 255, 0.2)',
            lineWidth: 1,
            labels: {
                style: {
                    color:'rgba(16, 255, 255, 0.48)',
                    fontSize:'15px'
                }
            }
        },
        series: [{
//             data: seriesDataJson
//             data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
//         	data:(function(){
//         		var data = [];
//         		data.push(29.9);
//         		data.push(71.5);
//         		data.push(106.4);
//         		data.push(129.2);
//         		data.push(144.0);
//         		data.push(176.0);
//         		data.push(135.6);
//         		data.push(148.5);
//         		data.push(216.4);
//         		data.push(194.1);
//         		data.push(29.9);
//         		data.push(54.4);
//         		return data;
//         	})
        }]
        
//         series: [{                                                                
//             name: 'Random data',                                                  
//             data: (function() {                                                   
                             
//                 var data = [],                                                    
//                     time = 10,                                
//                     i;
//                 var month = $("#classmonth").val();
//                 var year = $("#classyear").val();
//                 var searchItems = $("#searchItems").val();
//                 var basePath = $("#basePath").val();
                
//                 $.ajax({  
//             		type : "get",  //提交方式  
//             		url : basePath+"profitAct/getLirun.html",//路径  
//             		data : {  
//             		"month" : month,
//             		"year" : year,
//             		"searchItems":searchItems
//             	},//数据，这里使用的是Json格式进行传输  
//             	success : function(result) {//返回数据根据结果进行相应的处理 
//             		console.log(result);
//             		$.each(JSON.parse(result), function (i, item) {  
//             			data.push(parseInt(item.value));
//             			console.log(item.value);
//                     }); 
//             		return data;
//             	}  
//             	});
//                 return data;                                                      
//             })()                                                                  
//         }] 
        
        
    });
    
    
    //拼数据
    var month = $("#classmonth").val();
    var year = $("#classyear").val();
    var searchItems = $("#searchItems").val();
    var basePath = $("#basePath").val();
    $.ajax({  
		type : "get",  //提交方式  
		url : basePath+"profitAct/getLirun.html",//路径  
		data : {  
		"month" : month,
		"year" : year,
		"searchItems":searchItems
	},//数据，这里使用的是Json格式进行传输  
	success : function(result) {//返回数据根据结果进行相应的处理 
		var seriesDataJson = [];
		var xAxisDataJson = [];  
		console.log(result);
		//先取出map
		var data = JSON.parse(result);
		var nianLirun = data[0].nian;
// 		alert("Nianlrun:"+nianLirun);
		$("#nianLirun").text(nianLirun+"元");
		//月利润
		$("#yuelirun").text(data[0].yuelirun+"元");
		var yueList = data[0].yue;
		$.each(yueList, function (i, item) {  
			seriesDataJson.push(parseInt(item.value));
			var name = item.name;
	         var yue = name.substr(name.length-2,name.length);
	         if(parseInt(yue)<10){
	             yue = name.substr(name.length-1,name.length);
	         }
			xAxisDataJson.push(yue+"月");
// 			temp.push(item.name);
// 			console.log(item.value);
        }); 
		chart.series[0].setData(seriesDataJson);
		chart.xAxis[0].setCategories(xAxisDataJson);
	}  
	});  
    
    
    
    
    //处理data数据
    $.ajax({  
		type : "get",  //提交方式  
		url : basePath+"profitAct/getData.html",//路径  
		data : {  
		"month" : month,
		"year" : year,
		"searchItems":searchItems
	},//数据，这里使用的是Json格式进行传输  
	success : function(result) {
		//先取出map
		var data = JSON.parse(result);
		console.log(data);
		$("#Ygongdian").text(data[0].Ygongdian);
		$("#Yshoudian").text(data[0].Yshoudian);
		
		$("#gongdian").text(data[0].gongdian);
		$("#shoudian").text(data[0].shoudian);
		 
	}  
	});  
    
    
    
    
    
    
    

    
})


function confirm()
{
	var searchItems = $("#searchItems").val();
	var pattern = /^[F]\d{6}$/;
	var vd = pattern.test(searchItems);
	if(vd){
		return true;
	}else{
		alert("抄表册格式错误！（格式：F000000）");
		return false;
	}
}

function NumberToChinese(num){
	var s1 = [ "零", "一", "二", "三", "四", "五", "六", "七", "八", "九" ];
	var s2 = [ "十", "百", "千", "万", "十", "百", "千", "亿", "十", "百", "千" ];

	var result ;

	if(num<10){
		result = s1[parseInt(num)];
	}else if(num>10){
		var yueww = num.substr(num.length-1,num.length);
		result = s2[0] + s1[parseInt(yueww)];
	}else{
		result = s2[0] ;
	}
	return result;
	}



</script>
</html>