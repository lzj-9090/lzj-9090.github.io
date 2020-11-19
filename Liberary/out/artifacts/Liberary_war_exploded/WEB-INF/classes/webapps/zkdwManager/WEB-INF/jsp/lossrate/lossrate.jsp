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
		<title>线损率</title>
        <link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
        <script type='text/javascript' src="<%=basePath%>js/jquery.min.js"></script>
        <script type='text/javascript' src="<%=basePath%>js/highcharts.js"></script>
        <script type='text/javascript' src="<%=basePath%>js/highcharts-more.js"></script>
        <script src="<%=basePath%>js/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>js/jquery-validation/1.11.0/jquery.validate.method.js" type="text/javascript"></script>
 </head>
    <body>
<div class="header">
	<form id="lossrateForm" class="form-inline" role="form" action="<%=basePath%>lossrateAct/lossrate.html" onSubmit="return confirm();" method="post">
	    <div class="left logo-box">
<!-- 	    <img src="<%=basePath%>/images/logo.png" alt=""/> -->
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
	            <input type="text" name="searchItems" id="searchItems" value="${searchItems }" placeholder="输入抄表册"/>
	            <input type="hidden" id="oldsearchItems" name="oldsearchItems" value="${searchItems }" />
	            <input type="hidden" id="loseRate" name="loseRate" value="${loseRate }" />
	            <input type="hidden" id="jumingda" name="jumingda" value="${jumingda }" />
	            <input type="hidden" id="nojumingda" name="nojumingda" value="${nojumingda }" />
	            <input type="hidden" id="zeroqita" name="zeroqita" value="${zeroqita }" />
	            
	            <input type="hidden" id="dianlizoushou" name="dianlizoushou" value="${dianlizoushou }" />
	            <input type="hidden" id="jingrong" name="jingrong" value="${jingrong }" />
	            <input type="hidden" id="guitai" name="guitai" value="${guitai }" />
	            <input type="hidden" id="daikou" name="daikou" value="${daikou }" />
	            
	            <input type="hidden" id="zerojuming" name="zerojuming" value="${zerojuming }" />
	            <input type="hidden" id="zeronojuming" name="zeronojuming" value="${zeronojuming }" />
	            
	            
	            <input type="hidden" id="c1" name="c1" value="${c1 }" />
	            <input type="hidden" id="c3" name="c3" value="${c3 }" />
	            <input type="hidden" id="c2" name="c2" value="${c2 }" />
	            <input type="hidden" id="basePath" value="<%=basePath%>"/>
	        </div>
	    </div>
	</form>
</div>
<div class="container">
    <div class="left-menu">
        <ul>
            <li>
                <a  class="active" >功能切换</a>
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
        <div class="top-chart clearfix">
            <div class="top-lf">
                <div class="top-lf-box top-electricity">

                    <p>月供电量</p>
                    <div class="num-wrap">
                        <div class="num" id="yuegong">  
                        </div>
                    </div>
                </div>
            </div>
            <div class="top-mid" id="lossRate"></div>
            <div class="top-rg">
                <div class="top-rg-box top-electricity">

                    <p>月售电量</p>
                    <div class="num-wrap">
                        <div class="num" id="yueshou"> 
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="down-chart  clearfix">
            <ul>
                <li id="li1">
                <img alt="正在加载..." src="<%=basePath%>images/load2.gif"  >
                </li>
                <li id="li2">
                <img alt="正在加载..." src="<%=basePath%>images/load2.gif">
                </li>
                <li id="li3">
                <img alt="正在加载..." src="<%=basePath%>images/load2.gif">
                </li>
                <li id="li4">
                <img alt="正在加载..." src="<%=basePath%>images/load2.gif">
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

