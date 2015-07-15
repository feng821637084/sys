package com.flf.engine.handler;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.group.ChannelGroup;

import org.apache.commons.pool.BasePoolableObjectFactory;
import org.apache.log4j.Logger;

import com.flf.engine.util.Channel;
import com.flf.engine.util.Request;
import com.flf.engine.util.Response;


/**
 *处理器 附带池化功能
 *继承该类的注意：<br/>
 *1、命名必须如：Handler_1001_xxxx.java ，其中第一个为固定Handler标识 第二个协议编号
 */
public abstract class Handler extends BasePoolableObjectFactory {
	static Logger  log = Logger.getLogger(Handler.class);
	/** CODE 自动注入*/
	private  int CODE = -99;

    protected Request req = null;
    
    protected Response res = null;
    
    protected  ChannelGroup channelGroup;
    
    protected ChannelHandlerContext ctx;
    
    public Channel initChannel() {
    	Channel c = new Channel();
    	c.setReq(req);
    	c.setRes(res);
    	c.setCtx(ctx);
    	c.setGroup(channelGroup);
    	return c;
    }
    

    /**
     * @param gameReq
     */
    public void init(Request gameReq ,ChannelGroup channelGroup, ChannelHandlerContext ctx) {
        this.req = gameReq;
        this.channelGroup = channelGroup;
        this.ctx = ctx;

    }

    public Request getRequest() {
        return req;
    }

    /**
     * 
    * <p>Title: handleRequest</p>
    * <p>Description: </p>
    * @return null or object
    */
    public abstract Object handleRequest();


    protected int getImages(int imageID) {
        return imageID;

    }

    /**
     * new 对象
     * active object pool
     * @return
     * @throws Exception
     */
    public abstract Object makeObject() throws Exception;

    /**
     * Uninitialize an instance to be returned to the pool.
     * @param obj the instance to be passivated
     */
    public void passivateObject(Object obj) throws Exception {
        Handler handler = (Handler) obj;
        handler.clear();
    }

    
    private void clear() {
        req = null;
        res = null;
        channelGroup = null;
        ctx = null;
        CODE = 0;
    }

	public  int getCODE() {
		return CODE;
	}

	public  void setCODE(int cODE) {
		CODE = cODE;
	}

	public void setUID(int uid) {
		req.setUid(uid);
	}
}
