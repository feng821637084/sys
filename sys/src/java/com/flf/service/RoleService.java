package com.flf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flf.entity.Role;
import com.flf.orm.mybatis.MyBatisDao;
import com.flf.service.RoleService;
@Service
public class RoleService{
	@Autowired
	private MyBatisDao myBatisDao;
	
	//排除某个roleId
	public List<Role> listAllRoles(int roleId) {
		return myBatisDao.getList("roleMapper.listAllRoles" ,roleId);
	}

	public void deleteRoleById(int roleId) {
		myBatisDao.delete("roleMapper.deleteRoleById" , roleId);
	}

	public Role getRoleById(int roleId) {
		return myBatisDao.get("roleMapper.getRoleById" , roleId);
	}

	public boolean insertRole(Role role) {
		// TODO Auto-generated method stub
		
		if((Integer)myBatisDao.get("roleMapper.getCountByName", role) > 0 )
			return false;
		else{
			myBatisDao.save("roleMapper.insertRole", role);
			return true;
		}
	}

	public boolean updateRoleBaseInfo(Role role) {
		if((Integer)myBatisDao.get("roleMapper.getCountByName", role)>0)
			return false;
		else{
			myBatisDao.update("roleMapper.updateRoleBaseInfo", role);
			return true;
		}
	}
	
	public void updateRoleRights(Role role) {
		myBatisDao.update("roleMapper.updateRoleRights", role);
	}


}
