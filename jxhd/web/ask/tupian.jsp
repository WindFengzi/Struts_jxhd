<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
<title>查看图片比对</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/jxhd/img/jquery-1.8.3.min.js"></script>
</head>
<style type="text/css">
canvas {
	border: dashed 2px #CCC
}
</style>
<script type="text/javascript">
	//查看图片
	function askLog() {
		form1.target = 'frm_home_main';
		form1.msg.value = "1";
		form1.action = "AskLogTupian.action";
		form1.submit();
	}
	function askLogBidui() {
		form1.target = 'frm_home_main';
		form1.msg.value = "0";
		form1.action = "AskLogBidui.action";
		form1.submit();
	}
	function qiehuan() {
		var users = document.getElementsByName("users");
		var userId = "";
		for ( var i = 0; i < users.length; i++) {
			if (users[i].checked) {

				userId = userId + users[i].value + ",";
			}
		}
		userId = userId.substring(0, userId.length - 1);
		if (userId == '') {
			userId = '-1';
		}
		form1.hobby.value = userId;
		if (form1.msg.value == '0') {
			askLogBidui();
		} else {
			askLog();
		}
	}
	function iFrameHeight() {
		var ifm = document.getElementById("frm_home_main1");
		var subWeb = document.frames ? document.frames["frm_home_main1"].document
				: ifm.contentDocument;
		if (ifm != null && subWeb != null) {
			ifm.height = subWeb.body.scrollHeight;
		}
	}
</script>
<body>
	<form name="form1" method="post" action="ToDate.action" id="form1">
		<s:hidden name="msg" id="msg"></s:hidden>
		<s:hidden name="askLog.askId" id="askId"></s:hidden>
		<s:hidden name="askLog.itemId" id="itemId"></s:hidden>
		<s:hidden name="askLog.courceId" id="courceId"></s:hidden>
		<s:hidden name="askLog.askType" id="askType"></s:hidden>
		<s:hidden name="t_user1.hobby" id="hobby"></s:hidden>
		<div class="w800 fr">
			<div class="postion lh28 mb15">
				<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">图片比对
				</a> 》 <a href="#">开始比对</a>
			</div>
			<div class="w800_con ">
				<div class="tit2">
					<h2 class="lh32 pl30">
						<span class="fb f14">开始比对</span> Start Ratio
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
				<div class="con1">
					<div class="p30 qd">
						<s:iterator value="t_user1.data" status="stat">
							<input name="users" type="checkbox" onchange="qiehuan()"
								value="<s:property value='userId'/>" />
							<s:property value='name' />
						</s:iterator>
					</div>
				</div>
				<input name="input" type="button" value="查看图片"
					onclick="javascript:askLog()" class="bt1 fb grey1 ml50" /> <input
					name="input" type="button" value="融合比对"
					onclick="javascript:askLogBidui()" class="bt1 fb grey1 ml50" />
				<div class="con1">

					<iframe name='frm_home_main' src="AskLogTupian.action"
						id="frm_home_main" width=100% height=700px; style="border:0px"></iframe>
				</div>
			</div>
		</div>
	</form>
</body>
<script>
	qiehuan();
</script>
</html>