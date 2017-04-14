<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>公告信息</title>
<link href="/jxhd/css/css.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
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
		//form1.submit();
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
	function chexiao() {

		var chkObjs = document.getElementsByName("radio1");
		var radValue = "";
		for ( var i = 0; i < chkObjs.length; i++) {
			if (chkObjs[i].checked) {
				radValue = chkObjs[i].value;
				break;
			}
		}
		var str = new Array();
		str = radValue.split(",");

		form1.questionid.value = str[0];
		form1.questiontype.value = str[1];
		form1.action = "SaveQuestionPaper.action";
		//form1.submit();
	}
	function fenzu() {
		form1.action = "ToFenzu.action";
	}
</script>
</head>
<body>
	<form id="form1" name="form1" action="Questions.action" method="post">
		<input type="hidden" name="JXHD_QuestionPaper.questionid"
			id="questionid" /> <input type="hidden"
			name="JXHD_QuestionPaper.questiontype" id="questiontype" />
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="border_gray_3d6">
			<tr>
				<td height="35" background="images/bg03.jpg"
					style="padding-left:5px;">当前位置：教学互动> 选择试题</td>
			</tr>
			<tr>
				<td height="30" background="images/bg06.jpg"><table width="98%"
						border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="600" align="center"><TABLE>
									<TBODY>
										<TR>
											<TD>试题名称：<input name="JXHD_SEL.question" type="text"
												id="question"
												value="<s:property value='question' escape="false"/>"
												size="30" />
											</td>
											<TD>试题种类： <s:select
													list="#{'':'全部','单选题':'单选题','多选题':'多选题','判断题':'判断题','填空题':'填空题','问答题':'问答题'}"
													name="JXHD_SEL.questiontype"></s:select></td>
										</TR>
									</TBODY>
								</TABLE>
							</td>
							<td valign="bottom"><input name="button" type="image"
								style="height:20px;" src="images/arrow2_01.jpg"> <input
									name="button2" type="image" style="height:20px;"
									onclick="chexiao()" src="images/arrow2_03.jpg"> <input
										name="button2" type="image" style="height:20px;"
										onclick="fenzu()" src="images/arrow2_02.jpg">
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#97bce3" class="border_gray_4d6"
			style="margin-top:10px;">
			<tr>
				<td height="30" align="center" background="images/bg06.jpg"
					class="black12_b"></td>
				<td height="30" align="center" background="images/bg06.jpg"
					class="black12_b">序号</td>
				<td align="center" background="images/bg06.jpg" class="black12_b">
					试题名称</td>
				<td align="center" background="images/bg06.jpg" class="black12_b">
					试题种类</td>
			</tr>
			<s:iterator value="JXHD_SEL.data" status="stat">
				<s:if test="#stat.odd == true">
					<tr>
						<td align="center" bgcolor="#f1f4f8"><input type="radio"
							name="radio1"
							value="<s:property value='id'/>,<s:property value='questiontype'/>">
						</td>
						<td height="28" align="center" bgcolor="#f1f4f8"><s:property
								value='id' />
						</td>
						<td height="28" align="center" bgcolor="#f1f4f8"><s:property
								value='question' escape="false" />
						</td>
						<td height="28" align="center" bgcolor="#f1f4f8"><s:property
								value='questiontype' /></td>
					</tr>
				</s:if>
				<s:else>
					<tr>
						<td align="center" bgcolor="#FFFFFF"><input type="radio"
							name="radio1"
							value="<s:property value='id'/>,<s:property value='questiontype'/>">
						</td>
						<td height="28" align="center" bgcolor="#FFFFFF"><s:property
								value='id' />
						</td>
						<td height="28" align="center" bgcolor="#FFFFFF"><s:property
								value='question' escape="false" />
						</td>
						<td height="28" align="center" bgcolor="#FFFFFF"><s:property
								value='questiontype' /></td>
					</tr>
				</s:else>
			</s:iterator>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" background="images/bg04.jpg" bgcolor="#FFFFFF"
			class="border_blue_4bf" style="margin-top:10px;">

			<tr>
				<td width="50%" height="30" background="images/bg04.jpg"
					style="padding-left:5px;">当前是第 <s:property
						value="JXHD_SEL.pageNo" /> 页 共 <s:property
						value="JXHD_SEL.pageNum" /> 页 <a class="blue12_33"
					href="javascript:firstPage(<s:property value="JXHD_SEL.pageNo"/>,<s:property value="JXHD_SEL.pageNum"/>);">第一页</a>
					<a class="blue12_33"
					href="javascript:prevPage(<s:property value="JXHD_SEL.pageNo"/>,<s:property value="JXHD_SEL.pageNum"/>);">上一页</a>
					<a class="blue12_33"
					href="javascript:nextPage(<s:property value="JXHD_SEL.pageNo"/>,<s:property value="JXHD_SEL.pageNum"/>);">下一页</a>
					<a class="blue12_33"
					href="javascript:lastPage(<s:property value="JXHD_SEL.pageNo"/>,<s:property value="JXHD_SEL.pageNum"/>);">最后一页</a>
				</td>
				<td width="33%"></td>
				<td>转到 <input id="inputPageNo" type="text"
					size="<s:property value="JXHD_SEL.pageNo"/>" name="JXHD_SEL.pageNo">页

						<a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="JXHD_SEL.pageNum"/>)">go</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
