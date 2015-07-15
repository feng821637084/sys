/*
 * $RCSfile: ContextUtil.java,v $
 * $Date: 2014-4-30  $
 *
 * Copyright (C) 2005 WeiShang, Inc. All rights reserved.
 *
 * This software is the proprietary information of WeiShang, Inc.
 * Use is subject to license terms.
 */

package com.flf.util;

import org.springframework.context.ApplicationContext;


/**
 * <p>Title: ContextUtil</p> 
 * <p>Description: </p> 
 * <p>Copyright: Copyright (c) 2006</p> 
 * @author jacopo
 */
public class ContextUtil {
	private static ApplicationContext context;  
    public static ApplicationContext getContext() {  
       return context;  
    }  
    public static Object getBean(String beanId)  {  
       Object bean = context.getBean(beanId);  
       if (bean == null)  
           return null;  
       return bean;  
    }  
    public static void setContext(ApplicationContext ctx) {  
        context = ctx;  
       }  
      
}


