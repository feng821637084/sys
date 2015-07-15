<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>渠道信息管理</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>
	<form action="qdMainInfo.html" method="post" name="userForm" id="userForm">
	<div class="search_div">
		  <!-- 
	            渠道类型:&nbsp;&nbsp;&nbsp;<select name="qdType" id="qdType" style="vertical-align: middle;">
			<option <c:if test="${1==wsQdUserDetail.qdType}">selected</c:if> value="1">公司</option>
			<option <c:if test="${2==wsQdUserDetail.qdType}">selected</c:if> value="2">个人</option>
		 </select>&nbsp;&nbsp;
		  -->
		 用&nbsp;户&nbsp;名：<input type="text" name="loginName" value="${wsQdUserDetail.loginName}"/>&nbsp;&nbsp;
		 渠道名称：<input type="text" name="qdName" value="${wsQdUserDetail.qdName}"/>&nbsp;&nbsp;
		 创建日期：<input type="text" name="creatTimeStart" value="<fmt:formatDate value="${wsQdUserDetail.creatTimeStart}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/> -
		<input type="text" name="creatTimeEnd" value="<fmt:formatDate value="${wsQdUserDetail.creatTimeEnd}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker()" readonly="readonly" style="width:70px;"/>
		&nbsp;&nbsp;
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div>
	<div class="search_div">
		联系人：<input type="text" name="qdContact" value="${wsQdUserDetail.qdContact}"/>&nbsp;&nbsp;
		联系号码：<input type="text" name="qdPhone" value="${wsQdUserDetail.qdPhone}"/>&nbsp;&nbsp;
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllUser()"/></th>
			<th>序号</th>
			<!-- 
			<th>渠道类型</th>
			 -->
			<th>用户名</th>
			<th>密码</th>
			<th>关联商务</th>
			<th>渠道名称</th>
			<th>联系人</th>
			<th>邮箱</th>
			<th>联系号码</th>
			<!-- 
			<th>状态</th>
			 -->
			<th>修改时间</th>
			<th>操作</th>
		</tr>
		<c:choose>
			<c:when test="${not empty QDList}">
				<c:forEach items="${QDList}" var="qdList" varStatus="vs">
				<tr class="main_info">
				<td><input type="checkbox" name="pUserId" id="userIds${qdList.pUserId }" value="${qdList.pUserId }"/></td>
				<td>${vs.index+1}</td>
				<td>${qdList.loginName }</td>
				<td>${qdList.passWord }</td>
				<td>${qdList.mjName }</td>
				<!-- 
				<td>${qdList.qdTypeDisplay }</td>
				 -->
				<td>${qdList.qdName }</td>
				<td>${qdList.qdContact }</td>
				<td>${qdList.qdEmail }</td>
				<td>${qdList.qdPhone }</td>
				<!-- 
				<td>${qdList.status }</td>
				 -->
				<td><fmt:formatDate value="${qdList.createTime }" pattern="yyyy-MM-dd"/></td>
				<td><a href="javascript:editQdDetail(${qdList.pUserId });">详细</a> | <a href="javascript:stopDetail(${qdList.pUserId });">禁用 </a>
					 | <c:if test="${qdList.mjId < 1 }"><a href="javascript:glUser(${qdList.pUserId },'${qdList.loginName }','${qdList.qdName }');">关联到我</a></c:if>
					   <c:if test="${qdList.mjId > 0 }"><a style="color: #993300;">${qdList.mjName }</a></c:if>
				    <!-- 
				     | <a href="javascript:relativedUser(${qdList.pUserId });">关联用户</a>
				      -->
				</td>
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
			<!-- 
			<a href="javascript:addQD();" class="myBtn"><em>新增</em></a>
			 -->
			<%--<a href="javascript:exportQDList();" class="myBtn"><em>导出</em></a>--%>
			</div>
		${wsQdUserDetail.page.pageStr }
	</div>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/datePicker/WdatePicker.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		var _dg;
		function sltAllUser(){
			if($("#sltAll").attr("checked")){
				$("input[name='userIds']").attr("checked",true);
			}else{
				$("input[name='userIds']").attr("checked",false);
			}
		}
		
		function addQD(){
			var dg = new $.dialog({
				title:'新增渠道信息',
				id:'user_new',
				width:450,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'addQD.html'
				});
    		dg.ShowDialog();
    		_dg = dg;
		}
		
		function editQdDetail(pUserId){
			var dg = new $.dialog({
				title:'修改渠道详细信息',
				id:'QdDetail_edit',
				width:450,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				resize:false,
				page:'qdEditDetail.html?pUserId='+pUserId
				});
    		dg.ShowDialog();
    		_dg = dg;
		}
		
		function stopDetail(pUserId){
			if(confirm("确定要禁用该渠道吗？")){
				var url = "stopDetail.html?pUserId="+pUserId;
				$.get(url,function(data){
					if(data=="success"){
						document.location.reload();
					}
				});
			}
		}
		
		//关联到媒介身上
		function glUser(pUserId,loginName,qdName) {
			if(confirm("确认渠道：" + loginName+"@" + qdName + "关联到你账户下面去 \r\n 注意：一旦关联后将来不能改变，请确认无误!")){
				var url = '${pageContext.request.contextPath}/qd/glUser.html?pUserId=' + pUserId;
				$.get(url, function(data) {
					if (data != "" && data != "NULL") {
						alert("关联完成!");
						search();
					}else {
						alert("关联失败!");
						search();
					}
				});
			}

		}
		
		function relativedUser(pUserId){
		     var path = '${pageContext.request.contextPath}' ;
		     var dg = new $.dialog({
				title:'关联用户',
				id:'QdDetail_edit',
				width:1000,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				resize:false,
				page: path+'/userDialog.html?pUserId='+pUserId
				});
    		  dg.ShowDialog();
    		  _dg = dg;
		}
		
		function search(){
			$("#userForm").submit();
		}
		
		function exportQDList(){
			document.location = "excelQDList.html";
		}
		function success(){
			_dg.cancel();
			document.location.reload();
		}		
	</script>
</body>
</html>