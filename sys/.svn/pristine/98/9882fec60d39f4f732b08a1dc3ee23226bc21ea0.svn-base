package com.flf.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.flf.engine.handler.Handler;
import com.flf.engine.util.StaticData;
import com.flf.entity.FmoUserAccount;
import com.flf.entity.UserInfo;
import com.flf.service.GameService;
import com.flf.vo.UserChannel;

public class Handler_1001_Login extends Handler{
	@Autowired
	private  GameService gameService;
	@Override
	public Object handleRequest() {
		//onlineMap ?? 
		
		JSONObject obj = JSON.parseObject(this.getRequest().getData());
		//用户验证
		int uid = obj.getIntValue("uid");
		String key = obj.getString("key");
		int gameId = obj.getIntValue("gameId");
		int status = 2;
		JSONObject json = new JSONObject();
		
		String onlinKey = StaticData.getCacheUserKey(uid);
		//key + id验证
		if (onlinKey == null || !onlinKey.equals(key)) {
			json.put("status", status);
			return json;
		}
		
		this.setUID(obj.getIntValue("uid"));
		 
		UserChannel userChannel = new UserChannel(this.initChannel());
		//获取userInfo
		FmoUserAccount userAccount = gameService.getUserAccount(uid);
		UserInfo userInfo = new UserInfo();
		userInfo.setUserAccount(userAccount);
		userInfo.setGameId(gameId);
		userChannel.setUserInfo(userInfo);
		StaticData.userCacheMap.put(obj.getInteger("uid"), userChannel);
		json.put("status", 1);
		return json;
	}
	
	
	private void init() {
		
	}

	@Override
	public Object makeObject() throws Exception {
		return new Handler_1001_Login();
	}
	
}
