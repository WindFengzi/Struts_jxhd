<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,org.apache.struts2.ServletActionContext"%>
<html>
<head>
<title>东太教学互动管理系统</title>
<link rel="icon" type="image/gif" href="/jxhd/img/base.gif">
<link href="img/basic.css" type="text/css" rel="stylesheet" />
<link href="img/style.css" type="text/css" rel="stylesheet" />
<style type="text/css">
#msg_win {
	position: absolute;
	right: 0px;
	overflow: hidden;
	z-index: 99;
	border: 1px solid #529394;
	background: #F9EFFC;
	width: 120px;
	font-size: 12px;
	margin: 0px;
	display: none;
	top: 503px;
	visibility: visible;
	opacity: 1;
}

#msg_win .icos {
	position: absolute;
	top: 2px;
	right: 2px;
	z-index: 9;
}

.icos a {
	float: left;
	color: #FFFFFF;
	margin: 1px;
	text-align: center;
	font-weight: bold;
	width: 14px;
	height: 22px;
	line-height: 22px;
	padding: 1px;
	text-decoration: none;
	font-family: webdings;
}

.icos a:hover {
	color: #FFCC00;
}

#msg_title {
	background: #AC19E3;
	border-bottom: 1px solid #710B97;
	border-top: 1px solid #FFF;
	border-left: 1px solid #FFF;
	color: #FFFFFF;
	height: 25px;
	line-height: 25px;
	text-indent: 5px;
	font-weight: bold;
}

#msg_content {
	margin: 5px;
	margin-right: 0;
	width: 230px;
	height: 38px;
	overflow: hidden;
}
</style>
</head>
<script>
	/* 退出系统 */
	function f_logout() {
		if (confirm("您确认要退出系统吗")) {
			window.location = "./logout.jsp";
		}
	}
	//清空下划线
	function clear_underline() {
		var no_click = document.getElementById("menu")
				.getElementsByTagName("a");
		for ( var i = 0; i < no_click.length; i++) {
			no_click[i].className = "";
		}
	}
	/*首页*/
	function index() {
		clear_underline();
		var click = document.getElementById("index_index");
		click.className = "active";
		form1.target = 'frm_home_main';//form.target是打开方式，framename（frm_home_main,当前页iframe的name）,在指定框架中打开
		form1.action = 'queryIndex.action';
		form1.submit();
	}

	/* 公告管理  */
	function gonggao() {
		clear_underline();
		var click = document.getElementById("index_bulletin");
		click.className = "active";
		form1.target = 'frm_home_main';//form.target是打开方式，framename（frm_home_main,当前页iframe的name）,在指定框架中打开
		form1.action = 'Articles.action';
		form1.submit();
	}

	/* 教师信息管理 */
	function jsgl() {
		clear_underline();
		var click = document.getElementById("index_teacher");
		click.className = "active";
		document.getElementById("isTeacher").value = "1";
		form1.target = 'frm_home_main';//打开方式，在指定的框架中打开
		form1.action = 'Users.action';
		form1.submit();
	}

	/*学生管理*/
	function xsxx() {
		clear_underline();
		var click = document.getElementById("index_student");
		click.className = "active";
		document.getElementById("isTeacher").value = "0";
		form1.target = 'frm_home_main';
		form1.action = 'Users.action';
		form1.submit();
	}
	/* 教学互动反馈 */
	function dianm() {
		clear_underline();
		var click = document.getElementById("index_teach");
		click.className = "active";
		form1.target = 'frm_home_main';
		form1.action = 'ToDianm.action';
		form1.submit();
	}
	/* 统计分析 */
	function tjfx() {
		clear_underline();
		var click = document.getElementById("index_count");
		click.className = "active";
		form1.target = 'frm_home_main';
		form1.action = 'ToTjfx.action';
		form1.submit();
	}
	/* 系统管理 */
	function xtgl() {
		clear_underline();
		var click = document.getElementById("index_system");
		click.className = "active";
		form1.target = 'frm_home_main';
		form1.action = 'ToXtsz.action';
		form1.submit();
	}
	/* 请假管理 */
	function leaves() {
		clear_underline();
		var click = document.getElementById("index_leave");
		click.className = "active";
		form1.target = 'frm_home_main';
		form1.action = 'Leaves.action';
		form1.submit();
	}
	/*考勤*/
	function userStatus() {
		//form1.target='frm_home_main';
		//form1.action='UsersStatus.action';
		//form1.submit();
		window.open('UsersStatus.action','66',
		'fullscreen = yes , height=100, width=400, top=400, left=400,toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no');
		form1.target = '';
	}
	/*课程设置*/
	function updatePass() {
		form1.target = 'frm_home_main';
		form1.action = 'DepartmentByParentId1.action';
		form1.submit();
		//window.open('/jxhd/ToSetCourse.action', '66', 'fullscreen = yes , height=100, width=400, top=400, left=400,toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no'); 
	}
	
	/*在线人数开启*/
	function onlineStatus(){
		var online_alert = document.getElementById("msg_win");
		online_alert.style.display = "block";
	}
	/* 	gonggao(); */
