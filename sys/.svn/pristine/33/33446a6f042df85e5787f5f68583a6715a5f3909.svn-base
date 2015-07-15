package com.flf.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Menu;
import com.flf.entity.Role;
import com.flf.entity.User;
import com.flf.service.MenuService;
import com.flf.service.UserService;
import com.flf.util.Const;
import com.flf.util.CookieManager;
import com.flf.util.RightsHelper;
import com.flf.util.Tools;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	@Autowired
	private MenuService menuService;
	
	private static String CNAME_PWD = "COOKIE_f1555e2";
	private static String CNAME_NAME = "COOKIE_fSS5e2";
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public ModelAndView loginGet(HttpServletRequest request , HttpServletResponse response ){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		
		CookieManager cm = new CookieManager(request, response);
		try {
			String s1 = cm.getCookie(CNAME_NAME);
			String s2 = cm.getCookie(CNAME_PWD);
			mv.addObject("loginname",s1);
			mv.addObject("password",s2);
			if(StringUtils.isNotBlank(s1) && StringUtils.isNotBlank(s2)) {
				mv.addObject("checked", "true");
			}
		} catch (Exception e) {
		}
		return mv;
	}
	
	/**
	 * 请求登录，验证用户
	 * @param session
	 * @param loginname
	 * @param password
	 * @param code
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView loginPost(HttpServletRequest request , HttpServletResponse response ,HttpSession session,@RequestParam String loginname,@RequestParam String password , String remember){ //,@RequestParam String code){
//		String sessionCode = (String)session.getAttribute(Const.SESSION_SECURITY_CODE);
		ModelAndView mv = new ModelAndView();
		String errInfo = "";
//		if(Tools.notEmpty(sessionCode) ){ //&& sessionCode.equalsIgnoreCase(code)){
			User user = userService.getUserByNameAndPwd(loginname, password);
			if(user!=null){
				user.setLastLogin(new Date());
				userService.updateLastLogin(user);
				//session 有效时间设置
				if(user.getRoleId() == Const.QU_DAO_ID) {
					session.setMaxInactiveInterval(120 * 60);
				}else {
					session.setMaxInactiveInterval(60 * 60 * 5);
				}
				session.setAttribute(Const.SESSION_USER, user);
				session.removeAttribute(Const.SESSION_SECURITY_CODE);
				//验证成功 放入ck
				if (StringUtils.isNotBlank(remember)) {
					CookieManager cm = new CookieManager(request, response);
					cm.setCookie(CNAME_PWD, password, 30 * 24 * 60 * 60);
					cm.setCookie(CNAME_NAME, loginname, 30 * 24 * 60 * 60);
				}
			}else{
				errInfo = "用户名或密码有误！";
			}
//		}else{
//			errInfo = "验证码输入有误！";
//		}
		if(Tools.isEmpty(errInfo)){
			mv.setViewName("redirect:index.html");
		}else{
			mv.addObject("errInfo", errInfo);
			mv.addObject("loginname",loginname);
			mv.addObject("password",password);
			mv.setViewName("login");
		}
		return mv;
	}
	
	/**
	 * 访问系统首页
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index")
	public String index(HttpSession session,Model model){
		User user = (User)session.getAttribute(Const.SESSION_USER);
		user = userService.getUserAndRoleById(user.getUserId());
		Role role = user.getRole();
		String roleRights = role!=null ? role.getRights() : "";
		String userRights = user.getRights();
		//避免每次拦截用户操作时查询数据库，以下将用户所属角色权限、用户权限限都存入session
		session.setAttribute(Const.SESSION_ROLE_RIGHTS, roleRights); //将角色权限存入session
		session.setAttribute(Const.SESSION_USER_RIGHTS, userRights); //将用户权限存入session
		
		List<Menu> menuList = menuService.listAllMenu();
		if(Tools.notEmpty(userRights) || Tools.notEmpty(roleRights)){
			for(Menu menu : menuList){
				menu.setHasMenu(RightsHelper.testRights(userRights, menu.getMenuId()) || RightsHelper.testRights(roleRights, menu.getMenuId()));
				if(menu.isHasMenu()){
					List<Menu> subMenuList = menu.getSubMenu();
					for(Menu sub : subMenuList){
						sub.setHasMenu(RightsHelper.testRights(userRights, sub.getMenuId()) || RightsHelper.testRights(roleRights, sub.getMenuId()));
					}
				}
			}
		}
		model.addAttribute("user", user);
		model.addAttribute("menuList", menuList);
		return "index";
	}
	
	/**
	 * 进入首页后的默认页面
	 * @return
	 */
	@RequestMapping(value="/default")
	public String defaultPage(){
		return "default";
	}
	
	/**
	 * 用户注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpSession session ,HttpServletRequest request , HttpServletResponse response ){
		session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(Const.SESSION_ROLE_RIGHTS);
		session.removeAttribute(Const.SESSION_USER_RIGHTS);
		return loginGet(request, response);
	}
	
	@RequestMapping(value="/register")
	public String register(String key) {
		return "register";
	}
}
