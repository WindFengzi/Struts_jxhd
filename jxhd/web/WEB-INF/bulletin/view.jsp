<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>查看某一条具体的新闻</title>
<link href="/jxhd/css/css2.css" type="text/css"  rel="stylesheet" />
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

</script>

</head>

<body>
	<%
		String url = request.getRequestURL().toString();
		url = url.substring(0, url.indexOf("jxhd"));
	%>
	<form name="form1" method="post" action="ToDate.action" id="form1">
		<input type="hidden" name="body" id="body"/>
			<div id="detal_main">
				<div class="quan_content">
					<div class="detal">
						<div class="detal_title">
							<s:property value='notice.title' />
						</div>
						<div class="detal_intor">
							<span>作者：<s:property value='notice.publisher' />
							</span><span>时间： <s:date name="notice.updateTime"
									format="yyyy-MM-dd HH:mm" />
							</span>
						</div>
						<div class="detal_content">
							<s:property value='notice.body' escape="false" />
						</div>
						<div style="font-size:20px;padding-left: 10px;">
							<s:if test="fjuploadFileName!=null">
							附件：<br/>
								<s:iterator value="fjuploadFileName" id='number'>
									<a style="color:red;" target="my_tg1"
										href="ActicleFileDownload.action?fileName=<s:property value="number"/>"><s:property
											value='number' />
									</a>
									<br/>
								</s:iterator>
							</s:if>
						</div>
					</div>
				</div>
			</div>
	</form>
</body>
</html>