function openwin(obj) {
	var name = obj[0].name;
	var timestamp = Date.parse(new Date());
	var basePath = $("#basePath").val();
	var year = $("#classyear").val(); 
	var month = $("#classmonth").val(); 
	var searchItems = $("#searchItems").val();
	var color = obj[0].color;
	var path;
	//零度户
	if(name == '零度居名用户'){
// 		path = "lossrateAct/zerohu.html?userType=低压居民&timestamp="+timestamp+"&searchItems="+searchItems+"&month="+month+"&year="+year;
		path = "lossrateAct/zerohu.html?userType=低压居民&timestamp="+timestamp+"&searchItems="+searchItems+"&startMonth="+month+"&startYear="+year;
	}else if(name == '零度非居名用户'){
// 		path = "lossrateAct/zerohu.html?userType=低压非居民&timestamp="+timestamp+"&searchItems="+searchItems+"&month="+month+"&year="+year;
		path = "lossrateAct/zerohu.html?userType=低压非居民&timestamp="+timestamp+"&searchItems="+searchItems+"&startMonth="+month+"&startYear="+year;
	}else if(name == '其他' && color=='#f9ff66'){
// 		path = "lossrateAct/zerohu.html?userType=其他&timestamp="+timestamp+"&searchItems="+searchItems+"&month="+month+"&year="+year;
		path = "lossrateAct/zerohu.html?userType=其他&timestamp="+timestamp+"&searchItems="+searchItems+"&startMonth="+month+"&startYear="+year;
	}else if(name == '居民大电量'){
		path = "lossrateAct/dadianliang.html?is=yes&timestamp="+timestamp+"&searchItems="+searchItems+"&startMonth="+month+"&startYear="+year;
// 		path = "lossrateAct/dadianliang.html?is=yes&timestamp="+timestamp+"&searchItems="+searchItems+"&month="+month+"&year="+year;
	}else if(name == '其他'  && color=='#778eea'){
		path = "lossrateAct/dadianliang.html?timestamp="+timestamp+"&searchItems="+searchItems+"&startMonth="+month+"&startYear="+year;
// 		path = "lossrateAct/dadianliang.html?timestamp="+timestamp+"&searchItems="+searchItems+"&month="+month+"&year="+year;
	}else if(name == '代扣充值' || name == '金融机构代扣' || name == '电力机构走收' || name == '电力机构柜台收费'){
// 		path = "lossrateAct/jiaofei.html?type="+name+"&timestamp="+timestamp+"&searchItems="+searchItems+"&month="+month+"&year="+year;
		path = "lossrateAct/jiaofei.html?type="+name+"&timestamp="+timestamp+"&searchItems="+searchItems+"&startMonth="+month+"&startYear="+year;
	}else if(name == '抄表后7天'){
		path = "lossrateAct/jiaofeiTime.html?type=1&timestamp="+timestamp+"&searchItems="+searchItems+"&startMonth="+month+"&startYear="+year;
	}else if(name == '抄表后7天至月末前7天'){
		path = "lossrateAct/jiaofeiTime.html?type=2&timestamp="+timestamp+"&searchItems="+searchItems+"&startMonth="+month+"&startYear="+year;
	}else if(name == '月末7天'){
		path = "lossrateAct/jiaofeiTime.html?type=3&timestamp="+timestamp+"&searchItems="+searchItems+"&startMonth="+month+"&startYear="+year;
	}else if(name == '次月6天内'){
		path = "lossrateAct/jiaofeiTime.html?type=4&timestamp="+timestamp+"&searchItems="+searchItems+"&startMonth="+month+"&startYear="+year;
	}else if(name == '次月6天后'){
		path = "lossrateAct/jiaofeiTime.html?type=5&timestamp="+timestamp+"&searchItems="+searchItems+"&startMonth="+month+"&startYear="+year;
	}
	var iWidth=1200;                          //弹出窗口的宽度; 
    var iHeight=400;                         //弹出窗口的高度; 
	//获得窗口的垂直位置 
    var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
    //获得窗口的水平位置 
    var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
    window.open(basePath+path, "newwindow"+timestamp, "height="+iHeight+", width="+iWidth+", top="+iTop+",left="+iLeft+", toolbar =no, menubar=no, scrollbars=yes, resizable=no, location=no, status=no") //写成一行
 } 
 
 
$("#btnsd").click(function(){
	$("#lossrateForm").submit();
});

$("#btnsd").mouseover(function(){
	$(this).css("cursor","pointer");
});

$("#month").change(function(){
	var year = $("#year").val(); 
	var month = $("#month").val(); 
	var searchItems = $("#searchItems").val(); 
	var basePath = $("#basePath").val();
	window.location.href = basePath + "lossrateAct/lossrate.html?year="+year+"&month="+month+"&searchItems="+searchItems;//页面跳转并传参 
});


$(function () {
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
			month = months[months.length];
		}
		if(year==undefined || year==""||year==null){
			year = years[years.length];
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
	    $("#month").val(month);
	    $("#classmonth").val(parseInt(month));
	}  
	});
    
    
    
    


  
      
      
      

    
    
//     var month = $("#month").val();
//     li2
//     var nojumingda = parseInt($("#nojumingda").val());
//     var jumingda = parseInt($("#jumingda").val());
//     var zeroqita = parseInt($("#zeroqita").val());
//     li3
// 	var dianlizoushou = parseInt($("#dianlizoushou").val());
// 	var daikou = parseInt($("#daikou").val());
// 	var jingrong = parseInt($("#jingrong").val());
// 	var guitai = parseInt($("#guitai").val());
// 	li1
// 	var zeronojuming = parseInt($("#zeronojuming").val());
// 	var zerojuming = parseInt($("#zerojuming").val());
// 	li4
// 	var c1 = parseInt($("#c1").val());
// 	var c2 = parseInt($("#c2").val());
// 	var c3 = parseInt($("#c3").val());

