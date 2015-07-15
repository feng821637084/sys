<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CP列表</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>
	<form action="cpInfo.html" method="post" name="cpForm" id="cpForm">
	<div class="search_div">
	 
		产品名称：<input type="text" name=cpCompanyName value="${cp.cpCompanyName }"/>
		产品负责人：<input type="text" name="cpContact" value="${cp.cpContact }"/>
		<!-- 
		CP_QQ：<input type="text" name="cpQq" value="${cp.cpQq }"/>
		CP手机：<input type="text" name="cpPhone" value="${cp.cpPhone }"/>
		CP负责人:<input type="text" name="cpFzr" value="${cp.cpFzr }"/>
		 -->
		<br />&nbsp;
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<br />&nbsp;
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th>产品名称</th>
			<th>产品负责人</th>
			<th>录入人员</th>
			<!-- 
			<th>email</th>
			<th>手机</th>
			<th >qq</th>
			<th>后台URL</th>
			<th>用户名/密码</th>
			<th>CP负责人</th>
			<th>地址</th>
			 -->
			<th>操作</th>
		</tr>
		<c:choose>
			<c:when test="${not empty cpList}">
				<c:forEach items="${cpList}" var="cp" varStatus="vs">
				<tr class="main_info">
				<td>${vs.index+1}</td>
				<td>${cp.cpCompanyName }</td>
				<td>${cp.cpContact }</td>
				
				<td>${cp.swName }</td>
				<!-- 
				<td>${cp.cpPhone }</td>
				
				<td>${cp.cpQq }</td>
				<td>${cp.cpHtUrl }</td>
				<td>${cp.cpHtPwd }</td>	
				<td>${cp.cpFzr }</td>	
				<td>${cp.cpAddress }</td>	
				 -->		
				<td><a href="javascript:editCp(${cp.id });">修改</a> | <a href="javascript:delCp(${cp.id });">删除</a></td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="7">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="page_and_btn">
		<div>
			<a href="javascript:addCp();" class="myBtn"><em>新增</em></a>
			<a href="javascript:exportUser();" class="myBtn"><em>导出</em></a>
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
		
		function sltAllUser(){
			if($("#sltAll").attr("checked")){
				$("input[name='userIds']").attr("checked",true);
			}else{
				$("input[name='userIds']").attr("checked",false);
			}
		}
		
		function addCp(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'新增产品',
				id:'cp_new',
				width:550,
				height:500,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'edit.html?cpId=-1'
				});
    		dg.ShowDialog();
		}
		
		function editCp(cpId){
			var dg = new $.dialog({
				title:'修改产品信息',
				id:'cp_edit',
				width:550,
				height:500,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				resize:false,
				page:'edit.html?cpId='+cpId
				});
    		dg.ShowDialog();
		}
		
		function delCp(cpId){
			if(confirm("确定要删除该记录？")){
				var url = "delete.html?cpId="+cpId;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}
		}
		
		function search(){
			$("#cpForm").submit();
		}
		
		function exportUser(){
			document.location = "excel.html";
		}
	</script>
</body>
</html>