<!DOCTYPE html>
<%@ page language="java"
	import="com.dt.jxhd.domain.*,java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>组间互评评价</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<style>
#editable {
	padding: 10px;
	float: left;
}
</style>
<script>
	function sub1() {
		var tab = document.getElementById('tab');
		var obj = document.getElementById('itemId');
		var index = obj.selectedIndex;
		var itemId = obj.options[index].value;
		var url = 'SaveEvaluationGroupAjax.action';
		var studentId = "";
		var gradeId = "";
		for ( var i = 1; i < tab.rows.length; i++) {

			//for(var j=0;j<tab.rows[i].cells.length;j++){
			//alert(tab.rows[i].cells[j].innerHTML);
			var studentId1 = tab.rows[i].cells[0].innerHTML;
			//gradeId = tab.rows[i].cells[1].innerHTML;
			var sel = tab.rows[i].cells[0].innerHTML + 'sel';
			var obj = document.getElementById(sel);
			var index = obj.selectedIndex;
			var gradeId1 = obj.options[index].value;

			studentId = studentId + studentId1 + ",";
			gradeId = gradeId + gradeId1 + ",";
			//}
		}
		var params = {
			studentId : studentId,
			gradeId : gradeId,
			itemId : itemId
		};
		jQuery.post(url, params, savebackFun1, 'json');
	}
	function setVal(val) {
		var aa = val + 'sel';
		alert(document.getElementById(aa));
	}

	function savebackFun1(data) {
		var msg = data['msg'];
		alert(msg);
	}
	function gradeByItemId() {
		var obj = document.getElementById("itemId");
		var index = obj.selectedIndex;
		itemId = obj.options[index].value;
		//districtId = districtId.substr(0,districtId.length-1);
		var url = 'GradeByItemIdAjax.action';
		var params = {
			itemId : itemId
		};
		jQuery.post(url, params, callbackFun, 'json');
	}
	function callbackFun(data) {
		var tab = document.getElementById('tab');
		var parameters = data['list'];
		for ( var i = 1; i < tab.rows.length; i++) {
			var sel = tab.rows[i].cells[0].innerHTML + 'sel';
			document.getElementById(sel).options.length = 0;
			document.getElementById(sel).options.add(new Option('', ''));
			for (n = 0; n < parameters.length; n++) {
				document.getElementById(sel).options.add(new Option(
						parameters[n].gradeDesc, parameters[n].gradeId));
			}
		}
	}
</script>

</head>

<body>
	<form name="form1" method="post" action="EvaluationGroups.action"
		id="form1" enctype="multipart/form-data">


		<div class="w800 fr">
			<div class="postion lh28 mb15">
				<span class="fb green">您的位置：</span><a href="#">教学互动反馈</a> 》 <a
					href="#">组间互评 </a>
			</div>
			<div class="w800_con ">
				<div class="tit2">
					<h2 class="lh32 pl30">
						<span class="fb f14">组间互评</span> The Attendance Rate Statistics
					</h2>
				</div>
				<div class="p20 con1">
					<div class="form1 ">

						评价内容：
						<s:select id="itemId" list="evaluationItem.data"
							onchange="gradeByItemId()" name="itemId" headerKey=""
							headerValue="全部" listKey="itemId" listValue="content"></s:select>
						<input name="input" type="button" value=" 保  存" onclick="sub1()"
							class="bt1 fb grey1 ml50" />
					</div>
					<div class="table4 table3">
						<table style="width:100%;border:1px solid #d7d7d7" class="all_content" id="tab" >
							<tr>
								<td class="bghui fb">被评价组</td>
								<td width="10%" class="bghui fb">评价等级</td>
							</tr>
							<%
								int i = 1;
								List list = (List) request.getAttribute("list");
								student_group group = null;
								for (int n = 0; n < list.size(); n++) {
									group = (student_group) list.get(n);
							%>
							<tr>
								<td><%=group.getGroupName()%></td>
								<td><select id="<%=group.getGroupName()%>sel">
										<option value=""></option>
										<s:iterator value="evaluationGrade.data" status="stat">
											<option value="<s:property value='gradeId'/>">
												<s:property value='gradeDesc' />
											</option>
										</s:iterator>
								</select></td>

							</tr>
							<%
								}
							%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
