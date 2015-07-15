package com.flf.engine.bootstrap;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelHandler;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.util.concurrent.ImmediateEventExecutor;

import java.net.InetSocketAddress;

import org.apache.log4j.Logger;

import com.flf.engine.handler.ChatServerInitializer;
import com.flf.engine.handler.HandlerFactory;

/**
 ** NIO SERVER
 */
public class ChatServer {
	static Logger  log = Logger.getLogger(ChatServer.class);
	
	private final static int PORT = 2018;
	
	private final ChannelGroup group = new DefaultChannelGroup(ImmediateEventExecutor.INSTANCE);
	
	 /**用于分配处理业务线程的线程组个数 */ 
    protected static final int BIZGROUPSIZE = Runtime.getRuntime().availableProcessors()*2; //默认
    
	/** workerGroup 业务出现处理线程大小*/
	private final EventLoopGroup workerGroup = new NioEventLoopGroup(BIZGROUPSIZE);
	
	/** 业务出现线程大小*/ 
    protected static final int BIZTHREADSIZE = 4; 
    
    /** bossGroup 业务处理 */
    private static final EventLoopGroup bossGroup = new NioEventLoopGroup(BIZGROUPSIZE); 
	
	private Channel channel;
	
	public ChannelFuture start(InetSocketAddress address){
		ServerBootstrap boot = new ServerBootstrap();
		boot.group(bossGroup,workerGroup).channel(NioServerSocketChannel.class).childHandler(createInitializer(group));
		ChannelFuture f = boot.bind(address).syncUninterruptibly();
		channel = f.channel();
		return f;
	}

	protected ChannelHandler createInitializer(ChannelGroup group2) {
		return new ChatServerInitializer(group2);
	}
	
	public void destroy(){
		if(channel != null)
			channel.close();
		group.close();
		workerGroup.shutdownGracefully();
	}
	
	private static ChannelFuture f;
	/**
	 * 启动websocket
	* <p>Title: startWebSocket</p>
	* <p>Description: </p>
	*/
	public static void startWebSocket() {
		log.info("===============begin web socket server=================");
		final ChatServer server = new ChatServer();
		f = server.start(new InetSocketAddress(PORT));
		//计划销毁
		Runtime.getRuntime().addShutdownHook(new Thread(){
			@Override
			public void run() {
				server.destroy();
			}
		});
		//
		new Thread(){
			@Override
			public void run() {
				f.channel().closeFuture().syncUninterruptibly();
			}
		};
		HandlerFactory.getInstance().init();
		log.info("===============      SUCCESS          =================");
	}
	
	public static void main(String[] args) {
		final ChatServer server = new ChatServer();
		ChannelFuture f = server.start(new InetSocketAddress(PORT));
		System.out.println("server start................");
		Runtime.getRuntime().addShutdownHook(new Thread(){
			@Override
			public void run() {
				server.destroy();
			}
		});
		HandlerFactory.getInstance().init();
		//立即同步, 不等缓冲区满了. 否则还得等待缓冲区满了才会发送给远程
		f.channel().closeFuture().syncUninterruptibly();
	}
	
}
