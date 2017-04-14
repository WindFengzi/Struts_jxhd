<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>添加问答题目列表</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script  src="/jxhd/js/PageCtrl.js"></script>
<script  src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript" ></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script type="text/javascript">
	function deleteStation(stationId) {
		if (window.confirm('你确定要删除吗？')) {
			form1.action = "DeleteSel.action";
			form1.id.value = stationId;
			form1.submit();
		}
	}
	function updateStation(stationId) {
		form1.action = "GetStationById.action";
		form1.stationId.value = stationId;
		form1.submit();
	}
	function addStation() {
		form1.action = "ToInsertSel.action";
		form1.submit();
	}
	function updateStation(id) {
		form1.id.value = id;
		form1.action = "SelById.action";
		form1.submit();
	}
	function viewStation(id) {
		form1.id.value = id;
		form1.action = "ArticleByIdView.action";
		form1.submit();
	}
	function look() {
		form1.submit();
	}
	function checkAll() {
		var obj = document.all.box1;
		var obj1 = document.all.checkbox1;

		if (obj.checked) {
			for (i = 0; i < obj1.length; i++) {
				obj1[i].checked = true;
			}
		} else {
			for (i = 0; i < obj1.length; i++) {
				obj1[i].checked = false;
			}
		}
	}
	//添加问答
	function chexiao() {
		var chkObjs = document.getElementsByName("radio1");
		var radValue = "";
		for ( var i = 0; i < chkObjs.length; i++) {
			if (chkObjs[i].checked) {
				radValue = chkObjs[i].value;
				break;
			}
		}
		if (radValue == "") {
			alert("请选择题目！");
			return false;
		}
		//var obj = document.getElementById("questiontype"); //定位id
		//var index = obj.selectedIndex; // 选中索引
		//var text = obj.options[index].text; // 选中文本
		//var value = obj.options[index].value; // 选中值
		//alert(form1.askType.value);
		//if(form1.askType.value!=4){
		//alert(value);
		//	if(value=='4'){
		//		alert("非图片比对不能选图片比对题目。");
		//		return false;
		//	}
		//}
		form1.itemId.value = radValue;

		if (form1.askType.value == 2) {
			form1.action = "ToTiaoren.action";
		} else if (form1.askType.value == 3) {
			form1.action = "ToTiaozu.action";
		} else {
			form1.action = "SaveAsk.action";
		}
		form1.submit();
	}
	function sub1() {
		form1.submit();
	}
</script>

</head>
<body>
	<form id="form1" name="form1" action="ToSelectItems.action"
		method="post">
		<input type="hidden" name="askLog.itemId" id="itemId" />
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
					<span class="fb f14">选择试题</span> The Item Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:20px">
				<s:if test="askLog.askType!=4">
					试题种类：  <s:select list="#{'':'全部','0':'单选题','1':'多选题','2':'判断题','3':'问答题'}"
						onchange="sub1()" id="questiontype" name="testItem.questiontype"></s:select>
				</s:if>

				试题名称:
				<input name="testItem.question" type="text" class="text" /> 
				<input name="input" type="button" value=" 搜  索" onclick="sub1()" class="bt1 fb grey1 ml50" /> 
				<input name="input" type="button" value=" 添  加" onclick="chexiao()" class="bt1 fb grey1 ml50" />
			</div>
			<div class="table4 table3">
				<table style="width:100%;border:1px solid #d7d7d7" class="all_content">
					<tr>
						<td width="10%" class="bghui fb"></td>
						<td width="10%" colspan="2" class="bghui fb">序号</td>
						<td class="bghui fb">试题名称</td>
						<td width="10%" class="bghui fb">试题种类</td>
					</tr>
					<%
						int i = 1;
					%>
					<s:iterator value="testItem.data" status="stat">
						<tr>
							<td><input type="radio" name="radio1" value="<s:property value='itemId'/>" style="zoom:80%" /></td>
							<td colspan="2"><%=i++%></td>
							<td><s:property value='question' escape="false" /></td>
							<td>
							<s:if test="questiontype==0">
						   	单选题
						   </s:if> <s:if test="questiontype==1">
						   	多选题
						   </s:if> <s:if test="questiontype==2">
						   	判断题
						   </s:if> <s:if test="questiontype==3">
						   	问答题
						   </s:if> <s:if test="questiontype==4">
						   	图片比对题
						   </s:if></td>
						</tr>
					</s:iterator>
				</table>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="testItem.pageNo" />
					页 共
					<s:property value="testItem.pageNum" />
					页 <a href="javascript:firstPage(<s:property value="testItem.pageNo"/>,<s:property value="testItem.pageNum"/>);">第一页</a>
					<a href="javascript:prevPage(<s:property value="testItem.pageNo"/>,<s:property value="testItem.pageNum"/>);">上一页</a>
					<a class="blue12_33" href="javascript:nextPage(<s:property value="testItem.pageNo"/>,<s:property value="testItem.pageNum"/>);">下一页</a>
					<a class="blue12_33" href="javascript:lastPage(<s:property value="testItem.pageNo"/>,<s:property value="testItem.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1" name="testItem.pageNo"> 页
					<a class="blue12_33" href="javascript:checkInputPageNo1('inputPageNo',<s:property value="testItem.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
