package com.flf.controller.mob;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.flf.service.MenuService;
import com.flf.service.RoleService;
import com.flf.service.GameService;

@Controller
@RequestMapping(value="/mob")
public class MobTestController {
	
	@Autowired
	private GameService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;
	
	/**
	 * 关联渠道用户
	 * @param userId
	 * @param out
	 */
	@RequestMapping(value="/test")
	public String relevantQDUser(PrintWriter out){
		return "index2";
	}
}
