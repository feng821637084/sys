<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>渠道信息列表</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>
	<form action="qdMainInfoDialog.html" method="post" name="userForm" id="userForm">
	<div class="search_div">
		<!-- 
		渠道类型:<select name="roleId" id="roleId" style="vertical-align: middle;">
			<option value="1">公司</option>
			<option value="2">个人</option>
		</select>
		&nbsp;&nbsp;
		 -->
		 用&nbsp;户&nbsp;名：<input type="text" name="loginName" value="${wsQdUserDetail.loginName}"/>&nbsp;&nbsp;
		渠道名称：<input type="text" name="qdName" value="${wsQdUserDetail.qdName}"/>&nbsp;&nbsp;
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<div class="search_div">
	          联&nbsp;系&nbsp;人：<input type="text" name="qdContact" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;
	          创建日期：<input type="text" name="creatTimeStart" value="<fmt:formatDate value="${wsQdUserDetail.creatTimeStart}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/> -
		<input type="text" name="creatTimeEnd" value="<fmt:formatDate value="${wsQdUserDetail.creatTimeEnd}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllUser()"/></th>
			<th>序号</th>
			<!-- 
			<th>渠道类型</th>
			 -->
			<th>用户名</th>
			<th>渠道名称</th>
			<th>联系人</th>
			<!-- 
			<th>联系号码</th>
			 -->
			<th>关联媒介</th>
			<th>操作</th>
		</tr>
		<c:choose>
			<c:when test="${not empty QDList}">
				<c:forEach items="${QDList}" var="qdList" varStatus="vs">
				<tr class="main_info">
				<td><input type="checkbox" name="pUserId" id="userIds${qdList.pUserId }" value="${qdList.pUserId }"/></td>
				<td>${vs.index+1}</td>
				<!-- 
				<td>${qdList.qdType }</td>
				 -->
				<td>${qdList.loginName }</td>
				<td>${qdList.qdName }</td>
				<td>${qdList.qdContact }</td>
				<td>${qdList.mjName }</td>
				<!-- 
				<td>${qdList.qdPhone }</td>
				 -->
				<td><a href="javascript:setQd('${qdList.pUserId}','${qdList.qdName}');">选择该渠道</a>
				</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="9">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="page_and_btn">
		${wsQdUserDetail.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/datePicker/WdatePicker.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			dg.addBtn('ok','保存',function(){
				$("#userForm").submit();
			});
		});
		
		function sltAllUser(){
			if($("#sltAll").attr("checked")){
				$("input[name='userIds']").attr("checked",true);
			}else{
				$("input[name='userIds']").attr("checked",false);
			}
		}
		
		function setQd(pUserId , qdName){
		     //回调
			 window.parent.setQd(pUserId , qdName);
		}
		
		function exportUser(){
			document.location = "user/excel.html";
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
		
		function search(){
			$("#userForm").submit();
		}
		
	</script>
</body>
</html>