<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>老师审批界面</title>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script src="/jxhd/js/adapters/jquery.js"></script>
<link href="/jxhd/css/sample.css" rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/jxhd/css/css2.css" type="text/css"  rel="stylesheet" />
<style type="text/css">
	#editable {
		padding: 10px;
		float: left;
	}
</style>
	<script>
		function sub1() {
			form1.action = "LeaveUpdate.action";
			form1.submit();
		}
	</script>
</head>

<body>
	<form name="form1" method="post" action="ToDate.action" id="form1"
		enctype="multipart/form-data">
		<s:hidden name="leave.leaveId" id="leaveId"></s:hidden>
		<div class="form">
			<table width="100%" border="0" cellpadding="00" cellspacing="1">
				<tr>
					<th>请假学生：</th>
					<td><s:property value='leave.studentId' />
					</td>
				</tr>

				<tr id="trA">
					<th width="16%">开始时间：</th>
					<td width="84%"><s:date name="leave.fromTime"
							format="yyyy-MM-dd HH:mm" />
					</td>
				</tr>
				<tr id="trB">
					<th width="16%">结束时间：</th>
					<td width="84%"><s:date name="leave.toTime"
							format="yyyy-MM-dd HH:mm" />
					</td>
				</tr>
				<tr id="trC">
					<th width="16%">请假内容：</th>
					<td width="84%"><s:property value='leave.content' />
					</td>
				</tr>
				<tr id="trD">
					<th width="16%">审批结果：</th>
					<td width="84%"><s:select list="#{'1':'同意','0':'不同意'}"
							name="leave.reviewType"></s:select>
					</td>
				</tr>
				<tr id="trE">
					<th width="16%">审批意见：</th>
					<td width="84%"><textarea cols="80" name="leave.reviewContent"
							rows="10"></textarea></td>
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
</html>
