package com.flf.action;

import com.flf.engine.handler.Handler;
import com.flf.engine.util.StaticData;
import com.flf.vo.UserChannel;

/**
 * 心跳协议
* <p>Title: Handler_1008_Login</p>
* <p>Description: </p>
* <p>Company: SH.TY</p> 
* @author Jacopo
* @date 2015年7月3日 下午6:25:17
*/
public class Handler_1008_Login extends Handler{

	@Override
	public Object handleRequest() {
		//onlineMap ?? 
		
		UserChannel uc = StaticData.userCacheMap.asMap().get(req.getUid());
		StaticData.userCacheMap.put(req.getUid(), uc);
		return null;
	}

	@Override
	public Object makeObject() throws Exception {
		return new Handler_1008_Login();
	}
	
}
