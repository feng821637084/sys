package com.flf.engine.handler;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.apache.commons.pool.impl.StackObjectPool;
import org.apache.log4j.Logger;

import com.flf.engine.util.ClassesInPackage;

/**
 * 多池管理
* <p>Title: HandlerFactory</p>
* <p>Description: </p>
* <p>Company: SH.TY</p> 
* @author Jacopo
* @date 2015年7月1日 下午5:32:32
*/
public class HandlerFactory {

    public static Logger  logger = Logger.getLogger(HandlerFactory.class);
    private  Map<Integer,StackObjectPool> cache = new HashMap<Integer, StackObjectPool>();
    private  static HandlerFactory instance = new HandlerFactory();

    public Object get(Integer i) {
        return cache.get(i);
    }

    public static HandlerFactory getInstance(){
        return instance;
    }

    public void init() {
        logger.info("loading handlers");

        String className = null;
        try {
        	Set<Class<?>> tempmap = parseMappingTable();
            for (Class<?> o : tempmap) {
            	String[] sb = o.getCanonicalName().toString().split("_");
                Integer requestCode = Integer.valueOf(sb[1]);
                    //                   System.out.println(className);
                Handler factory = (Handler) o.newInstance();
                cache.put(requestCode, new StackObjectPool(factory, 100, 10));
                    
            }
        } catch(Exception ex) {
            logger.error("can't init handler, className=" + className , ex);
        }

        logger.info("ObjectFactory init ok");
    }

    /**
     * 约定优先于配置
    * <p>Title: parseMappingTable</p>
    * <p>Description: </p>
    * @return
    */
    private  Set<Class<?>> parseMappingTable() {
        //自动扫描
        Set<Class<?>> map = ClassesInPackage.getClasses("com.flf.action");
        return map;
    }

}

