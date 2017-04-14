<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>部门管理</title>
<link href="img/basic.css" type="text/css" rel="stylesheet" />
<link href="img/style.css" type="text/css" rel="stylesheet" />
<link rel="StyleSheet" href="dtree.css" type="text/css" />
<script type="text/javascript" src="dtree.js"></script>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script>
	function departmentByParent(departmentId) {
		form1.parentDepartmentId.value = departmentId;
		form1.target = 'frm_home_main1';
		form1.action = "Departments.action";
		form1.submit();
	}
	function Items() {
		form1.target = 'frm_home_main1';
		form1.action = "Items.action";
		form1.submit();
	}
	function pjnr() {
		form1.target = 'frm_home_main1';
		form1.action = "EvaluationItems.action";
		form1.submit();
	}
	function pjdj() {
		form1.target = 'frm_home_main1';
		form1.action = "EvaluationGrades.action";
		form1.submit();
	}
	function bjgl() {
		form1.target = 'frm_home_main1';
		form1.action = "Classes.action";
		form1.submit();
	}
	
	
</script>

</head>

<body>
	<form id="form1" name="form1" action="Departments.action" method="post">
		<input type="hidden" name="department.parentDepartmentId"
			value="<s:property value='department.parentDepartmentId'/>"
			id="parentDepartmentId" />

		<div id="div1" class="w170 fl"
			style="position:absolute;overflow:auto;width:170px; height:655px; background-color: #E5EFF0;">
			<div class="w400 fl">
				<script type="text/javascript">
				<!--
					d = new dTree('d');
					//从treeBean中获取js代码
					// var treecontent = document.getElementById("tree").innerHTML;
					//执行代码
					//eval(treecontent);
					d.add(0, -1, '部门');
					<s:iterator value="department.data" status="stat">
					d.add(<s:property value='departmentId'/>,<s:property value='parentDepartmentId'/>,'<s:property value='departmentName'/>',
								//	'<a href=javascript:departmentByParent(<s:property value='departmentId'/>) title=<s:property value='departmentName'/>><s:property value='departmentName'/>',
									'javascript:departmentByParent(<s:property value='departmentId'/>)');
					</s:iterator>
					document.write(d);
				//-->
				</script>
			</div>
		</div>
		<div class="w800 fr">
			<iframe name='frm_home_main1' src="gonggao/list1.jsp"
				id="frm_home_main1" width=100% height=690px; style="border:0px" ></iframe>
		</div>
	</form>
</body>
<script>
	var parentDepartmentId = form1.parentDepartmentId.value;
	if (parentDepartmentId.length == 0) {
		parentDepartmentId = 1;
	}
	departmentByParent(parentDepartmentId);
</script>
</html>
