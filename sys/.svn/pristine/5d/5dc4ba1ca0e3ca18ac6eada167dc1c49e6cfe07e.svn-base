package com.flf.engine.safety;

import java.util.HashMap;
import java.util.Map;

/**
 * 安全过滤
* <p>Title: Safety</p>
* <p>Description: </p>
* <p>Company: SH.TY</p> 
* @author Jacopo
* @date 2015年6月30日 下午7:23:19
*/
public class Safety {
	
	public static Map<String, String> SAF_IP_MAP = new HashMap<String, String>();
	
	
	
	/**
	 * IPS 验证
	* <p>Title: safIp</p>
	* <p>Description: </p>
	* @return false验证失败直接阻止
	*/
	public static boolean safIp(String ip) {
		if (SAF_IP_MAP.get(ip) != null) {
			return false;
		}
		return true;
	}
	
//	public static boolean 
}
