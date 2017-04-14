<!DOCTYPE html>
<%@ page language="java" import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
  <title></title>
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
		
		form1.action="SaveQuestionPaperAnswer.action";
		form1.submit();
		}
	</script>

  </head>
  
  <body>
  <%
    String url = request.getRequestURL().toString();
    	url = url.substring(0,url.indexOf("jxhd"));
     %>
  <form name="form1" method="post" action="ToDate.action" id="form1">
  <s:hidden name="JXHD_QuestionPaper.id"></s:hidden>
  <div id="detal_main">
  <div class="quan_content">
    <div class="detal">
      <div class="detal_title"><s:property value='JXGL_GONGGAO.title'/></div>
      <div class="detal_intor"><span>出题人：<s:property value='JXHD_QuestionPaper.chutiMan'/></span><span>出题时间： <s:date name="JXHD_QuestionPaper.chutiTime" format="yyyy-MM-dd HH:mm:ss" /></span></div>
      <div class="detal_content">
      <s:property value='JXHD_SEL.question' escape="false"/><br/>
      A:<s:property value='JXHD_SEL.choicea'  /><br/>
      B:<s:property value='JXHD_SEL.choiceb'  /><br/>
      C:<s:property value='JXHD_SEL.choicec'  /><br/>
      D:<s:property value='JXHD_SEL.choiced'  /><br/>
      学生答案:<s:property value='JXHD_QuestionPaper.useranswer'  /><br/>
     答题人:<s:property value='JXHD_QuestionPaper.datiMan'  /><br/>
      答题时间:<s:date name="JXHD_QuestionPaper.datiTime" format="yyyy-MM-dd HH:mm:ss" /><br/>
      </div>
<div class="btncase"> 
<input type="button" class="btn1"  id="btn1" onmouseover="this.className='btn1_h'"  onmouseout="this.className='btn1'" onclick="history.go(-1)"  value="返回" />
</div>
    </div>
  </div>
</div>
</form>
  </body>
</html>
