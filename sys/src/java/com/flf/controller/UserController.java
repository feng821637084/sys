package com.flf.controller;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Menu;
import com.flf.entity.Role;
import com.flf.entity.User;
import com.flf.service.MenuService;
import com.flf.service.RoleService;
import com.flf.service.UserService;
import com.flf.util.Const;
import com.flf.util.RightsHelper;
import com.flf.util.Tools;
import com.flf.view.UserExcelView;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;
	/**
	 * 显示用户列表
	 * @param user
	 * @return
	 */
	@RequestMapping
	public ModelAndView list(User user,String pUserId ,HttpSession session){
		List<User> userList = userService.listPageUser(user);
		List<Role> roleList = roleService.listAllRoles(-1);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users");
		mv.addObject("userList", userList);
		mv.addObject("roleList", roleList);
		mv.addObject("user", user);
		//用于渠道用户关联
		mv.addObject("pUserId", pUserId);
		//不是管理员就不要显示管理员的信息
		User thisUser = (User)session.getAttribute(Const.SESSION_USER);
		if(thisUser.getRoleId() != 1) {
			User[] users = new User[userList.size()];
			users = userList.toArray(users);
			for (User u : users) {
				if (u.getRole().getRoleId() == 1) {
					userList.remove(u);
				}
			}
		}
		return mv;
	}
	
	/**
	 * 请求新增用户页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/add")
	public String toAdd(Model model,HttpSession session){
		//不是管理员就不要显示管理员的信息
		User thisUser = (User)session.getAttribute(Const.SESSION_USER);
		List<Role> roleList;
		if(thisUser.getRoleId() == 1) {
			roleList = roleService.listAllRoles(-1);
		}else {
			roleList = roleService.listAllRoles(1);
		}
		model.addAttribute("roleList", roleList);
		return "user_info";
	}
	
	/**
	 * 保存用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public ModelAndView saveUser(User user){
		ModelAndView mv = new ModelAndView();
		if(user.getUserId()==null || user.getUserId().intValue()==0){
			if(userService.insertUser(user)==false){
				mv.addObject("msg","failed");
			}else{
				mv.addObject("msg","success");
			}
		}else{
			userService.updateUserBaseInfo(user);
		}
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 保存用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/updataPassword",method=RequestMethod.POST)
	public ModelAndView updataPassword(User user,HttpSession session){
		User thisUser = (User)session.getAttribute(Const.SESSION_USER);
		ModelAndView mv = new ModelAndView();
		if(user == null || user.getUserId() == null) {
			mv.setViewName("updatePassword");
			return mv;
		}
		if (!thisUser.getPassword().equals(user.getOldPassword())) {
			mv.addObject("msg","密码输入错误!");
		}else {
			mv.addObject("msg","修改成功!");
			thisUser.setPassword(user.getPassword());
			userService.updateUserBaseInfo(thisUser);
		}
		mv.setViewName("updatePassword");
		return mv;
	}
	/**
	 * 请求编辑用户页面
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/edit")
	public ModelAndView toEdit(@RequestParam int userId ,HttpSession session){
		ModelAndView mv = new ModelAndView();
		//不是管理员就不要显示管理员的信息
		User thisUser = (User)session.getAttribute(Const.SESSION_USER);
		User user = userService.getUserById(userId);
		List<Role> roleList;
		if(thisUser.getRoleId() == 1) {
			roleList = roleService.listAllRoles(-1);
		}else {
			roleList = roleService.listAllRoles(1);
		}
		mv.addObject("user", user);
		mv.addObject("roleList", roleList);
		mv.setViewName("user_info");
		return mv;
	}
	
	/**
	 * 删除某个用户
	 * @param userId
	 * @param out
	 */
	@RequestMapping(value="/delete")
	public void deleteUser(@RequestParam int userId,PrintWriter out){
		userService.deleteUser(userId);
		out.write("success");
		out.close();
	}
	
	/**
	 * 请求用户授权页面
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/auth")
	public String auth(@RequestParam int userId,Model model){
		List<Menu> menuList = menuService.listAllMenu();
		User user = userService.getUserById(userId);
		String userRights = user.getRights();
		if(Tools.notEmpty(userRights)){
			for(Menu menu : menuList){
				menu.setHasMenu(RightsHelper.testRights(userRights, menu.getMenuId()));
				if(menu.isHasMenu()){
					List<Menu> subRightsList = menu.getSubMenu();
					for(Menu sub : subRightsList){
						sub.setHasMenu(RightsHelper.testRights(userRights, sub.getMenuId()));
					}
				}
			}
		}
		JSONArray arr = JSONArray.fromObject(menuList);
		String json = arr.toString();
		json = json.replaceAll("menuId", "id").replaceAll("menuName", "name").replaceAll("subMenu", "nodes").replaceAll("hasMenu", "checked");
		model.addAttribute("zTreeNodes", json);
		model.addAttribute("userId", userId);
		return "authorization";
	}
	
	/**
	 * 保存用户权限
	 * @param userId
	 * @param menuIds
	 * @param out
	 */
	@RequestMapping(value="/auth/save")
	public void saveAuth(@RequestParam int userId,@RequestParam String menuIds,PrintWriter out){
		BigInteger rights = RightsHelper.sumRights(Tools.str2StrArray(menuIds));
		User user = userService.getUserById(userId);
		user.setRights(rights.toString());
		userService.updateUserRights(user);
		out.write("success");
		out.close();
	}
	
	/**
	 * 导出用户信息到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView export2Excel(){
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("用户名");
		titles.add("名称");
		titles.add("角色");
		titles.add("最近登录");
		dataMap.put("titles", titles);
		List<User> userList = userService.listAllUser();
		dataMap.put("userList", userList);
		UserExcelView erv = new UserExcelView();
		ModelAndView mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
}
