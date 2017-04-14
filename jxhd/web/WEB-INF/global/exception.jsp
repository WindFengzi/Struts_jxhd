<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div style='padding:5px;padding-left:70px;color:red;font-size:12px'>
	<h1>出现异常了！</h1>
	<s:property value="%{exception.message}" />
</div>
