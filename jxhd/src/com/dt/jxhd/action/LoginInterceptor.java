package com.dt.jxhd.action;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
//用户登录的拦截器
public class LoginInterceptor extends MethodFilterInterceptor{
	private static final long serialVersionUID = 1L;
	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		@SuppressWarnings({ "unchecked" })
		Map<String,Object> session = arg0.getInvocationContext().getSession();
		String userName = (String) session.get("userName");
		if(userName == null){
			return "login";
		}
		if (!isOverdue(getProperties().getProperty("use.date"))) {
			return "overdue";
		}
		return arg0.invoke();
	}
	
	protected Properties getProperties(){
		InputStream in =  getClass().getResourceAsStream("/validate.properties"); 
		Properties prop = new Properties(); 
		try {
			prop.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
//		System.out.println("use.date:"+prop.getProperty("use.date")); 
		return prop;
	}
	protected boolean isOverdue(String date) {
		if(date == null) {
			return false;
		}
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		Calendar cal2 = Calendar.getInstance();
		try {
			Date validate = format.parse(date);
			cal2.setTime(validate);
//			System.out.println("2:" + cal.before(cal2));// 现在的时间是否先于传递进来的时间
			return cal.before(cal2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return true;
	}
}
