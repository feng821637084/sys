package com.flf.job;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.flf.util.date.DateUtil;

@Service
public class AppDataSetJob {
	//Log object
	static Logger  log = Logger.getLogger(AppDataSetJob.class);
	/****
	 * 数据录入操作 凌晨00：10 job
	 * @author lj.x
	 * @throws Exception 
	 */
	public void job() throws Exception{
		action(0);
	}
	
	/**
	 * job自动数据录入丢失情况下这里自动补录 注意这里最多也只能补录昨天的数据了
	 * <br/>所以系统当天内系统一定要启动过一次了
	 * 
	 */
	public static  void initAppDateTrim() {
		log.info("initAppDateTrim ..open.");
		new AppDataSetJob().action(1);
		log.info("initAppDateTrim ...end");
	}
	
	private void action(int isV) {
		log.info("...AppDataSetJob open .. time is:" + DateUtil.getDaytime(0));
		log.info("...AppDataSetJob end .. time is:" + DateUtil.getDaytime(0));
	}
	/***
	 * 得到昨日日期
	 * 格式：yyyy-MM-dd
	 * @return  
	 */
	public static String getYesterDay(){
		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   -1);
		String yesterday = new SimpleDateFormat( "yyyy-MM-dd").format(cal.getTime());
		return yesterday;
	}
	
	
}
