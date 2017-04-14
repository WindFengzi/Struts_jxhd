<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>统计分析</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script><!-- 应该没有用到 -->
<script  src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript" ></script><!-- 应该没有用到 -->
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script>
	/*考勤统计*/
	function kqtj() {
		form1.target = 'frm_home_main1';
		form1.action = "ToKqtj.action";
		form1.submit();
	}
	/*问答统计*/
	function twtj() {
		form1.target = 'frm_home_main1';
		form1.action = "Twtj.action";
		form1.submit();
	}
	/*回答统计*/
	function hdtj() {
		form1.target = 'frm_home_main1';
		form1.action = "Hdtj.action";
		form1.submit();
	}
</script>

</head>

<body>
	<form id="form1" name="form1" action="Articles.action" method="post">
		<input type="hidden" name="student.studentId" id="studentId" /> <input
			type="hidden" name="askLog.askType" id="askType" />
		<div class="w170 fl">
			<img src="img/tjfx.jpg" width="170" height="34" alt="统计分析"
				class="mb15" />
			<h2 class="link fb">统计分析</h2>
			<ul id="accordion" class="accordion">
				<li><div class="link">问答统计</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:twtj()">提问统计</a></li>
						<li><a href="#" onclick="javascript:hdtj()">回答统计</a></li>
					</ul>
				</li>
				<li>
					<div class="link">考勤统计</div>
					<ul class="submenu">
						<li><a href="#" onclick="javascript:kqtj()">考勤统计</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="w800 fr">
			<iframe name='frm_home_main1' src="/jxhd/dm/list.jsp"
				id="frm_home_main1" height="690px" width=100%  style="border:0px"></iframe>
		</div>
	</form>
<script>
	twtj();
</script>
</body>
</html>
