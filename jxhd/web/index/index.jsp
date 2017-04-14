<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
</script>
</head>

<body>
	<form id="form1" name="form1"  method="post"  >
		<div style="text-align: center;font-size: 24px;"><s:property value="index_edit.index_name"/></div>
		<img src="<s:property value="index_edit.index_src"/>">
	</form>
</body>
</html>
