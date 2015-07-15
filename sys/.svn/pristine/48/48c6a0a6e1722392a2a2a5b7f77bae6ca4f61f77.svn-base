package com.flf.interceptor;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.flf.entity.Menu;
import com.flf.entity.User;
import com.flf.util.Const;
import com.flf.util.RightsHelper;
import com.flf.util.Tools;
import com.flf.util.cache.StaticCache;

public class RightsHandlerInterceptor extends HandlerInterceptorAdapter{
	public static final Logger logger = Logger.getLogger(RightsHandlerInterceptor.class);
	private static Map<String, String> path_map = new HashMap<String, String>(100);
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		String path = request.getServletPath();
		if(path.matches(Const.NO_INTERCEPTOR_PATH))
			return true;
		//不要每次都判断 折腾
		if (path_map.get(path) != null) {
			super.preHandle(request, response, handler);
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		Integer menuId = null;
		//不要每次都去查询
//		List<Menu> subList = ServiceHelper.getMenuService().listAllSubMenu();
		Map<Integer, Menu> map = StaticCache.get().getCache(Const.CACHE_MENU);
		for(Entry<Integer, Menu> e : map.entrySet()){
			Menu m = e.getValue();
			String menuUrl = m.getMenuUrl();
			if(Tools.notEmpty(menuUrl)){
				if(path.contains(menuUrl)){
					menuId = m.getMenuId();
					break;
				}else{
					String[] arr = menuUrl.split("\\.");
					String regex = "";
					if(arr.length==2){
						regex = "/?"+arr[0]+"(/.*)?."+arr[1];
						
					}else{
						regex = "/?"+menuUrl+"(/.*)?.html";
					}
					if(path.matches(regex)){
						menuId = m.getMenuId();
						break;
					}
				}
			}
		}
		if(menuId == null) {
			path_map.put(path, path);
		}
		//System.out.println(path+"===="+menuId);
		if(menuId != null){
			//user = ServiceHelper.getUserService().getUserAndRoleById(user.getUserId());
			String userRights = (String) session.getAttribute(Const.SESSION_USER_RIGHTS);
			String roleRights = (String) session.getAttribute(Const.SESSION_ROLE_RIGHTS);
			if(RightsHelper.testRights(userRights, menuId) || RightsHelper.testRights(roleRights, menuId)){
				return true;
			}else{
				//有可能是重复的菜单....
				for(Entry<Integer, Menu> e : map.entrySet()){
					Menu m = e.getValue();
					String menuUrl = m.getMenuUrl();
					if(Tools.notEmpty(menuUrl)){
						if(path.contains(menuUrl)){
							menuId = m.getMenuId();
							if(RightsHelper.testRights(userRights, menuId) || RightsHelper.testRights(roleRights, menuId)){
								return true;
							}
						}else{
							String[] arr = menuUrl.split("\\.");
							String regex = "";
							if(arr.length==2){
								regex = "/?"+arr[0]+"(/.*)?."+arr[1];
								
							}else{
								regex = "/?"+menuUrl+"(/.*)?.html";
							}
							if(path.matches(regex)){
								menuId = m.getMenuId();
								if(RightsHelper.testRights(userRights, menuId) || RightsHelper.testRights(roleRights, menuId)){
									return true;
								}
							}
						}
					}
				}
				logger.info("用户："+user.getLoginname()+"试图访问"+path+"被阻止！");
				ModelAndView mv = new ModelAndView();
				mv.setViewName("no_rights");
				throw new  ModelAndViewDefiningException(mv);
			}
		}
		return super.preHandle(request, response, handler);
	}
	
}
