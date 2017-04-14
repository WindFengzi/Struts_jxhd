<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>角色编辑</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script>
	function sub1() {
		form1.action = "UpdateRole.action";
		form1.submit();
	}
	function list1() {
		history.go(-1);
	}
</script>

</head>

<body>
	<form name="form1" method="post" action="ToDate.action" id="form1">
		<s:hidden id="roleId" name="t_sys_role.roleId"></s:hidden>

		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">角色管理</a>
			》 <a href="#">修改角色信息</a>
			<!-- <div class="search">
				<input name="" type="text" class="text fl" /><input name=""
					type="button" class="sou fl" value="" />
			</div> -->
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">修改角色信息</span> Add Student Information
				</h2>
			</div>
			<div class="table4 table3">
				<div class="fl w370">
					<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
						class="all_content">
						<tr>
							<td width="31%" class="bghui fb">角色名称</td>
							<td width="69%"><input type="text"
								name="t_sys_role.roleName"
								value="<s:property value='t_sys_role.roleName'/>" id="roleName" />
							</td>
						</tr>

					</table>
				</div>
				<div class="fr">
					<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
						class="all_content">
						<tr>
							<td width="31%" class="bghui fb">角色描述</td>
							<td width="69%"><input type="text"
								name="t_sys_role.roleDesc"
								value="<s:property value='t_sys_role.roleDesc'/>" id="roleDesc" />
							</td>
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