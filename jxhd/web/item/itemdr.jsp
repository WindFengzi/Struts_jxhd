<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="/jxhd/css/demo.css" type="text/css">
<link rel="stylesheet" href="/jxhd/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	function look() {
		var obj = form1.upload;
		var photoExt = obj.value.substr(obj.value.lastIndexOf("."))
				.toLowerCase();//获得文件后缀名
		if (photoExt != '.xls' && photoExt != '.xlsx') {
			alert("请上传后缀名为xls、xlsx的文件，并按模版要求编辑!");
			return false;
		} else {
			form1.action = "InsertPlItem.action";
			form1.submit();
		}
	}
	function list1() {
		history.go(-1);
	}
</SCRIPT>

</head>

<body>
	<form name="form1" id="form1" action="FileUpload.action" method="POST"
		enctype="multipart/form-data">
		<s:hidden name="testItem.questiontype" id="questiontype"></s:hidden>
		<div class="w800_con ">
			<input type="file" name="upload" size="50" /> <a
				href="item/item.xls"
				style="color:#3366cc; line-height:18px; text-decoration:underline;">模版下载</a><br />
			<input name="input" onclick="look()" type="button" value="导 入"
				class="bt3 fb grey1 ml50" /> <input name="input" onclick="list1()"
				type="button" value="返回" class="bt3 fb grey1 ml50" />
		</div>
	</form>
</body>
</html>
