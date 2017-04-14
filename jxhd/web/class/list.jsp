<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>班级管理</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script>
		function sub1(){
			form1.action="Classes.action";
			form1.submit();
		}
		function update(classId){
			form1.classId.value = classId;
			form1.action="ClassById.action";
			form1.submit();
		}
		function deleteStation(stationId){
	if(window.confirm('你确定要删除吗？')){
		form1.action="DeleteClass.action";
		form1.classId.value = stationId;
		form1.submit();
	}
}
		function toView(Id){
			form1.id.value = Id;
			form1.action="ToView.action";
			form1.submit();
		}
		function addStation(){
			form1.action="ToInsertClass.action";
			form1.submit();
		}
		
/* 	window.onload=function(){
		//alert(document.body.offsetHeight);//firefox和ie显示正确，但是chrome不行
		//alert(document.getElementById("form1").offsetHeight);
		parent.document.getElementById('frm_home_main1').style.height = document.getElementById("form1").offsetHeight + 'px' ;
		parent.parent.document.getElementById('frm_home_main').style.height = document.getElementById("form1").offsetHeight + 'px' ;
	} */
	</script>

</head>

<body>
	<form id="form1" name="form1" action="Classes.action" method="post">
		<input type="hidden" name="t_class.classId" id="classId" />

		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">系统管理</a>
			》 <a href="#">班级管理</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">班级管理</span> The Class Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:10px">
				&nbsp;班级名称：<input name="t_class.className" type="text"
					value="<s:property value='t_class.className'/>" class="text" />
				年级：<input name="t_class.gradeName" type="text"
					value="<s:property value='t_class.gradeName'/>" class="text" />
				部门：<input name="t_class.departmentName" type="text"
					value="<s:property value='t_class.departmentName'/>" class="text" />
				<input name="input" type="button" value=" 搜  索" onclick="sub1()"
					class="bt1 fb grey1 ml10" /> <input name="input" type="button"
					value=" 添  加" onclick="addStation()" class="bt1 fb grey1 ml10" />
			</div>
			<div class="table4 table3">
				<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
					class="all_content">
					<tr>
						<td width="15%" colspan="2" class="bghui fb">序号</td>
						<td class="bghui fb" width="20%">班级名称</td>
						<td width="15%" class="bghui fb">年级</td>
						<td width="30%" class="bghui fb">部门</td>
						<td width="20%" class="bghui fb">操作</td>
					</tr>
					<%
						int i = 1;
					%>
					<s:iterator value="t_class.data" status="stat">
						<tr>
							<td colspan="2"><%=i++%></td>
							<td><s:property value='className' /></td>
							<td><s:property value='gradeName' /></td>
							<td><s:property value='departmentName' /></td>
							<td><a href="#"
								onclick="update(<s:property value='classId'/>)" class="grey">编辑</a>
								<a href="#"
								onclick="javascript:deleteStation(<s:property value='classId'/>)"
								class="grey">删除</a>
							</td>
						</tr>
					</s:iterator>
				</table>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="t_class.pageNo" />
					页 共
					<s:property value="t_class.pageNum" />
					页 <a
						href="javascript:firstPage(<s:property value="t_class.pageNo"/>,<s:property value="t_class.pageNum"/>);">第一页</a>
					<a
						href="javascript:prevPage(<s:property value="t_class.pageNo"/>,<s:property value="t_class.pageNum"/>);">上一页</a>
					<a class="blue12_33"
						href="javascript:nextPage(<s:property value="t_class.pageNo"/>,<s:property value="t_class.pageNum"/>);">下一页</a>
					<a class="blue12_33"
						href="javascript:lastPage(<s:property value="t_class.pageNo"/>,<s:property value="t_class.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1"
						name="t_class.pageNo"> 页 <a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="t_class.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>