<!DOCTYPE html>
<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>更新某一条公告</title>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script src="/jxhd/js/ckeditor.js"></script>
<script src="/jxhd/js/adapters/jquery.js"></script>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
#editable {
	padding: 10px;
	float: left;
}
</style>
<script>
	CKEDITOR.disableAutoInline = true;

	$(document).ready(function() {
		$('#editor1').ckeditor(); // Use CKEDITOR.replace() if element is <textarea>.
		$('#editable').ckeditor(); // Use CKEDITOR.inline().
	});

	function setValue() {
		$('#editor1').val($('input#val').val());
	}
	
	//更新公告后提交
	function sub1() {
		if(document.getElementById("title").value=== ""){
			document.getElementById("showTitleError").innerHTML = "标题不能为空，请填写！";
			return;
		}else{
			var editor = CKEDITOR.instances.editor1;
			form1.body.value = editor.getData();
			form1.action = "UpdateArticle.action";
			form1.submit();
		}
	}
	//返回
	function list1() {
		history.go(-1);
	}
	
	
	
	var i = 1;
	function addComponent() {
		i = i + 1;
		if ($.support.msie) {//是否支持ie浏览器，现在已经不再用了
			var uploadHTML = document.createElement("<input type='file'  name='fjupload'/><br/>")
		} else {
			var uploadHTML = document.createElement("input");
			var fileIndex = "fjupload" + i;
			var aaIndex = "aa" + i;
			uploadHTML.type = "file";
			uploadHTML.name = "fjupload";
			uploadHTML.id = fileIndex;
			document.getElementById("files").appendChild(uploadHTML);
			var aa = "javascript:removeFile('" + i + "');";//删除附件
			
			uploadHTML = document.createElement('a');//创建a标签
			uploadHTML.href = aa;
			uploadHTML.id = aaIndex;
			uploadHTML.innerText = "删除";
			document.getElementById("files").appendChild(uploadHTML);
			uploadHTML = document.createElement('br');
			document.getElementById("files").appendChild(uploadHTML);
		}
	}
	//删除附件（修改中新家的情况下）
	function removeFile(fileIndex) {
		var fileIndex1 = "fjupload" + fileIndex;
		var aa = document.getElementById('files');
		var aElement = document.getElementById(fileIndex1);
		var fileIndex2 = "aa" + fileIndex;
		var aaIndex = document.getElementById(fileIndex2);
		aa.removeChild(aElement);//移除input标签
		aa.removeChild(aaIndex);//移除删除链接的a标签
	}
	//修改中删除附件（原来已经有附件的情况下）
	function deleteFj(id, attachfileurl) {
		if (confirm("您确定你要删除么？")) {
			form1.id.value = id;
			form1.attachfileurl.value = attachfileurl;
			form1.action = "DeleteFj.action";
			form1.submit();
		}
	}
</script>

</head>

<body>
	<%
		String url = request.getRequestURL().toString();
		url = url.substring(0, url.indexOf("jxhd"));
	%>
	<form name="form1" method="post" action="ToDate.action" id="form1"
		enctype="multipart/form-data">
		<input type="hidden" name="body" id="body"/> 
		<input 	type="hidden" name="notice.noticeId" id="noticeId"	value="<s:property value='notice.noticeId'/>"/> 
		<input 	type="hidden" name="notice.attachfileurl" id="attachfileurl" value="<s:property value='notice.attachfileurl'/>"/>
			<div class="w170 fl">
				<img src="img/gggl.png" width="170" height="43" alt="公告管理" />
			</div>
			<div class="w800 fr">
				<!-- 位置导航 -->
				<div class="postion lh28 mb15">
					<span class="fb green">您的位置：</span><a href="#">首页</a> 》 
					<a 	href="#">公告管理 </a> 》 <a href="#">修改公告 </a>
				</div>
				<!-- 修改公告主体 -->
				<div class="w800_con ">
					<div class="tit2">
						<h2 class="lh32 pl30">
							<span class="fb f14">修改公告</span> Update Notice
						</h2>
					</div>

					<table style="width: 100%;border: 0px" >
						<tr>
							<th width="16%" style="text-align: center">标题：</th>
							<td width="84%"><input name="notice.title" type="text"
								value="<s:property value='notice.title'/>" id="title"
								style="width:650px;" />
							</td>
						</tr>
						<!-- 标题为空提示 -->
						<tr>
							<th width="16%"></th>
							<td width="84%%"><span id="showTitleError" style="color:red"></span></td>
						</tr>
						<tr>
							<th style="text-align: center">内容：</th>
							<td>
							<textarea cols="80" id="editor1" name="notice.body" rows="10"> 
      							<s:property value='notice.body' />
							</textarea>
							</td>
						</tr>
						<tr>
							<th style="text-align: center">附件:</th>
							<td style="padding-left:4px;" colspan="3" width="210" bgcolor="#f1f4f8">
								<s:if test="fjuploadFileName!=null">
									<s:iterator value="fjuploadFileName" id='number'>
										<a href="<%=url%>/jxhd/upload/<s:property value="number"/>">
										<s:property value='number' />
										</a>
										<a class="blue12_33"
											href="javascript:deleteFj('<s:property value="notice.id"/>','<s:property value="number"/>')">删除</a>
										<br />
									</s:iterator>
								</s:if> 
								<span id="files"> </span>
							<p /> 
							<input type="button" onclick="addComponent();" value="添加附件" /></td>
						</tr>
					</table>
					<p class="tc p30">
						<input name="input" type="button" value="确 认" onclick="sub1()"
							class="bt3 fb grey1 ml50" /> 
						<input name="input"	onclick="list1()" type="button" value="返回"
							class="bt3 fb grey1 ml50" />
					</p>
				</div>
	</div>
	</form>
</body>
</html>