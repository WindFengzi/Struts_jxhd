<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>学生互评</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script  src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script type="text/javascript">
function deleteStation(evaluationId){
	if(window.confirm('你确定要删除吗？')){
		form1.action="DeleteEvaluationStu.action";
		form1.evaluationId.value = evaluationId;
		form1.submit();
	}
}
function addStation(){
	form1.action="ToInsertEvaluationStu.action";
	form1.submit();
}
function updateStation(evaluationId){
	form1.evaluationId.value=evaluationId;
	form1.action="evaluationStudentById.action";
	form1.submit();
}
function viewStation(evaluationId){
	form1.evaluationId.value=evaluationId;
	form1.action="ArticleByIdView.action";
	form1.submit();
}
function look(){
	form1.submit();
}
</script>
</head>
<body>
	<form id="form1" name="form1" action="EvaluationResults.action"
		method="post">
		<input type="hidden" name="evaluationResult.evaluationId"
			id="evaluationId" />

		<div class="w800 fr">
			<div class="postion lh28 mb15">
				<span class="fb green">您的位置：</span><a href="#">教学互动反馈</a> 》 <a
					href="#">学生互评 </a>
			</div>
			<div class="w800_con ">
				<div class="tit2">
					<h2 class="lh32 pl30">
						<span class="fb f14">学生互评</span> The Attendance Rate Statistics
					</h2>
				</div>
				<div class="p20 con1">
					<div class="form1 " style="padding-left:20px">
						评价内容：
						<s:select id="itemId" list="evaluationItem.data"
							name="evaluationResult.itemId" onchange="look()" headerKey=""
							headerValue="全部" listKey="content" listValue="content"></s:select>
						<input name="input" type="button" value=" 搜  索" onclick="look()"
							class="bt1 fb grey1 ml10" /> <input name="input" type="button"
							value=" 评  价" onclick="addStation()" class="bt1 fb grey1 ml10" />
					</div>
					<div class="table4 table3">
						<table style="width:100%;border:1px solid #d7d7d7" class="all_content" >
							<tr>
								<td width="10%" class="bghui fb">序号</td>
								<td width="10%" class="bghui fb">被评价学生</td>
								<td class="bghui fb">评价内容</td>
								<td width="10%" class="bghui fb">评价等级</td>
								<td width="10%" class="bghui fb">删除</td>
							</tr>
							<%
								int i = 1;
							%>
							<s:iterator value="evaluationResult.data" status="stat">
								<tr>
									<td><%=i++%></td>
									<td><s:property value='beUserId' />
									</td>
									<td><s:property value='itemId' />
									</td>
									<td><s:property value='gradeId' /></td>
									<td><a href="#" class="blue12_33"
										onclick="javascript:deleteStation(<s:property value='evaluationId'/>)">删除</a>
									</td>
								</tr>
							</s:iterator>
						</table>
						<div class="pages mt20 tc">
							当前是第
							<s:property value="evaluationResult.pageNo" />
							页 共
							<s:property value="evaluationResult.pageNum" />
							页 <a
								href="javascript:firstPage(<s:property value="evaluationResult.pageNo"/>,<s:property value="evaluationResult.pageNum"/>);">第一页</a>
							<a
								href="javascript:prevPage(<s:property value="evaluationResult.pageNo"/>,<s:property value="evaluationResult.pageNum"/>);">上一页</a>
							<a class="blue12_33"
								href="javascript:nextPage(<s:property value="evaluationResult.pageNo"/>,<s:property value="evaluationResult.pageNum"/>);">下一页</a>
							<a class="blue12_33"
								href="javascript:lastPage(<s:property value="evaluationResult.pageNo"/>,<s:property value="evaluationResult.pageNum"/>);">最后一页</a>
							转到 <input id="inputPageNo" type="text" size="1"
								name="evaluationResult.pageNo"> 页
							<a class="blue12_33"
								href="javascript:checkInputPageNo1('inputPageNo',<s:property value="evaluationResult.pageNum"/>)">go</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
