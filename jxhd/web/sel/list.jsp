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
function deleteStation(stationId){
	if(window.confirm('你确定要删除吗？')){
		form1.action="DeleteSel.action";
		form1.id.value = stationId;
		form1.submit();
	}
}
function updateStation(stationId){
	form1.action="GetStationById.action";
	form1.stationId.value = stationId;
	form1.submit();
}
function addStation(){
	form1.action="ToInsertSel.action";
	form1.submit();
}
function updateStation(id){
	form1.id.value=id;
	form1.action="SelById.action";
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
	<form id="form1" name="form1" action="Sels.action" method="post">
		<input type="hidden" name="JXHD_SEL.id" id="id" />
		<s:hidden name="JXHD_SEL.classId"></s:hidden>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="border_gray_3d6">
			<tr>
				<td height="35" background="images/bg03.jpg"
					style="padding-left:5px;">当前位置：系统管理> 选择试题管理</td>
			</tr>
			<tr>
				<td height="30" background="images/bg06.jpg"><table width="98%"
						border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="300" align="center"><TABLE>
									<TBODY>
										<TR>
											<TD>试题名称：<input name="JXHD_SEL.question" type="text"
												id="question" size="30" />
											</td>
										</TR>
									</TBODY>
								</TABLE>
							</td>
							<td valign="bottom"><input name="button" type="image"
								style="height:20px;" onclick="look()" src="images/arrow2_03.jpg">
									<input name="button2" type="image" style="height:20px;"
									onclick="addStation()" src="images/arrow2_20.jpg">
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
					class="black12_b">序号</td>
				<td align="center" background="images/bg06.jpg" class="black12_b">
					试题名称</td>
				<td align="center" background="images/bg06.jpg" class="black12_b">
					编辑</td>
				<td align="center" background="images/bg06.jpg" class="black12_b">
					删除</td>
			</tr>
			<s:iterator value="JXHD_SEL.data" status="stat">
				<s:if test="#stat.odd == true">
					<tr>
						<td height="28" align="center" bgcolor="#f1f4f8"><s:property
								value='id' />
						</td>
						<td height="28" align="center" bgcolor="#f1f4f8"><s:property
								value='question' escape="false" />
						</td>
						<td height="28" align="center" bgcolor="#f1f4f8"><a href="#"
							class="blue12_33"
							onclick="updateStation(<s:property value='id'/>)">编辑</a></td>
						<td height="28" align="center" bgcolor="#f1f4f8"><a href="#"
							class="blue12_33"
							onclick="javascript:deleteStation(<s:property value='id'/>)">删除</a>
						</td>
					</tr>
				</s:if>
				<s:else>
					<tr>
						<td height="28" align="center" bgcolor="#FFFFFF"><s:property
								value='id' />
						</td>
						<td height="28" align="center" bgcolor="#FFFFFF"><s:property
								value='question' escape="false" />
						</td>
						<td height="28" align="center" bgcolor="#FFFFFF"><a href="#"
							class="blue12_33"
							onclick="updateStation(<s:property value='id'/>)">编辑</a></td>
						<td height="28" align="center" bgcolor="#FFFFFF"><a href="#"
							class="blue12_33"
							onclick="javascript:deleteStation(<s:property value='id'/>)">删除</a>
						</td>
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
