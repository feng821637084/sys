<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品多渠道号列表</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>
	<form action="info.html" method="post" name="cpProdectForm" id="cpProdectForm">
	<div class="search_div">
		产品名称：<input type="text" name=appName value="${cpProdect.appName }"/>
		负责人：<input type="text" name="pDataName" value="${cpProdect.pDataName }"/>
		<!-- 
		负责人：<input type="text" name="appFzr" value="${cpProdect.appFzr }"/>
		 -->
		所属渠道：<input type="text" name="qdOperator" value="${cpProdect.qdOperator }"/>
		<br/>
		选择产品：<select name="pDataId" id="pDataId" style="vertical-align: middle;">
			<option value="">请选择</option>
			<c:forEach items="${cpList}" var="cp">
			<option value="${cp.id}" <c:if test="${cp.id==cpProdect.pDataId}">selected</c:if>>${cp.cpCompanyName }@${cp.cpContact }</option>
			</c:forEach>
			</select>
		&nbsp;
		产品状态：<select name="isDel" id="isDel" style="vertical-align: middle;">
			<option value="1" <c:if test="${1==cpProdect.isDel}">selected</c:if>>已上架</option>
			<option value="2" <c:if test="${2==cpProdect.isDel}">selected</c:if>>未上架</option>
			</select>
		&nbsp;
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
		<br/>
	</div>
	<br />		<br/>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th>产品名称</th>
			<th>负责人</th>
			<th>指导价格</th>
			<!-- 
			<th>后台地址</th>
			<th >用户名/密码</th>
			 -->
			 <!-- 
			<th>CP负责人</th>
			 -->
			<th>所属渠道</th>
			<th>所属渠道价格</th>
			<th>结算周期</th>
			<th>结算方式</th>
			<th>更新时间</th>
			<th>操作</th>
		</tr>
		<c:choose>
			<c:when test="${not empty appList}">
				<c:forEach items="${appList}" var="cpProdectItem" varStatus="vs">
					<tr class="main_info">
					<td>${vs.index+1}</td>
					<td>${cpProdectItem.appName }</td>
					<td>${cpProdectItem.pDataName }</td>
					<td>${cpProdectItem.cpPrice }</td>
					<!-- 
					<td>${cpProdectItem.appHtUrl }</td>
					<td>${cpProdectItem.appHtPwd }</td>
					 -->
					 <!-- 
					<td>${cpProdectItem.appFzr }</td>
					 -->
					<td>${cpProdectItem.loginname }<a style="color:#009933;font-weight:bold">@</a>${cpProdectItem.qdOperator }</td>	
					<td>${cpProdectItem.qdPrice }</td>
					<td><c:if test="${0==cpProdectItem.appJszq}">双周</c:if><c:if test="${1==cpProdectItem.appJszq}">单周</c:if><c:if test="${2==cpProdectItem.appJszq}">月结</c:if></td>
					<td><c:if test="${0==cpProdectItem.cpsCpa}">CPS</c:if><c:if test="${1==cpProdectItem.cpsCpa}">CPA</c:if></td>
					<td><fmt:formatDate value="${cpProdectItem.createTime }" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>
						<a href="javascript:editCpProdect(${cpProdectItem.appId });">编辑</a> | 
						<c:if test="${1==cpProdectItem.isDel}"><a href="javascript:delCpProdect('${cpProdectItem.appId}','${cpProdectItem.appName }');">下架</a></c:if>
						<c:if test="${2==cpProdectItem.isDel}"><a href="javascript:toCpProdect('${cpProdectItem.appId}','${cpProdectItem.appName }');">上架</a></c:if>
						|<a href="javascript:delCpProdect3('${cpProdectItem.appId}','${cpProdectItem.appName }');">删除</a>
					</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="10">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="page_and_btn">
		<div>
			<a href="javascript:addCpProdect();" class="myBtn"><em>新增</em></a>
		</div>
		${cpProdect.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function addCpProdect(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增渠道',
				id:'cp_prodect_new',
				width:600,
				height:500,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'edit.html?appId=-1&pDataId='+$("#pDataId").val()
				});
    		dg.ShowDialog();
		}
		
		function editCpProdect(cpProdectId){
			var dg = new $.dialog({
				title:'修改渠道',
				id:'cp_prodect_edit',
				width:600,
				height:500,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				resize:false,
				page:'edit.html?appId='+cpProdectId+'&pDataId='+$("#pDataId").val()
				});
    		dg.ShowDialog();
		}
		
		function delCpProdect(cpProdectId,appName){
			if(confirm("确定要下架:"+appName+"？\r\n下架后数据截止!")){
				var url = "delete.html?appId="+cpProdectId+"&appName="+appName;
				$.get(url,function(data){
					if(data=="success"){
						search();
					}
				});
			}
		}
		function delCpProdect3(cpProdectId,appName){
			if(confirm("确定要删除:"+appName+"？\r\n如果该包还要给被的渠道推广请操作下架!!")){
				var url = "delCpProdect3.html?appId="+cpProdectId+"&appName="+appName;
				$.get(url,function(data){
					if(data=="success"){
						search();
					}
				});
			}
		}
		function toCpProdect(cpProdectId,appName){
			if(1==1) {
				alert("暂不提供直接上架方式，编辑产品重新分配渠道，产品重新上架!");
				return;
			}
			
			
			if(confirm("重新上架该产品？你也可以直接编辑产品重新分配渠道，自动上架!")){
				var url = "noDelete.html?appId="+cpProdectId+"&appName="+appName;
				$.get(url,function(data){
					if(data=="success"){
						alert("上架成功!");
					}
				});
			}
		}
		function search(){
			$("#cpProdectForm").submit();
		}
	</script>
</body>
</html>