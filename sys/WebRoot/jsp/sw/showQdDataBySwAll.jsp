<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据统计</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>
    <form action="showQdDataBySwAll.html?action=1" method="post" name="recordsForm" id="recordsForm">
		<div class="search_div">
		        <input type="hidden" name="searchFlag" id="searchFlag" value="1"/>
				选择商务：
				<select name="swId" id="swId" style="vertical-align: middle;" onchange="setSwId();">
					<c:forEach items="${users}" var="u">
					<option value="${u.userId}" <c:if test="${wsQdData.swId==u.userId}">selected</c:if>>${u.loginname }@${u.username}</option>
					</c:forEach>
				</select>

				选择产品：
				<select name="appId" id="appId" onchange="zdDetailSearch();" style="vertical-align: middle;">
				    <option  value="">请选择</option>
				</select>
				
				
				所属日期：
				<input type="text" id ="updateTimeStart" name="updateTimeStart"
					value="<fmt:formatDate value="${wsQdData.updateTimeStart}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker()" readonly="readonly" style="width: 70px;" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-{%d}'})" />
				-
				<input type="text" id ="updateTimeEnd" name="updateTimeEnd"
					value="<fmt:formatDate value="${wsQdData.updateTimeEnd}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker()" readonly="readonly" style="width: 70px;" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-{%d}'})" />
				 <font color="red">*</font>&nbsp;&nbsp;
				<a href="javascript:search();" id="myBtn" class="myBtn"><em>查询</em> </a>
		</div>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
			<tr class="main_head">
				<c:if test="${wsQdData.roleId != 4}">
					<th>序号</th>
					<th>渠道</th>
					<th>CP</th>
					<th>产品</th>
					<th>CP推广量</th>
					<th>渠道推广量</th>
					<th>CP价格</th>
					<th>渠道价格</th>
					<th>cp计算总价</th>
					<th>渠道计算总价</th>
					<th>所属日期</th>
					<th>录入者</th>
				</c:if>
				<c:if test="${wsQdData.roleId == 4}">
					<th>序号</th>
					<th>产品</th>
					<th>推广量</th>
					<th>单价</th>
					<th>总价</th>
					<th>所属日期</th>
				</c:if>
			</tr>
			<c:choose>
				<c:when test="${not empty CPList}">
				   <c:if test = "${wsQdData.roleId != 4}">
						<c:forEach items="${CPList}" var="cpList" varStatus="vs">
						<tr class="main_info">
						<td>${vs.index+1}</td>
						<td>${cpList.qdName }</td>
						<td>${cpList.cpName }</td>
						<td>${cpList.appName }</td>
						<td>${cpList.cpCount }</td>
						<td>${cpList.qdCount }</td>
						<td>${cpList.cpPrice }</td>
						<td>${cpList.qdPrice }</td>
						<td>${cpList.cpMoney }</td>
						<td>${cpList.qdMoney }</td>
						<td><fmt:formatDate value="${cpList.indexTime }" pattern="yyyy-MM-dd"/></td>
						<td>${cpList.bjName }</td>
						</tr>
						</c:forEach>
				    </c:if>	
				   
				   <c:if test = "${wsQdData.roleId == 4}">
						<c:forEach items="${CPList}" var="cpList" varStatus="vs">
						<tr class="main_info">
						<td>${vs.index+1}</td>
						<td>${cpList.appName }</td>
						<td>${cpList.qdCount }</td>
						<td>${cpList.qdPrice }</td>
						<td>${cpList.qdMoney }</td>
						<td><fmt:formatDate value="${cpList.indexTime }" pattern="yyyy-MM-dd"/></td>
						</tr>
						</c:forEach>
				   </c:if>	
				</c:when>
				<c:otherwise>
					<tr class="main_info">
						<td colspan="13">没有相关数据</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<div class="page_and_btn">
			${wsQdData.page.pageStr }
		</div>
		<c:if test = "${wsQdData.roleId != 4}">
			<div style = "float:left;color:#912BD5;font-weight:bold;font-size:14px;">
				CP推广数合计：${sum.cpCountSum}个 &nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div style = "float:left;color:#912BD5;font-weight:bold;font-size:14px;">
				CP总价合计：${sum.cpMoneySum}元 &nbsp;&nbsp; &nbsp;&nbsp;
			</div>
			<div style = "float:left;color:#5599AA;font-weight:bold;font-size:14px;">
				渠道推广数合计：${sum.qdCountSum}个 &nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div style = "float:left;color:#5599AA;font-weight:bold;font-size:14px;">
				渠道总价合计：${sum.qdMoneySum}元 &nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div style = "float:left;color:#5599AA;font-weight:bold;font-size:14px;">
				渠道扣税后合计：<fmt:formatNumber value="${sum.qdMoneySum * 0.945}" pattern="##.##" minFractionDigits="1" ></fmt:formatNumber>元 &nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div style = "float:left;color:#DD2222;font-weight:bold;font-size:14px;">
				盈利：<fmt:formatNumber value="${sum.cpMoneySum - sum.qdMoneySum}" pattern="##.##" minFractionDigits="1" ></fmt:formatNumber>元
			</div>
		</c:if>
		<c:if test="${wsQdData.roleId == 4}">
			<div style = "float:left;color:#912BD5;font-weight:bold;font-size:14px;">
				推广数合计：${sum.qdCountSum}个 &nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div style="float:left;color:#912BD5;font-weight:bold;font-size:14px;">总价合计：${sum.qdMoneySum}元&nbsp;&nbsp;&nbsp;&nbsp;</div>
			<div style = "float:left;color:#5599AA;font-weight:bold;font-size:14px;">
				扣税5.5个点后合计：<fmt:formatNumber value="${sum.qdMoneySum * 0.945}" pattern="##.##" minFractionDigits="1" ></fmt:formatNumber>元 &nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</c:if>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/datePicker/WdatePicker.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
	    });
		
		var __appId = "${wsQdData.appId}";
		var __appFzrId = "${wsQdData.swId}";
		getCpList(__appId,__appFzrId);
		function getCpList(_appId , _appFzrId) {
			//alert(_appId + "__" + _appFzrId);
			if (_appId == "") {
				_appId = "0";
			}
			//设置默认时间 并且提交 查询出最近3天数据
			if (_appFzrId == '') {
				return;
			}
			var url = '${pageContext.request.contextPath}/qd/getCpProductsBySw.html?isDel=3&appFzrId='+ _appFzrId + "&appId=" + _appId;
			$.get(url, function(data) {
				//alert(data);
				if (data != "" && data != "NULL") {
					//更新下拉项目 appId
					$("#appId").empty();
					var strs = data.split(';');
					//<option  value="">请选择</option>
					$("#appId").append("<option selected value='-99'>请选择</option>");
					for ( var i = 0; i < strs.length; i++) {
						if (strs[i].length > 2) {
							var _app = strs[i].split('$');
							if(_appId == _app[0]) {
								$("#appId").append("<option selected value='"+_app[0]+"'>" + _app[1] + "</option>");
							}else{
								$("#appId").append("<option value='"+_app[0]+"'>" + _app[1] + "</option>");								
							}
						}
					}
				}
			});			
		}		
		
		function zdDetailSearch() {
			if($("#appId").val() == "-99") {
				return;
			}
			search();
		}
		
		
		//获取产品列表
		function setSwId() {
			getCpList("0",$("#swId").val());
			//$("#appId").val("");
			//$("#pDataId").val("");
			//search();
		}		

		function search(){
		    //var t = document.getElementById("appId"); 
          //  var appId = $("#appId").val();
		    var updateTimeStart=$("#updateTimeStart").val();
		    var updateTimeEnd=$("#updateTimeEnd").val();
		    if(updateTimeStart=="" || updateTimeEnd==""){
		       alert("请设置日期范围!");
		       return;
		    }
			$("#recordsForm").submit();
		}
		function getNowDate(_dd) {
			var dd = new Date();
			dd.setDate(dd.getDate() - _dd);//获取AddDayCount天后的日期
			var y = dd.getFullYear();
			var m = dd.getMonth() + 1;//获取当前月份的日期
			var d = dd.getDate();
			return y + "-" + m + "-" + d;
		}
	</script>
</body>
</html>