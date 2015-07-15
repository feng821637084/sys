/*
 * $RCSfile: DispatcherServlet.java,v $
 * $Date: 2014-2-16  $
 *
 * Copyright (C) 2005 WeiShang, Inc. All rights reserved.
 *
 * This software is the proprietary information of WeiShang, Inc.
 * Use is subject to license terms.
 */

package com.flf.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * <p>Title: DispatcherServlet</p> 
 * <p>Description: </p> 
 * <p>Copyright: Copyright (c) 2006</p> 
 * @author jacopo
 */
public class DispatcherServlet extends
		org.springframework.web.servlet.DispatcherServlet {
	private static final long serialVersionUID = -9176553878825909059L;
	private static String charset = "text/html;charset=UTF-8";
	@Override
	protected void doDispatch(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType(charset);
		super.doDispatch(request, response);
	}
}


