<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title></title>
<style>
html {
	overflow-x: hidden;
}
</style>
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
	<form name="form1" method="post" action="ToDate.action" id="form1">
		<s:hidden name="answerLog.askId" id="askId"></s:hidden>
		<s:hidden name="answerLog.studentId" id="studentId"></s:hidden>
		<div class="m5 tuxing p10">
			<div class="pb20 dtxx">
				<h3 class="lh34 pl10 fb">答题信息</h3>
				<ul style="width:800px">
					<s:if test="askLog.finishType==1">
						<s:if test="askLog.isRight==999">
							<li class="ceng"><p class="lh22 f14 tc">1</p>
								<p class="lh26 mt40 tc">
									<s:property value='t_user1.name' />
								</p>
								<p class="lh22 f14 tc">
									<a
										href="javascript:answer(<s:property value='askLog.askId' />,<s:property value='t_user1.userId' />)">答案</a>
								</p></li>
						</s:if>
						<s:if test="askLog.isRight==0">
							<li class="hong"><p class="lh22 f14 tc">1</p>
								<p class="lh26 mt40 tc">
									<s:property value='t_user1.name' />
								</p>
								<p class="lh22 f14 tc">
									<a
										href="javascript:answer(<s:property value='askLog.askId' />,<s:property value='t_user1.userId' />)">答案</a>
								</p></li>
						</s:if>
						<s:if test="askLog.isRight==1">
							<li class="lan">
								<p class="lh22 f14 tc">1</p>
								<p class="lh26 mt40 tc">
									<s:property value='t_user1.name' />
								</p>
								<p class="lh22 f14 tc">
									<a
										href="javascript:answer(<s:property value='askLog.askId' />,<s:property value='t_user1.userId' />)">答案</a>
								</p></li>
						</s:if>
					</s:if>

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
					<div class="cb"></div>
				</ul>
			</div>
		</div>
	</form>
</body>
</html>
