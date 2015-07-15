package com.flf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flf.entity.User;
import com.flf.orm.mybatis.MyBatisDao;
@Service
public class UserService{
	@Autowired
	private MyBatisDao myBatisDao;
	
	public User getUserById(Integer userId) {
		// TODO Auto-generated method stub
		return myBatisDao.get("userMapper.getUserById" ,userId);
	}

	public boolean insertUser(User user) {
		// TODO Auto-generated method stub
		int count = myBatisDao.get("userMapper.getCountByName",user.getLoginname());
		if(count>0){
			return false;
		}else{
			myBatisDao.save("userMapper.insertUser",user);
			return true;
		}
		
	}

	/**
	 * 根据角色获取用户列表 
	 * @param roleIds
	 * @return
	 */
	public List<User> getUsersByRore(Integer[] roleIds){
		return myBatisDao.getList("userMapper.getUsersByRore" ,roleIds);
	}
	
	public List<User> listPageUser(User user){
		return myBatisDao.getList("userMapper.listPageUser" ,user);
	}

	public List<User> listPageUserForQD(User user){
		return myBatisDao.getList("userMapper.listPageUserForQD" ,user);
	}
	
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		myBatisDao.update("userMapper.updateUser",user);
	}

	public void updateUserBaseInfo(User user){
		myBatisDao.update("userMapper.updateUserBaseInfo",user);
	}
	
	public void updateUserRights(User user){
		myBatisDao.update("userMapper.updateUserRights",user);
	}
	
	public User getUserByNameAndPwd(String loginname, String password) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setLoginname(loginname);
		user.setPassword(password);
		return myBatisDao.get("userMapper.getUserInfo",user);
	}

	public void deleteUser(int userId){
		myBatisDao.delete("userMapper.deleteUser" ,userId);
	}

	public User getUserAndRoleById(Integer userId) {
		return myBatisDao.get("userMapper.getUserAndRoleById",userId);
	}

	public void updateLastLogin(User user) {
		myBatisDao.update("userMapper.updateLastLogin",user);
	}

	public List<User> listAllUser() {
		return myBatisDao.getList("userMapper.listAllUser");
	}
	
}
