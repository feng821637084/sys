<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CP管理</title>
<link type="text/css" rel="stylesheet" href="../css/main.css"/>
<link type="text/css" rel="stylesheet" href="../js/validate/css/validate.css" />
<style type="text/css">
body{width:100%;height:100%;background-color: #FFFFFF;text-align: center;}
.input_txt{width:200px;height:20px;line-height:20px;}
.info{height:40px;line-height:40px;}
.info th{text-align: right;width:85px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>
</head>
<body>
	<form action="save.html" name="cpProdectForm" id="cpProdectForm" target="result" method="post" onsubmit="return checkInfo();">
		<input type="hidden" name="appId" id="appId" value="${cpProdect.appId}"/>
		<input type="hidden" name="pDataName" id="pDataName" value="${cpProdect.pDataName}"/>
		<input type="hidden" name="qdId" id="qdId" value="${cpProdect.qdId}"/>
		<input type="hidden" name="qdIdBak" id="qdIdBak" value="${cpProdect.qdId}"/>
		<input type="hidden" name="appFzrId" id="appFzrId" value="${cpProdect.appFzrId}"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th >产品名称:</th>
			<td><input type="text" name="appName" id="appName" class="input_txt" value="${cpProdect.appName }"/>输入产品名称+渠道号</td>
		</tr>
		<tr class="info">
			<th>所属CP:</th>
			<td>
			    <select name="pDataId" id="pDataId" style="vertical-align: middle;" onchange="setPData(this[selectedIndex].innerHTML);">
					<option value="">请选择</option>
					<c:forEach items="${cpList}" var="cp">
					<option value="${cp.id}" <c:if test="${cp.id==cpProdect.pDataId}">selected</c:if>>${cp.cpCompanyName }@${cp.cpContact }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr class="info">
			<th>指导价格:</th>
			<td><input type="text" name="cpPrice" id="cpPrice" class="input_txt" value="${cpProdect.cpPrice }"/></td>
		</tr>
		<!-- 
		<tr class="info">
			<th>用户名/密码:</th>
			<td><input type="text" name="appHtPwd" id="appHtPwd" class="input_txt" value="${cpProdect.appHtPwd }"/></td>
		</tr>
		 -->
		<tr class="info">
			<th>负责人:</th>
			<td><input type="text" name="appFzr" id="appFzr" class="input_txt" value="${cpProdect.appFzr }"/></td>
		</tr>
		<tr class="info">
			<th>结算周期:</th>
			<td>
				<select name="appJszq" id="appJszq" style="vertical-align: middle;">
					<option value="0" <c:if test="${1==cpProdect.appJszq}">selected</c:if>>双周</option>
					<option value="1" <c:if test="${2==cpProdect.appJszq}">selected</c:if>>单周</option>
					<option value="2" <c:if test="${2==cpProdect.appJszq}">selected</c:if>>月结</option>
				</select>
			</td>
		</tr>
		<tr class="info">
			<th>CPS/CPA:</th>
			<td>
				<select name="cpsCpa" id="cpsCpa" style="vertical-align: middle;">
				<option value="1" <c:if test="${1==cpProdect.cpsCpa}">selected</c:if>>CPA</option>
					<option value="0" <c:if test="${0==cpProdect.cpsCpa}">selected</c:if>>CPS</option>
				</select>
			</td>
		</tr>
		<tr class="info">
			<th>分配渠道:</th>
			<td><input readonly="readonly" type="text" name="qdOperator" id="qdOperator" class="input_txt" value="${cpProdect.qdOperator }" readonly = "readonly" />
				<div>
					<!-- 
					<a href="javascript:addCpProdect();" class="myBtn"><em>选择</em></a>
					 -->
				</div>
			</td>
		</tr>
		<tr class="info">
			<th>所属渠道价格:</th>
			<td><input readonly="readonly" type="text" name="qdPrice" id="qdPrice" class="input_txt" value="${cpProdect.qdPrice }"/></td>
		</tr>
		<tr class="info">
			<th>备注:</th>
			<td><textarea  cols="15" id="appHtUrl" name="appHtUrl" rows="15" style="width: 400px; height: 70px;">${cpProdect.appHtUrl }</textarea></td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
	
	<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="../js/validate/talent-validate-all-init.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		//js 验证绑定,"appHtUrl", "appHtPwd"
		var _v1 = tt.vf.req.add("appName", "pDataId" ,"cpPrice");
		var _fd = "^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$";
		var _v2 = new tt.RV().set(new RegExp(_fd),"只能输入数字!").add("cpPrice");
		var ttReqV = tt.vf.req;
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			dg.addBtn('ok','保存',function(){
				$("#cpProdectForm").submit();
			});
		});
		
		function checkInfo(){
			if(!tt.validateForm('cpProdectForm')) {
				return false;
			}
			if($("#qdOperator").val()!=""){
				var _v4 = tt.vf.req.add("qdPrice");
				var _v3 = new tt.RV().set(new RegExp(_fd),"只能输入数字!").add("qdPrice");
				if(!tt.validateForm('cpProdectForm')) {
					ttReqV.rm(_v3);
					return false;
				}
				ttReqV.rm(_v3);
				return true;
			}else {
			}
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
		
		var _dg1;
		function addCpProdect(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'选择渠道',
				id:'qd_dialog',
				width:550,
				height:380,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'${pageContext.request.contextPath}/qd/qdMainInfoDialog.html'
				});
			_dg1 = dg;
    		dg.ShowDialog();
		}
		function setQd(pUserId , qdName) {
			$("#qdId").attr("value" , pUserId);
			$("#qdOperator").attr("value" , qdName);
			if($("#qdPrice").val() == null || $("#qdPrice").val() == '') {
				$("#qdPrice").attr("value" , $("#cpPrice").val());
			}
			_dg1.cleanDialog();
		}
		function setPData(pDataName) {
			$("#pDataName").attr("value" , pDataName.split('@')[1]);
		}
	</script>
</body>
</html>