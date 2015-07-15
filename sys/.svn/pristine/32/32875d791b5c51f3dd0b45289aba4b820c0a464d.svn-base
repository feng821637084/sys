<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>渠道商信息</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>                
		<form action="qdDetailEdit.html" method="post" name="qdUserDetailForm"
			id="qdUserDetailForm">
			<div class="search_div">
			    <input type="hidden" name="pUserId" value= "${QdDetail.pUserId}" />
			    <!-- 
				渠道类型:&nbsp;
				<select name="qdType" id="qdType" disabled="disabled" style="vertical-align: middle;width:16%">
					<option value="1">公司</option>
					<option value="2">个人</option>
				</select>
				 -->
				渠道名称 :&nbsp;
				<input type="text" name="qdName" style="width:15%" disabled="disabled" value="${QdDetail.qdName}"/>
				联系人:&nbsp;&nbsp; &nbsp; &nbsp;
				<input type="text" name="qdContact" style="width:15%"   value="${QdDetail.qdContact}">
				邮箱：&nbsp;&nbsp;&nbsp; &nbsp;  &nbsp; 
				<input type="text" name="qdEmail" style="width:15%"   value="${QdDetail.qdEmail}" />
			</div>
			<div class="search_div">
				银行:&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="qdYh" <c:if test="${!empty QdDetail.qdYh}">disabled="disabled"</c:if> style="width:15.3%"  value="${QdDetail.qdYh}"  />
				支行信息:&nbsp;&nbsp;
				<input type="text" name="qdKhk" <c:if test="${!empty QdDetail.qdKhk}">disabled="disabled"</c:if> style="width:15%" value="${QdDetail.qdKhk}" />
				开户登记名:
				<input type="text" name="qdKhr" <c:if test="${!empty QdDetail.qdKhr}">disabled="disabled"</c:if> style="width:15%" value="${QdDetail.qdKhr}" />
				开户帐号:&nbsp;&nbsp; 
				<input type="text" name="qdZh" <c:if test="${!empty QdDetail.qdZh}">disabled="disabled"</c:if> style="width:15%" value="${QdDetail.qdZh}" />
			</div>
			<div class="search_div">
			           联系号码 :&nbsp;
				<input type="text" name="qdPhone" style="width:15%"  value="${QdDetail.qdPhone}"/>
			           联系QQ：&nbsp;
				<input type="text" name="qdQq" style="width:15%"   value="${QdDetail.qdQq}" />
				地址:&nbsp;&nbsp;&nbsp; &nbsp;  &nbsp; &nbsp;&nbsp;
				<input type="text" name="qdAddress" style="width:15%"  value="${QdDetail.qdAddress}" />
				<!-- 
				备注:&nbsp;&nbsp;&nbsp; &nbsp;  &nbsp;  &nbsp;  
				<input type="text" name="qdNote" style="width:15%"  value="${QdDetail.qdNote}" />
				 -->
<!--				创建时间:-->
<!--				<input type="text" name="createTime" style="width:15%" value="${QdDetail.createTime}" />-->
			</div>
			<br/>
			<div class="page_and_btn">
				<div>
					<a href="javascript:saveQdUserDetail();" class="myBtn"><em>保存</em>
					</a>
				</div>
			</div>
		</form>
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.5.1.min.js"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/datePicker/WdatePicker.js"></script> 
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
		<script type="text/javascript">
		$(document).ready(function(){
		});
		
		function saveQdUserDetail(){
		    $("#qdUserDetailForm").submit();
		}
		
	</script>
</body>
</html>