//     myGaugeChart("li1",
//     	['#b7c029', '#92962d','#f9ff66'],  
//     	'零度户',[
//         ['零度居名用户', zerojuming],
//         ['零度非居名用户',zeronojuming],
//         ['其他', zeroqita]
//     ],-65);
    
//     myGaugeChart("li2",['#b3d1fc', '#778eea'],'居民大电量',[
//         ['居民大电量',jumingda],
//         ['其他', nojumingda]
//     ],-90);
//     myGaugeChart("li3",['#8df3ff', '#00c1d8', '#0070e2','#009dff'],'缴费方式',[
//         ['代扣充值', daikou],
//         ['电力机构柜台收费',guitai],
//         ['金融机构代扣',jingrong],
//         ['电力机构走收', dianlizoushou]
//     ],-35);
//     myGaugeChart("li4",  
//     	['#d6918f', '#f8cde1', '#d35c5f','#d82a2a','#fa7a9e']
//     	,'缴费时间',[
//         ['抄表后7天', c1],
//         ['抄表后7天至月末前7天',c2],
//         ['月末7天',c3],
//         ['次月6天内', 0],
//         ['次月6天后', 0]
//     ],-7);

});








$(function () {
	
	
    var month = $("#classmonth").val();
    var year = $("#classyear").val();
    var searchItems = $("#searchItems").val();
    var basePath = $("#basePath").val();
    //处理data数据
    $.ajax({  
		type : "get",  //提交方式  
		url : basePath+"lossrateAct/getData2.html",//路径 
		data:{
			month:month,
			year:year,
			searchItems:searchItems
		},
		success : function(result) {//返回数据根据结果进行相应的处理
		var data = JSON.parse(result);
		$("#yueshou").html(data[0].yueshou);
		$("#yuegong").html(data[0].yuegong);
	}  
	});
    
    
    
    

    // 构建图表
    Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
        return {
            radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
            stops: [
                [0, color],
                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
            ]
        };
    });
    /*
    * containerId图标id
    * colors饼图各块颜色
    * text标题
    * data数据
    * y 底下图例偏移（图例个数不一样，饼图大小不一致）
    * */
    function myGaugeChart(containerId, colors, text , data,y) {
        chart = new Highcharts.Chart({
            chart: {
                renderTo : containerId,
                plotBackgroundColor: null,
                plotBorderWidth: null,
                backgroundColor: 'transparent',
                plotShadow: false,
                height : 400
            },
            colors:colors,
            legend: {
             layout: 'vertical',
                verticalAlign: 'bottom',
                y:y,
                itemMarginTop :10,
                itemStyle: {
                    color: '#f9ff66',
                    fontWeight: 'bold'
                },
                itemHoverStyle: {
                    color: '#fff'
                },
                labelFormatter: function () {
                    return this.name + this.y+ '户';
                }
            },
            title: {
                text: text,
                style:{
                    color:'#02e5f3',
                    fontSize:'28px'
                }
            },
            tooltip: {
                pointFormat: '{point.percentage:.0f}%</b>'
            },
            credits: {
                enabled: false
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        color:'#fff',
                        enabled: true,
                        distance: -30,
                        format: '{point.percentage:.0f} %',
//                         formatter: function() {
//                             if (this.percentage > 0)
//                                 return '<b>' + this.point.name + '</b>: ' + this.percentage + ' %'; // 这里进行判断
//                         },
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        },
                        connectorColor: 'silver'
                    },
                    showInLegend: true,
                    point: {
                        events: {
                            legendItemClick: function(e) {
                            	openwin($(this));
                            	return false;
                            }
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                data: data
            }]
        })
    }
    
  
    
    
    //获取饼图数据
    $.ajax({  
		type : "get",  //提交方式  
		url : basePath+"lossrateAct/getBinData.html",//路径 
		data:{
			month:month,
			year:year,
			searchItems:searchItems
		},
		success : function(result) {//返回数据根据结果进行相应的处理
		var data = JSON.parse(result);
		myGaugeChart("li1",
		    	['#b7c029', '#92962d','#f9ff66'],  
		    	'零度户',[
		        ['零度居名用户', data[0].zerojuming],
		        ['零度非居名用户',data[0].zeronojuming],
		        ['其他', data[0].zeroqita]
		    ],-65);
		    
		    myGaugeChart("li2",['#b3d1fc', '#778eea'],'居民大电量',[
		        ['居民大电量',data[0].jumingda],
		        ['其他', data[0].nojumingda]
		    ],-90);
		    myGaugeChart("li3",['#8df3ff', '#00c1d8', '#0070e2','#009dff'],'缴费方式',[
		        ['代扣充值', data[0].daikou],
		        ['电力机构柜台收费',data[0].guitai],
		        ['金融机构代扣',data[0].jingrong],
		        ['电力机构走收', data[0].dianlizoushou]
		    ],-35);
		    myGaugeChart("li4",  
		    	['#d6918f', '#f8cde1', '#d35c5f','#d82a2a','#fa7a9e']
		    	,'缴费时间',[
		        ['抄表后7天', data[0].c1],
		        ['抄表后7天至月末前7天',data[0].c2],
		        ['月末7天',data[0].c3],
		        ['次月6天内', data[0].c4],
		        ['次月6天后', data[0].c5]
		    ],-7);
	}  
	});
    
    
    
    
    
    

    //线损率

