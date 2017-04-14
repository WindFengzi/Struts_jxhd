<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>首页修改</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	function update_index() {
		var title = document.getElementById("title");
		var upload = document.getElementById("upload");
		var title_inform = document.getElementById("title_inform");
		var upload_inform = document.getElementById("upload_inform");
		if (title.value == null || title.value == "") {
			title_inform.style.display = "inline";
			return;
		}
		if (upload.value == null || upload.value == "") {
			title_inform.style.display = "none";
			upload_inform.style.display = "inline";
			return;
		}
		form1.target = parent.parent.document.getElementById("frm_home_main").name;
		form1.action = "UpdateIndex.action"
		form1.submit();
	}
</script>
</head>

<body>
	<form id="form1" name="form1" method="post"
		enctype="multipart/form-data">
		<div style="text-align: left;font-size: 12px;margin-bottom: 5px;">
			首页标题：<input type="text" id="title"
				style="width: 300px;margin-left: 20px;" name="index_edit.index_name"><label
				id="title_inform" style="color: red;display:none;margin-left:5px;">请填写标题</label>
		</div>
		<input type="file" id="upload" name="upload"><label
			id="upload_inform" style="color: red;display:none">请选择图片</label> <br />
		<input type="button" style="margin-top: 5px" value="提交"
			onclick="javascript:update_index()">
	</form>
</body>
</html>
