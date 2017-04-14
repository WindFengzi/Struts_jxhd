<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>查看已发送预习的具体题目</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script  src="/jxhd/js/PageCtrl.js"></script>
</head>

<body>
	<form id="form1" name="form1" action="PreviewById.action" method="post"  >
	<% Integer a = (Integer)(request.getAttribute("preview_id")); %>
		<input type="hidden" name="preview.preview_id" id="preview_id" value=<%=a%> />
		<div class="w170 fl">
			<img src="img/xtgl.jpg" width="170" height="77" alt="系统管理"
				class="mb15" />
		</div>
		<div class="w800 fr" style="height:100%">
			<div class="postion lh28 mb15">
				<span class="fb green">您的位置：</span><a href="#">系统管理</a> 》 <a href="#">查看预习</a>
			</div>
			<div class="w800_con ">
				<div class="tit2">
					<h2 class="lh32 pl30">
						<span class="fb f14">查看预习</span> Bulletin List
					</h2>
				</div>
				<div class="table4 table3">
					<table style="width: 100%;border: 1px; border-color:#d7d7d7;">
						<tr>
							<td width="20%" class="bghui fb">序号</td>
							<td class="bghui fb">题目</td>
							<td width="20%" class="bghui fb">类型</td>
						</tr>
						<s:iterator value="testItem.data" status="stat">
							<tr style="border-bottom:1px solid #E5EFF0">
								<td><s:property value="#stat.index+1"/></td>
								<td style="text-align: left;">
									<a href="#" class="notice_title" onclick="viewStation(<s:property value='preview_id'/>)" class="grey"><s:property value='question' /> </a>
								</td>
								<td>
									<s:if test="questiontype == 0">
										单选题
									</s:if>
									<s:if test="questiontype == 1">
										多选题
									</s:if>
									<s:if test="questiontype == 2">
										判断题
									</s:if>
									<s:if test="questiontype == 3">
										问答题
									</s:if>
									<s:if test="questiontype == 4">
										图片对比题
									</s:if>
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
						转到 <input id="inputPageNo" type="text" size="1" name="testItem.pageNo"/> 页 
						<a class="blue12_33" href="javascript:checkInputPageNo1('inputPageNo',<s:property value="testItem.pageNum"/>)">go</a>
					</div> 
				</div>
			</div>
		</div>
	</form>
</body>
</html>
