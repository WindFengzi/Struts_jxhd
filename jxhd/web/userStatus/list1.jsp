<%@ page language="java" import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
  <head>
   <link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
 <script  src="/jxhd/js/PageCtrl.js"></script>
  <script src="/jxhd/img/jquery-1.8.3.min.js"></script>
  <script src="/jxhd/img/tab.js" type="text/javascript" ></script>
  <script type="text/javascript" src="/jxhd/img/index.js"></script>
  </head>
  
  <body>
  <form id="form1" name="form1" action="Articles.action" method="post">
 <%
    List users = (List)request.getAttribute("t_user1.data");
    String msg = null;
    if(request.getAttribute("msg")!=null){
    	msg = request.getAttribute("msg").toString();
    }
     %>
<ul class="dianming bgwhite p10">
<%
	if(msg!=null){
	t_user t_user1 = null;
	String ss[] = msg.split(";");
	for(int i=0;i<users.size();i++){
	String flag = "false";
		t_user1 = (t_user)users.get(i);
		System.out.println("===:::::::::"+t_user1.getUserId());
        	for(int m=0;m<ss.length;m++){
        		System.out.println(ss[m]); 
        		String aa[] = ss[m].split(",");
        		for(int n=0;n<aa.length;n++){
        			System.out.println(aa[n]); 
        			if(t_user1.getUserId().toString().equals(aa[0])){
        			System.out.println("======"+aa[1]);
        				if(aa[1].equals("2")){
        					flag = "false";
        				}else if(aa[1].equals("1")){
        					flag = "houtai";
        				}else if(aa[1].equals("3")){
        					flag = "zaixian";
        				}else{
        					flag = "wangluo";
        				}
        				System.out.println("111======"+flag);
        			}
        		}
        	}
			
 if(flag.equals("wangluo")){
  %>
<li> <img src="/jxhd/img/lan1.jpg" width="38" height="40" /> <p class="f14 blue3 lh28"><%=t_user1.getName() %></p> </li>
 <%}  if(flag.equals("false")){
  %>
<li> <img src="/jxhd/img/hong1.jpg" width="38" height="40" /> <p class="f14 blue3 lh28"><%=t_user1.getName() %></p> </li>
 <%}   if(flag.equals("zaixian")){
  %>
<li> <img src="/jxhd/img/green1.jpg" width="38" height="40" /> <p class="f14 blue3 lh28"><%=t_user1.getName() %></p> </li>
 <%}  if(flag.equals("houtai")){
  %>
<li> <img src="/jxhd/img/ceng1.jpg" width="38" height="40" /> <p class="f14 blue3 lh28"><%=t_user1.getName() %></p> </li>
 <%} } %>
  <div class="cb"></div>
</ul>
<ul class="dianming1 bgwhite p10 canzhao">
<li> <img src="/jxhd/img/green1.jpg" width="38" height="40" /><p class="f14 blue3 lh28 w70 tc">在线</p> </li>
<li> <img src="/jxhd/img/lan1.jpg" width="38" height="40" /> <p class="f14 blue3 lh28 w70 tc">切换了网络</p> </li>
<li> <img src="/jxhd/img/ceng1.jpg" width="38" height="40" /> <p class="f14 blue3 lh28 w70 tc">切换至后台</p> </li>
<li> <img src="/jxhd/img/hong1.jpg" width="38" height="40" /><p class="f14 blue3 lh28 w70 tc">退出了APP</p> </li>
 <div class="cb"></div>
</ul>
<%}else{ %>
	<div style='padding:15px;padding-left:60px;color:red;font-size:24px'>请检查服务端是否开启或者是否选课。</div>
<%} %>


    </form>
    </body>
</html>