package com.flf.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.User;
import com.flf.service.UserService;
import com.flf.util.Const;

@Controller
@RequestMapping(value="/pwd")
public class PwdController {
	
	@Autowired
	private UserService userService;
	/**
	 * 保存用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/updataPassword")
	public ModelAndView updataPassword(User user,HttpSession session){
		User thisUser = (User)session.getAttribute(Const.SESSION_USER);
		ModelAndView mv = new ModelAndView();
		if(user == null  || user.getLoginname() == null) {
			user = user == null ? new User() : user;
			mv.setViewName("updatePassword");
			user.setLoginname(thisUser.getLoginname());
			mv.addObject("user", user);
			return mv;
		}
		if (!thisUser.getPassword().equals(user.getOldPassword())) {
			mv.addObject("msg","密码输入错误!");
			mv.addObject("user", user);
		}else {
			mv.addObject("msg","修改成功!");
			thisUser.setPassword(user.getPassword());
			userService.updateUserBaseInfo(thisUser);
		}
		mv.setViewName("updatePassword");
		return mv;
	}
}
