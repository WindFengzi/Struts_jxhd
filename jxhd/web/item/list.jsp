<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>试题管理</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script  src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script type="text/javascript">
function deleteStation(itemId){
	if(window.confirm('你确定要删除吗？')){
		form1.action="DeleteItem.action";
		form1.itemId.value = itemId;
		form1.submit();
	}
}
/* function updateStation(stationId){
	form1.action="GetStationById.action";
	form1.stationId.value = stationId;
	form1.submit();
} */
function addStation(){
	form1.action="ToInsertItem.action";
	form1.submit();
}
function updateStation(itemId){
	form1.itemId.value=itemId;
	form1.action="ItemById.action";
	form1.submit();
}
function viewStation(id){
	form1.id.value=id;
	form1.action="ArticleByIdView.action";
	form1.submit();
}
function look(){
	form1.submit();
}
function toExcelSave(){
		 	var t2 = document.getElementById("questiontype"); 
			var classId = t2.options[t2.selectedIndex].value;
			if(classId==''){
				alert("请选择试题类型。");
			}else{
				form1.action="ToInsertPlItem.action";
				form1.submit();
			}
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
	<form id="form1" name="form1" action="Items.action" method="post">
		<input type="hidden" name="testItem.itemId" id="itemId" />
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">系统管理</a>
			》 <a href="#">试题管理</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">试题管理</span> The Item Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:18px">
				试题种类：
				<s:select list="#{'':'全部','0':'单选题','1':'多选题','2':'判断题','3':'问答题','4':'图片比对题'}"
					onchange="look()" id="questiontype" name="testItem.questiontype"></s:select>
				试题名称：
				<input name="testItem.question" type="text" value="<s:property value='testItem.question'/>" class="text" /> 
				<input name="input" type="button" value=" 搜  索" onclick="look()" class="bt1 fb grey1 ml10" /> 
				<input name="input" type="button" value=" 添  加" onclick="addStation()" class="bt1 fb grey1 ml10" />
				<input name="input" type="button" value="excel导入" onclick="toExcelSave()" class="bt1 fb grey1 ml10" />
			</div>
			<div class="table4 table3">
				<table style="width: 100%;border: 1px; border-color:#d7d7d7;" class="all_content">
					<tr>
						<td width="5%" colspan="2" class="bghui fb">序号</td>
						<td class="bghui fb">试题名称</td>
						<td width="10%" class="bghui fb">试题种类</td>
						<td width="10%" class="bghui fb">操作</td>
					</tr>
					<%
						int i = 1;
					%>
					<s:iterator value="testItem.data" status="stat">
						<tr>
							<td colspan="2"><%=i++%></td>
							<td><s:property value='question' escape="false" /></td>
							<td><s:if test="questiontype==0">
								   单选题
								   </s:if> <s:if test="questiontype==1">
								   多选题
								   </s:if> <s:if test="questiontype==2">
								  判断题
								   </s:if> <s:if test="questiontype==5">
								  填空题
								   </s:if> <s:if test="questiontype==3">
								   问答题
								   </s:if> <s:if test="questiontype==4">
								   图片比对题
								   </s:if>
							</td>
							<td><a href="#"
								onclick="updateStation(<s:property value='itemId'/>)"
								class="grey">编辑</a> <a href="#"
								onclick="javascript:deleteStation(<s:property value='itemId'/>)"
								class="grey">删除</a>
							</td>
						</tr>
					</s:iterator>
				</table>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="testItem.pageNo" />
					页 共
					<s:property value="testItem.pageNum" />
					页 <a
						href="javascript:firstPage(<s:property value="testItem.pageNo"/>,<s:property value="testItem.pageNum"/>);">第一页</a>
					<a
						href="javascript:prevPage(<s:property value="testItem.pageNo"/>,<s:property value="testItem.pageNum"/>);">上一页</a>
					<a class="blue12_33"
						href="javascript:nextPage(<s:property value="testItem.pageNo"/>,<s:property value="testItem.pageNum"/>);">下一页</a>
					<a class="blue12_33"
						href="javascript:lastPage(<s:property value="testItem.pageNo"/>,<s:property value="testItem.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1"
						name="testItem.pageNo"> 页 <a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="testItem.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
