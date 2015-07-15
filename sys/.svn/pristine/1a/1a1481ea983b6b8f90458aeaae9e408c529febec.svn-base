<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>结款对账</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>
	<form action="info.html" method="post" name="jiesuanForm" id="jiesuanForm">
	<input type="hidden" name="qdId" id="qdId" value="${jiesuan.qdId}"/>
	<div class="search_div">
		结款渠道：<input type="text" name="qdName" id="qdName" class="input_txt" value="${jiesuan.qdName }" />
		<div>
			<a href="javascript:addCpProdect();" class="myBtn"><em>选择</em></a>
		</div>
		
		<br/>
		账单历史(20条)：<select name="id" id="id" style="vertical-align: middle;" onchange="zdDetailSearch(this[selectedIndex].value);">
			<option value="">请选择</option>
			<c:forEach items="${zdList}" var="zd">
			<option value="${zd.id}" <c:if test="${zd.id==jiesuan.id}">selected</c:if>><fmt:formatDate value="${zd.beginTime}" pattern="yyyy-MM-dd"/>~~<fmt:formatDate value="${zd.endTime}" pattern="yyyy-MM-dd"/></option>
			</c:forEach>
			</select>
		<br/>
		对账单生成：<input type="text" name="beginTime" value="<fmt:formatDate value="${jiesuan.beginTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/> -
		<input type="text" name="endTime" value="<fmt:formatDate value="${jiesuan.endTime}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
		<a href="javascript:zdCreate();" class="myBtn"><em>生成账单</em></a>
	</div>
	<br />
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th>产品名称</th>
			<th>CP价格</th>
			<th>渠道价格</th>
			<th >CP推广数</th>
			<th>渠道推广数</th>
			<th>CP总价</th>
			<th>渠道总价</th>
			<th>利润</th>
		</tr>
		<c:choose>
			<c:when test="${not empty jiesuanDetailList}">
				<c:forEach items="${jiesuanDetail}" var="cpProdect" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1}</td>
				<td>${jiesuanDetail.appName }</td>
				<td>${jiesuanDetail.cpPrice }</td>
				<td>${jiesuanDetail.qdPrice }</td>
				<td>${jiesuanDetail.cpCount }</td>
				<td>${jiesuanDetail.qdCount }</td>
				<td>${jiesuanDetail.cpMoney }</td>
				<td>${jiesuanDetail.qdMoney }</td>	
				<td>${jiesuanDetail.lilun }</td>	
				<td><a href="javascript:editCpProdectXXXX(${cpProdect.appId });">??</a></td>
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
		${cp.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		var _dg1;
		//渠道选择框
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
		//选择渠道回调
		function setQd(pUserId , qdName) {
			$("#qdId").attr("value" , pUserId);
			$("#qdName").attr("value" , qdName);
			_dg1.cleanDialog();
			//选择完渠道后
			$("#jiesuanForm").attr("action","moneyApply.html?action=1");
			$("#jiesuanForm").submit();
		}
		function setPData(pDataName) {
			$("#pDataName").attr("value" , pDataName);
		}
		//账单生成
		function zdCreate(){
			$("#jiesuanForm").attr("action","moneyApply.html?action=3");
			$("#jiesuanForm").submit();
		}
		//账单查询
		function zdDetailSearch(zdId) {
			$("#jiesuanForm").attr("action","moneyApply.html?action=2");
			$("#jiesuanForm").submit();
		}
		
		//看看有什么提示
		showLog('${msg}');
		
		function showLog(mag) {
			if(mag != null && mag != '' && mag != 'null') {
				alert(mag);
			}
		}
	</script>
</body>
</html>