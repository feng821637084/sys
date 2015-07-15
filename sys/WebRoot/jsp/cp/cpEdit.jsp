<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品管理</title>
<link type="text/css" rel="stylesheet" href="../css/main.css"/>
<style type="text/css">
body{width:100%;height:100%;background-color: #FFFFFF;text-align: center;}
.input_txt{width:200px;height:20px;line-height:20px;}
.info{height:40px;line-height:40px;}
.info th{text-align: right;width:65px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>
</head>
<body>
	<form action="save.html" name="cpForm" id="cpForm" target="result" method="post" onsubmit="return checkInfo();">
		<input type="hidden" name="id" id="id" value="${cp.id}"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th>产品名称:</th>
			<td><input type="text" name="cpCompanyName" id="cpCompanyName" class="input_txt" value="${cp.cpCompanyName }"/></td>
		</tr>
		<tr class="info">
			<th>负责人:</th>
			<td><input type="text" name="cpContact" id="cpContact" class="input_txt" value="${cp.cpContact }"/></td>
		</tr>
		<!--  
		<tr class="info">
			<th>email:</th>
			<td><input type="text" name="cpEmail" id="cpEmail" class="input_txt" value="${cp.cpEmail }"/></td>
		</tr>
		<tr class="info">
			<th>联系号码:</th>
			<td><input type="text" name="cpPhone" id="cpPhone" class="input_txt" value="${cp.cpPhone }"/></td>
		</tr>
		<tr class="info">
			<th>联系QQ:</th>
			<td><input type="text" name="cpQq" id="cpQq" class="input_txt" value="${cp.cpQq }"/></td>
		</tr>
		<tr class="info">
			<th>公司地址:</th>
			<td><input type="text" name="cpAddress" id="cpAddress" class="input_txt" value="${cp.cpAddress }"/></td>
		</tr>
		<tr class="info">
			<th>后台地址:</th>
			<td><input type="text" name="cpHtUrl" id="cpHtUrl" class="input_txt" value="${cp.cpHtUrl }"/></td>
		</tr>
		<tr class="info">
			<th>用户名/密码:</th>
			<td><input type="text" name="cpHtPwd" id="cpHtPwd" class="input_txt" value="${cp.cpHtPwd }"/></td>
		</tr>
		-->	
		<tr class="info">
			<th>备注:</th>
			<td>
			<textarea  cols="40" id="cpNote" name="cpNote" rows="20" style="width: 400px; height: 200px;">${cp.cpNote }</textarea>
			</td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript">
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			dg.addBtn('ok','保存',function(){
				$("#cpForm").submit();
			});
			if($("#cpId").val()!=""){
			}
		});
		
		function checkInfo(){
			if($("#cpCompanyName").val()==""){
				alert("请输入公司名!");
				$("#cpCompanyName").focus();
				return false;
			}
			//if($("#cpContact").val()==""){
			//	alert("请输入联系人!");
			//	$("#cpContact").focus();
			//	return false;
			//}			
			return true;
		}
		
		function success(){
			if(dg.curWin.document.forms[0]){
				dg.curWin.document.forms[0].action = dg.curWin.location+"";
				dg.curWin.document.forms[0].submit();
			}else{
				dg.curWin.location.reload();
			}
			dg.cancel();
		}
		
		function failed(){
			alert("新增失败，该公司名名已存在！");
			$("#cpCompanyName").select();
			$("#cpCompanyName").focus();
		}
	</script>
</body>
</html>