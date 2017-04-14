<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>添加部门</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script>
	function sub1() {
		form1.action = "SaveDepartment.action";
		form1.submit();

		//alert(parent.document.getElementById("div1").innerHTML);
		//parent.document.getElementById("parentDepartmentId").value = form1.parentDepartmentId.value;
		var departmentId = form1.parentDepartmentId.value;
		parent.location.href = "ToDepartments.action?departmentId="
				+ departmentId;
		//setTimeout("parent.location.reload();",3000);
		//var parentDepartmentId = form1.parentDepartmentId.value;
		//parent.departmentByParent(parentDepartmentId);
		//setTimeout(function(){parent.location.reload();},1000);
	}
	function list1() {
		history.go(-1);
	}
</script>
</head>
<body>
	<form name="form1" method="post" action="SaveDepartment.action"
		id="form1">
		<input type="hidden" name="department.parentDepartmentId"
			id="parentDepartmentId"
			value="<s:property value='department.parentDepartmentId'/>" />
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">系统设置</a> 》 <a href="#">部门管理</a>
			》 <a href="#">添加部门信息</a>
			<div class="search">
				<input name="" type="text" class="text fl" /><input name=""
					type="button" class="sou fl" value="" />
			</div>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">添加部门信息</span> Add Department Information
				</h2>
			</div>
			<div class="table4 table3">
				<div class="fl w370">
					<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
						class="all_content">
						<tr>
							<td width="31%" class="bghui fb">部门名称</td>
							<td width="69%"><input type="text"
								name="department.departmentName" id="departmentName" /></td>
						</tr>

					</table>
				</div>
				<div class="cb"></div>
			</div>
			<p class="tc p30">
				<input name="input" onclick="sub1()" type="button" value="保 存"
					class="bt3 fb grey1 ml50" /> <input name="input" onclick="list1()"
					type="button" value="返回" class="bt3 fb grey1 ml50" />
			</p>
		</div>
	</form>
</body>
</html>