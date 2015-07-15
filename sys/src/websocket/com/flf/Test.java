package com.flf;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

import com.flf.vo.UserChannel;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.cache.RemovalListener;
import com.google.common.cache.RemovalNotification;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

public class Test {
	public static int a = 999;
	public static void main(String[] args) throws ExecutionException, InterruptedException  {
//		googleCache();
		map();
	}
	
	
	
	public static void map() {
		Map<Integer, Integer> map = Maps.newLinkedHashMap();
		map.put(2, 2);
		map.put(20, 20);
		map.put(19, 19);
		map.put(34, 34);
		map.put(211, 211);
		map.put(22, 22);
		map.put(2, 2);
		for (int a : map.keySet()) {
			System.out.println(a);
		}
		System.out.println("---------------");
		
		List<Integer> list = Lists.newLinkedList();
		list.add(233);
		list.add(243);
		list.add(223);
		list.add(2333);
		list.add(24423);
		list.add(2223);
		list.add(2443);
		list.add(2443);
		list.add(2443);
		list.add(2443);
		for (int a : list) {
			System.out.println(a);
		}
		list.remove(2);
		System.out.println("---------------");
		for (int a : list) {
			System.out.println(a);
		}
		
	}
	/**
	 *1  
	 * 
	* 
	* <p>Title: googleCache</p>
	* <p>Description: </p>
	* @param args
	* @throws ExecutionException
	* @throws InterruptedException
	*/
	public static void googleCache() throws ExecutionException, InterruptedException {
		RemovalListener<Integer, UserChannel> removalListener = new RemovalListener<Integer, UserChannel>() {
			    public void onRemoval(RemovalNotification<Integer, UserChannel> remova) {
//			    	remova.get
			    	System.out.println("rem =" + remova.getKey() + " " + remova.getValue().a);
			    }
			};
			CacheLoader<Integer, UserChannel> loader = new CacheLoader<Integer, UserChannel> () {
				//重新获取缓存数据 
				@Override
				public UserChannel load(Integer arg0) throws Exception {
					System.out.println("key is =" + (a ++));
					UserChannel u = new UserChannel();
					u.a = a;
					return null;
				}
				};
	

		//最大个数10000 * 5    过期时间：1000*60  删除监听 
		//expireAfterAccess(long, TimeUnit) 缓存项在给定时间内没有被读/写访问，则回收
		//expireAfterWrite(long, TimeUnit) 缓存项在给定时间内没有被写访问（创建或覆盖），则回收
		LoadingCache<Integer, UserChannel> userCacheMap = CacheBuilder.newBuilder()
				.maximumSize(10000 * 5)
				.expireAfterWrite(2000 , TimeUnit.MILLISECONDS)
				.removalListener(removalListener)
				.build(loader);
		userCacheMap.getIfPresent(1);
		UserChannel u = new UserChannel();
		u.a  = 888;
		userCacheMap.put(1, u);
		userCacheMap.getIfPresent(1);
		Thread.sleep(1990);
		System.out.println(userCacheMap.getIfPresent(1).a);
//		System.out.println(userCacheMap.get(1).a);
////		userCacheMap.invalidate(1);
//		System.out.println(userCacheMap.get(1).a);
//		System.out.println(System.currentTimeMillis() + "   1");
//		Thread.sleep(2100);
//		System.out.println(System.currentTimeMillis() + "   2");
//		
//		userCacheMap.get(1);
//		System.out.println(System.currentTimeMillis() + "   3");
//		userCacheMap.invalidate(1);
//		System.out.println(userCacheMap.get(1).a);
//		//-----测试刷新
//		Thread.sleep(1800);
//		userCacheMap.refresh(1);
//		Thread.sleep(1000);
//		System.out.println(System.currentTimeMillis() + "   4");
//		userCacheMap.get(1);
//		System.out.println(System.currentTimeMillis() + "   5");
//		Thread.sleep(1100);
//		System.out.println(System.currentTimeMillis() + "   6");
//		userCacheMap.get(1);
	}
}