//         var lossRates = $('#lossRate').highcharts({
	 var lossRates = new Highcharts.Chart({
                    chart : {
                    	renderTo: 'lossRate',
                        type : "gauge",
                        backgroundColor:'transparent',
                        plotBorderWidth : 0,
                        plotBackgroundColor : "transparent",
                        plotBackgroundImage : null,
                        width : 220,
                        height : 135
                    },
                    exporting : {
                        // 是否允许导出
                        enabled : false
                    },
                    credits : {
                        enabled : false
                    },
                    title : {
                        text : ''
                    },
                    pane : [ {
                        startAngle : -90,
                        endAngle : 90,
                        background : null,
                        // 极坐标图或角度测量仪的中心点，像数组[x,y]一样定位。位置可以是以像素为单位的整数或者是绘图区域的百分比
                        center : [ '50%', '90%' ],
                        size : 125
                    } ],
                    yAxis : {
                        min : -100,
                        max : 100,
                        // 步长
                        tickInterval : 20,
                        minorTickPosition : 'outside',
                        tickPosition : 'outside',
                        labels : {
                            // 刻度值旋转角度
                            rotation : 'auto',
                            distance : 20,
                            style: {
                                color: '#FFFFFF',
                                fontWeight: 'bold'
                            }
                        },
                        plotBands : [ {
                            // 预警红色区域长度
                            // from: 80,
                            // to: 100,
                            // color: '#C02316',
                            // 红色区域查出刻度线
                            innerRadius : '100%',
                            outerRadius : '115%'
                        } ],
                        // 表盘,为0时为半圆，其余都为圆
                        pane : 0,
                        title : {
                            style: {color:'#fff',fontSize: '18px'},
                            text : '线损率',
                            y : 50
                        }
                    },
                    plotOptions : {
                        gauge : {
                            dataLabels : {
                                enabled : true,
                                y:-45,
                                borderWidth:0,
                                color:'#fff',
                                fontSize:'14px'
                            },
                            dial : {
                                backgroundColor: '#02e5f3',
                                // 半径：指针长度
                                radius : '100%'
                            }
                        }
                    },
                    tooltip: {
                        pointFormat: '{point.y}'
                    },
                    series : [ {
//                         data : [8.8],
                        
                        
                        
                        data: (function() {                                                   
                            
//                             var data = [];
//                             var loseRate = $("#loseRate").val();
//                             data.push(parseInt(loseRate));
//                             return data; 
                      	
                      	  
                      	  
                        })() ,
                        
                        
                        
                        yAxis : 0,
                        dataLabels: {
                            format: '<div style="text-align:center"><span style="font-size:14px;color:#02e5f3">{y}%</span></div>'
                        }
                    } ]

                });
    
    
  	  $.ajax({  
  			type : "get",  //提交方式  
  			url : basePath+"lossrateAct/getLoseRate.html",//路径 
  			data:{
  				month:month,
  				year:year,
  				searchItems:searchItems
  			},
  			success : function(result) {//返回数据根据结果进行相应的处理
  			var data = JSON.parse(result);
  			var loseRate = data[0].loseRate;
  			var loseRateDataJson = [];
  			loseRateDataJson.push(parseInt(loseRate));
  			lossRates.series[0].setData(loseRateDataJson);
  		}  
  		});

});














	function confirm()
	{
		var searchItems = $("#searchItems").val();
		var pattern = /^[F]\d{6}$/;
		var vd = pattern.test(searchItems);
		if(vd){
			return true;
		}else{
			alert("抄表编号格式错误！（格式：F000000）");
			return false;
		}
	}

</script>
</html>