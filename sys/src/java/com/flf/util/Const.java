package com.flf.util;

import org.springframework.context.ApplicationContext;

public class Const {
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";
	public static final String SESSION_USER = "sessionUser";
	public static final String SESSION_USER_RIGHTS = "sessionUserRights";
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";
	public static final String NO_INTERCEPTOR_PATH = ".*/((login)|(logout)|(code)|(register)|(registerin)).*";	//不对匹配该值的访问路径拦截（正则）
	public static ApplicationContext WEB_APP_CONTEXT = null; //该值会在web容器启动时由WebAppContextListener初始化
	public static final String CACHE_MENU = "CACHE_MENU";
	
	public static final int MEI_JIE_ID = 5;
	public static final int SHAN_WU_ID = 3;
	public static final int QU_DAO_ID = 4;
	
	/**
	 * 商务 一些ID集合
	 */
	public static final Integer[] SW_ROLE_IDS = {3,6,8};
}
