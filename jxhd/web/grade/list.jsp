<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>评价等级</title>
<link rel="stylesheet" href="/jxhd/css/demo.css" type="text/css">
<link rel="stylesheet" href="/jxhd/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script type="text/javascript"
	src="/jxhd/js/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="/jxhd/js/ztree/jquery.ztree.excheck-3.5.js"></script>
<script src="/jxhd/js/Time.js"></script>
<script type="text/javascript">
function deleteStation(stationId){
	if(window.confirm('你确定要删除吗？')){
		form1.action="DeleteEvaluationGrade.action";
		form1.gradeId.value = stationId;
		form1.submit();
	}
}
function addStation(){
	form1.action="ToInsertEvaluationGrade.action";
	form1.submit();
}
function updateStation(id){
	form1.gradeId.value=id;
	form1.action="EvaluationGradeById.action";
	form1.submit();
}
function viewStation(id){
	form1.itemId.value=id;
	form1.action="ArticleByIdView.action";
	form1.submit();
}
function look(){
	form1.submit();
}

/* window.onload=function(){
		//alert(document.body.offsetHeight);//firefox和ie显示正确，但是chrome不行
		//alert(document.getElementById("form1").offsetHeight);
		parent.document.getElementById('frm_home_main1').style.height = document.getElementById("form1").offsetHeight + 'px' ;
		parent.parent.document.getElementById('frm_home_main').style.height = document.getElementById("form1").offsetHeight + 'px' ;
	} */
</script>
</head>
<body>
	<form id="form1" name="form1" action="EvaluationGrades.action"
		method="post">
		<input type="hidden" name="evaluationGrade.gradeId" id="gradeId" />

		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">系统管理</a> 》 <a href="#">评价设置</a>
			》 <a href="#">评价级别</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">评价级别</span> The Grade Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:20px">
				<input name="evaluationGrade.gradeDesc" type="text"
					value="<s:property value='evaluationGrade.gradeDesc'/>"
					class="text" /> <input name="input" type="button" value=" 搜  索"
					onclick="look()" class="bt1 fb grey1 ml10" /> <input name="input"
					type="button" value=" 添  加" onclick="addStation()"
					class="bt1 fb grey1 ml10" />
			</div>
			<div class="table4 table3">
				<table style="width: 100%;border: 1px; border-color:#d7d7d7;" class="all_content">
					<tr>
						<td width="10%" colspan="2" class="bghui fb">序号</td>
						<td class="bghui fb">评价等级</td>
						<td width="30%" class="bghui fb">操作</td>
					</tr>
					<%
						int i = 1;
					%>
					<s:iterator value="evaluationGrade.data" status="stat">
						<tr>
							<td colspan="2"><%=i++%></td>
							<td><s:property value='gradeDesc' /></td>
							<td><a href="#"
								onclick="updateStation(<s:property value='gradeId'/>)"
								class="grey">编辑</a> <a href="#"
								onclick="deleteStation(<s:property value='gradeId'/>)"
								class="grey">删除</a>
							</td>
						</tr>
					</s:iterator>
				</table>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="evaluationGrade.pageNo" />
					页 共
					<s:property value="evaluationGrade.pageNum" />
					页 <a
						href="javascript:firstPage(<s:property value="evaluationGrade.pageNo"/>,<s:property value="evaluationGrade.pageNum"/>);">第一页</a>
					<a
						href="javascript:prevPage(<s:property value="evaluationGrade.pageNo"/>,<s:property value="evaluationGrade.pageNum"/>);">上一页</a>
					<a class="blue12_33"
						href="javascript:nextPage(<s:property value="evaluationGrade.pageNo"/>,<s:property value="evaluationGrade.pageNum"/>);">下一页</a>
					<a class="blue12_33"
						href="javascript:lastPage(<s:property value="evaluationGrade.pageNo"/>,<s:property value="evaluationGrade.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1"
						name="evaluationGrade.pageNo"> 页 <a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="evaluationGrade.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
