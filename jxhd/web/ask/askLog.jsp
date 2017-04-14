<!DOCTYPE html >
<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>浙江省排污权交易中心</title>
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
	function answer(askId, studentId) {
		form1.askId.value = askId;
		form1.studentId.value = studentId;
		form1.action = "AnswerById.action";
		form1.submit();
	}
</script>
<style>
html {
	overflow-x: hidden;
}

a:link {
	color: #FFFFFF
} /* 未访问的链接 */
a:visited {
	color: #FFFFFF
} /* 已访问的链接 */
a:hover {
	color: #00FF00
} /* 鼠标移动到链接上 */
a:active {
	color: #0000FF
} /* 选定的链接 */
</style>
</head>

<body>
	<%
		String url = request.getRequestURL().toString();
		url = url.substring(0, url.indexOf("jxhd"));
		List users = (List) request.getAttribute("t_user1.data");
		List answers = (List) request.getAttribute("answerLog.data");
	%>
	<form name="form1" method="post" action="ToDate.action" id="form1">
		<s:hidden name="answerLog.askId" id="askId"></s:hidden>
		<s:hidden name="answerLog.studentId" id="studentId"></s:hidden>
		<div class="m5 tuxing p10">
			<div class="pb20 dtxx">
				<h3 class="lh34 pl10 fb">
					答题信息
					<s:if test="student_group.groupName!=null">
(选中组：<s:property value='student_group.groupName' />组)
</s:if>
				</h3>
				<ul style="width:800px">

					<%
						t_user t_user1 = null;
						answer_log answer_log1 = null;

						for (int n = 0; n < users.size(); n++) {
							String flag = "false";
							t_user1 = (t_user) users.get(n);
							for (int m = 0; m < answers.size(); m++) {
								answer_log1 = (answer_log) answers.get(m);
								if (t_user1.getUserId().equals(answer_log1.getStudentId())) {
									flag = "true";
									if (answer_log1.getIsRight().equals("1")
											|| answer_log1.getIsRight().equals("999")) {
					%>
					<a>
						<li class="lan">
							<p class="lh22 f14 tc"><%=t_user1.getIdNumber()%></p>
							<p class="lh26 mt40 tc"><%=t_user1.getName()%></p>
							<p class="lh22 f14 tc">
								<a href="javascript:answer(<s:property value='askLog.askId' />,'<%=t_user1.getUserId()%>')">答案</a>
							</p></li>
					</a>
					<%
						} else if (answer_log1.getIsRight().equals("0")) {
					%>
					<li class="hong"><p class="lh22 f14 tc"><%=t_user1.getIdNumber()%></p>
						<p class="lh26 mt40 tc"><%=t_user1.getName()%></p>
						<p class="lh22 f14 tc">
							<a
								href="javascript:answer(<s:property value='askLog.askId' />,'<%=t_user1.getUserId()%>')">答案</a>
						</p>
					</li>
					<%
						} else {
					%>
					<li class="ceng"><p class="lh22 f14 tc"><%=t_user1.getIdNumber()%></p>
						<p class="lh26 mt40 tc"><%=t_user1.getName()%></p>
						<p class="lh22 f14 tc">
							<a
								href="javascript:answer(<s:property value='askLog.askId' />,'<%=t_user1.getUserId()%>')">答案</a>
						</p></li>
					<%
						}
								}
							}
							if (flag.equals("false")) {
					%>

					<li class="ceng"><p class="lh22 f14 tc"><%=t_user1.getIdNumber()%></p>
						<p class="lh26 mt40 tc"><%=t_user1.getName()%></p>
						<p class="lh22 f14 tc">
							<a
								href="javascript:answer(<s:property value='askLog.askId' />,'<%=t_user1.getUserId()%>')">答案</a>
						</p></li>

					<%
						}
						}
					%>

					<div class="cb"></div>
				</ul>
			</div>
			<div class="pb20 dianming bgwhite">
				<ul style="height:50px" class=" p10 canzhao ">
					<s:if test="testItem.questiontype!=3">
						<li><img src="img/lan2.jpg" width="11" height="11" />
							<p class="f14 blue3 lh28 tc">正确</p></li>
						<li><img src="img/hong2.jpg" width="11" height="11" />
							<p class="f14 blue3 lh28 tc">错误</p></li>
						<li><img src="img/ceng2.jpg" width="11" height="11" />
							<p class="f14 blue3 lh28 tc">未答</p></li>
					</s:if>
					<s:else>
						<li><img src="img/lan2.jpg" width="11" height="11" />
							<p class="f14 blue3 lh28 tc">已答</p></li>
						<li><img src="img/ceng2.jpg" width="11" height="11" />
							<p class="f14 blue3 lh28 tc">未答</p></li>
					</s:else>
					<div class="cb"></div>
				</ul>
			</div>
		</div>
	</form>
</body>
</html>
