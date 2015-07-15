package com.flf.engine.handler;

import io.netty.channel.Channel;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.group.ChannelGroup;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.handler.stream.ChunkedWriteHandler;

/**
 * CHANNEL CONFIG
 */
public class ChatServerInitializer extends ChannelInitializer<Channel> {

	private final ChannelGroup group;
	public ChatServerInitializer(ChannelGroup group) {
		super();
		this.group = group;
	}

	
	/**
	* 加载相关配置
	*/
	@Override
	protected void initChannel(Channel ch) throws Exception {
		ChannelPipeline pipeline = ch.pipeline();
		
		pipeline.addLast(new HttpServerCodec());
		
		pipeline.addLast(new ChunkedWriteHandler());
		
		//最大就5KB 
		pipeline.addLast(new HttpObjectAggregator(5*1024));
		
		pipeline.addLast(new HttpRequestHandler("/"));
		
		pipeline.addLast(new WebSocketServerProtocolHandler("/"));
		
		pipeline.addLast(new TextWebSocketFrameHandler(group));
		
	}

}
