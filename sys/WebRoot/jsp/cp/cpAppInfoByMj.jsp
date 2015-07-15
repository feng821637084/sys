<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CP产品列表</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>
	<form action="infoByMj.html" method="post" name="cpProdectForm" id="cpProdectForm">
	<div class="search_div">
		产品名称：<input type="text" name=appName value="${cpProdect.appName }"/>
		<!-- 
		所属CP：<input type="text" name="pDataName" value="${cpProdect.pDataName }"/>
		 -->
		<!-- 
		负责人：<input type="text" name="appFzr" value="${cpProdect.appFzr }"/>
		 -->
		所属渠道：<input type="text" name="qdOperator" value="${cpProdect.qdOperator }"/>
		<br/>
		<!-- pDataId
		选择所属CP：<select name="pDataId" id="pDataId" style="vertical-align: middle;">
			<option value="">请选择</option>
			<c:forEach items="${cpList}" var="cp">
			<option value="${cp.id}" <c:if test="${cp.id==cpProdect.pDataId}">selected</c:if>>${cp.cpCompanyName }</option>
			</c:forEach>
			</select>
		 -->	
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
			<th>所属CP</th>
			<th>CP价格</th>
			<!-- 
			<th>后台地址</th>
			<th >用户名/密码</th>
			 -->
			<th>CP负责人</th>
			<th>所属渠道</th>
			<th>所属渠道价格</th>
			<th>结算周期</th>
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
					<td>${cpProdectItem.appFzr }</td>
					<td>${cpProdectItem.loginname }<a style="color:#009933;font-weight:bold">@</a>${cpProdectItem.qdOperator }</td>	
					<td>${cpProdectItem.qdPrice }</td>
					<td><c:if test="${0==cpProdectItem.appJszq}">双周</c:if><c:if test="${1==cpProdectItem.appJszq}">单周</c:if><c:if test="${2==cpProdectItem.appJszq}">月结</c:if></td>
					<td><fmt:formatDate value="${cpProdectItem.createTime }" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>
						<a href="javascript:editCpProdect(${cpProdectItem.appId },${cpProdectItem.pDataId });">编辑</a> 
						<!-- 
						| 
						<c:if test="${1==cpProdectItem.isDel}"><a href="javascript:delCpProdect('${cpProdectItem.appId}','${cpProdectItem.appName }');">下架</a></c:if>
						<c:if test="${2==cpProdectItem.isDel}"><a href="javascript:toCpProdect('${cpProdectItem.appId}','${cpProdectItem.appName }');">上架</a></c:if>
						 -->
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
			<!-- 
			<a href="javascript:addCpProdect();" class="myBtn"><em>新增</em></a>
			 -->
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
		

		
		function editCpProdect(cpProdectId,pDataId){
			var dg = new $.dialog({
				title:'设置渠道',
				id:'cp_prodect_edit',
				width:600,
				height:500,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				resize:false,
				page:'editByMj.html?appId='+cpProdectId+'&pDataId='+pDataId
				});
    		dg.ShowDialog();
		}
		
		function delCpProdect(cpProdectId,appName){
			if(confirm("确定要下架:"+appName+"？")){
				var url = "deleteByMj.html?appId="+cpProdectId+"&appName="+appName;
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
			
			
			if(confirm("确定上架该产品？你也可以直接编辑产品重新分配渠道，自动上架!")){
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