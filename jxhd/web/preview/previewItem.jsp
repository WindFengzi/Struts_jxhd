<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>列表</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script type="text/javascript">
	/* function deleteStation(stationId) {
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
	} */
	//添加问答

	function chexiao() {
		var chkObjs = document.getElementsByName("radio1");
		var ss = "";

		for (var i = 0; i < chkObjs.length; i++) {
			if (chkObjs[i].checked) {
				ss = ss + chkObjs[i].value + ",";
			}
		}
		parent.document.getElementById("preview_content").value = parent.document
				.getElementById("preview_content").value
				+ ss;
		if (ss == "") {
			alert("请选择预习题目。");
			return;
		}
		alert("添加成功！")
	}
	//确定
	function confirm() {
		var content = parent.document.getElementById("preview_content").value;
		var real_content = content.substr(0, content.length - 1);
		form1.preview_content.value = real_content;
		form1.class_id.value = parent.document.getElementById("classId").value;
		form1.preview_title.value = parent.document.getElementById("title").value;
		form1.target = parent.parent.parent.document
				.getElementById("frm_home_main").name;
		form1.action = "AddPreviewProblem.action";
		form1.submit();
	}

	function sub1() {
		form1.submit();
	}
</script>

</head>
<body>
	<form id="form1" name="form1" action="PreviewSelectItems.action"
		method="post">
		<%-- <input type="hidden" name="askLog.itemId" id="itemId" /> 
		<input type="hidden" name="preview.preview_content" id="preview_content" />
		<input type="hidden" name="preview.class_id" id="class_id" /> 
		<input type="hidden" name="preview.preview_title" id="preview_title" />
		<s:hidden name="askLog.askType" id="askType"></s:hidden> --%>

		<div class="w800_con " style="border:0">
			<div class="form1 " style="padding-left:20px">
				<%-- <s:if test="askLog.askType!=4"> --%>
				试题种类： 
				 <s:select list="#{'':'全部','0':'单选题','1':'多选题','2':'判断题','3':'问答题'}"
					onchange="sub1()" id="questiontype" name="preview_title.preview_tag">
					</s:select>
				<%-- </s:if> --%>

				试题名称:
				<input name="t_preview_add.preview_title" type="text" class="text" /> 
				<input name="input" type="button" value=" 搜  索" onclick="sub1()" class="bt1 fb grey1 ml50" /> 
				<input name="input" type="button" value=" 添  加" onclick="chexiao()" class="bt1 fb grey1 ml50" /> 
				<input name="input" type="button" value=" 确  定" onclick="confirm()" class="bt1 fb grey1 ml50" />
			</div>
			<div class="table4 table3">
				<table style="width:100%;border:1px solid #d7d7d7"
					class="all_content">
					<tr>
						<td width="10%" class="bghui fb"></td>
						<td width="10%" colspan="2" class="bghui fb">序号</td>
						<td class="bghui fb">试题名称</td>
						<td width="10%" class="bghui fb">试题种类</td>
					</tr>
					<%
						int i = 1;
					%>
					<s:iterator value="t_preview_add.data" status="stat">
						<tr>
							<td>
							<input type="checkbox" name="radio1" value="<s:property value='preview_add_id'/>" style="zoom:80%" /></td>
							<td colspan="2"><%=i++%></td>
							<td><s:property value='preview_title' escape="false" /></td>
							<td><s:property value='preview_content' escape="false" />
							</td>
						</tr>
					</s:iterator>
				</table>
				
				<div class="pages mt20 tc">
					当前是第
					<s:property value="t_preview_add.pageNo" />
					页 共
					<s:property value="t_preview_add.pageNum" />
					页
					<a href="javascript:firstPage(<s:property value="t_preview_add.pageNo"/>,<s:property value="t_preview_add.pageNum"/>);">第一页</a>
					<a href="javascript:prevPage(<s:property value="t_preview_add.pageNo"/>,<s:property value="t_preview_add.pageNum"/>);">上一页</a>
					<a class="blue12_33" href="javascript:nextPage(<s:property value="t_preview_add.pageNo"/>,<s:property value="t_preview_add.pageNum"/>);">下一页</a>
					<a class="blue12_33" href="javascript:lastPage(<s:property value="t_preview_add.pageNo"/>,<s:property value="t_preview_add.pageNum"/>);">最后一页</a>
					转到 
					<input id="inputPageNo" type="text" size="1" name="t_preview_add.pageNo"> 页 
					<a class="blue12_33" href="javascript:checkInputPageNo1('inputPageNo',<s:property value="t_preview_add.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
