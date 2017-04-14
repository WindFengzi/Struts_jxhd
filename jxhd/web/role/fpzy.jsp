<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>角色授权资源</title>
<link href="../css/css_style.css" rel="stylesheet" type="text/css">
<script  src="/jxhd/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#checkAll").click(function() {
			$('input[name="resIds"]').attr("checked", this.checked);
		});
		var $subBox = $("input[name='resIds']");
		$subBox
				.click(function() {
					$("#checkAll")
							.attr(
									"checked",
									$subBox.length == $("input[name='resIds']:checked").length ? true
											: false);
				});
	});
	function deleteStation(stationId) {
		if (window.confirm('你确定要删除吗？')) {
			form1.action = "DeleteStation.action";
			form1.stationId.value = stationId;
			form1.submit();
		}
	}
	function updateStation(stationId) {
		form1.action = "GetStationById.action";
		form1.stationId.value = stationId;
		form1.submit();
	}
	function addZy() {
		var a = document.getElementsByName("resIds");

		var ss = "";
		for ( var i = 0; i < a.length; i++) {
			if (a[i].checked) {
				ss = ss + a[i].value + ",";
			}
		}

		form1.resourceIds.value = ss;
		form1.action = "InsertZy.action";
		form1.submit();
	}
	function look() {
		form1.submit();
	}
	function list1() {
		history.go(-1);
	}
</script>
</head>
<body>
	<form id="form1" name="form1" action="ToSqzd.action" method="post">
		<s:hidden id="roleId" name="t_sys_role.roleId"></s:hidden>
		<input type="hidden" name="t_sys_role_resource.resourceIds"
			id="resourceIds">
		<table style="width:95%;border:0px;">
			<tr>
				<td width="24"><img src="../images/title_bg-3.png" width="5"
					height="16" />
				</td>
				<td height="45"><span class="black14_b">角色授权资源</span>
				</td>
				<td width="80"><input name="button4" type="button"
					onclick="addZy()" value="添加"
					style="background:#FFF url(../images/anniu_8026_bg.jpg); width:80px; height:26px; border:none; cursor:pointer;" />
				</td>
				<td width="80"><input name="button4" type="button"
					onclick="list1()" value="返回"
					style="background:#FFF url(../images/anniu_8026_bg.jpg); width:80px; height:26px; border:none; cursor:pointer;" />
				</td>

			</tr>
		</table>


		<table style="width:95%;border:0px;bgcolor:#f3f5f8">
			<tr>
				<td align="center" width="10%" background="../images/bg_yy_02.jpg"
					class="black12_b"><input type='checkbox' id="checkAll" />
				</td>
				<td align="center" width="10%" background="../images/bg_yy_02.jpg"
					class="black12_b">资源编号</td>
				<td align="center" width="15%" background="../images/bg_yy_02.jpg"><span
					class="black12_b">资源名称</span>
				</td>
				<td align="center" width="15%" background="../images/bg_yy_02.jpg"><span
					class="black12_b">资源描述</span>
				</td>
			</tr>
			<%
				int i = 1;
			%>
			<s:iterator value="userlist" status="stat">
				<tr>
					<td align="center" width="10%" valign="middle" bgcolor="#FFFFFF">
						<s:if test="resUrl=='true'">
							<input type='checkbox' name='resIds' checked="true"
								value="<s:property value='resId'/>">
						</s:if> <s:else>
							<input type='checkbox' name='resIds'
								value="<s:property value='resId'/>">
						</s:else></td>
					<td align="center" width="10%" valign="middle" bgcolor="#FFFFFF">
						<s:property value="resId" />
					</td>
					<td align="center" width="15%" valign="middle" bgcolor="#FFFFFF">
						<s:property value="resName" /></td>
					<td align="center" width="15%" valign="middle" bgcolor="#FFFFFF">
						<s:property value="resDesc" />
					</td>
				</tr>
			</s:iterator>

		</table>
	</form>
</body>
</html>
