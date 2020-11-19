function getPath() {
	var location = (window.location + '').split('/');
	return location[0] + '//' + location[2] + '/' + location[3];
}
//在这里定义一个全局的路径获取
var basePath = getPath();
//这个地方主要是用来加载角色的
$(document).ready(function() {
	var roleId = $("#roleId").val();
	$.ajax( {
		type : 'post',
		url : basePath + '/roleAct/showRoles.html',
		async : false,
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		success : function(data) {
			jsondata = $.parseJSON(data);
			var roleNames = jsondata.roleNames;
			var roleIds = jsondata.roleIds;
			var objSelect = document.getElementById("selectRole");
			objSelect.options.length = 0;
			for ( var i = 0; i < roleNames.length; i++) {
				objSelect.options.add(new Option(roleNames[i], roleIds[i]));
			}
		},
		err : function() {
		}
	});
	var opts = document.getElementById("selectRole");
	for ( var i = 0; i < opts.options.length; i++) {
		if (roleId == opts.options[i].value) {
			opts.options[i].selected = 'selected';
		}
	}

});
function showRf() {
	var roleId = $("#selectRole").val();
	if (roleId == 0) {
		return;
	} else {
		window.location.href = basePath
				+ "/roleAct/roleFun.html?roleId=" + roleId;
	}
}

$(".zdy").click(function(){
	
	if($(this).is(':checked')){
		$(this).attr("checked","checked");
		$(this).attr("name","functionIds");
	}else{
		
		$(this).removeAttr("checked");
		$(this).removeAttr("name");
	}
	
	 
 });


//保存数据的时候进行一个验证
function saverf(){
	//如果没有选择的话给个提示
	
	return true;
}

