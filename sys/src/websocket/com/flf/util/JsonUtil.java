package com.flf.util;

import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.flf.engine.util.Request;
import com.google.common.collect.Maps;

public class JsonUtil {
	public static void main(String[] args) {
//		BB b = new BB();
//		b.b = "b";
//		b.c = "c";
//		
//		String s = JSON.toJSONString(b);
//		AA a = new AA();
//		a.h = s;
//		a.a = "9999999999";
//		String ss = JSON.toJSONString(a);
//		a = JSON.parseObject(ss, AA.class);
		Request req = new Request();
		req.setCode(1001);
//		req.setUid("19880602");
		Map<String, Object> map = Maps.newHashMap();
		map.put("uid", "19880602");
		map.put("key", "key198808");
		map.put("gameId", 1);
		req.setData(JSON.toJSONString(map));
		System.out.println(JSON.toJSONString(req));
	}
	

}

class AA {
	
	public String a;
	public String h;
}	
class BB {
	
	public String b;
	public String c;
}	
