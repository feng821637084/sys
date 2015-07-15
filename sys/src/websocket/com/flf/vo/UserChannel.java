package com.flf.vo;

import com.flf.engine.util.Channel;
import com.flf.entity.UserInfo;

public class UserChannel {
	public int a;
	Channel channel;
	
	UserInfo userInfo;
	public UserChannel() {}
	public UserChannel(Channel channel2) {
		this.channel = channel2;
	}

	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	
	
}
