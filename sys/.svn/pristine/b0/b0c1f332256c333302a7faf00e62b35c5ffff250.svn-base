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
	.login_input{width:150px;height:20px;margin-left:30px;border:1px solid #7F9DB9;vertical-align: middle;}
	.login_code{width:70px;height:20px;margin-left:30px;border:1px solid #7F9DB9;vertical-align: middle;}
	.btn{width:60px;height:25px;border-width:0px;background-image: url(images/btn-bg2.gif);letter-spacing: 3px;margin-right:70px;cursor: pointer;}
	.login_info img{vertical-align: middle;cursor: pointer;}
	
	.errInfo{display:none;color:red;}
	
	.logo{width:100%;height:68px;background: url(images/logo2.png) no-repeat;_background:none;_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/logo2.png';)}
	.left_txt{font-family: Arial, Helvetica, sans-serif;font-size: 12px;line-height: 25px;color: #666666;}
	
	.bottom{width:100%;height:auto;text-align:center;font-family: Arial, Helvetica, sans-serif;font-size: 10px;color: #ABCAD3;text-decoration: none;line-height: 20px;}
</style>
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--在线客服Begin-->
<div id="floatTools" class="rides-cs">
	<div class="floatL">
		<a style="display: block" id="aFloatTools_Show" class="btnOpen" title="查看在线客服" onclick="javascript:$('#divFloatToolsView').animate({width: 'show', opacity: 'show'}, 'normal',function(){ $('#divFloatToolsView').show();kf_setCookie('RightFloatShown', 0, '', '/', 'www.shopnc.net'); });$('#aFloatTools_Show').attr('style','display:none');$('#aFloatTools_Hide').attr('style','display:block');" href="javascript:void(0);">
		展开</a>
		<a style="display: none" id="aFloatTools_Hide" class="btnCtn" title="关闭在线客服" onclick="javascript:$('#divFloatToolsView').animate({width: 'hide', opacity: 'hide'}, 'normal',function(){ $('#divFloatToolsView').hide();kf_setCookie('RightFloatShown', 1, '', '/', 'www.shopnc.net'); });$('#aFloatTools_Show').attr('style','display:block');$('#aFloatTools_Hide').attr('style','display:none');" href="javascript:void(0);">
		收缩</a> </div>
	<div id="divFloatToolsView" class="floatR" style="display: none">
		<div class="cn">
			<h3 class="titZx">产品客服</h3>
			<ul>
				<li><span>小燕</span>
				<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1015929289&site=qq&menu=yes">
				<img border="0" src="http://wpa.qq.com/pa?p=2:1015929289:51" alt="ShopNC客服1" title="ShopNC客服1" /></a>
				</li>
				
				<li><span>燕姐</span>
				<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1605753184&site=qq&menu=yes">
				<img border="0" src="http://wpa.qq.com/pa?p=2:1605753184:51" alt="ShopNC客服2" title="ShopNC客服2" /></a></li>
			</ul>
			<h3>渠道客服</h3>
			<ul>
				<li><span>小妍</span>
				<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=413107691&site=qq&menu=yes">
				<img border="0" src="http://wpa.qq.com/pa?p=2:413107691:51" alt="大宗订制服务" title="大宗订制服务" /></a></li>
			</ul>
			<!-- 
			<h3>售后服务</h3>
			<ul>
				<li><span>售 后</span>
				<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1015929289&site=qq&menu=yes">
				<img border="0" src="http://wpa.qq.com/pa?p=2:1015929289:51" alt="售后服务客服" title="售后服务客服" /></a></li>
			</ul>
			 -->
		</div>
	</div>
</div>
<!--在线客服End-->
<div style="width:100%;height:645px;position: absolute;top:50%;left:50%;margin-top:-320px;margin-left:-50%;">
	<div class="header"></div>
	<div class="center">
		<div class="login_right">
			<div style="width:100%;height:auto;margin-top:150px;">
			<form action="login.html" method="post" name="loginForm" onsubmit="return check();">
				<div class="login_title">
					用户登录
				</div>
				<div class="login_info">
					<label>用户名：</label><input type="text" name="loginname" id="loginname" class="login_input" value="${loginname }"/>
					&nbsp;<span id="nameerr" class="errInfo"></span>
				</div>
				<div class="login_info">
					<label>密　码：</label><input type="password" name="password" id="password" class="login_input" value="${password }"/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
				</div>
				<div class="login_info">
							<input type="checkbox" checked="${checked}" style="vertical-align: middle;" name="remember" value="ture"/>
							<label style="font-size: 13px; font-family: Tahoma; vertical-align: middle; color: #464847;">记住我</label>
							<span
								style="font-size: 13px; font-family: Tahoma; margin-left: 30px; color: #464847;"><a
								href="register.html?key=register" >免费注册</a>
								<!-- 
								|<a
								href="/login.jsp?formType=forget" target="_blank" class="ys">忘记密码</a>
								 -->
							</span>
				</div>
				<!-- 
				<div class="login_info">
					<label>验证码：</label><input type="text" name="code" id="code" value="" class="login_code"/>&nbsp;&nbsp;
					<img id="codeImg" alt="点击更换" title="点击更换" src=""/>
					&nbsp;<span id="codeerr" class="errInfo"></span>
				</div>
				 -->
				<div class="login_info">
					<input type="submit" name="loginBtn" value="登录" class="btn"/>
					<input type="reset" name="cancelBtn" value="取消" class="btn"/>
				</div>
			</form>
			</div>
		</div>
		<div class="login_left">
			<div style="width:100%;height:auto;margin-top:150px;">
				<div class="logo"></div>
				<div class="left_txt">
					<div class="login_title">公告：</div>
					1、3月份所有账单已经结算完毕<br/>
					2、渠道商务必填写好有效的银行账户相关信息<br/>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom">
	Copyright &copy; 2014 微推科技版权所有
	</div>
</div>
	<script type="text/javascript" src="js/kefu.js"></script>
	<script type="text/javascript">
		var errInfo = "${errInfo}";
		var msg = "${msg}";
		$(document).ready(function(){
			changeCode();
			$("#codeImg").bind("click",changeCode);
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
	
		if (msg.length > 2) {
			alert(msg);
		}
		function genTimestamp(){
			var time = new Date();
			return time.getTime();
		}
	
		function changeCode(){
			$("#codeImg").attr("src","code.html?t="+genTimestamp());
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
			if($("#loginname").val()==""){
				$("#nameerr").show();
				$("#nameerr").html("用户名不得为空！");
				$("#loginname").focus();
				return false;
			}
			if($("#password").val()==""){
				$("#pwderr").show();
				$("#pwderr").html("密码不得为空！");
				$("#password").focus();
				return false;
			}
			if($("#code").val()==""){
				$("#codeerr").show();
				$("#codeerr").html("验证码不得为空！");
				$("#code").focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>