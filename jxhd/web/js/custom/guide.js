	/* �˳�ϵͳ */
	function f_logout() {
		if (confirm("��ȷ��Ҫ�˳�ϵͳ��")) {
			window.location = "./logout.jsp";
		}
	}
	//����»���
	function clear_underline() {
		var no_click = document.getElementById("menu")
				.getElementsByTagName("a");
		for ( var i = 0; i < no_click.length; i++) {
			no_click[i].className = "";
		}
	}
	/*��ҳ*/
	function index() {
		clear_underline();
		var click = document.getElementById("index_index");
		click.className = "active";
		form1.target = 'frm_home_main';//form.target�Ǵ򿪷�ʽ��framename��frm_home_main,��ǰҳiframe��name��,��ָ������д�
		form1.action = 'queryIndex.action';
		form1.submit();
	}

	/* �������  */
	function notice() {
		clear_underline();
		var click = document.getElementById("index_bulletin");
		click.className = "active";
		form1.target = 'frm_home_main';//form.target�Ǵ򿪷�ʽ��framename��frm_home_main,��ǰҳiframe��name��,��ָ������д�
		form1.action = 'Articles.action';
		form1.submit();
	}

	/* ��ʦ��Ϣ���� */
	function jsgl() {
		alert("��ʦ����");
		clear_underline();
		var click = document.getElementById("index_teacher");
		click.className = "active";
		document.getElementById("isTeacher").value = "1";
		form1.target = 'frm_home_main';//�򿪷�ʽ����ָ���Ŀ���д�
		form1.action = 'Users.action';
		form1.submit();
	}

	/*ѧ������*/
	function xsxx() {
		clear_underline();
		var click = document.getElementById("index_student");
		click.className = "active";
		document.getElementById("isTeacher").value = "0";
		form1.target = 'frm_home_main';
		form1.action = 'Users.action';
		form1.submit();
	}
	/* ��ѧ�������� */
	function dianm() {
		clear_underline();
		var click = document.getElementById("index_teach");
		click.className = "active";
		form1.target = 'frm_home_main';
		form1.action = 'ToDianm.action';
		form1.submit();
	}
	/* ͳ�Ʒ��� */
	function tjfx() {
		clear_underline();
		var click = document.getElementById("index_count");
		click.className = "active";
		form1.target = 'frm_home_main';
		form1.action = 'ToTjfx.action';
		form1.submit();
	}
	/* ϵͳ���� */
	function xtgl() {
		clear_underline();
		var click = document.getElementById("index_system");
		click.className = "active";
		form1.target = 'frm_home_main';
		form1.action = 'ToXtsz.action';
		form1.submit();
	}
	/* ��ٹ��� */
	function leaves() {
		clear_underline();
		var click = document.getElementById("index_leave");
		click.className = "active";
		form1.target = 'frm_home_main';
		form1.action = 'Leaves.action';
		form1.submit();
	}
	/*����*/
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
	/*�γ�����*/
	function updatePass() {
		form1.target = 'frm_home_main';
		form1.action = 'DepartmentByParentId1.action';
		form1.submit();
		//window.open('/jxhd/ToSetCourse.action', '66', 'fullscreen = yes , height=100, width=400, top=400, left=400,toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no'); 
	}
	
	/*������������*/
	function onlineStatus(){
		var online_alert = document.getElementById("msg_win");
		online_alert.style.display = "block";
	}
	/* 	gonggao(); */