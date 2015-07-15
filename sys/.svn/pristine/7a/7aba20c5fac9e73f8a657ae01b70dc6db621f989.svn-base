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
    <form action="setQdDataByCp.html?action=1" method="post" name="recordsForm" id="recordsForm">
		<div class="search_div">
				选择产品：
				<select name="pDataId" id="pDataId" style="vertical-align: middle;" onchange="setPData(this[selectedIndex].innerHTML,this[selectedIndex].value);">
					<option value="">请选择</option>
					<c:forEach items="${cpList}" var="cp">
					<option value="${cp.id}" <c:if test="${cp.id==wsQdData.pDataId}">selected</c:if>>${cp.cpContact }@${cp.cpCompanyName }</option>
					</c:forEach>
				</select>
				
				选择渠道：
				<select name="appId" id="appId" onchange="zdDetailSearch();" style="vertical-align: middle;">
				    <option  value="">请选择</option>
				</select>
				&nbsp;&nbsp; 所属日期：
				<input type="text" id ="updateTimeStart" name="updateTimeStart"
					value="<fmt:formatDate value="${wsQdData.updateTimeStart}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker()" readonly="readonly" style="width: 70px;" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-{%d}'})" />
				&nbsp;-&nbsp;
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
			   &nbsp;<a href="javascript:bulu();" class="myBtn"><em>确认补录</em> </a>
			   <br/>
			   
		</div>
		<br/><br/>
	<div class="page_and_btn">
		${wsQdData.page.pageStr }
	</div>
	</form>
	<!-- input 框太多了提高效率放出来 -->
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
			<th>实际推广量</th>
			<th>渠道计算推广量</th>
			<th>操作</th>
			<th>录入状态</th>
			<th>CP价格</th>
			<th>渠道价格</th>
			<th>实际总价</th>
			<th>渠道计算总价</th>
			<th>录入者</th>
			<!-- 
			<th>录入时间</th>
			 -->
			
			
		</tr>
		<c:choose>
			<c:when test="${not empty appDataList}">
				<c:forEach items="${appDataList}" var="appData" varStatus="vs">
					<tr class="main_info">
					<!-- 
					<td><input type="checkbox" name="appId${appData.id }" id="userIds${appData.id }" value="${appData.id }"/></td>
					 -->
					<td>${vs.index+1}<input  type="hidden" id="qdId${appData.id}" name="qdId" value="${appData.qdId }" /></td>
					<td>${appData.loginName }<a style="color:#009933;font-weight:bold">@</a>${appData.qdName }</td>
					<td>${appData.cpName }</td>
					<td>${appData.appName }</td>
					<td style="font-size:12px;color:red"><fmt:formatDate value="${appData.indexTime }" pattern="yyyy-MM-dd"/></td>
					<td><input style="width:60px" type="text" id="cpCount${appData.id }" name="cpCount" value="${appData.cpCount }" /></td>
					<td><input style="width:60px" type="text" id="qdCount${appData.id }" name="qdCount" value="${appData.qdCount }" /></td>
					<td><a href="javascript:saveAppData(${appData.id });">保存</a>
					<td id="status${appData.id }"><c:if test="${appData.cpStatusDisplay != '已录入'}"><a>未录入</a></c:if><c:if test="${appData.cpStatusDisplay == '已录入'}"><a style="font-size:12px;color:red">已录入</a></c:if></td>
					<td id="cpPrice${appData.id }">${appData.cpPrice }</td>
					<td id="qdPrice${appData.id }">${appData.qdPrice }</td>
					<c:if test="${cpsCpa == 1}">
						<td id="cpMoney${appData.id }">${appData.cpMoney }</td>
						<td id="qdMoney${appData.id }">${appData.qdMoney }</td> 
					</c:if>
					<c:if test="${cpsCpa == 2}">
						<td><input style="width:60px" type="text" id="cpMoney${appData.id }" name="cpMoney" value="${appData.cpMoney }" /></td>
						<td><input style="width:60px" type="text" id="qdMoney${appData.id }" name="qdMoney" value="${appData.qdMoney }" /></td>
					</c:if>

					<td>${appData.bjName }</td>
					<!-- 
					<td><fmt:formatDate value="${appData.updateTime }" pattern="yyyy-MM-dd"/></td>
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
		var _appId = "${wsQdData.appId}";
		var _pDataId = "${wsQdData.pDataId}";
		getCpList(_appId,_pDataId);
		//ajax去拉取产品数据
		function getCpList(_appId , _pDataId) {
			//设置默认时间 并且提交 查询出最近3天数据
			if (_pDataId == '') {
				return;
			}
			var url = '${pageContext.request.contextPath}/qd/getCpProducts.html?pDataId='+ _pDataId + "&appId=" + _appId;
			$.get(url, function(data) {
				if (data != "" && data != "NULL") {
					//更新下拉项目 appId
					$("#appId").empty();
					var strs = data.split(';');
					//<option  value="">请选择</option>
					$("#appId").append("<option value=''>" + "所有" + "</option>");
					for ( var i = 0; i < strs.length; i++) {
						if (strs[i].length > 2) {
							var _app = strs[i].split('@');
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
		
		function sltAllUser(){
			if($("#sltAll").attr("checked")){
				$("input[name='userIds']").attr("checked",true);
			}else{
				$("input[name='userIds']").attr("checked",false);
			}
		}
		
		var _dg1;
		
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
		    var cpCount = new Number(n1);
		    var qdCount = new Number(n2);
		    if(cpCount < qdCount){
		       alert("渠道推广量 应小于 CP推广量");
		       return;
		    }
		    var qdId = $("#qdId"+id).val();
		    if (qdId == '') {
		    	qdId = "-1";
		    }
		    var updateTimeStart=$("#updateTimeStart").val();
		    var updateTimeEnd=$("#updateTimeEnd").val();
			var url = "${pageContext.request.contextPath}/qd/saveAppData.html?id="+id+"&cpPrice="+p1+"&qdPrice="+p2+"&cpCount="+cpCount+"&qdCount="+qdCount+"&qdId="+qdId+"&updateTimeStart="+updateTimeStart+"&updateTimeEnd="+updateTimeEnd;
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
		
		function search(){
		    if($("#pDataId").val() == "" ){
		       alert("请选择CP!"); 
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
		    if(_dd > -1 && _dd < 32) {

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

		function forcheck(ss) {
			if (ss == 0) {
				return true;
			}
			var type = "^[0-9]*[1-9][0-9]*$";
			var re = new RegExp(type);
			if (ss.match(re) == null) {
				alert("请输入大于零的整数!");
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
			//if ($("#appId").val() == null || $("#appId").val() == '' || $("#appId").val() == "-99") {
			//	return;
			//}
			if($("#appId").val() == "-99") {
				return;
			}
			if ($("#pDataId").val() == "") {
				alert("请选择CP!");
				return;
			} else {
				$("#recordsForm").attr("action", "setQdDataByCp.html?action=1");
				//直接去查询
				search();
			}
		}


		function setPData(cpName, cpId) {

			//设置默认时间 并且提交 查询出最近3天数据
			$("#updateTimeStart").attr("value", getNowDate(3));
			$("#updateTimeEnd").attr("value", getNowDate(1));
			//
			search();
		}
		function bulu() {
			if ($("#appId").val() == null || $("#appId").val() == '' || $("#appId").val() == "-99") {
				alert("请选择CP，并选择CP下面的产品!");
				return;
			}
		    var   beginTime   =   new   Date(Date.parse($("#timeOne").val().replace(/-/g,   "/"))); 
		    var   endTime     =   new   Date(Date.parse($("#timeTwo").val().replace(/-/g,   "/")));
		    var nowDate = new Date();
		    var   _dd2 = (nowDate - beginTime)/1000/60/60/24;
		    if (_dd2 > 30) {
		    	alert("请不要补录过期30天以上的数据!");
		    	return;
		    }
		    
		    var   _dd = (endTime - beginTime)/1000/60/60/24;
		    if(_dd < 0) {
		    	alert("请选择有效日期!");
		    	return;
		    }
		    
		    if (_dd > 7) {
		    	alert("时间间隔不要超过7天!");
		    	return;
		    }
			var appId = $("#appId").val();
			if(window.confirm("确认补录产品:" + $("#appId  option:selected").text() + "数据，时间是：" + $("#timeOne").val() + "到" + $("#timeTwo").val())) {
				//直接ajax解决
				var url = '${pageContext.request.contextPath}/qd/bulu.html?pDataId='+$("#pDataId").val()+'&appId='+ appId + "&timeOne="+$("#timeOne").val()+"&timeTwo="+$("#timeTwo").val();
				$.get(url, function(data) {
					if (data != "" && data != "NULL") {
						alert("完成录入!");
						$("#updateTimeStart").attr("value", $("#timeOne").val());
						$("#updateTimeEnd").attr("value", $("#timeTwo").val());
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