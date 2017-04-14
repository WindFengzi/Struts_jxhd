<!DOCTYPE html >
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>评价等级添加</title>
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

		form1.action = "SaveEvaluationGrade.action";
		form1.submit();
	}
</script>

</head>

<body>
	<form name="form1" method="post" action="ToDate.action" id="form1"
		enctype="multipart/form-data">
		<s:hidden name="notice.classId"></s:hidden>
		<div class="form">
			<table style="width:100%;border:0px;">
				<tr>
					<th width="16%">评价等级：</th>
					<td width="84%"><input name="evaluationGrade.gradeDesc"
						type="text" id="gradeDesc" style="width:650px;" /></td>
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
</script>
</html>