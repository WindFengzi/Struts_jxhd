<%@ page language="java" import="java.util.*,com.dt.jxhd.domain.*"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>查看错误分组</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<form id="form1" name="form1" onSubmit="allSelect()">
		<%
			List list = (List) request.getAttribute("list");
		%>
		<div class="con1 p30">
			<div class=" w560 zefz">
				<div class="centent">
					<select name="chosen" id="chosen" multiple="multiple"><!-- multiple属性是支持ctrl多选属性 -->
						<%
							String groupName = "0";
							for (int i = 0; i < list.size(); i++) {
								group_error group_error = (group_error) list.get(i);
								if (!group_error.getGroup_name().equals(groupName) ) {
						%>
						<option style="font-size: 14px;font-weight: bold;" value="zu<%=group_error.getGroup_name()%>">
							组<%=group_error.getGroup_name()%></option>
						<option
							value="zu<%=group_error.getGroup_name()%>_<%=group_error.getStudent_id()%>">
							--<%=group_error.getStudent_name()%></option>
						<%
							} else {
						%>
						<option
							value="zu<%=group_error.getGroup_name()%>_<%=group_error.getStudent_id()%>">
							--<%=group_error.getStudent_name()%></option>
						<%
							}
								groupName = group_error.getGroup_name();
							}
						%>
					</select>
					<div>
					</div>
				</div>
			</div>
			<div class="cb"></div>
		</div>
		<input 		type="text" style="display:none;" id="TRoleList">
	</form>
</body>
</html>
