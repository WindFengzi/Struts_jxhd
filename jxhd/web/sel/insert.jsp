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
 
		form1.question.value = editor.getData();
		form1.action="SaveSel.action";
		form1.submit();
		}
	</script>

  </head>
  
  <body>
  <form name="form1" method="post" action="ToDate.action" id="form1" enctype="multipart/form-data">
  <input type="hidden" name="JXHD_SEL.question"   id="question">
   <s:hidden name="JXHD_SEL.classId"></s:hidden>
		<div class="form">
   <table width="100%" border="0" cellpadding="00" cellspacing="1">
      
       
      <tr>
        <th>试题内容：</th>
        <td><textarea cols="80" id="editor1" name="editor1" rows="10"> 
		</textarea></td>
      </tr>
      <tr>
        <th width="16%">A选项：</th>
        <td width="84%"><input name="JXHD_SEL.choicea" type="text" id="choicea" style="width:650px;" /></td>
      </tr>
      <tr>
        <th width="16%">B选项：</th>
        <td width="84%"><input name="JXHD_SEL.choiceb" type="text" id="choiceb" style="width:650px;" /></td>
      </tr>
      <tr>
        <th width="16%">C选项：</th>
        <td width="84%"><input name="JXHD_SEL.choicec" type="text" id="choicec" style="width:650px;" /></td>
      </tr>
      <tr>
        <th width="16%">D选项：</th>
        <td width="84%"><input name="JXHD_SEL.choiced" type="text" id="choiced" style="width:650px;" /></td>
      </tr>
      <tr>
        <th width="16%">试题答案：</th>
        <td width="84%"><input name="JXHD_SEL.answer" type="text" id="answer" style="width:650px;" /></td>
      </tr>
       <tr>
        <th width="16%">分数：</th>
        <td width="84%"><input name="JXHD_SEL.score" type="text" id="score" style="width:650px;" /></td>
      </tr>
      <tr>
        <th width="16%">难易程度：</th>
        <td width="84%"><input name="JXHD_SEL.quesdifficult" type="text" id="quesdifficult" style="width:650px;" /></td>
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
</html>
<script>
function addComponent()
{
var uploadHTML = document.createElement( "<input type='file'  name='fjupload'/><br/>");
document.getElementById("files").appendChild(uploadHTML);
uploadHTML = document.createElement( "<p/>");
document.getElementById("files").appendChild(uploadHTML);
}
</script>