function setHeight(){
	var headHeight=document.getElementById('head').offsetHeight;	 
	var max_height =window.innerHeight-headHeight|| document.documentElement.clientHeight-headHeight||document.body.clientHeight-headHeight;	 
	var primary = document.getElementById('section');
	primary.style.height = max_height+"px";	 
}

function color(href){
	var link=document.getElementById('style_css');
	var _iframe = document.getElementById('iframe').contentWindow;  
		link.href=href;
	_iframe.document.getElementById('style_css').href=link.href;
}

$(document).ready(function(){
	nav();
	var pageHeight=$(".page").height();
	$(".table-responsive").css("margin-bottom",pageHeight+40);
	$('.page-sidebar-b').click(function(){
		$('.page-sidebar').animate({left:'-180px'},500,function(){
		$('.page-sidebar_mini').css('display','block');
		$('.page-sidebar').css('display','none');
		});
		$('.page-content').animate({marginLeft:'30px'});
	});
	$('.page-sidebar-m').click(function(){
		$('.page-sidebar_mini').css('display','none');
		$('.page-sidebar').css('display','block');
		$('.page-sidebar').animate({left:'0'});
		$('.page-content').animate({marginLeft:'180px'});
	});
	$(".tab-pane ul li a").click(function(){
		$(this).siblings("ul").slideToggle();
		$(this).parent().siblings().children(".sub-menu").slideUp();
		$(this).parent().siblings("li").removeClass("active");
		$(this).parent("li").toggleClass("active");
	});
	$(".page-sidebar-menu>li.active .sub-menu li.active").parent(".sub-menu").css("display","block");
	$(".sub-menu li a").click(function(){
		$(".sub-menu li").removeClass("active");
		$(this).parent("li").addClass("active");
	});
	$(".nav-tabs li").click(function(){
		var text0=$(this).children().find("p").text();
		$(".page-sidebar-top span").text(text0);
	});
	$(".color_list").mousemove(function(){
		$(".color_list ul").css("display","block");
	});
	$(".color_list").mouseleave(function(){
		$(".color_list ul").css("display","none");
	});
	$(".muban_add").click(function(){
		$(".table>thead>tr>th.last-line").before("<th><button class='muban_reduce'>×</button></th>");   
		var trArray = $(".table tr");
        var td;
		for (var i = 0; i < trArray.length; i++) {
			td = $(trArray[i]).find("td:last");
			$(td).before("<td></td>");
		}
	});
	
	$(".table").on('click','.muban_reduce',function(){
		var index=$(this).parent().index();
		var trArray = $(".table tr");
        var td;
		for (var i = 0; i < trArray.length; i++) {
			td = $(trArray[i]).find("td:eq("+index+")");
			$(td).remove();
		}
		$(this).parent().remove();
	});	
	
	$(".add_xx").click(function(){
		$(".form-table tr:last").after('<tr><td>'
					+'<div class="form-group">'
					+'<div class="col-sm-2"><input type="text" class="form-control number fr"></div>'
					+'<div class="col-sm-4">'
					+'<input type="text" class="form-control">'
					+'</div>'
					+'<div class="col-sm-1">'
					+'<a class="btn btn-danger reduce_btn">-</a>'
					+'</div>'
				    +'</div></td></tr>')
	});
	$(".add-form").on('click','.reduce_btn',function(){
		$(this).parents("tr").remove();
	});
	$(".gq_add_btn").click(function(){
		$(".table tr:last").after('<tr>'
								+'<td><select><option value="">关卡</option><option value="">第一关</option><option value="">第二关</option></select></td>'
								+'<td><input type="text" class="cg_input"></td>'
								+'<td><input type="text" class="cg_input"></td>'
								+'<td><input type="text" class="cg_input"></td>'
								+'<td><input type="text" class="cg_input"></td>'
								+'<td><a class="btn btn-danger gq_reduce_btn">-</a></td>'
								+'</tr>')
	});
	
	$(".table").on('click','.gq_reduce_btn',function(){
		$(this).parent().parent("tr").remove();
	});
	
})
function nav(){
	var text=$(".nav-tabs li.active a p").text();
	$(".page-sidebar-top span").text(text);
}
		
//全选
$(function(){
	$('#totalAll').bind('click',function(){
		if(this.checked){
			$("input[name=item]").each(function(){
					$(this).prop('checked',true);
				})
		}else{ 
			$("input[name=item]").each(function(){
				$(this).prop('checked',false);
			})
		}
	});
	var allLength=$("input[name=item]").length;
	$("input[name=item]").each(function(){
		$("input[name=item]").bind('click',function(){
			var selectedLength=$("input[name=item]:checked").length;
			if(selectedLength==allLength){
				$('#totalAll').prop("checked",true);
			}else{
				$('#totalAll').prop("checked",false);
			}
		})
	})
});

$(function(){
	var today = new Date();
	var day = today.getDay();
	var week;
	var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
	week = arr_week[day];
	now=today.getFullYear()+"年"+(today.getMonth() + 1)+"月"+today.getDate()+"日"+"   "+ week;
	$(".today").text(now);
});
var t = null;
t = setTimeout(time);
function time() {
	clearTimeout(t);
	dt = new Date();
	var h = dt.getHours()
	if (h < 10) {
		h = "0" + h
	}
	var m = dt.getMinutes()
	if (m < 10) {
		m = "0" + m
	}
	var s = dt.getSeconds()
	if (s < 10) {
		s = "0" + s
	}
//	document.getElementById("timeShow").innerHTML = "" + h + ":" + m + ":" + s;
	t = setTimeout(time, 1000);
}

