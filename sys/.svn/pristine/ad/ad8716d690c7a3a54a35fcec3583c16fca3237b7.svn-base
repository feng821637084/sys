<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据查询</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>
    <form action="showQdData.html?action=1" method="post" name="recordsForm" id="recordsForm">
		<div class="search_div">
		        <input type="hidden" name="searchFlag" id="searchFlag" value="1"/>
		        <c:if test = "${wsQdData.roleId != 4}">
				<a href="javascript:selectQd();" id="xzQD" class="myBtn"><em>选择渠道</em></a>
				<input type="text" name="qdId" id="qdId" value="${wsQdData.qdId}" style = "display:none"/>
				<input type="text" name="qdOperator" id="qdOperator" value="${wsQdData.qdOperator}" readonly = "readonly" /> <font color="red">*</font>
				&nbsp;&nbsp; 
				</c:if>
				
				上架产品：
				<select name="appId" id="appId" onchange="zdDetailSearch();" style="vertical-align: middle;">
				    <c:if test= "${not empty CPAppList}">
				        <c:forEach items = "${CPAppList}" var = "list">
				          <option <c:if test="${wsQdData.appId==list.APP_ID}">selected="true"</c:if> value = "${list.APP_ID}">${list.APP_NAME}</option>
				        </c:forEach>
				    </c:if>
				</select>&nbsp;&nbsp; 
				已下架产品:
				<select name="oldAppId" id="oldAppId" onchange="zdOldDetailSearch();" style="vertical-align: middle;">
				    <option  value="">所有</option>
				    <c:if test= "${not empty CPOldAppList}">
				        <c:forEach items = "${CPOldAppList}" var = "list">
				          <option <c:if test="${extData.oldAppId==list.oldAppId}">selected="true"</c:if> value = "${list.oldAppId}">${list.oldAppName}</option>
				        </c:forEach>
				    </c:if>
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
				扣税后合计：<fmt:formatNumber value="${sum.qdMoneySum * 0.945}" pattern="##.##" minFractionDigits="1" ></fmt:formatNumber>元 &nbsp;&nbsp;&nbsp;&nbsp;
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
		setTime();
		function setTime() {
			var action = '${extData.action}';
			if(action == '') {
				//设置默认时间 并且提交 查询出最近3天数据
				$("#updateTimeStart").attr("value" , getNowDate(7));
				$("#updateTimeEnd").attr("value" , getNowDate(1));
			}
		}
		function sltAllUser(){
			if($("#sltAll").attr("checked")){
				$("input[name='userIds']").attr("checked",true);
			}else{
				$("input[name='userIds']").attr("checked",false);
			}
		}
		
		var _dg1;
		function selectQd(){
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
		
		
		var _dg1;
		function setQd(pUserId , qdName) {
			$("#qdId").attr("value" , pUserId);
			$("#qdOperator").attr("value" , qdName);
			_dg1.cleanDialog();
			search();
			//
//			if(1 == 2) {
//				$.ajax({type:"post",url:"getCpListByQd.html",dataType:"json",
//		            data:{"qdId" : $("#qdId").val()},
//		            success:function(data){
//		            $("#appId").html("");
//		            if(data == null || data =="" ){
//		               alert("此渠道无产品信息,请重新选择");
//		               //$(".myBtn").Enabled= false; TBD
//		               return;
//		            }
//		            $.each(data,function(i,item){
//		              $("#appId").append("<option value="+item.APP_ID+">"+item.APP_NAME+"</option>");
//		            });
//		            }
//		          });
//			}

		}
		
		function change(){
		    if('${wsQdData.roleId}' == 1){
			    if($("#qdId").val()== "" ){
			       alert("请选择渠道!"); 
			       return;
			    }
			 }   
			 var qdId = $("#qdId").val();
			 var updateTimeStart=$("#updateTimeStart").val();
		     var updateTimeEnd=$("#updateTimeEnd").val();
			 var url = "getCpListByQd.html?qdId="+qdId+"&updateTimeStart="+updateTimeStart+"&updateTimeEnd="+updateTimeEnd;
			 $.get(url,function(data){
				if(data=="success"){
					}
				});
		}
		
		
		function zdDetailSearch() {
			if('${wsQdData.roleId}' == 1){
			    if($("#qdId").val()== "" ){
			       alert("请首先选择渠道，再选择产品!"); 
			       return;
			    }
		    }
			$("#recordsForm").attr("action","showQdData.html?action=1");
			search();
		}
		
		function zdOldDetailSearch() {
			if('${wsQdData.roleId}' != 4){
			    if($("#qdId").val()== "" ){
			       alert("请首先选择渠道，再选择产品!"); 
			       return;
			    }
		    }
			$("#recordsForm").attr("action","showQdData.html?action=2");
			search();
		}
		
		function search(){
			if('${wsQdData.roleId}' != 4){
			    if($("#qdId").val()== "" ){
			       alert("请选择渠道!"); 
			       return;
			    }
		    }
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