<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>需要分发的当个学生</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script  src="/jxhd/js/PageCtrl.js"></script>
</head>

<body>
	<form id="form1" name="form1" action="" method="post"  >
	<div style="border:4px solid #E5EFF0;height:40px;">
		<s:iterator value="t_user1.data" status="stat">
			<input type="checkbox" id="student" name="student" value="<s:property value='userId'/>"><s:property value='name' />
		</s:iterator>
	</div>
	</form>
</body>
</html>
