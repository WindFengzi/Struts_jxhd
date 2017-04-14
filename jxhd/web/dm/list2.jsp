<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>点名底部的页面</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script  src="/jxhd/js/PageCtrl.js"></script>
<script  src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
</head>

<body>
	<form id="form1" name="form1" action="Articles.action" method="post">
		<%
			String msg = request.getAttribute("msg").toString();
			if (msg.equals("null")) {
		%>
		<font size="20" color="red">您未进行课程设置，请设置课程！</font>
		<%
			} else {
		%>
		<%
			List<t_user> users = (List) request.getAttribute("t_user1.data");
			List<attendance> attendances = (List) request.getAttribute("attendance.data");
			List<leave> leaves = (List) request.getAttribute("leave.data");
		%>
		<ul class="dianming bgwhite p10">
			<%
				t_user t_user1 = null;
					attendance attendance = null;
					leave leave = null;

					for (int i = 0; i < users.size(); i++) {
						String flag = "false";
						t_user1 = (t_user) users.get(i);
						for (int m = 0; m < attendances.size(); m++) {
							attendance = (attendance) attendances.get(m);
							if (t_user1.getUserId().equals(
									attendance.getStudentId())) {
								flag = "true";
							}
						}
						for (int n = 0; n < leaves.size(); n++) {
							leave = (leave) leaves.get(n);
							if (t_user1.getUserId().equals(
									Integer.valueOf(leave.getStudentId()))) {
								flag = "qingjia";
							}
						}

						if (flag.equals("true")) {
			%>
			<li><img src="/jxhd/img/lan1.jpg" width="38" height="40" />
				<p class="f14 blue3 lh28" style="width:60px;text-align:center"><%=t_user1.getName()%></p>
			</li>
			<%
				}
						if (flag.equals("qingjia")) {
			%>
			<li><img src="/jxhd/img/hong1.jpg" width="38" height="40" />
				<p class="f14 blue3 lh28" style="width:60px;text-align:center"><%=t_user1.getName()%></p>
			</li>
			<%
				}
						if (flag.equals("false")) {
			%>
			<li><img src="/jxhd/img/ceng1.jpg" width="38" height="40" />
				<p class="f14 blue3 lh28" style="width:60px;text-align:center"><%=t_user1.getName()%></p>
			</li>
			<%
				}
					}
			%>
			
		</ul>
		<div class="cb"></div>
		<ul class="dianming bgwhite p10 canzhao">
			<li><img src="/jxhd/img/lan1.jpg" width="38" height="40" />
				<p class="f14 blue3 lh28 tc">已到</p></li>
			<li><img src="/jxhd/img/ceng1.jpg" width="38" height="40" />
				<p class="f14 blue3 lh28 tc">未到</p></li>
			<li><img src="/jxhd/img/hong1.jpg" width="38" height="40" />
				<p class="f14 blue3 lh28 tc">请假</p></li>
		</ul>
		<div class="cb"></div>

		<%
			}
		%>
	</form>
</body>
</html>