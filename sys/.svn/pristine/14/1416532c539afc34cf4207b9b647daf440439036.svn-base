package com.flf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flf.entity.Menu;
import com.flf.orm.mybatis.MyBatisDao;
@Service
public class MenuService{

	@Autowired
	private MyBatisDao myBatisDao;
	public void deleteMenuById(Integer menuId) {
		myBatisDao.delete("menuMapper.deleteMenuById", menuId);
	}

	public Menu getMenuById(Integer menuId) {
		return myBatisDao.get("menuMapper.getMenuById", menuId);
	}

	public List<Menu> listAllParentMenu() {
		return myBatisDao.getList("menuMapper.listAllParentMenu");
	}

	public void saveMenu(Menu menu) {
		if(menu.getMenuId()!=null && menu.getMenuId().intValue()>0){
			myBatisDao.update("menuMapper.updateMenu" , menu);
		}else{
			myBatisDao.save("menuMapper.insertMenu", menu);
		}
	}

	public List<Menu> listSubMenuByParentId(Integer parentId) {
		return myBatisDao.getList("menuMapper.listSubMenuByParentId", parentId);
	}
	
	public List<Menu> listAllMenu() {
		List<Menu> rl = this.listAllParentMenu();
		for(Menu menu : rl){
			List<Menu> subList = this.listSubMenuByParentId(menu.getMenuId());
			menu.setSubMenu(subList);
		}
		return rl;
	}

	public List<Menu> listAllSubMenu(){
		return myBatisDao.getList("menuMapper.listAllSubMenu");
	}
}
