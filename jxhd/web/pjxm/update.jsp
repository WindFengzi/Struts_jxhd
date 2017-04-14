<!DOCTYPE html >
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>编辑评价</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script src="/jxhd/js/ckeditor.js"></script>
<script src="/jxhd/js/adapters/jquery.js"></script>
<link href="/jxhd/css/sample.css" rel="stylesheet">
<link href="/jxhd/css/css2.css" type="text/css" rel="stylesheet" />
<style>
#editable {
	padding: 10px;
	float: left;
}
</style>
<script>
	CKEDITOR.disableAutoInline = true;

	$(document).ready(function() {
		$('#editor1').ckeditor(); // Use CKEDITOR.replace() if element is <textarea>.
		$('#editable').ckeditor(); // Use CKEDITOR.inline().
	});

	function setValue() {
		$('#editor1').val($('input#val').val());
	}

	function sub1() {

		var a = document.getElementsByName("gradeIds");
		var ss = "";
		for ( var i = 0; i < a.length; i++) {
			if (a[i].checked) {

				ss = ss + a[i].value + ",";
			}
		}
		form1.gradeId.value = ss;
		form1.action = "UpdateEvaluationItem.action";
		form1.submit();
	}
</script>

</head>

<body>
	<form name="form1" method="post" action="ToDate.action" id="form1"
		enctype="multipart/form-data">
		<input type="hidden" name="evaluationItem.itemId" id="itemId"
			value="<s:property value='evaluationItem.itemId'/>"> <input
			type="hidden" name="evaluationItem.gradeId" id="gradeId"
			value="<s:property value='evaluationItem.gradeId'/>">
		<div class="form">
			<table style="width:100%;border:0px">
				<tr>
					<th width="16%">评价内容：</th>
					<td width="84%"><input name="evaluationItem.content"
						value="<s:property value='evaluationItem.content'/>" type="text"
						id="content" style="width:650px;" />
					</td>
				</tr>
				<tr>
					<th width="16%">评价等级：</th>
					<td width="84%"><s:iterator value="list" status="stat">
							<s:if test="pageCtrl">
								<input type='checkbox' name='gradeIds' checked="true"
									value="<s:property value='gradeId'/>">
								<s:property value='gradeDesc' />
							</s:if>
							<s:else>
								<input type='checkbox' name='gradeIds'
									value="<s:property value='gradeId'/>">
								<s:property value='gradeDesc' />
							</s:else>
						</s:iterator></td>
				</tr>
			</table>

			<div class="btncase">
				<input type="button" class="btn1" id="btn1"
					onmouseover="this.className='btn1_h'"
					onmouseout="this.className='btn1'" onclick="sub1()" value="确定" />
				<input type="button" class="btn1" id="btn1"
					onmouseover="this.className='btn1_h'"
					onmouseout="this.className='btn1'" onclick="history.go(-1)"
					value="返回" />
			</div>
		</div>
	</form>
</body>
<script>
	function addComponent() {
		var uploadHTML = document
				.createElement("<input type='file'  name='fjupload'/><br/>");
		document.getElementById("files").appendChild(uploadHTML);
		uploadHTML = document.createElement("<p/>");
		document.getElementById("files").appendChild(uploadHTML);
	}
	function deleteFj(id, attachFileUrl) {
		if (confirm("您确定你要删除么？")) {
			form1.id.value = id;
			form1.attachFileUrl.value = attachFileUrl;
			form1.action = "DeleteFj.action";
			form1.submit();
		}
	}
</script>
</html>