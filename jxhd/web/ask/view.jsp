<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>问答：即问即答、抢答活动、挑人作答、挑组作答、图片比对查看</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script>
	function sub1() {
		var editor = CKEDITOR.instances.editor1;
		form1.body.value = editor.getData();
		form1.action = "SaveArticle.action";
		form1.submit();
	}
	function askLog() {
		form1.target = 'frm_home_main';
		if (form1.askType.value == '1') {
			form1.action = "AskLog1.action";
		} else {
			form1.action = "AskLog.action";
		}
		form1.submit();
	}
	function askTubiao() {
		form1.target = 'frm_home_main';
		form1.action = "AskTubiao.action";
		form1.submit();
	}
</script>
</head>
<body>
	<%
		String url = request.getRequestURL().toString();
		url = url.substring(0, url.indexOf("jxhd"));
		List users = (List) request.getAttribute("t_user1.data");
		List answers = (List) request.getAttribute("answerLog.data");
		String askType = request.getAttribute("askLog.askType").toString();
		String name = "";
		if (askType != null) {
			if (askType.equals("0")) {
				name = "即问即答";
			} else if (askType.equals("1")) {
				name = "抢答活动";
			} else if (askType.equals("2")) {
				name = "挑人作答";
			} else if (askType.equals("4")) {
				name = "图片比对";
			} else {
				name = "挑组作答";
			}
		}
	%>
	<form name="form1" method="post" action="ToDate.action" id="form1">
		<s:hidden name="askLog.askId" id="askId"></s:hidden>
		<s:hidden name="askLog.itemId" id="itemId"></s:hidden>
		<s:hidden name="askLog.courceId" id="courceId"></s:hidden>
		<s:hidden name="askLog.askType" id="askType"></s:hidden>
		<s:hidden name="student_group.groupName" id="groupName"></s:hidden>
		<div class="w800 fr">
			<div class="postion lh28 mb15">
				<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#"><%=name%></a>
				》 <a href="#"><%=name%></a>
			</div>
			<div class="w800_con ">
				<div class="tit2">
					<h2 class="lh32 pl30">
						<span class="fb f14"><%=name%></span> Question and Answer
					</h2>
				</div>
				<div class="con1">
					<div class="p30 qd">
						<p>题目：</p>
						<p>
							<s:property value='testItem.question' escape="false" />
						</p>
						<s:if test="testItem.choicea!=''">
							<p>
								<s:property value='testItem.choicea' escape="false" />
							</p>
						</s:if>
						<s:if test="testItem.choiceb!=''">
							<p>
								<s:property value='testItem.choiceb' escape="false" />
							</p>
						</s:if>
						<s:if test="testItem.choicec!=''">
							<p>
								<s:property value='testItem.choicec' escape="false" />
							</p>
						</s:if>
						<s:if test="testItem.choiced!=''">
							<p>
								<s:property value='testItem.choiced' escape="false" />
							</p>
						</s:if>
						<s:if test="testItem.choicee!=''">
							<p>
								<s:property value='testItem.choicee' escape="false" />
							</p>
						</s:if>
						<s:if test="testItem.choicef!=''">
							<p>
								<s:property value='testItem.choicef' escape="false" />
							</p>
						</s:if>
						<s:if test="testItem.choiceg!=''">
							<p>
								<s:property value='testItem.choiceg' escape="false" />
							</p>
						</s:if>
					</div>

				</div>
				<input name="input" type="button" value="查看答题情况"
					onclick="javascript:askLog()" class="bt1 fb grey1 ml50" />
				<s:if test="askLog.askType!=1">

					<input name="input" type="button" value="查看图表"
						onclick="javascript:askTubiao()" class="bt1 fb grey1 ml50" />
				</s:if>

				<div class="con1">

					<iframe name='frm_home_main' src="AskLog.action" id="frm_home_main"
						width=100% height=700px; style="border:0px"></iframe>
				</div>
			</div>
		</div>
	</form>
</body>
<script>
	askLog();
</script>
</html>