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
	function notice() {
		clear_underline();
		var click = document.getElementById("index_bulletin");
		click.className = "active";
		form1.target = 'frm_home_main';//form.target是打开方式，framename（frm_home_main,当前页iframe的name）,在指定框架中打开
		form1.action = 'Articles.action';
		form1.submit();
	}

	/* 教师信息管理 */
	function jsgl() {
		alert("教师管理");
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
		window
				.open(
						'UsersStatus.action',
						'66',
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