</script>
<body>
	<%
		String userName = (String) session.getAttribute("userName");
		if (userName == null) {
			response.sendRedirect("logout.jsp");
			return;
		}
	%>
	<form id="form1" name="form1" action="MonitorByUserId.action"
		method="post">
		<input type="hidden" name="t_user1.isTeacher" id="isTeacher" />
		<!--header star-->
		<div class="header">
			<div class="w1000 lh30 h30">
				<img src="img/welcome.png" width="126" height="6" class="fl pt10" />
				<div class="fr white">
					<span class="fb user"><s:property value="#session.userName" />
					</span> <a href="javascript:f_logout()" class="white"> [退出]</a> <a
						href="javascript:updatePass()" class="white">课程设置</a> 
						<a href="#" onclick="javascript:userStatus()" class="white">巡检</a>
						<a href="#" onclick="javascript:onlineStatus()" class="white">在线人数</a>
				</div>
			</div>
		</div>

		<!--banner star-->
		<div class="banner">
			<div class="w1000">
				<img src="img/banner3.jpg" width="1000" height="69" />
				<h1 class="logo">
					<img src="img/logo.png" width="170" height="36" />
				</h1>
				<div id="menu" class="nav f14">
					<a href="#" id="index_index" onclick="javascript:index()">首 页 </a>
					<a href="#" class="active" id="index_bulletin"
						onclick="javascript:gonggao()">公告管理</a> <a href="#"
						id="index_teacher" onclick="javascript:jsgl()">教师信息管理</a> <a
						href="#" id="index_student" onclick="javascript:xsxx()">学生管理</a> <a
						href="#" id="index_teach" onclick="javascript:dianm()">教学互动反馈</a>
					<a href="#" id="index_leave" onclick="javascript:leaves()">请假管理</a>
					<a href="#" id="index_count" onclick="javascript:tjfx()">统计分析</a> <a
						href="#" id="index_system" onclick="javascript:xtgl()">系统管理</a>
				</div>
			</div>
		</div>

		<!--content star-->
		<div class="content w1000 mt30">
			<iframe name='frm_home_main' id="frm_home_main" width=100%
				style="height:700px;overflow:none;border:0px;" height="700px"></iframe>
		</div>

		<div class="cb"></div>
		<!-- 浮动窗口 -->
		<!-- <div id="msg_win">
			<div class="icos">
				<a id="msg_min"  href="javascript:void 0"></a><a
					id="msg_close" title="关闭" href="javascript:void 0">×</a>
			</div>
			<div id="msg_title">在线人数</div>
			<div id="msg_content">
				<iframe src="userStatus/list.jsp" style="border:0px;overflow:none;">
				</iframe>
			</div>
		</div> -->
		<script>
			var Message = {
				set : function() {//最小化与恢复状态切换
					var set = this.minbtn.status == 1 ? [ 0, 1, 'block',
							this.char[0], '最小化' ] : [ 1, 0, 'none',
							this.char[1], '恢复' ];
					this.minbtn.status = set[0];
					this.win.style.borderBottomWidth = set[1];
					this.content.style.display = set[2];
					this.minbtn.innerHTML = set[3];
					this.minbtn.title = set[4];
					this.win.style.top = this.getY().top;
				},
				close : function() {//关闭
					this.win.style.display = 'none';
					window.onscroll = null;
				},
				setOpacity : function(x) {//设置透明度
					var v = x >= 100 ? '' : 'Alpha(opacity=' + x + ')';
					this.win.style.visibility = x <= 0 ? 'hidden' : 'visible';//IE有绝对或相对定位内容不随父透明度变化的bug
					this.win.style.filter = v;
					this.win.style.opacity = x / 100;
				},
				show : function() {//渐显
					clearInterval(this.timer2);
					var me = this, fx = this.fx(0, 100, 0.1), t = 0;
					this.timer2 = setInterval(function() {
						t = fx();
						me.setOpacity(t[0]);
						if (t[1] == 0) {
							clearInterval(me.timer2)
						}
					}, 6);//10 to 6
				},
				fx : function(a, b, c) {//缓冲计算
					var cMath = Math[(a - b) > 0 ? "floor" : "ceil"], c = c || 0.1;
					return function() {
						return [ a += cMath((b - a) * c), a - b ]
					}
				},
				getY : function() {//计算移动坐标
					var d = document, b = document.body, e = document.documentElement;
					var s = Math.max(b.scrollTop, e.scrollTop);
					var h = /BackCompat/i.test(document.compatMode) ? b.clientHeight
							: e.clientHeight;
					var h2 = this.win.offsetHeight;
					return {
						foot : s + h + h2 + 2 + 'px',
						top : s + h - h2 - 2 - 250 + 'px'
					}
				},
				moveTo : function(y) {//移动动画
					clearInterval(this.timer);
					var me = this, a = parseInt(this.win.style.top) || 0;
					var fx = this.fx(a, parseInt(y));
					var t = 0;
					this.timer = setInterval(function() {
						t = fx();
						me.win.style.top = t[0] + 'px';
						if (t[1] == 0) {
							clearInterval(me.timer);
							me.bind();
						}
					}, 6);//10 to 6
				},
				bind : function() {//绑定窗口滚动条与大小变化事件
					var me = this, st, rt;
					window.onscroll = function() {
						clearTimeout(st);
						clearTimeout(me.timer2);
						me.setOpacity(0);
						st = setTimeout(function() {
							me.win.style.top = me.getY().top;
							me.show();
						}, 100);//600 mod 100
					};
					window.onresize = function() {
						clearTimeout(rt);
						rt = setTimeout(function() {
							me.win.style.top = me.getY().top
						}, 100);
					}
				},
				init : function() {//创建HTML
					function $(id) {
						return document.getElementById(id)
					}
					;
					this.win = $('msg_win');
					var set = {
						minbtn : 'msg_min',
						closebtn : 'msg_close',
						title : 'msg_title',
						content : 'msg_content'
					};
					for ( var Id in set) {
						this[Id] = $(set[Id])
					}
					;
					var me = this;
					this.minbtn.onclick = function() {
						me.set();
						this.blur()
					};
					this.closebtn.onclick = function() {
						me.close()
					};
					this.char = navigator.userAgent.toLowerCase().indexOf(
							'firefox') + 1 ? [ '_', '::', '×' ] : [ '0', '2',
							'r' ];//FF不支持webdings字体
					this.minbtn.innerHTML = this.char[0];
					this.closebtn.innerHTML = this.char[2];
					setTimeout(function() {//初始化最先位置
						me.win.style.display = 'none';
						me.win.style.top = me.getY().foot;
						me.moveTo(me.getY().top);
					}, 0);
					return this;
				}
			};
			Message.init();
		</SCRIPT>
		<!--footer star-->
		<div class="foot mt30">
			<div class="w1000">
				<p class="cb tr pt10 pr15 lh22">Copyright © 浙江东太科技有限公司 版权所有</p>
			</div>
		</div>
	</form>
	<script>
		index();
	</script>
</body>
</html>
