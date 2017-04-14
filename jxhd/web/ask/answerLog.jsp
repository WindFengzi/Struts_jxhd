<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<title></title>
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
</style>
<style type="text/css">
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
		<div class="w800_con ">
			<div class="con1">
				<div class="p30 qd">
					<p>答题信息：</p>
					<p>
						答题时间：
						<s:date name="answerLog.answerTime" format="yyyy-MM-dd HH:mm:ss" />
					</p>
					<p>
						答案：
						<s:if test="testItem.questiontype==0||testItem.questiontype==1">
							<s:if test="answerLog.isA==1">
			A
		</s:if>
							<s:if test="answerLog.isB==1">
			B
		</s:if>
							<s:if test="answerLog.isC==1">
			C
		</s:if>
							<s:if test="answerLog.isD==1">
			D
		</s:if>
							<s:if test="answerLog.isE==1">
			E
		</s:if>
							<s:if test="answerLog.isF==1">
			F
		</s:if>
							<s:if test="answerLog.isG==1">
			G
		</s:if>
						</s:if>
						<s:if test="testItem.questiontype==3||testItem.questiontype==4">
							<s:if test="answerLog.answerContent!=null">
								<s:property value="answerLog.answerContent" />
							</s:if>
						</s:if>
						<s:if test="testItem.questiontype==2">
							<s:if test="answerLog.isRight==1">
								<s:if test="testItem.answer==0">
		错误
	</s:if>
								<s:if test="testItem.answer==1">
		正确
	</s:if>
							</s:if>
							<s:if test="answerLog.isRight==2">
								<s:if test="testItem.answer==0">
		正确
	</s:if>
								<s:if test="testItem.answer==1">
		错误
	</s:if>
							</s:if>
						</s:if>
					</p>
				</div>

			</div>
		</div>
	</form>
</body>
</html>
