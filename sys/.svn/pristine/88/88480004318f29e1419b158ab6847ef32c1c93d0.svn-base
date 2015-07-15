package com.flf.engine.util;

import java.util.concurrent.TimeUnit;

import com.flf.SH.Szzss;
import com.flf.vo.UserChannel;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.cache.RemovalListener;
import com.google.common.cache.RemovalNotification;

/**
 * 静态数据
* <p>Title: StaticData</p>
* <p>Description: </p>
* <p>Company: SH.TY</p> 
* @author Jacopo
* @date 2015年7月1日 下午3:20:59
*/
public class StaticData {
	

	/** szzss 指数对象数据 当前*/
	public static Szzss SZZS = null;
	
	/** SZZS_MAX_SIZE 最大存储*/
	public final static int SZZS_MAX_SIZE = 60 * 10 * 40;
	
	/** SZZS_ARRAY_RM_INDEX 留存数据 最大 30分钟*/
	public final static int SZZS_ARRAY_RM_INDEX = 60 * 10 * 30; 
	
	/** SZZS_LIST 上证数据list 非线程安全只在JOB里面调用 数据满格就得回调10分钟*/
	public static int[] SZZS_LIST = new int[SZZS_MAX_SIZE];
	
	/** SZZS_LIST 上证数据list 非线程安全只在JOB里面调用 数据满格就得回调10分钟*/
	public static int SZZS_INDEX = -1;
	
	/** USER_CACHE_WRITE_TIME 失效时间*/
	private final static long USER_CACHE_WRITE_SECONDS = 60;
	
	/** USER_CACHE_WRITE_TIME 失效时间*/
	private final static long USER_KEY_MAP_WRITE_SECONDS = 60 * 60 * 3;
	
	/** 不要使用get 获取数据 get没有数据时候返回null会抛异常 ，用getIfPresent<相当于map中的get>*/
	public static LoadingCache<Integer, UserChannel> userCacheMap = null;
	
	/** USER_KEY_MAP 用户验证key*/
	public static LoadingCache<Integer, String> USER_KEY_MAP = null;
	
	/**
	 * 获取用户缓存
	* <p>Title: getCacheUserChannel</p>
	* <p>Description: </p>
	* @param key
	* @return
	*/
	public static UserChannel getCacheUserChannel(Integer key) {
		return userCacheMap.asMap().get(key);
	}
	
	
	/**
	 * 添加用户缓存
	* <p>Title: putUserCacheMap</p>
	* <p>Description: </p>
	* @param k
	* @param v
	*/
	public static void putUserCacheMap(Integer k , UserChannel v) {
		userCacheMap.put(k, v);
	}
	/**
	 * 获取用户KEY
	* <p>Title: getCacheUserChannel</p>
	* <p>Description: </p>
	* @param key
	* @return
	*/
	public static String getCacheUserKey(Integer key) {
		return USER_KEY_MAP.asMap().get(key);
	}
	
	
	/**
	 * 添加KEY
	* <p>Title: putUserCacheMap</p>
	* <p>Description: </p>
	* @param k
	* @param v
	*/
	public static void putCacheUserKey(Integer k , String v) {
		USER_KEY_MAP.put(k, v);
	}
	public static void init() {
		//删除监听
		RemovalListener<Integer, UserChannel> removalListener = new RemovalListener<Integer, UserChannel>() {
		    public void onRemoval(RemovalNotification<Integer, UserChannel> remova) {
		    	
		    }
		};
		CacheLoader<Integer, UserChannel> loader = new CacheLoader<Integer, UserChannel> () {
		//重新获取缓存数据 无缓存时
			@Override
			public UserChannel load(Integer arg0) throws Exception {
				//理论上这里要组装值 返回null get时候就会抛异常 得用getIfPresent
				return null;
			}
		};

		//最大个数10000 * 5    过期时间：1000*60  删除监听 
		//expireAfterAccess(long, TimeUnit) 缓存项在给定时间内没有被读/写访问，则回收
		//expireAfterWrite(long, TimeUnit) 缓存项在给定时间内没有被写访问（创建或覆盖），则回收
		userCacheMap = CacheBuilder.newBuilder()
				.maximumSize(10000 * 5)
				.expireAfterWrite(StaticData.USER_CACHE_WRITE_SECONDS , TimeUnit.SECONDS)
				.removalListener(removalListener)
				.build(loader);
		
		//=======================
		RemovalListener<Integer, String> removalListener2 = new RemovalListener<Integer, String>() {
		    public void onRemoval(RemovalNotification<Integer, String> remova) {
		    	
		    }
		};
		CacheLoader<Integer, String> loader2 = new CacheLoader<Integer, String> () {
		//重新获取缓存数据 无缓存时
			@Override
			public String load(Integer arg0) throws Exception {
				//理论上这里要组装值 返回null get时候就会抛异常 得用getIfPresent
				return null;
			}
		};

		//最大个数10000 * 5    过期时间：1000*60  删除监听 
		//expireAfterAccess(long, TimeUnit) 缓存项在给定时间内没有被读/写访问，则回收
		//expireAfterWrite(long, TimeUnit) 缓存项在给定时间内没有被写访问（创建或覆盖），则回收
		USER_KEY_MAP = CacheBuilder.newBuilder()
				.maximumSize(10000 * 5)
				.expireAfterWrite(StaticData.USER_KEY_MAP_WRITE_SECONDS , TimeUnit.SECONDS)
				.removalListener(removalListener2)
				.build(loader2);
	}
	
	
}
