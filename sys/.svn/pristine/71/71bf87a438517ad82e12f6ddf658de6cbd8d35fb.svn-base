<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>微信支付页面</title>
	</head>

	<script type="text/javascript">
	//当微信内置浏览器完成内部初始化后会触发WeixinJSBridgeReady事件。
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		alert("init");
		//公众号支付
		$('#getBrandWCPayRequest').click(function(e){
			WeixinJSBridge.invoke('getBrandWCPayRequest',{
				"appId" : "wx4c1d341daa6da78f", //公众号名称，由商户传入
				"timeStamp" : "1414561699", //时间戳
				"nonceStr" : "5K8264ILTKCH16CQ2502SI8ZNMTM67VS", //随机串
				"package" : "prepay_id=123456789", ////扩展包
				"signType" : "MD5", //微信签名方式:1.sha1
				"paySign" : "C380BEC2BFD727A4B6845133519F3AD6" ////微信签名
			},function(res){
				// if(res.err_msg == get_brand_wcpay_request:ok ) {
				alert( res.err_msg ); // alert("OK");
				// }
				// 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。
				//因此微信团队建议，当收到ok返回时，向商户后台询问是否收到交易成功的通知，若收到通知，前端展示交易成功的界面；若此时未收到通知，商户后台主动调用查询订单接口，查询订单的当前状态，并反馈给前	展示相应的界面。
			});
		});
	}, false);
	</script>
</html>