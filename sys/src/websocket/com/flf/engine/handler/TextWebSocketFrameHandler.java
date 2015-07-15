package com.flf.engine.handler;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.group.ChannelGroup;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;

import org.apache.commons.pool.ObjectPool;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.flf.engine.protocol.ProtocolConfig;
import com.flf.engine.util.Request;
import com.flf.engine.util.StaticData;
import com.flf.vo.UserChannel;

/**
 ** BASE HANDLER
 */
public class TextWebSocketFrameHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {
	
	static Logger  log = Logger.getLogger(TextWebSocketFrameHandler.class);
	
	protected final static HandlerFactory handlerCacheFactory = HandlerFactory.getInstance();
	
	 protected ObjectPool objPool = null;
	
	private final ChannelGroup group;
	public TextWebSocketFrameHandler(ChannelGroup group) {
		super();
		this.group = group;
		
	}
	
	/**
	 * 建立连接初始化化
	 * */
	@Override
	public void userEventTriggered(ChannelHandlerContext ctx, Object evt)
			throws Exception {
		if(evt == WebSocketServerProtocolHandler.ServerHandshakeStateEvent.HANDSHAKE_COMPLETE){
			ctx.pipeline().remove(HttpRequestHandler.class);
			//自动管理
			group.add(ctx.channel());
			//String ip = ((InetSocketAddress)ctx.channel().remoteAddress()).getAddress().getHostAddress();
		}else{
			super.userEventTriggered(ctx, evt);
		}
		
	}
	
	/**
	 * 接收消息
	 * */
	@Override
	protected void channelRead0(ChannelHandlerContext ctx,
			TextWebSocketFrame msg) throws Exception {
		//验证
//		group.writeAndFlush(new TextWebSocketFrame("aks"));//群发
//		ctx.channel().writeAndFlush(new TextWebSocketFrame(ctx.channel().hashCode()+ ""));//单发
		//code 协议号 -- code:4位
		//uid: 用户标识 -- uid:12位 
		//data: 数据集合 json
		String sMsg = msg.text();
		Request req = null;
		Object data = null;
		Handler handler = null;
		try {
			req  = JSON.parseObject(sMsg,Request.class);
			if (req.getCode() < 1) {
				log.error("协议出错 reda error! json=" + sMsg);
				ctx.close();//直接踢掉
			}
			objPool = (ObjectPool)handlerCacheFactory.get(req.getCode());
			handler = (Handler) objPool.borrowObject();
			handler.setCODE(req.getCode());
		} catch (Exception e) {
			log.error("协议出错 reda error! json=" + sMsg, e);
			ctx.close();//直接踢掉
			return;
		}
		//handler init
		handler.init(req , group ,ctx);
		
		//数据完整性验证 超长的也不行
		//连接要注意更换
		if(req.getCode() != ProtocolConfig.ONE_START_CODE) {
			UserChannel uc = StaticData.userCacheMap.asMap().get(req.getUid());
			if (!vd(req , handler ,uc)) {
				log.error("协议出错 reda error! uid=" + req.getUid());
				ctx.close();//直接踢掉
				return;
			}
	    	//不是同个连接 可能掉线重连了 刷新连接了要
	    	if (!ctx.channel().equals(uc.getChannel().getCtx().channel())) {
	    		uc.setChannel(handler.initChannel());
	    	}
		}
		
		try {
			data  = handler.handleRequest();
			//发送数据
			if (data != null) {
				req.setData(JSON.toJSONString(data));
				ctx.writeAndFlush(getMsg(JSON.toJSONString(req)));
			}
		} catch (Exception e) {
			log.debug("handler error code=" + req.getCode() , e);
		}
		
	}
	
    /**
     * 验证合法性 
    * <p>Title: vd</p>
    * <p>Description: </p>
    * @return
    */
    public boolean vd(Request req ,Handler handler ,UserChannel uc) {
    	if (req.getUid() < 1 || req.getCode() < 1 || (req.getData() !=  null && req.getData().length() > 5000)) {
    		return false;
    	}
		if (uc == null) {
			log.error("===================uc == null 没有找到该用户!");
			return false;
		}
    	return true;
    }	
	
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause)
			throws Exception {
		ctx.close();
		cause.printStackTrace();
	}
	/**
	 * 默认UTF-8
	* <p>Title: getMsg</p>
	* <p>Description: </p>
	* @param str
	* @return
	*/
	public static TextWebSocketFrame getMsg(String str) {
		return new TextWebSocketFrame(str);
	}
//	static {
//    	Timer tim = new Timer();
//    	TimerTask tt = new TimerTask() {
//    		
//			@Override
//			public void run() {
//				ChannelGroup gg = groups.get(100);
//				if (gg != null) {
//					gg.write(new TextWebSocketFrame("99999999999999"));
//					gg.flush();
//				}
//			}
//		};
//		tim.schedule(tt,0,1000 * 3);
//	}
}
