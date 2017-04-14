<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>公告添加</title>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/ckeditor.js"></script>
<script type="text/javascript" src="js/adapters/jquery.js"></script>
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
	
	$(document).ready(function(){
		$('#editor1').ckeditor(); // Use CKEDITOR.replace() if element is <textarea>.
		$('#editable').ckeditor(); // Use CKEDITOR.inline().
	});
//	$(document).ready(function() {});

	//这个没有用到
	function setValue() {
		$('#editor1').val($('input#val').val());
	}
	
	//确认
	function sub1() {
		var titleLength = document.getElementById("title").value;
		//alert(titleLength.length);
		if(titleLength === ""){
			document.getElementById("showTitleError").innerHTML = "标题不能为空，请填写！";
			return;
		}else if (titleLength.length <= 50){
			var editor = CKEDITOR.instances.editor1;
			form1.body.value = editor.getData();
			form1.action = "SaveArticle.action";
			form1.submit();
		} else if (titleLength.length > 50) {
			document.getElementById("showTitleError").innerHTML = "标题最多50个字";
			return;
		}
	}
	//返回
	function list1() {
		history.go(-1);
	}
	
	//删除第一个附件
	function deleteAttachment(){
		var fistFiles = document.getElementById("fistFiles");
		fistFiles.innerHTML =	"<input type=file name=fjupload />";
	}
	
	
	var i = 1;
	//添加附件
	function addComponent() {
		i = i + 1;
		//var isIE = /msie/.test(navigator.userAgent.toLowerCase());
		//alert(isIE);
		if ($.support.msie) {
			var uploadHTML = document.createElement("<input type='file'  name='fjupload'/><br/>")
		} else {
	
			var uploadHTML = document.createElement("input");
			var fileIndex = "fjupload" + i;
			var aaIndex = "aa" + i;
			uploadHTML.type = "file";
			uploadHTML.name = "fjupload";
			uploadHTML.id = fileIndex;
			document.getElementById("files").appendChild(uploadHTML);
			var aa = "javascript:removeFile('" + i + "');";
			uploadHTML = document.createElement('a');
			uploadHTML.href = aa;
			uploadHTML.id = aaIndex;
			uploadHTML.innerText = "<删除>";
		
			document.getElementById("files").appendChild(uploadHTML);
			uploadHTML = document.createElement('br');
			document.getElementById("files").appendChild(uploadHTML);
		}
	}
	
	//移除附件
	function removeFile(fileIndex) {
		var fileIndex1 = "fjupload" + fileIndex;
		var aa = document.getElementById('files');
		var aElement = document.getElementById(fileIndex1);
		var fileIndex2 = "aa" + fileIndex;
		var aaIndex = document.getElementById(fileIndex2);
		aa.removeChild(aElement);
		aa.removeChild(aaIndex);
	}
	
	/* 公告管理  */
	function notice() {
		form1.action = 'Articles.action';
		form1.submit();
	}
</script>

</head>

<body>
	<form name="form1" method="post" action="ToDate.action" id="form1" enctype="multipart/form-data">
		<input type="hidden" name="body" id="body"/> 
		<s:hidden name="notice.classId"></s:hidden>
			<div class="w170 fl">
				<img src="img/gggl.png" width="170" height="43" alt="公告管理" />
			</div>
			<div class="w800 fr">
				<div class="postion lh28 mb15">
					<span class="fb green">您的位置：</span>
					<a href="#">首页</a> > 
					<a href="#" onclick="javascript:notice()">公告管理
				    </a> > <a href="#">添加公告 </a>
				</div>
				<div class="w800_con ">
					<div class="tit2">
						<h2 class="lh32 pl30">
							<span class="fb f14">添加公告</span> Add Notice
						</h2>
					</div>

					<table style="width: 100%;border: 0px;">
						<tr style="height:10px;"/><!-- 标签上面空行 -->  
						<tr >
							<th style="width:10%;text-align: center">标题：</th>
							<td style="width:90%;"><input name="notice.title" type="text" id="title" style="width:650px;" /></td>
						</tr>
						<tr style="height:10px"/><!--标题下面空行 -->
						
						<tr>
							<th style="width:10%;"></th>
							<td style="width:90%;"><span id="showTitleError" style="color:red"></span></td>
						</tr>
						<tr>
							<th style="text-align: center">内容：</th>
							<td>
								<textarea cols="80" id="editor1" name="notice.body" rows="10"> </textarea>
							</td>
						</tr>
						<tr>
							<th style="text-align:left">附件:</th>
							<td style="padding-left:4px;width:210px,bgcolor:#f1f4f8" colspan="3">
								<input type="button" onclick="addComponent();" value="添加附件" />
								<span id="files">
									<span id="fistFiles"> 
									<input type="button"  onclick="deleteAttachment()" value="删除"  style="display:none"/>
									<br/>
									</span>
								</span>
								<p /> 
								
							</td>
						</tr>
					</table>
					<p class="tc p30">
						<input name="input" type="button" value="确 认" onclick="sub1()" class="bt3 fb grey1 ml50" /> 
						<input name="input" onclick="list1()" type="button" value="返回" class="bt3 fb grey1 ml50" />
					</p>
				</div>

			</div>
	</form>
</body>
</html>