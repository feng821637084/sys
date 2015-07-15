package com.flf.action;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;

import com.flf.engine.handler.Handler;
import com.flf.engine.util.StaticData;
import com.flf.service.GameService;
import com.flf.vo.UserChannel;

public class Handler_1002_UserInfo extends Handler{
	@Autowired
	private  GameService gameService;
	@Override
	public Object handleRequest() {
		
		UserChannel uc = StaticData.getCacheUserChannel(req.getUid());
		JSONObject json = new JSONObject();
		
//		status		状态
//		name		昵称
//		gold		金币
//		jifen		积分
//				
//		paoma		跑马灯数据
//		indexTime		指数时间
//		indexData		指数数据
		
		
		return new JSONObject(true);
	}

	@Override
	public Object makeObject() throws Exception {
		return new Handler_1002_UserInfo();
	}
	
}
