package com.flf.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.flf.engine.bootstrap.ChatServer;
import com.flf.util.Const;
import com.flf.util.ContextUtil;
import com.flf.util.cache.StaticCache;

public class WebAppContextListener implements ServletContextListener {
	//Log object
	public static Logger  log = Logger.getLogger(WebAppContextListener.class);
	public void contextDestroyed(ServletContextEvent event) {
		
	}

	/** 
	 * 系统启动后要初始化数据
	 **/
	public void contextInitialized(ServletContextEvent event) {
		log.info("--------begin---------启动初始化数据.....");
		//获取Spring WebApplicationContext
		Const.WEB_APP_CONTEXT = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		try {
			initContextUtil(event.getServletContext());
		} catch (Exception e) {
			log.error("initContextUtil error ", e);
			
		}
//		AppDataSetJob.initAppDateTrim();
		try {
			init();
		} catch (Exception e) {
			log.error("init error ", e);
			System.exit(0);
		}
		ChatServer.startWebSocket();
		log.info("-------success--------启动初始化数据.....");
	}
	private void initContextUtil(ServletContext context) throws Exception{  
        ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(context);  
        ContextUtil.setContext(ctx);  
	}
	
	private void init() {
		//init 菜单数据
		StaticCache.init();
	}
	
	
}
