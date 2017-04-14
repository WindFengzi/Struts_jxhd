<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<link href="img/basic.css" type="text/css" rel="stylesheet" />
<link href="img/style.css" type="text/css" rel="stylesheet" />
<link rel="StyleSheet" href="dtree.css" type="text/css" />
<script type="text/javascript" src="dtree.js"></script>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script>
	function departmentByParent(departmentId) {

		form1.target = 'frm_home_main1';
		form1.departmentId.value = departmentId;
		form1.action = "DepartmentByParentId1.action";
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
	function iFrameHeight() {
		var ifm = document.getElementById("frm_home_main1");
		var subWeb = document.frames ? document.frames["frm_home_main1"].document
				: ifm.contentDocument;
		if (ifm != null && subWeb != null) {
			ifm.height = subWeb.body.scrollHeight;
		}
	}
</script>

</head>

<body>
	<form id="form1" name="form1" action="Departments.action" method="post">
		<input type="hidden" name="t_course_log.classId" id="departmentId" />

		<div class="w170 fl">
			<script type="text/javascript">
			<!--
				d = new dTree('d');
				//从treeBean中获取js代码
				// var treecontent = document.getElementById("tree").innerHTML;
				//执行代码
				//eval(treecontent);
				d.add(0, -1, '部门');
				<s:iterator value="department.data" status="stat">
				d
						.add(<s:property value='departmentId'/>,
								<s:property value='parentDepartmentId'/>,
								'<s:property value='departmentName'/>',
								'javascript:departmentByParent(<s:property value='departmentId'/>)');
				</s:iterator>
				document.write(d);
			//-->
			</script>
		</div>
		<div class="w800 fr">
			<iframe name='frm_home_main1' src="gonggao/list1.jsp"
				id="frm_home_main1" width=100% onLoad="iFrameHeight()"
				style="border:0px"></iframe>

		</div>
	</form>
</body>
<script>
	departmentByParent(1);
</script>
</html>