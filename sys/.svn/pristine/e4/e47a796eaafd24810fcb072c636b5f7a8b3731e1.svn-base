<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>渠道运营系统</title>
<style type="text/css">
	body{margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;background-color: #1B3142;}
	.header{width:100%;height:41px;background: url(images/login-top-bg.gif) repeat-x;}
	.center{width:100%;height:532px;background: url(images/login_bg.jpg) repeat-x;}
	.login_right{float:right;width:50%;height:100%;background: url(images/login-wel.gif) bottom no-repeat;}
	.login_left{float:right;width:295px;height:100%;background: url(images/login-content-bg.gif) no-repeat;}
	.login_title{margin-left:35px;font-family: Arial, Helvetica, sans-serif;font-size: 14px;height:36px;line-height: 36px;color: #666666;font-weight: bold;}
	.login_info{margin-left:35px;font-family: Arial, Helvetica, sans-serif;font-size: 12px;height:36px;line-height: 36px;color: #333333;}
	.login_input{width:150px;height:20px;margin-left:5px;border:1px solid #7F9DB9;vertical-align: middle;}
	.login_code{width:70px;height:20px;margin-left:30px;border:1px solid #7F9DB9;vertical-align: middle;}
	.btn{width:60px;height:25px;border-width:0px;background-image: url(images/btn-bg2.gif);letter-spacing: 3px;margin-right:70px;cursor: pointer;}
	.login_info img{vertical-align: middle;cursor: pointer;}
	
	.errInfo{display:none;color:red;}
	
	.logo{width:100%;height:68px;background: url(images/logo2.png) no-repeat;_background:none;_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/logo2.png';)}
	.left_txt{font-family: Arial, Helvetica, sans-serif;font-size: 12px;line-height: 25px;color: #666666;}
	
	.bottom{width:100%;height:auto;text-align:center;font-family: Arial, Helvetica, sans-serif;font-size: 10px;color: #ABCAD3;text-decoration: none;line-height: 20px;}
</style>
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="js/validate/css/validate.css" />
</head>
<body>
<div style="width:100%;height:645px;position: absolute;top:50%;left:50%;margin-top:-320px;margin-left:-50%;">
	<div class="header"></div>
	<div class="center">
		<div class="login_right">
			<div style="width:100%;height:auto;margin-top:150px;">
			<form action="registeron.html" method="post" name="registeron" onsubmit="return check();">
				<div class="login_title">
					用户注册
				</div>
				<div class="login_info">
					<label>账&nbsp;&nbsp;户&nbsp;&nbsp;名：</label><input type="text" name="loginname" id="loginname" class="login_input" value="${user.loginname }"/>
					&nbsp;<span id="nameerr" class="errInfo"></span>
					&nbsp;&nbsp;
					<label>渠道名称：</label><input type="text" name="qdName" id="qdName" class="login_input" value="${qd.qdName }"/>
					&nbsp;<label style="color:#ff0000;">填入:公司名或名片上称呼</label>
				</div>
				<div class="login_info">
					<label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label><input type="password" name="password" id="password" class="login_input" value="${password }"/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
					&nbsp;&nbsp;
					<label>确认密码：</label><input type="password" name="password_y" id="password_y" class="login_input" value=""/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
				</div>
				<div class="login_info">
					<label>联&nbsp;&nbsp;系&nbsp;&nbsp;人：</label><input type="text" name="qdContact" id="qdContact" class="login_input" value="${qd.qdContact }"/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
					&nbsp;&nbsp;
					<label>邮箱地址：</label><input type="text" name="qdEmail" id="qdEmail" class="login_input" value="${qd.qdEmail }"/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
				</div>
				<div class="login_info">
					<label>Q&nbsp;Q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：</label><input type="text" name="qdQq" id="qdQq" class="login_input" value="${qd.qdQq }"/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
					&nbsp;&nbsp;
					<label>手机座机：</label><input type="text" name="qdPhone" id="qdPhone" class="login_input" value="${qd.qdPhone }"/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
				</div>
				<div class="login_info">
					<label>开户银行：</label><input type="text" name="qdYh" id="qdYh" class="login_input" value="${qd.qdYh }"/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
					&nbsp;&nbsp;
					<label>银行卡号：</label><input type="text" name="qdZh" id="qdZh" class="login_input" value="${qd.qdZh }"/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
				</div>
				<div class="login_info">
					<label>开户姓名：</label><input type="text" name="qdKhr" id="qdKhr" class="login_input" value="${qd.qdKhr }"/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
				</div>
				<div class="login_info">
					<label>支行信息：</label><input type="text" name="qdKhk" id="qdKhk" class="login_input" value="${qd.qdKhk }"/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
				</div>
				<div class="login_info">
					<input type="submit" name="loginBtn" value="注册" class="btn"/>
				</div>
			</form>
			</div>
		</div>
		<div class="login_left">
			<div style="width:100%;height:auto;margin-top:150px;">
				<div class="logo"></div>
				<div class="left_txt">
					<div class="login_title">公告：</div>
					1、近期账单已经结算完毕<br/>
					2、渠道商务必填写好有效的银行账户相关信息<br/>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom">
	Copyright &copy; 2014 重庆微推科技
	</div>
</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/validate/talent-validate-all-init.js" ></script>
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg != '' || msg.length > 0) {
			alert(msg);
		}
		$(document).ready(function(){
			changeCode();
			//$("#codeImg").bind("click",changeCode);
			if(errInfo!=""){
				if(errInfo.indexOf("验证码")>-1){
					$("#codeerr").show();
					$("#codeerr").html(errInfo);
					$("#code").focus();
				}else{
					$("#nameerr").show();
					$("#nameerr").html(errInfo);
				}
			}
			$("#loginname").focus();
		});
	
		function genTimestamp(){
			var time = new Date();
			return time.getTime();
		}
	
		function changeCode(){
			//$("#codeImg").attr("src","code.html?t="+genTimestamp());
		}
		
		function resetErr(){
			$("#nameerr").hide();
			$("#nameerr").html("");
			$("#pwderr").hide();
			$("#pwderr").html("");
			$("#codeerr").hide();
			$("#codeerr").html("");
		}
		
		function check(){
			resetErr();
			var _v1 = tt.vf.req.add("loginname", "qdName" ,"password","password_y", "qdContact" ,"qdEmail","qdQq","qdPhone"	);
			
			var _fd = "^[A-Za-z0-9]+$";
			var _v2 = new tt.RV().set(new RegExp(_fd),"登录名只能包含数字字母!").add("loginname");
			var _v3 = new tt.RV().set(new RegExp(_fd),"密码只能包含数字字母!").add("password");
			var _v4 = new tt.RV().set(new RegExp(_fd),"密码名只能包含数字字母!").add("password_y");
			tt.vf.email.add("qdEmail");
			tt.vf.int.add("qdQq");
			//----
			
			if(!tt.validateForm('registeron')) {
				return false;
			}
			if ($("#password").val() != $("#password_y").val()) {
				alert("两次输入密码不一致，请重新输入!");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>