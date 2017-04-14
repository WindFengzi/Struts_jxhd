<!DOCTYPE html>
<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
    <script src="/jxhd/js/ckeditor.js"></script>
    <script src="/jxhd/js/adapters/jquery.js"></script>
    <link href="/jxhd/css/sample.css" rel="stylesheet">
<link href="/jxhd/css/css2.css" type="text/css" rel="stylesheet" />
<style>

		#editable
		{
			padding: 10px;
			float: left;
		}

	</style>
	<script>

		CKEDITOR.disableAutoInline = true;

		$( document ).ready( function() {
			$( '#editor1' ).ckeditor(); // Use CKEDITOR.replace() if element is <textarea>.
			$( '#editable' ).ckeditor(); // Use CKEDITOR.inline().
		} );

		function setValue() {
			$( '#editor1' ).val( $( 'input#val' ).val() );
		}
		
		
		function sub1(){
		
		var editor = CKEDITOR.instances.editor1;
 
		form1.body.value = editor.getData();
		form1.action="UpdateSel.action";
		form1.submit();
		}
	</script>

  </head>
  
  <body>
  <%
    String url = request.getRequestURL().toString();
    	url = url.substring(0,url.indexOf("jxhd"));
     %>
  <form name="form1" method="post" action="ToDate.action" id="form1" enctype="multipart/form-data">
  <input type="hidden" name="JXHD_SEL.question"   id="body">
    <input type="hidden" name="JXHD_SEL.id"   id="id" value="<s:property value='JXHD_SEL.id'/>">
    <div class="form">
  <table width="100%" border="0" cellpadding="00" cellspacing="1">
   
 <tr>
        <th>试题内容：</th>
        <td>
		<textarea cols="80" id="editor1" name="editor1" rows="10"> 
  <s:property value='JXHD_SEL.question'/>
		</textarea>
		</td>
      </tr>
      <tr>
        <th width="16%">A选项：</th>
        <td width="84%"><input name="JXHD_SEL.choicea" type="text" value="<s:property value='JXHD_SEL.choicea'/>" id="choicea" style="width:650px;" /></td>
      </tr>
       <tr>
        <th width="16%">B选项：</th>
        <td width="84%"><input name="JXHD_SEL.choiceb" type="text" value="<s:property value='JXHD_SEL.choiceb'/>" id="choiceb" style="width:650px;" /></td>
      </tr>
      <tr>
        <th width="16%">C选项：</th>
        <td width="84%"><input name="JXHD_SEL.choicec" type="text" value="<s:property value='JXHD_SEL.choicec'/>" id="choicec" style="width:650px;" /></td>
      </tr>
      <tr>
        <th width="16%">D选项：</th>
        <td width="84%"><input name="JXHD_SEL.choiced" type="text" value="<s:property value='JXHD_SEL.choiced'/>" id="choiced" style="width:650px;" /></td>
      </tr>
      <tr>
        <th width="16%">试题答案：</th>
        <td width="84%"><input name="JXHD_SEL.answer" type="text" value="<s:property value='JXHD_SEL.answer'/>" value="<s:property value='JXHD_SEL.answer'/>" id="answer" style="width:650px;" /></td>
      </tr>
       <tr>
        <th width="16%">分数：</th>
        <td width="84%"><input name="JXHD_SEL.score" type="text" value="<s:property value='JXHD_SEL.score'/>" id="score" style="width:650px;" /></td>
      </tr>
      <tr>
        <th width="16%">难易程度：</th>
        <td width="84%"><input name="JXHD_SEL.quesdifficult" type="text" value="<s:property value='JXHD_SEL.quesdifficult'/>" id="quesdifficult" style="width:650px;" /></td>
      </tr>
       <tr>
        <th width="16%">试题类型：</th>
        <td width="84%"><s:select list="#{'单选题':'单选题','多选题':'多选题'}"  name="JXHD_SEL.questiontype" ></s:select></td>
      </tr>
  </table>
  
		<div class="btncase"><input type="button" class="btn1"  id="btn1" onmouseover="this.className='btn1_h'"  onmouseout="this.className='btn1'" onclick="sub1()"  value="确定" />
<input type="button" class="btn1"  id="btn1" onmouseover="this.className='btn1_h'"  onmouseout="this.className='btn1'" onclick="history.go(-1)"  value="返回" />
</div>
		</div>
</form>
  </body>
 <script>
function addComponent()
{
var uploadHTML = document.createElement( "<input type='file'  name='fjupload'/><br/>");
document.getElementById("files").appendChild(uploadHTML);
uploadHTML = document.createElement( "<p/>");
document.getElementById("files").appendChild(uploadHTML);
}
function deleteFj(id,attachFileUrl){
	if(confirm("您确定你要删除么？")){
	    form1.id.value=id;
	    form1.attachFileUrl.value=attachFileUrl;
	    form1.action = "DeleteFj.action";
		form1.submit();
	}
}
</script>
</html>
