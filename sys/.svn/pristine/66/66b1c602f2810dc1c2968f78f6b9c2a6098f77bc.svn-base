/*
 * $RCSfile: StaticCache.java,v $
 * $Date: 2014-5-8  $
 *
 * Copyright (C) 2005 WeiShang, Inc. All rights reserved.
 *
 * This software is the proprietary information of WeiShang, Inc.
 * Use is subject to license terms.
 */

package com.flf.util.cache;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.flf.entity.Menu;
import com.flf.util.Const;
import com.flf.util.ServiceHelper;


/**
 * 有空再维护吧	
 * <p>Title: StaticCache</p> 
 * <p>Description: </p> 
 * <p>Copyright: Copyright (c) 2006</p> 
 * @author jacopo
 */
public class StaticCache {
	
	
	/**
	 * 获取引用
	 * @return
	 */
	public static StaticCache get() {
		return cache;
	}
	
	private static StaticCache cache;
	
	private Map<String, Object> cacheMap = new ConcurrentHashMap<String, Object>();
	
	private StaticCache(){};
	
	private  static int isInit = 0;
	public static void init() {
		if (isInit != 0) {
			return;
		}
		isInit = -999;
		cache = new StaticCache();
		//
		List<Menu> subList = ServiceHelper.getMenuService().listAllSubMenu();
		Map<Integer, Menu> map = new ConcurrentHashMap<Integer, Menu>(50);
		for (Menu m : subList) {
			map.put(m.getMenuId(), m);
		}
		cache.cacheMap.put(Const.CACHE_MENU, map);
	}

	/**
	 * 获取缓存中value
	 * @param key
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public  <T> T getCache(String key) {
		return (T)cacheMap.get(key);
	}
	
	/**
	 * 加入cache
	 * @param key
	 * @param value
	 * @return
	 */
	public int putCache(String key , Object value) {
		return cache.putCache(key, value);
	}
}


