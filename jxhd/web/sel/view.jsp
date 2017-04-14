<!DOCTYPE html>
<%@ page language="java" import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
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
		alert(form1.body.value);
		form1.action="SaveArticle.action";
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
  <input type="hidden" name="body"   id="body">
  <div id="detal_main">
  <div class="quan_content">
    <div class="detal">
      <div class="detal_title"><s:property value='JXGL_GONGGAO.title'/></div>
      <div class="detal_intor"><span>作者：<s:property value='JXHD_NOTSEL.publisher'/></span><span>时间： <s:date name="JXGL_GONGGAO.updateTime" format="yyyy-MM-dd HH:mm:ss" /></span></div>
      <div class="detal_content">
      <s:property value='JXHD_NOTSEL.question' escape="false"/>
      </div>
      <div style="font-size:20px;">
   附件：<s:if test="fjuploadFileName!=null" >
                   <s:iterator value="fjuploadFileName" id='number'>
                  <a style="color:red;" target="my_tg1" href="/jxhd/upload/<s:property value="number"/>"><s:property value='number'/></a>
                  </s:iterator>
                   </s:if>
   </div>
    </div>
  </div>
</div>
</form>
  </body>
</html>
