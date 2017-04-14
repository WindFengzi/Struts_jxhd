<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>设置组列表</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script type="text/javascript">
	//重置分组
	function addStation() {
		form1.action = "ToFenzu.action";
		form1.submit();
	}
	//随机分组
	function random() {
		var number = prompt("请输入每组的人数",2);
		if(number!=null && number != ""){
			number = parseInt(number);
			form1.number_group.value = number;
		}
		form1.action = "ToRandomFenzu.action";
		form1.submit();
	}
	//修改分组
	function updateStation() {
		form1.action = "ToUpdateGroup.action";
		form1.submit();
	}
	//搜索
	function look() {
		form1.submit();
	}
</script>
</head>
<body>
	<form id="form1" name="form1" action="StudentGroups.action"
		method="post">
		<input type="hidden" name="askLog.askId" id="askId" /> 
		<input 	type="hidden" name="askLog.itemId" id="itemId" />
		<input type="hidden" name="number_group" id="number_group"/>
		<s:hidden name="askLog.askType" id="askType"></s:hidden>

		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">教学互动反馈</a>
			》 <a href="#">组列表</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">组列表</span> The Group Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:20px">
				学生姓名：<input name="studentGroup.studentId" type="text"
					value="<s:property value='studentGroup.studentId'/>" class="text" />
				是否废弃：
				<s:select list="#{'':'全部','0':'否','-1':'是'}" value="3"
					onchange="look()" name="studentGroup.groupStatus"></s:select>
				<input name="input" type="button" value=" 搜  索" onclick="look()"
					class="bt1 fb grey1 ml10" /> 
					
					<input name="input" type="button"
					value=" 重  置" onclick="addStation()" class="bt1 fb grey1 ml10" />
					<input name="input" type="button"
					value=" 随  机" onclick="random()" class="bt1 fb grey1 ml10" />
				<input name="input" type="button" value=" 修  改"
					onclick="updateStation()" class="bt1 fb grey1 ml10" />
			</div>
			<div class="table4 table3">
				<table style="width:100%;border:solid 1 #d7d7d7">
					<tr>
						<td width="20%" colspan="2" class="bghui fb">序号</td>
						<td width="20%" class="bghui fb">组</td>
						<td class="bghui fb" width="20%">学生姓名</td>
						<td class="bghui fb" width="20%">创建时间</td>
						<td class="bghui fb" width="20%">是否废弃</td>
					</tr>
					<%
						int i = 1;
					%>
					<s:iterator value="studentGroup.data" status="stat">
						<tr style="border-bottom:1px solid #E5EFF0">
							<td colspan="2"><%=i++%></td>
							<td><s:property value='groupName' /></td>
							<td><s:property value='studentId' />
							</td>
							<td><s:date name="createTime" format="yyyy-MM-dd HH:mm" />
							</td>
							<td><s:if test="groupStatus==-1">
   	是
   </s:if> <s:if test="groupStatus==0">
   	否
   </s:if>
							</td>
						</tr>
					</s:iterator>
				</table>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="studentGroup.pageNo" />
					页 共
					<s:property value="studentGroup.pageNum" />
					页 <a
						href="javascript:firstPage(<s:property value="studentGroup.pageNo"/>,<s:property value="studentGroup.pageNum"/>);">第一页</a>
					<a
						href="javascript:prevPage(<s:property value="studentGroup.pageNo"/>,<s:property value="studentGroup.pageNum"/>);">上一页</a>
					<a class="blue12_33"
						href="javascript:nextPage(<s:property value="studentGroup.pageNo"/>,<s:property value="studentGroup.pageNum"/>);">下一页</a>
					<a class="blue12_33"
						href="javascript:lastPage(<s:property value="studentGroup.pageNo"/>,<s:property value="studentGroup.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1"
						name="studentGroup.pageNo"> 页 <a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="studentGroup.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
