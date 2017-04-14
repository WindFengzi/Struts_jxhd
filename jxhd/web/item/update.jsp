<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>试题编辑</title>
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
		//var editor = CKEDITOR.instances.editor1;
		//form1.question.value = editor.getData();
		form1.action = "UpdateItem.action";
		form1.submit();
	}
	function test(val) {
		if (val == 2 || val == 3 || val == 5) {
			document.getElementById("trA").style.display = "none";
			document.getElementById("trB").style.display = "none";
			document.getElementById("trC").style.display = "none";
			document.getElementById("trD").style.display = "none";
			document.getElementById("trE").style.display = "none";
			document.getElementById("trF").style.display = "none";
			document.getElementById("trG").style.display = "none";
			document.getElementById("trNum").style.display = "none";
			document.getElementById("div1").style.display = "none";
		} else if (val == 4) {
			document.getElementById("trA").style.display = "none";
			document.getElementById("trB").style.display = "none";
			document.getElementById("trC").style.display = "none";
			document.getElementById("trD").style.display = "none";
			document.getElementById("trE").style.display = "none";
			document.getElementById("trF").style.display = "none";
			document.getElementById("trG").style.display = "none";
			document.getElementById("trNum").style.display = "none";
			document.getElementById("div1").style.display = "none";
		} else if (val == 1) {
			document.getElementById("trA").style.display = "";
			document.getElementById("trB").style.display = "";
			document.getElementById("trC").style.display = "";
			document.getElementById("trD").style.display = "";
			document.getElementById("trE").style.display = "";
			document.getElementById("trF").style.display = "";
			document.getElementById("trG").style.display = "";
			document.getElementById("trNum").style.display = "";
			document.getElementById("div1").style.display = "";
		} else if (val == 0) {
			document.getElementById("trA").style.display = "";
			document.getElementById("trB").style.display = "";
			document.getElementById("trC").style.display = "";
			document.getElementById("trD").style.display = "";
			document.getElementById("trE").style.display = "none";
			document.getElementById("trF").style.display = "none";
			document.getElementById("trG").style.display = "none";
			document.getElementById("trNum").style.display = "";
			document.getElementById("div1").style.display = "none";
		}
	}
	function deletePath(itemId) {
		if (confirm("您确定你要删除么？")) {
			form1.itemId.value = itemId;
			form1.action = "DeletePath.action";
			form1.submit();
		}
	}
	function list1() {
		form1.action = "Items.action";
		form1.submit();
	}
</script>

</head>

<body>
	<%
		String url = request.getRequestURL().toString();
		url = url.substring(0, url.indexOf("jxhd"));
	%>
	<form name="form1" method="post" action="ToDate.action" id="form1"
		enctype="multipart/form-data">
		<input type="hidden" name="testItem.itemId" id="itemId"
			value="<s:property value='testItem.itemId'/>">
		<div class="form">
			<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
				class="all_content">
				<tr>
					<th>试题内容：</th>
					<td><textarea cols="80" name="testItem.question" rows="10">
							<s:property value='testItem.question' />
						</textarea>
					</td>
				</tr>

				<tr id="trA" style="display:none">
					<th width="16%">A选项：</th>
					<td width="84%"><input name="testItem.choicea"
						value="<s:property value='testItem.choicea'/>" type="text"
						id="choicea" style="width:350px;" /></td>
				</tr>
				<tr id="trB" style="display:none">
					<th width="16%">B选项：</th>
					<td width="84%"><input name="testItem.choiceb"
						value="<s:property value='testItem.choiceb'/>" type="text"
						id="choiceb" style="width:350px;" /></td>
				</tr>
				<tr id="trC" style="display:none">
					<th width="16%">C选项：</th>
					<td width="84%"><input name="testItem.choicec"
						value="<s:property value='testItem.choicec'/>" type="text"
						id="choicec" style="width:350px;" /></td>
				</tr>
				<tr id="trD" style="display:none">
					<th width="16%">D选项：</th>
					<td width="84%"><input name="testItem.choiced"
						value="<s:property value='testItem.choiced'/>" type="text"
						id="choiced" style="width:350px;" /></td>
				</tr>
				<tr id="trE" style="display:none">
					<th width="16%">E选项：</th>
					<td width="84%"><input name="testItem.choicee"
						value="<s:property value='testItem.choicee'/>" type="text"
						id="choicee" style="width:350px;" /></td>
				</tr>
				<tr id="trF" style="display:none">
					<th width="16%">F选项：</th>
					<td width="84%"><input name="testItem.choicef"
						value="<s:property value='testItem.choicef'/>" type="text"
						id="choicef" style="width:350px;" /></td>
				</tr>
				<tr id="trG" style="display:none">
					<th width="16%">G选项：</th>
					<td width="84%"><input name="testItem.choiceg"
						value="<s:property value='testItem.choiceg'/>" type="text"
						id="choiceg" style="width:350px;" /></td>
				</tr>
				<tr id="trNum" style="display:none">
					<th width="16%">选项数量：</th>
					<td width="84%"><s:select
							list="#{'2':'2','3':'3','4':'4','5':'5','6':'6','7':'7'}"
							name="testItem.choicenum"></s:select></td>
				</tr>

				<tr>
					<th width="16%">试题答案：</th>
					<td width="84%"><s:if test="testItem.questiontype!=2">
							<input name="testItem.answer" type="text"
								value="<s:property value='testItem.answer'/>" id="answer"
								style="width:350px;" />
						</s:if> <s:if test="testItem.questiontype==1">
							<div id="div1" style='color:red;font-size:12px'>(多选题答案用逗号分开)</div>
						</s:if> <s:if test="testItem.questiontype==2">
							<s:select list="#{'1':'正确','0':'错误'}" name="testItem.answer"
								id="answer1"></s:select>
						</s:if>
					</td>
				</tr>
				<tr>
					<th width="16%">分数：</th>
					<td width="84%"><input name="testItem.score" type="text"
						value="<s:property value='testItem.score'/>" id="score"
						style="width:350px;" /></td>
				</tr>
				<tr>
					<th width="16%">试题类型：</th>
					<td width="84%"><s:select
							list="#{'0':'单选题','1':'多选题','2':'判断题','3':'问答题','4':'图片比对题'}"
							onchange="test(this.value)" id="questiontype"
							name="testItem.questiontype"></s:select></td>
				</tr>
				<tr id="trPic">
					<th width="16%">图片：</th>

					<td width="84%"><s:if test="testItem.picUrl!=null">
							<s:if test="testItem.picUrl!=''">

								<a
									href="<%=url%>/jxhd/upload/<s:property value="testItem.picUrl"/>">查看图片</a>
								<a class="blue12_33"
									href="javascript:deletePath('<s:property value="testItem.itemId"/>')">删除</a>
							</s:if>
						</s:if> <input type="file" name="upload" size="50" /></td>
				</tr>
			</table>

			<div class="btncase">
				<input type="button" class="btn1" id="btn1"
					onmouseover="this.className='btn1_h'"
					onmouseout="this.className='btn1'" onclick="sub1()" value="确定" />
				<input type="button" class="btn1" id="btn1"
					onmouseover="this.className='btn1_h'"
					onmouseout="this.className='btn1'" onclick="list1()" value="返回" />
			</div>
		</div>
	</form>
</body>
<script>
	test(form1.questiontype.value);
</script>
</html>