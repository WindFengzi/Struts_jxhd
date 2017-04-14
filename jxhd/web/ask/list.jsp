<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>问答：即问即答、抢答活动、挑人作答、挑组作答、图片比对</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script  src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script type="text/javascript">
function deleteStation(askId){
	if(window.confirm('你确定要删除吗？')){
		form1.action="DeleteAsk.action";
		form1.askId.value = askId;
		form1.submit();
	}
}
function lookStation(askId,itemId,courceId){
	form1.askId.value = askId;
	form1.itemId.value = itemId;
	form1.courceId.value = courceId;
	form1.action="ToItem.action";
	form1.submit();
}
//添加问答
function addStation(){
	form1.action="ToSelectItems.action";
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
</script>
</head>
<body>
	<form id="form1" name="form1" action="Asks.action" method="post">
		<input type="hidden" name="askLog.askId" id="askId" /> 
		<input type="hidden" name="askLog.itemId" id="itemId" /> 
		<input type="hidden" name="askLog.courceId" id="courceId" />
		<s:hidden name="askLog.askType" id="askType"></s:hidden>
		<%
			String askType = request.getParameter("askLog.askType");
			String name = "";
			if (askType.equals("0")) {
				name = "即问即答";
			} else if (askType.equals("1")) {
				name = "抢答活动";
			} else if (askType.equals("2")) {
				name = "挑人作答";
			} else if (askType.equals("4")) {
				name = "图片比对";
			} else {
				name = "挑组作答";
			}
		%>


		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">教学互动反馈</a>
			》 <a href="#"><%=name%></a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14"><%=name%></span> The Ask Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:10px">
				试题名称：
				<input name="askLog.question" type="text" value="<s:property value='askLog.question'/>" class="text" /> 
				<input name="input" type="button" value=" 搜  索" onclick="look()" class="bt1 fb grey1 ml10" /> 
				<input name="input" type="button" value=" 添  加" onclick="addStation()" class="bt1 fb grey1 ml10" />
			</div>
			<div class="table4 table3">
				<table style="width:100%;border:1px solid #d7d7d7" class="all_content">
					<tr>
						<td width="10%" colspan="2" class="bghui fb">序号</td>
						<td class="bghui fb">试题名称</td>
						<td width="10%" class="bghui fb">出题人</td>
						<td width="20%" class="bghui fb">出题时间</td>
						<td width="10%" class="bghui fb">操作</td>
					</tr>
					<%
						int i = 1;
					%>
					<s:iterator value="askLog.data" status="stat">
						<tr>
							<td colspan="2"><%=i++%></td>
							<td><s:property value='question' escape="false" />
							</td>
							<td><s:property value='name' /></td>
							<td><s:date name="askTime" format="yyyy-MM-dd HH:mm" />
							</td>

							<td><a href="#"
								onclick="javascript:lookStation(<s:property value='askId'/>,<s:property value='itemId'/>,<s:property value='courceId'/>)"
								class="grey">查看</a> <a href="#"
								onclick="javascript:deleteStation(<s:property value='askId'/>)"
								class="grey">删除</a></td>
						</tr>
					</s:iterator>
				</table>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="askLog.pageNo" />
					页 共
					<s:property value="askLog.pageNum" />
					页 <a
						href="javascript:firstPage(<s:property value="askLog.pageNo"/>,<s:property value="askLog.pageNum"/>);">第一页</a>
					<a
						href="javascript:prevPage(<s:property value="askLog.pageNo"/>,<s:property value="askLog.pageNum"/>);">上一页</a>
					<a class="blue12_33"
						href="javascript:nextPage(<s:property value="askLog.pageNo"/>,<s:property value="askLog.pageNum"/>);">下一页</a>
					<a class="blue12_33"
						href="javascript:lastPage(<s:property value="askLog.pageNo"/>,<s:property value="askLog.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1"
						name="askLog.pageNo"> 页 
						<a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="askLog.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
