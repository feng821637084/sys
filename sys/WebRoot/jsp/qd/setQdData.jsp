<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据录入</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>
    <form action="setQdData.html?action=1" method="post" name="recordsForm" id="recordsForm">
		<div class="search_div">
				<a href="javascript:selectQd();" class="myBtn"><em>选择渠道</em>
				</a>
				<input type="text" name="qdId" id="qdId" value="${wsQdData.qdId}" style = "display:none"/>
				
				<input type="text" name="qdOperator" id="qdOperator" value="${wsQdData.qdOperator}" readonly = "readonly" /> <font color="red">*</font>
				选择产品：
				<select name="appId" id="appId" onchange="zdDetailSearch();" style="vertical-align: middle;">
				    <option  value="">所有</option>
				    <c:if test= "${not empty CPAppList}">
				        <c:forEach items = "${CPAppList}" var = "list">
				          <option <c:if test="${wsQdData.appId==list.APP_ID}">selected="true"</c:if> value = "${list.app_id}">${list.APP_NAME}</option>
				        </c:forEach>
				    </c:if>
				</select>
				历史产品:
				<select name="oldAppId" id="oldAppId" onchange="zdOldDetailSearch();" style="vertical-align: middle;">
				    <option  value="">所有</option>
				    <c:if test= "${not empty CPOldAppList}">
				        <c:forEach items = "${CPOldAppList}" var = "list">
				          <option <c:if test="${extData.oldAppId==list.oldAppId}">selected="true"</c:if> value = "${list.oldAppId}">${list.oldAppName}</option>
				        </c:forEach>
				    </c:if>
				</select>
				&nbsp;&nbsp; 所属日期：
				<input type="text" id ="updateTimeStart" name="updateTimeStart"
					value="<fmt:formatDate value="${wsQdData.updateTimeStart}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker()" readonly="readonly" style="width: 70px;" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-{%d}'})" />
				-
				<input type="text" id ="updateTimeEnd" name="updateTimeEnd"
					value="<fmt:formatDate value="${wsQdData.updateTimeEnd}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker()" readonly="readonly" style="width: 70px;" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-{%d}'})" />
				 <font color="red">*</font>&nbsp;&nbsp;
				<a href="javascript:search();" class="myBtn"><em>按渠道录入</em> </a>
				<br/>
				数据补录(选择时间段补录): 
				<input type="text" id ="timeOne" name="timeOne"
					value="<fmt:formatDate value="${extData.timeOne}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker()" readonly="readonly" style="width: 70px;" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-{%d}'})" />
				&nbsp;-&nbsp;
				<input type="text" id ="timeTwo" name="timeTwo"
					value="<fmt:formatDate value="${extData.timeTwo}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker()" readonly="readonly" style="width: 70px;" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-{%d}'})" />
			   &nbsp;<a href="javascript:bulu();" class="myBtn"><em>确认补录</em> </a>（想补录那个产品就在产品/历史产品选择框中选择产品先）
		</div>
		<br/>
	<div class="page_and_btn">
		${wsQdData.page.pageStr }
	</div>
	<br/>
	</form>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<!-- 
			<th><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllUser()"/></th>
			 -->
			<th>序号</th>
			<th>渠道</th>
			<th>CP</th>
			<th>产品</th>
			<th>所属日期</th>
			<th>CP推广量</th>
			<th>渠道推广量</th>
			<th>操作</th>
			<th>录入状态</th>
			<th>CP价格</th>
			<th>渠道价格</th>
			<th>cp计算总价</th>
			<th>渠道计算总价</th>
			<th>录入者</th>
			<!-- 
			<th>录入时间</th>
			 -->
		</tr>
		<c:choose>
			<c:when test="${not empty CPList}">
				<c:forEach items="${CPList}" var="cpList" varStatus="vs">
					<tr class="main_info">
					<!-- 
					<td><input type="checkbox" name="appId${cpList.id }" id="userIds${cpList.id }" value="${cpList.id }"/></td>
					 -->
					<td>${vs.index+1}</td>
					<td>${cpList.loginName }<a style="color:#009933;font-weight:bold">@</a>${cpList.qdName }</td>
					<td>${cpList.cpName }</td>
					<td>${cpList.appName }</td>
					<td style="font-size:12px;color:red"><fmt:formatDate value="${cpList.indexTime }" pattern="yyyy-MM-dd"/></td>
					<td><input style="width:60px" type="text" id="cpCount${cpList.id }" name="cpCount" value="${cpList.cpCount }" /></td>
					<td><input style="width:60px" type="text" id="qdCount${cpList.id }" name="qdCount" value="${cpList.qdCount }" /></td>
					<td><a href="javascript:saveAppData(${cpList.id });">保存</a>
					<td id="status${cpList.id }"><c:if test="${cpList.cpStatusDisplay != '已录入'}"><a>未录入</a></c:if><c:if test="${cpList.cpStatusDisplay == '已录入'}"><a style="font-size:12px;color:red">已录入</a></c:if></td>
					<td id="cpPrice${cpList.id }">${cpList.cpPrice }</td>
					<td id="qdPrice${cpList.id }">${cpList.qdPrice }</td>
					<td id="cpMoney${cpList.id }">${cpList.cpMoney }</td>
					<td id="qdMoney${cpList.id }">${cpList.qdMoney }</td>
					<td>${cpList.bjName }</td>
					<!-- 
					<td><fmt:formatDate value="${cpList.updateTime }" pattern="yyyy-MM-dd"/></td>
					 -->
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="15">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
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
		
		
		var _dg1;
		function selectQd(){
			//$(".shadow").show();
			var dg = new $.dialog({
				title:'选择渠道',
				id:'qd_dialog',
				width:600,
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
		
		function saveAppData(id){
		    var n1 =  $("#cpCount"+id).val();
		    var n2 =  $("#qdCount"+id).val();
		    var p1 =  $("#cpPrice"+id).text();
		    var p2 =  $("#qdPrice"+id).text();
		    if(!forcheck(n1)){
		        return;
		    }
		    if(!forcheck(n2)){
		        return;
		    }
		    var cpCount = Number(n1);
		    var qdCount = Number(n2);
		    if(cpCount < qdCount){
		       alert("渠道推广量 应小于 CP推广量");
		       return;
		    }
		    var qdId = $("#qdId").val();
		    var updateTimeStart=$("#updateTimeStart").val();
		    var updateTimeEnd=$("#updateTimeEnd").val();
			var url = "saveAppData.html?id="+id+"&cpPrice="+p1+"&qdPrice="+p2+"&cpCount="+cpCount+"&qdCount="+qdCount+"&qdId="+qdId+"&updateTimeStart="+updateTimeStart+"&updateTimeEnd="+updateTimeEnd;
				
			$.get(url,function(data){
				if(data=="success"){
					 //alert("保存成功!");
					 var cpMoney = accMul(cpCount,Number(p1));
					 var qdMoney = accMul(qdCount,Number(p2));
					 $("#cpMoney"+id).text(cpMoney);
					 $("#qdMoney"+id).text(qdMoney);
					 $("#status"+id).html("<a style='font-size:12px;color:red'>已录入</a>");
					}
				});
		}
		
		var _dg1;
		function setQd(pUserId , qdName) {
			$("#qdId").attr("value" , pUserId);
			$("#qdOperator").attr("value" , qdName);
			_dg1.cleanDialog();
			//设置默认时间 并且提交 查询出最近3天数据
			$("#updateTimeStart").attr("value" , getNowDate(3));
			$("#updateTimeEnd").attr("value" , getNowDate(1));
			search();
		}
		
		function search(){
		    if($("#qdId").val()== "" ){
		       alert("请选择渠道!"); 
		       return;
		    }
		    var updateTimeStart=$("#updateTimeStart").val();
		    var updateTimeEnd=$("#updateTimeEnd").val();
		    if(updateTimeStart=="" || updateTimeEnd==""){
		       alert("请设置有效日期!");
		       return;
		    }
		    
		    var   beginTime   =   new   Date(Date.parse($("#updateTimeStart").val().replace(/-/g,   "/"))); 
		    var   endTime     =   new   Date(Date.parse($("#updateTimeEnd").val().replace(/-/g,   "/")));
		    var   _dd = (endTime - beginTime)/1000/60/60/24;
		    if(_dd > 0 && _dd < 32) {

		    }else {
		    	alert("请设置合适时间范围，只能设置间隔32天最大时间!");
		    	return;
		    }
			$("#recordsForm").submit();
		}
		
		function forstrtrim(d) {
			if (d.length < 2) {
				return "0" + d;
			}else {
				return d;
			}
		}
		    //判断正整数  
         function forcheck(ss){
         if(ss == 0){
           return true;
         }
         var  type="^[0-9]*[1-9][0-9]*$";
         var  re   =   new   RegExp(type);
         if(ss.match(re)==null){
          alert( "请输入大于零的整数!");
         return false;
         }
         return true;
      } 

 		function getNowDate(_dd) {
			var dd = new Date();
			dd.setDate(dd.getDate() - _dd);//获取AddDayCount天后的日期
			var y = dd.getFullYear();
			var m = dd.getMonth() + 1;//获取当前月份的日期
			var d = dd.getDate();
			return y + "-" + m + "-" + d;
		}

		//js 乘法函数  
		//调用：accMul(arg1,arg2)   
		//返回值：arg1乘以arg2的精确结果   
		function accMul(arg1, arg2) {
			var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
			try {
				m += s1.split(".")[1].length;
			} catch (e) {
			}
			try {
				m += s2.split(".")[1].length;
			} catch (e) {
			}
			return Number(s1.replace(".", "")) * Number(s2.replace(".", ""))
					/ Math.pow(10, m);
		}
		
		function zdDetailSearch() {
			    if($("#qdId").val()== ""){
			    	alert("请选择渠道!");
			       return;
			    }else {
			    	$("#recordsForm").attr("action","setQdData.html?action=1");
			    	//直接去查询
			    	search();
			    }
		}
		
		function zdOldDetailSearch() {
		    if($("#qdId").val()== ""){
		    	alert("请选择渠道!");
		       return;
		    }else {
		    	if($("#oldAppId").val()== "") {
		    		return;
		    	}
		    	$("#recordsForm").attr("action","setQdData.html?action=2");
		    	//直接去查询
		    	search();
		    }
		}
		var action = '${extData.action}';
		function bulu() {
			var appId ='';
			var _str = '';
			if(action == '1') {
				if ($("#appId").val() == null || $("#appId").val() == '' || $("#appId").val() == "-99") {
					alert("请选择CP，并选择CP下面的产品!");
					return;
				}
				appId = $("#appId").val();
				_str = "#appId";
			}else {
				if ($("#oldAppId").val() == null || $("#oldAppId").val() == '' || $("#oldAppId").val() == "-99") {
					alert("请选择CP，并选择CP下面的产品!");
					return;
				}
				appId = $("#oldAppId").val();
				_str = "#oldAppId";
			}

		    var   beginTime   =   new   Date(Date.parse($("#timeOne").val().replace(/-/g,   "/"))); 
		    var   endTime     =   new   Date(Date.parse($("#timeTwo").val().replace(/-/g,   "/")));
		    var   _dd = (endTime - beginTime)/1000/60/60/24;
		    var nowDate = new Date();
		    var   _dd2 = (nowDate - beginTime)/1000/60/60/24;
		    if (_dd2 > 30) {
		    	alert("请不要补录过期30天以上的数据!");
		    	return;
		    }
		    if(_dd < 0) {
		    	alert("请选择有效日期!");
		    	return;
		    }
		    if (_dd > 7) {
		    	alert("时间间隔不要超过7天!");
		    	return;
		    }
			
			if(window.confirm("确认需要补录，补录出错，由补录人负责!\r\n 确认补录产品:" + $(_str+"  option:selected").text() + "数据，时间是：" + $("#timeOne").val() + "到" + $("#timeTwo").val())) {
				//直接ajax解决 由商务补录
				var url = '${pageContext.request.contextPath}/qd/buluByMj.html?action='+action+'&appId='+ appId + "&timeOne="+$("#timeOne").val()+"&timeTwo="+$("#timeTwo").val()+"&qdId="+$("#qdId").val();
				$.get(url, function(data) {
					if (data != "" && data != "NULL") {
						alert("完成录入!");
						$("#updateTimeStart").attr("value", $("#timeOne").val());
						$("#updateTimeEnd").attr("value", $("#timeTwo").val());
						if (action == '1') {
							zdDetailSearch();
						}else {
							zdOldDetailSearch();
						}
						search();
					}else {
						alert("数据已存在!");
						return;
					}
				});
			}
		}
	</script>
</body>
</html>