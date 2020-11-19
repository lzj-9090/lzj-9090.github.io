function getPath() {
	var location = (window.location + '').split('/');
	return location[0] + '//' + location[2] + '/' + location[3];
}
var basePath = getPath();
$(document).ready(function() {
	if (window != top)
		top.location.href = location.href;
	$(document).keyup(function(event) {
		if (event.keyCode == 13) {
			if ($("#nosubmit").val() == 'false') {
				$("#submitLogin").trigger("click");
			} else {
				$("#nosubmit").val('false');
			}

		}
	});
	// 错误提示
	var errormsg = $("#errorMsg").val();
	if (errormsg != null && errormsg != "") {
		alert(errormsg);
	}

});
// 验证form表单的
function checkForm() {
	var adminName = $("#adminName").val();
	var passWord = $("#passWord").val();
	if (adminName == "" || adminName == null) {
		alert("请输入用户名!");
		return false;
	}
	if (passWord == "" || passWord == null) {
		alert("请输入密码!");
		return false;
	}
	 if (!checkCode()) {
	 return false;
	 }
	return true;
}
// 验证验证码的true:通过 false:不通过
function checkCode() {
	var result = false;
	var randCode = $("#randCode").val();
	if (randCode == "" || randCode == null) {
		alert("请输入验证码!");
		return result;
	}
	$.ajax({
		type : 'post',
		url : basePath + '/loginAct/checkCode.html',
		async : false,
		data : {
			randCode : randCode
		},
		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
		success : function(data) {
			if ("fail" == data) {
				// 验证码不正确的时候要重新刷新验证码
				$("#code").attr("src",
						basePath + "/JcaptchaServlet?" + new Date().getTime());

				alert("验证码不正确!");
				$("#nosubmit").val("true");
			}
			if ("success" == data) {
				result = true;
			}
		},
		err : function() {
		}
	});
	return result;
}