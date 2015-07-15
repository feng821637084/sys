package com.flf.SH;

import java.util.Calendar;
import java.util.concurrent.ThreadLocalRandom;

import org.apache.log4j.Logger;

import com.flf.engine.util.StaticData;
import com.flf.util.HttpUtils;

public class SzzsJob {
	
	static Logger  log = Logger.getLogger(SzzsJob.class);
	
	/**
	 * 
	 *  排除周末每天9点执行一次 13点执行一次  
	* <p>Title: job</p>
	* <p>Description: </p>
	*/
	public static void job() {
		// 9 -- 11.30
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		int HOUR = calendar.get(Calendar.HOUR);
		long actionTime = 0;
		//早上的
		if (HOUR < 10) {
			actionTime = 150 * 60 * 100; //早盘时间
		//下午开盘	
		}else {
			actionTime =  120 * 60 * 100;//午盘时间
		}
		long endTime = System.currentTimeMillis() + actionTime;
		int status =  1 ;
		//固定时间执行
		while (System.currentTimeMillis() < endTime) {
			double d = -99;
			if (status == 1) {
				d = getSinaSzzs();
			}
			if (d < 0) {
				d = getQqSzzs();
			}
			if (d < 1) {
				log.error("get szzs err!!===================================================");
				continue;
			}
			d = d * 100;
			//当前指数
			int s = new Double(d).intValue();
			long time = System.currentTimeMillis()/1000;
			//更新参数
			Szzss szzss = new Szzss();
			Szzss _s = StaticData.SZZS;
			if (_s != null && _s.time == time) {
				continue;
			}
			
			//数据处理 数据满了就复制
			if (StaticData.SZZS_INDEX >= StaticData.SZZS_MAX_SIZE - 1) {
				int[] ints = new int[StaticData.SZZS_MAX_SIZE];
				
				System.arraycopy(StaticData.SZZS_LIST, StaticData.SZZS_MAX_SIZE - StaticData.SZZS_ARRAY_RM_INDEX
														,ints , 0,
														StaticData.SZZS_ARRAY_RM_INDEX);
				StaticData.SZZS_INDEX = StaticData.SZZS_ARRAY_RM_INDEX - 1;
				
			}
			
			
			//查看时间间隔
			long jgTime = _s == null ? 0 : time - _s.time;
			if (jgTime == 0) {
				continue; //时间相同？ 这就放弃
			}else {
				for (long a = 0 ; a < jgTime ; a ++) {
					//超过1s 
					if (jgTime - a > 1) {
						//随机一个数
						int __s = suijishu(s - 150 , s + 150);//3个点直接浮动
						StaticData.SZZS_LIST[StaticData.SZZS_INDEX + 1] = __s;
						StaticData.SZZS_INDEX  ++;
					}else {
						StaticData.SZZS_LIST[StaticData.SZZS_INDEX + 1] = s;
						StaticData.SZZS_INDEX  ++;
					}
					
				}
			}
			
			
			
			//
			try {
				Thread.sleep(1000 * 3);//
			} catch (InterruptedException e) {
			}
			
		}
	}
	private static ThreadLocalRandom tlr = ThreadLocalRandom.current();
	private static int suijishu(int a , int b) {
		return tlr.nextInt(a, b);
	}
	
	private static String s1 = "http://hq.sinajs.cn/list=s_sh000001";
	private static double getSinaSzzs() {
		long t = System.currentTimeMillis();
		try {
			String s = HttpUtils.URLGet(s1, null, HttpUtils.URL_PARAM_DECODECHARSET_UTF8);
			String[] strs = s.split(",");
			double dou2 = Double.valueOf(strs[1]);
			return dou2;
		} catch (Exception e) {
			log.error("time ==" + (System.currentTimeMillis() - t), e);
			return -99;
		}
	}
	
	private static String s2 = "http://qt.gtimg.cn/q=s_sh000001";
	private static double getQqSzzs() {
		long t = System.currentTimeMillis();
		try {
			String s = HttpUtils.URLGet(s2, null, HttpUtils.URL_PARAM_DECODECHARSET_UTF8);
			String[] strs = s.split("~");
			double dou1 = Double.valueOf(strs[3]);
			return dou1;
		} catch (Exception e) {
			log.error("time ==" + (System.currentTimeMillis() - t), e);
			return -99;
		}
	}
}
