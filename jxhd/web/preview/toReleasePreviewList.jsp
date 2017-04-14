<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>跳转发布预习列表</title>
<link href="img/basic.css" type="text/css" rel="stylesheet" />
<link href="img/style.css" type="text/css" rel="stylesheet" />
<link rel="StyleSheet" href="dtree.css" type="text/css" />
<script type="text/javascript" src="dtree.js"></script>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script>
	function departmentByParent(departmentId) {
		form1.target = 'frm_home_main1';
		form1.departmentId.value = departmentId;
		form1.action = "ReleasePreview.action";
		form1.submit();
	}
</script>
</head>
<body>
	<form id="form1" name="form1" action="Departments.action" method="post">
		<input type="hidden" name="t_course_log.classId" id="departmentId" />
		<!-- 部门id在上面设置 -->
		<div id="div1" class="w170 fl"
			style="position:absolute;overflow:auto;width:170px; height:695px;background-color: #E5EFF0;">
			<div class="w400 fl">
				<script type="text/javascript">
					d = new dTree('d');
					d.add(0, -1, '部门');
					<s:iterator value="department.data" status="stat">
					d.add(<s:property value='departmentId'/>,<s:property value='parentDepartmentId'/>,'<s:property value='departmentName'/>',
								//	'<a href=javascript:departmentByParent(<s:property value='departmentId'/>) title=<s:property value='departmentName'/>><s:property value='departmentName'/>',
									'javascript:departmentByParent(<s:property value='departmentId'/>)');
					</s:iterator>
					document.write(d);
				</script>
			</div>
		</div>
		<div class="w800 fr">
			<iframe name='frm_home_main1' style="border:0px;" id="frm_home_main1"
				width=100% height="695px"></iframe>
		</div>
	</form>
	<script>
		departmentByParent(1);
	</script>
</body>
</html>
