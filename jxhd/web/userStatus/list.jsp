<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
</head>

<body>
    
	<form id="form1" name="form1" action="Articles.action" method="post">
		<%
			List users = (List) request.getAttribute("t_user1.data");
			String msg = null;
			if (request.getAttribute("msg") != null) {
				msg = request.getAttribute("msg").toString();
			}
		%>
		<div class="m5 tuxing p20 ">
			<ul class="dianming bgwhite p10">
				<%
					if (msg != null) {
						t_user t_user1 = null;
						String ss[] = msg.split(";");
						int appNum = 0;
						int htNum = 0;
						int zxNum = 0;
						int wlNum = 0;
						for (int i = 0; i < users.size(); i++) {
							String flag = "false";
							t_user1 = (t_user) users.get(i);
							System.out.println("===:::::::::" + t_user1.getUserId());
							for (int m = 0; m < ss.length; m++) {
								System.out.println(ss[m]);
								String aa[] = ss[m].split(",");
								for (int n = 0; n < aa.length; n++) {
									System.out.println(aa[n]);
									if (t_user1.getUserId().toString().equals(aa[0])) {
										System.out.println("======" + aa[1]);
										if (aa[1].equals("2")) {
											flag = "false";

										} else if (aa[1].equals("1")) {
											flag = "houtai";
										} else if (aa[1].equals("3")) {
											flag = "zaixian";
										} else {
											flag = "wangluo";
										}
										System.out.println("111======" + flag);
									}
								}
							}

							if (flag.equals("wangluo")) {
								wlNum++;/* 网络 */
				%>
				<li><img src="/jxhd/img/lan1.jpg" width="38" height="40" />
					<p class="f14 blue3 lh28"><%=t_user1.getName()%></p></li>
				<%
					}
							if (flag.equals("false")) {
								appNum++; /* 退出 */
				%>
				<li><img src="/jxhd/img/hong1.jpg" width="38" height="40" />
					<p class="f14 blue3 lh28"><%=t_user1.getName()%></p></li>
				<%
					}
							if (flag.equals("zaixian")) {
								zxNum++;/*在线  */
				%>
				<li><img src="/jxhd/img/green1.jpg" width="38" height="40" />
					<p class="f14 blue3 lh28"><%=t_user1.getName()%></p></li>
				<%
					}
							if (flag.equals("houtai")) {
								htNum++;/* 后台 */
				%>
				<li><img src="/jxhd/img/ceng1.jpg" width="38" height="40" />
					<p class="f14 blue3 lh28"><%=t_user1.getName()%></p></li>
				<%
					}
						}
				%>
				<div class="cb"></div>
			</ul>
			<ul class="dianming1 bgwhite p10 canzhao">
				<li><img src="/jxhd/img/green1.jpg" width="38" height="40" />
				<p class="f14 blue3 lh28 w100 tc">
						在线：<%=zxNum%></p></li>
				<li><img src="/jxhd/img/lan1.jpg" width="38" height="40" />
					<p class="f14 blue3 lh28 w100 tc">
						切换了网络：<%=wlNum%></p></li>
				<li><img src="/jxhd/img/ceng1.jpg" width="38" height="40" />
					<p class="f14 blue3 lh28 w100 tc">
						切换至后台：<%=htNum%></p></li>
				<li><img src="/jxhd/img/hong1.jpg" width="38" height="40" />
				<p class="f14 blue3 lh28 w100 tc">
						退出了APP：<%=appNum%></p></li>
				<div class="cb"></div>
			</ul>
			<div style="position: absolute;top: 0px;left: 0px">在线：<%=zxNum %>
				  <br/>
				      离开：<%=appNum %> 
			</div>
			<%
				} else {
			%>
			<div style='padding:15px;padding-left:60px;color:red;font-size:24px'>请检查服务端是否开启或者是否选课。</div>
			<%
				}
			%>
		</div>

	</form>
	<script type="text/javascript">
		function remainTime() {
			form1.action = 'UsersStatus.action';
			form1.submit();
			//setTimeout("remainTime()",100000);
			/* window.setInterval('remainTime()', 600000); */
		}
		window.setInterval('remainTime()', 6000);
	</script>
</body>
</html>