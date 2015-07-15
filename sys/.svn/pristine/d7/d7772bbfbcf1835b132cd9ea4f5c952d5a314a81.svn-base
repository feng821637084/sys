package com.flf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flf.entity.FmoUserAccount;
import com.flf.entity.User;
import com.flf.orm.mybatis.MyBatisDao;
@Service
public class GameService{
	@Autowired
	private MyBatisDao myBatisDao;
	
	
	public User getUserById(Integer userId) {
		return myBatisDao.get("userMapper.getUserById" ,userId);
	}
	
	
	public FmoUserAccount getUserAccount(int uid) {
		return myBatisDao.get("FmoUserAccountMapper.selectByPrimaryKey", uid);
	}
}
