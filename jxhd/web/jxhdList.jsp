<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>教学互动反馈</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script  src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript" ></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script>
	/*学生互评*/
	function xshp() {
		form1.target = 'frm_home_main1';
		form1.action = "EvaluationResults.action";
		form1.submit();
	}
	/*组间互评*/
	function zjhp() {
		form1.target = 'frm_home_main1';
		form1.action = "EvaluationGroups.action";
		form1.submit();
	}
	/*即问即答、抢答活动、挑人作答、挑组作答，根据数据类型*/
	function ask(askType) {
		form1.askType.value = askType;
		form1.target = 'frm_home_main1';
		form1.action = "Asks.action";
		form1.submit();
	}
	/*设置组*/
	function szFenzu() {
		form1.target = 'frm_home_main1';
		form1.action = "StudentGroups.action";
		form1.submit();
	}
	/*点名*/
	function dianm() {
		form1.target = 'frm_home_main1';
		form1.action = '/jxhd/dm/list.jsp';
		form1.submit();
		
	}
	/*添加问答,根据askType是判断是添加何种类型的题目*/
	function addItem(askType) {
		form1.askType.value = askType;
		form1.target = 'frm_home_main1';
		form1.action = "ToSelectItems.action";
		form1.submit();
	}
	
		//错题分发
	function errorDispatcher(){
		form1.target = '';
		form1.action = "ToErrorItems.action";
		form1.submit();
	}
	
		/*针对错题设置组*/
	function errorGroup() {
		form1.target = '';
		form1.action = "StudentGroupsError.action";
		form1.submit();
	
	}

	/* 学生提问 */
	function askQuestions() {
		form1.target = 'frm_home_main1';
		form1.action = "AskQuestionsByStudent.action";
		form1.submit();
	}
	/*待定*/
	function MyDai() {
		form1.target = 'frm_home_main1';
		form1.action = "Daiding.action";
		form1.submit();
	}
</script>

</head>

<body>
	<form id="form1" name="form1"  method="post">
		<input type="hidden" name="student.studentId" id="studentId" /> 
		<input 	type="hidden" name="askLog.askType" id="askType" />
		<div class="w170 fl">
			<img src="img/jxhdfk.jpg" width="170" height="57" alt="教学互动反馈"
				class="mb15" />

			<h2 class="link fb">教学互动反馈</h2>

			<ul id="accordion" class="accordion">
				<li>
					<div class="link">点名</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:dianm()">点名</a></li>
					</ul>
				</li>
				<li>
					<div class="link">即问即答</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:ask(0)">即问即答</a></li>
						<li><a href="#" onclick="javascript:addItem(0)">添加问答</a></li>
					</ul>
				</li>
				<li><div class="link">抢答活动</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:ask(1)">抢答活动</a></li>
						<li><a href="#" onclick="javascript:addItem(1)">添加抢答</a></li>
					</ul>
				</li>
				<li><div class="link">挑人作答</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:ask(2)">挑人作答</a></li>
						<li><a href="#" onclick="javascript:addItem(2)">添加问答</a></li>
					</ul>
				</li>
				<li><div class="link">挑组作答</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:ask(3)">挑组作答</a></li>
						<li><a href="#" onclick="javascript:addItem(3)">添加问答</a></li>
					</ul>
				</li>
				<li><div class="link">设置组</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:szFenzu()">设置组</a></li>
					</ul>
				</li>
				<li><div class="link">学生互评</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:xshp()">学生互评</a></li>
					</ul>
				</li>
				<li><div class="link">组间互评</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:zjhp()">组间互评</a></li>
					</ul>
				</li>
				<li><div class="link">图片比对</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:ask(4)">图片比对</a></li>
						<li><a href="#" onclick="javascript:addItem(4)">添加比对</a></li>
					</ul>
				</li>
				<li><div class="link">错题分发</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:errorDispatcher()">错题分发</a></li>
						<li><a href="#" onclick="javascript:errorGroup()">设置组</a></li>
					</ul>
				</li>
				<li><div class="link">教学问答</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:askQuestions()">学生提问</a></li>
						<li><a href="#" onclick="javascript:MyDai()">待定</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="w800 fr">
			<iframe name='frm_home_main1' src="/jxhd/dm/list.jsp"
				id="frm_home_main1" height="690px" width=100% style="border:0px"></iframe>
		</div>
	</form>
</body>
</html>