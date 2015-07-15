package com.flf.engine.util;

import com.flf.engine.handler.Handler;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.group.ChannelGroup;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;

/**
 * 连接封装
* <p>Title: Channel</p>
* <p>Description: </p>
* <p>Company: SH.TY</p> 
* @author Jacopo
* @date 2015年7月1日 下午3:21:20
*/
public class Channel {
	
	
	private Request req;
	private Response res;
	//连接信息 ALL
	private ChannelGroup group;
	//连接信息
	private ChannelHandlerContext ctx;
	
	/**
	 * UTF-8 默认
	* <p>Title: getMsg</p>
	* <p>Description: </p>
	* @param str
	* @return
	*/
	public static TextWebSocketFrame getMsg(String str) {
		return new TextWebSocketFrame(str);
	}
	/**
	 * 当前发送
	* <p>Title: send</p>
	* <p>Description: </p>
	* @param obj
	* @return
	*/
	public boolean send(String obj) {
		ctx.channel().writeAndFlush(getMsg(obj));
		return true;
	}
	
	/**
	 * 广播所有
	* <p>Title: sendAll</p>
	* <p>Description: </p>
	* @param obj
	* @return
	*/
	public boolean sendAll(String obj) {
		group.writeAndFlush(getMsg(obj));
		return true;
	}
	
	/**
	 * 关闭链接
	* <p>Title: close</p>
	* <p>Description: </p>
	* @return
	*/
	public boolean close() {
		try {
			ctx.close();
			group.remove(ctx);
			req = null;
			res = null;
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public void clean() {
		
	}

	public Request getReq() {
		return req;
	}

	public void setReq(Request req) {
		this.req = req;
	}

	public Response getRes() {
		return res;
	}

	public void setRes(Response res) {
		this.res = res;
	}

	public ChannelGroup getGroup() {
		return group;
	}

	public ChannelHandlerContext getCtx() {
		return ctx;
	}
	public void setGroup(ChannelGroup group) {
		this.group = group;
	}
	public void setCtx(ChannelHandlerContext ctx) {
		this.ctx = ctx;
	}
	
}
