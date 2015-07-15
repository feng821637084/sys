<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>渠道商详细信息</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>                
		<form action="qdDetailSave.html" method="post" name="qdDetailSav"
			id="qdDetailSav">
			<div class="search_div">
			    <input type="text" name="pUserId" value= "${QdDetail.pUserId}" style="display:none">
			    <!-- 
				渠道类型:&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="qdType" id="qdType"  style="vertical-align: middle;width:30%">
					<option value="1">公司</option>
					<option value="2">个人</option>
				</select>
				 -->
				&nbsp;渠道名称:&nbsp;&nbsp;
				<input type="text" name="qdName" style="width:30%"  value="${QdDetail.qdName}">
			</div>
			<div class="search_div">
			    &nbsp;联系人:&nbsp;&nbsp; &nbsp; &nbsp;
				<input type="text" name="qdContact" style="width:30%"  value="${QdDetail.qdContact}">
				联系号码 :&nbsp;
				<input type="text" name="qdPhone" style="width:30%"   value="${QdDetail.qdPhone}"/>
			</div>
			<div class="search_div">
				银行:&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="qdYh" style="width:30%" value="${QdDetail.qdYh}"  />
				支行信息:&nbsp;&nbsp;
				<input type="text" name="qdKhk" style="width:30%" value="${QdDetail.qdKhk}" />
			</div>
			<div class="search_div">
				开户登记名:
				<input type="text" name="qdKhr" style="width:30%" value="${QdDetail.qdKhr}" />
				开户帐号:&nbsp;&nbsp;
				<input type="text" name="qdZh" style="width:30%" value="${QdDetail.qdZh}" />
			</div>
			<div class="search_div">
			           联系QQ：&nbsp;&nbsp;
				<input type="text" name="qdQq" style="width:30%"  value="${QdDetail.qdQq}" />
				地址:&nbsp;&nbsp;&nbsp; &nbsp;  &nbsp; &nbsp;
				<input type="text" name="qdAddress" style="width:30%"  value="${QdDetail.qdAddress}" />
			</div>
			<div class="search_div">
			            邮箱：&nbsp;&nbsp;&nbsp; &nbsp;  &nbsp; 
				<input type="text" name="qdEmail" style="width:30%"  value="${QdDetail.qdEmail}" />
				备注:&nbsp;&nbsp;&nbsp; &nbsp;  &nbsp;  &nbsp; 
				<input type="text" name="qdNote" style="width:30%"  value="${QdDetail.qdNote}" />
			</div>
			<br/>
		</form>
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.5.1.min.js"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/datePicker/WdatePicker.js"></script> 
       <script type="text/javascript" src="${pageContext.request.contextPath}/js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
		<script type="text/javascript">
		
		var dg;
		$(document).ready(function(){
			dg = frameElement.lhgDG;
			var pUserId = '${QdDetail.pUserId}';
			if(pUserId==""){
				dg.addBtn('ok','保存',function(){
					$("#qdDetailSav").submit();
				});
			}else{
			    dg.addBtn('ok','修改',function(){
					$("#qdDetailSav").submit();
				});
			}
			/**if($("#userId").val()!=""){
				$("#loginname").attr("readonly","readonly");
				$("#loginname").css("color","gray");
				var roleId = "${user.roleId}";
				if(roleId!=""){
					$("#roleId").val(roleId);
				}
			}*/
		});
		
		function success(){
			if(dg.curWin.document.forms[0]){
				dg.curWin.document.forms[0].action = dg.curWin.location+"";
				dg.curWin.document.forms[0].submit();
			}else{
				dg.curWin.location.reload();
			}
			dg.cancel();
		}
		
		//校验手机号码：必须以数字开头，除数字外，可含有“-”
		function isMobil(s){
		var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
		if (!patrn.exec(s)){
		alert("联系号码:必须以数字开头，除数字外，可含有“-”");
		return false;
		}
		}
	</script>
</body>
</html>