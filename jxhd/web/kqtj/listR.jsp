<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>考勤统计右边</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<form id="form1" name="form1" action="Articles.action" method="post">
		<div class="w800_con ">
			<div class="table4 table3">
				<div id='div_excel_content'>
					<table
						style="width: 100%;border: 1px;font-size:12px; border-color:#d7d7d7;"
						class="all_content">
						<tr>
							<td colspan="2" class="bghui fb">序号</td>
							<td width="12%" class="bghui fb">班级</td>
							<td width="15%" class="bghui fb">课程</td>
							<td width="15%" class="bghui fb">点名时间</td>
							<td width="14%" class="bghui fb">已到</td>
							<td width="11%" class="bghui fb">未到</td>
							<td width="15%" class="bghui fb">请假<br /></td>
							<td width="12%" class="bghui fb">缺勤率</td>
						</tr>
						<%
							int i = 1;
						%>
						<s:iterator value="list" status="stat">
							<tr>
								<td colspan="2"><%=i++%></td>
								<td><s:property value='className' /></td>
								<td><s:property value='subjectName' /></td>
								<td><s:property value='createTime1' /></td>
								<td><s:property value='num' /></td>
								<td><s:property value='wdNum' /></td>
								<td><s:property value='leaveNum' /></td>
								<td><s:property value='percent' /></td>
							</tr>
						</s:iterator>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
</html>