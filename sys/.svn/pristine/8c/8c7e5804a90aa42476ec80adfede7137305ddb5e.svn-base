<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更改密码</title>
<link type="text/css" rel="stylesheet" href="../css/main.css"/>
<link type="text/css" rel="stylesheet" href="../js/validate/css/validate.css" />
<style type="text/css">
body{width:100%;height:100%;background-color: #FFFFFF;text-align: center;}
.input_txt{width:200px;height:20px;line-height:20px;}
.info{height:40px;line-height:40px;}
.info th{text-align: right;width:65px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>
</head>
<body>
	<form action="updataPassword.html" name="userForm" id="userForm" method="post">
		<input type="hidden" name="userId" id="userId" value="${user.userId }"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th>用户名:</th>
			<td><input type="text" readonly="readonly" name="loginname" id="loginname" class="input_txt" value="${user.loginname }"/></td>
		</tr>
		<tr class="info">
			<th>老密码:</th>
			<td><input type="text" name="oldPassword" id="oldPassword"  class="input_txt"/></td>
		</tr>
		<tr class="info">
			<th>新密码:</th>
			<td><input type="text" name="password" id="password" value="${user.password }" class="input_txt"/></td>
		</tr>
	</table>
	<div class="search_div">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:search();" class="myBtn"><em>确认修改</em></a>
	</div>
	</form>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validate/talent-validate-all-init.js" ></script>
	<script type="text/javascript">
		var msg = "${msg}";
		if (msg != "" && msg != null) {
			alert(msg);
		}
		function search(){
			var _v1 = tt.vf.req.add("password","oldPassword");
			var _fd = "^[A-Za-z0-9]+$";
			var _v3 = new tt.RV().set(new RegExp(_fd),"密码只能包含数字字母!").add("password");
			var _v4 = new tt.RV().set(new RegExp(_fd),"密码名只能包含数字字母!").add("oldPassword");
			if(!tt.validateForm('userForm')) {
				return false;
			}
			$("#userForm").submit();
		}
	</script>
</body>
</html>