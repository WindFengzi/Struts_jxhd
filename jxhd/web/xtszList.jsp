<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>系统管理</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script>
	/*参数管理*/
	function sub1() {
		form1.target = 'frm_home_main1';
		form1.action = "Params.action";
		form1.submit();
	}
	/*试题管理*/
	function Items() {
		form1.target = 'frm_home_main1';
		form1.action = "Items.action";
		form1.submit();
	}
	/*评价内容*/
	function pjnr() {
		form1.target = 'frm_home_main1';
		form1.action = "EvaluationItems.action";
		form1.submit();
	}
	/*评价等级*/
	function pjdj() {
		form1.target = 'frm_home_main1';
		form1.action = "EvaluationGrades.action";
		form1.submit();
	}
	/* 老师点评 */
	function teacherComment() {
		form1.target = '';
		form1.action = "EvaluationTeacher.action";
		form1.submit();
	}
	/* 学生评论 */
	function studentComment() {
		form1.target = '';
		form1.action = "EvaluationStudent.action";
		form1.submit();
	}
	/*班级管理*/
	function bjgl() {
		form1.target = 'frm_home_main1';
		form1.action = "Classes.action";
		form1.submit();
	}
	/*课时节设置*/
	function sections() {
		form1.target = 'frm_home_main1';
		form1.action = "Sections.action";
		form1.submit();
	}
	/*课程设置*/
	function courseShezhi() {
		form1.target = '';
		form1.action = "CourseShezhi.action";
		form1.submit();
	}
	/*部门管理*/
	function departments() {
		form1.target = '';
		form1.action = "ToDepartments.action";
		form1.submit();
	}
	/*角色管理*/
	function roles() {
		form1.target = "frm_home_main1";
		form1.action = "Roles.action";
		form1.submit();
	}
	/*资源管理*/
	function resources() {
		form1.target = "frm_home_main1";
		form1.action = "Resources.action";
		form1.submit();
	}
	/*首页设置*/
	function index_edit(){
		form1.target = "frm_home_main1";
		form1.action = "queryIndex1.action"
		form1.submit();
	}
	
	//添加预习
	function addPreview(){
		form1.target = '';
		form1.action = "ToPreviewItems.action";
		form1.submit();
	}
	//查看预习
	function lookPreview(){
		form1.target = '';
		form1.action = "ToReleasePreviewLogList.action";
		form1.submit();
	}
	// 发布预习
	function releasePreview() {
		form1.target = '';
		form1.action = "ToReleasePreview.action";
		form1.submit();
	}
</script>

</head>

<body>
	<form id="form1" name="form1" action="Params.action" method="post">
		<input type="hidden" name="t_sys_parameter.id" id="id" />


		<div class="w170 fl" style="height: 666px;">
			<img src="img/xtgl.jpg" width="170" height="77" alt="系统管理"
				class="mb15" />

			<h2 class="link fb">系统管理</h2>


			<ul id="accordion" class="accordion">


				<li>
					<div class="link">试题管理</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:Items()">试题管理</a></li>
					</ul>
				</li>
				<li>
					<div class="link">引导管理</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:addPreview()">添加预习</a></li>
						<li><a href="#" onclick="javascript:lookPreview()">查看预习</a>
						<li><a href="#" onclick="javascript:releasePreview()">发布预习</a>
						</li>
					</ul>
				</li>
				<li>
					<div class="link">部门管理</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:departments()">部门管理</a></li>
					</ul>
				</li>
				<li>
					<div class="link">课程管理</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:sections()">课时节设置</a></li>
						<li><a href="#" onclick="javascript:courseShezhi()">课程设置</a>
						</li>
					</ul>
				</li>
				<li><div class="link">评价管理</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:teacherComment()">老师点评</a></li>
						<li><a href="#" onclick="javascript:studentComment()">学生评论</a></li>
						<li><a href="#" onclick="javascript:pjnr()">评价内容</a></li>
						<li><a href="#" onclick="javascript:pjdj()">评价等级</a></li>
					</ul>
				</li>
				<li>
					<div class="link">班级管理</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:bjgl()">班级管理</a></li>
					</ul>
				</li>
				<li>
					<div class="link">参数管理</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:sub1()">参数管理</a></li>
						<li><a href="#" onclick="javascript:index_edit()">首页配置</a></li>
					</ul>
				</li>
				<li><div class="link">权限管理</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:roles()">角色管理</a></li>
						<li><a href="#" onclick="javascript:resources()">资源管理</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="w800 fr">
			<iframe name='frm_home_main1' id="frm_home_main1" width=100%
				height="666px" style="border:0"></iframe>
		</div>
	</form>
	<script>
		sub1();//默认显示参数页
	</script>
</body>
</html>