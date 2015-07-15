package com.flf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flf.entity.Info;
import com.flf.entity.Page;
import com.flf.orm.mybatis.MyBatisDao;

@Service
public class InfoService{
	@Autowired
	private MyBatisDao myBatisDao;
	public List<Info> listPageInfo(Page page) {
		return myBatisDao.getList("infoMapper.parameterType", page);
	}
}
