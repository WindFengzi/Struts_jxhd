<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>添加预习界面</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/ckeditor.js"></script>
<script>
	function deleteAttachment(){
		var fistFiles = document.getElementById("fistFiles");
		fistFiles.innerHTML =	"<input type=file name=fjupload />";
	}
	
	//移除附件
	function removeFile(fileIndex) {
		document.getElementById("addUpload").disabled = false;
		var fileIndex1 = "upload" + fileIndex;
		var aa = document.getElementById('files');
		var aElement = document.getElementById(fileIndex1);
		var fileIndex2 = "aa" + fileIndex;
		var aaIndex = document.getElementById(fileIndex2);
		aa.removeChild(aElement);
		aa.removeChild(aaIndex);
		
	}
	
	function savePreview() {
		var title = document.getElementById("previewTitleID").value.trim();
		var content = document.getElementById("previewContentID").value.trim();
		var regu = "^[ ]+$";
		var re = new RegExp(regu);
		if (title == null || title == "" || re.test(title)) {
			$("#titleHint").html("标题不能为空(最长为80)");
		} else if (title.length > 80){
			$("#titleHint").html("标题字数超过限度(最长为80)");
		} else if (content.length > 300) {
			$("#contentHint").html("内容字数超过限度(最长为300)");
		} else {
			form1.action = "AddPreview.action";
			form1.submit();
		}
	}
	
	function getLengthTitle() {
		var regu = "^[ ]+$";
		var re = new RegExp(regu);
		var title = document.getElementById("previewTitleID").value.trim();
		if (title.length > 80){
			$("#titleHint").html("标题字数超过限度(最长为80)");
		} else if (re.test(title) || title == "") {
			$("#titleHint").html("标题不能为空(最长为80)");
		}else {
			$("#titleHint").html("");
		}
		
	}
	
	function getLengthContent(){
		var content = document.getElementById("previewContentID").value.trim();
//		alert(content.length);
		if (content.length > 300) {
			$("#contentHint").html("内容字数超过限度(最长为300)");
		} else {
			$("#contentHint").html("");
		}
	}
	
	function goBackList() {
		history.go(-1);
	}
	
	var i = 1;
	function addComponent() {
		i = i + 1;
		//var isIE = /msie/.test(navigator.userAgent.toLowerCase());
		//alert(isIE);
		if ($.support.msie) {
			var uploadHTML = document.createElement("<input type='file' class='file'  name='upload'/><br/>")
		} else {
	
			var uploadHTML = document.createElement("input");
			var fileIndex = "upload" + i;
			var aaIndex = "aa" + i;
			uploadHTML.type = "file";
			uploadHTML.name = "upload";
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
			document.getElementById("addUpload").disabled = true;
		}
	}
	
</script>
</head>  
  <body>	
	<form name="form1" method="post" action="ToDate.action" id="form1"  enctype="multipart/form-data">

		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> > 
			<a href="#">参数管理</a> > 
			<a href="#">添加预习内容</a>
			<div class="search">
				<input name="" type="text" class="text fl" />
				<input name="" type="button" class="sou fl" value="" />
			</div>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">添加预习</span> Add Student Information
				</h2>
			</div>
		<div >
			<table style="width: 50%;border: 0px;    align-content: center; margin: auto;">
				<tr style="height:10px;"><!-- 标签上面空行 -->
					<td style="width:15%;"></td>
					<td style="width:85%;"></td>
				</tr>
				<tr >
					<td style="width:15%;text-align:center;">标题：</td>
					<td style="width:85%;">
						<input type="text" onblur="getLengthTitle()" style="width: 85%;" name="t_preview_add.preview_title" id="previewTitleID" />
					</td>
				</tr>
				<tr style="height:20px;"><!-- 标签上面空行 -->
					<td style="width:15%;"></td>
					<td style="width:85%;"><label id="titleHint" style="color:red"></label></td>
				</tr>
				<tr>
					<td style="text-align: center;width:15%;">内容：</td>
					<td>
						<textarea style="width: 85%;" onblur="getLengthContent();" name="t_preview_add.preview_content" id="previewContentID" cols="80" rows="10"></textarea>
					</td>
				</tr>
				<tr style="height:20px;"><!-- 标签上面空行 -->
					<td style="width:15%;"></td>
					<td style="width:85%;"><label id="contentHint" style="color:red"></label></td>
				</tr>
				<tr>
					<td style="width:15%;text-align:center">附件:</td>
					<td style="width:85%;padding-left:4px;,bgcolor:#f1f4f8" colspan="3">
						<input id="addUpload" style="text-align:center" type="button" onclick="addComponent();" value="添加附件" />
					<span id="files">
					<span id="fistFiles"> 
						<input type="button"  onclick="deleteAttachment()" value="删除"  style="display:none"/>
						<br/>
					</span>
					</span>
					<p/>
					</td>
				</tr> 
			</table>
			<p class="tc p30">
				<input name="input" onclick="savePreview()" type="button" value="保 存" class="bt3 fb grey1 ml50" /> 
				<input name="input" onclick="goBackList()" type="button" value="返回" class="bt3 fb grey1 ml50" />
			</p>
		</div>
	</form>
  </body>
</html>
