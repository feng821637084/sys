/*
 * $RCSfile: CookieManager.java,v $
 * $Date: 2014-4-17  $
 *
 * Copyright (C) 2005 WeiShang, Inc. All rights reserved.
 *
 * This software is the proprietary information of WeiShang, Inc.
 * Use is subject to license terms.
 */

package com.flf.util;

/**
 * <p>Title: CookieManager</p> 
 * <p>Description: </p> 
 * <p>Copyright: Copyright (c) 2006</p> 
 * @author jacopo
 */
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Cookie管理
 * 
 * @author coder_hero
 * 
 */
public class CookieManager {
	private static  DesUtils desUtiles = null;
	private HttpServletRequest request = null;
	private HttpServletResponse response = null;

	// private String securityCode = "yimei1234abcd09"; //加密code
	public CookieManager(HttpServletRequest request,
			HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	/**
	 * 获取cookie
	 * 
	 * @param name
	 * @return
	 */
	public String getCookie(String name) {
		try {
			desUtiles = desUtiles == null ? new DesUtils("ws$^&UUU") : desUtiles;
		} catch (Exception e) {
		}
		if (name == null)
			return null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals(name)) {
					String value = new String(cookies[i].getValue());
					try {
						return desUtiles.decrypt(value);
					} catch (Exception e) {
					}
					return value;
				}
			}
		}
		return null;
	}

	/**
	 * 设置cookie
	 * 
	 * @param name
	 * @param value
	 * @param maxAge
	 */
	public void setCookie(String name, String value, int maxAge) {
		try {
			desUtiles = desUtiles == null ? new DesUtils("ws$^&UUU") : desUtiles;
		} catch (Exception e) {
		}
		String _value = null;
		try {
			_value = desUtiles.encrypt(value);
		} catch (Exception e) {
		}
		// value = DESede.EnCrypt(value,securityCode);
		Cookie cookie = new Cookie(name, _value);
		cookie.setMaxAge(maxAge);//设置有效时间，单位秒
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	/**
	 * 设置cookie
	 * 
	 * @param name
	 * @param value
	 */
//	public void setCookie(String name, String value) {
//		// value = DESede.EnCrypt(value,securityCode);
//		Cookie cookie = new Cookie(name, value);
//		cookie.setMaxAge(3600);////设置有效时间，单位秒
//		//c.setDomain(".v512.com");//设置域名
//		cookie.setPath("/");
//		response.addCookie(cookie);
//	}

	/**
	 * 删除cookie
	 * 
	 * @param name
	 */
	public void delCookie(String name) {
		Cookie cookie = new Cookie(name, null);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
	}
}
