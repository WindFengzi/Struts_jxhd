<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>部门管理右边</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script  src="/jxhd/js/PageCtrl.js"></script>
<script  src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script>
		function sub1(){
		
			form1.action="Departments.action";
			form1.submit();
		}
		function deleteStation(departmentId){
	if(window.confirm('你确定要删除吗？')){
		form1.departmentId.value = departmentId;
		form1.action="DeleteDepartment.action";
		form1.submit();
		var departmentId = form1.parentDepartmentId.value;
			parent.location.href="ToDepartments.action?departmentId="+departmentId;
		
		//setTimeout("parent.location.reload();",3000);
		//setTimeout(function(){parent.location.reload();},1000);
		 
	}
}
function sub2(){
alert();
		
		}
		function addStation(){
			form1.action="ToAddDepartment.action";
			form1.submit();
		}
	</script>

</head>

<body>
	<form id="form1" name="form1" action="Departments.action" method="post">
		<input type="hidden" name="department.departmentId" id="departmentId" />
		<input type="hidden" name="department.parentDepartmentId"
			id="parentDepartmentId"
			value="<s:property value='department.parentDepartmentId'/>" />

		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">系统管理</a>
			》 <a href="#">部门设置</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">部门设置</span> The Department Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:10px">

				&nbsp;&nbsp;&nbsp;关键字:<input name="department.departmentName"
					type="text" value="<s:property value='department.departmentName'/>"
					class="text" /> <input name="input" type="button" value=" 搜  索"
					onclick="sub1()" class="bt1 fb grey1 ml10" /> <input name="input"
					type="button" value=" 添  加" onclick="addStation()"
					class="bt1 fb grey1 ml10" />
			</div>
			<div class="table4 table3">
				<table style="width: 100%;border: 1px; border-color:#d7d7d7;" class="all_content">
					<tr>
						<td colspan="2" class="bghui fb">序号</td>
						<td class="bghui fb">部门名字</td>
						<td width="10%" class="bghui fb">操作</td>
					</tr>
					<%
						int i = 1;
					%>
					<s:iterator value="department.data" status="stat">
						<tr>
							<td colspan="2"><%=i++%></td>
							<td><s:property value='departmentName' />
							</td>
							<td><a href="#"
								onclick="javascript:deleteStation(<s:property value='departmentId'/>)"
								class="grey">删除</a></td>
						</tr>
					</s:iterator>
				</table>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="department.pageNo" />
					页 共
					<s:property value="department.pageNum" />
					页 <a
						href="javascript:firstPage(<s:property value="department.pageNo"/>,<s:property value="department.pageNum"/>);">第一页</a>
					<a
						href="javascript:prevPage(<s:property value="department.pageNo"/>,<s:property value="department.pageNum"/>);">上一页</a>
					<a class="blue12_33"
						href="javascript:nextPage(<s:property value="department.pageNo"/>,<s:property value="department.pageNum"/>);">下一页</a>
					<a class="blue12_33"
						href="javascript:lastPage(<s:property value="department.pageNo"/>,<s:property value="department.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1"
						name="department.pageNo">页 <a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="department.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>