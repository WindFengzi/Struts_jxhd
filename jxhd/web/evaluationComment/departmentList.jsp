<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>查询评论时左侧的部门列表</title>
<link href="img/basic.css" type="text/css" rel="stylesheet" />
<link href="img/style.css" type="text/css" rel="stylesheet" />
<link rel="StyleSheet" href="dtree.css" type="text/css" />
<script type="text/javascript" src="dtree.js"></script>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script>
<%-- <%
Cookie myCookie[]=request.getCookies();//创建一个Cookie对象数组
for(int n = 0; n < myCookie.length-1; n++){//设立一个循环，来访问Cookie对象数组的每一个元素
	Cookie newCookie = myCookie[n];
	if(newCookie.getName().equals("cookieComment")); //判断元素的值是否为username中的值
	{
		%>
			var cookieComment = <%=newCookie.getValue()%>!//如果找到后，向他问好
		<%
	}
}
%> --%>
	
	function departmentByParent(departmentId,tag) {
		form1.target = 'frm_home_main1';
		form1.departmentId.value = departmentId;
		//alert(tag);
		if (tag == 1) {
			form1.commentTag.value = 3;
			form1.action = "StudentCommentList.action";
		} else {
			form1.commentTag.value = 0;
			form1.action = "AdminTeacherList.action";				
		}
		form1.submit();
	}
</script>
</head>
<body>
	<form id="form1" name="form1" action="Departments.action" method="post">
		<input type="hidden" name="t_course_log.classId" id="departmentId" />
		<input type="hidden" name="t_teacher_comment.tag" id="commentTag"/>
		<!-- 部门id在上面设置 -->
		<div id="div1" class="w170 fl"
			style="position:absolute;overflow:auto;width:170px; height:695px;background-color: #E5EFF0;">
			<div class="w400 fl">
				<script type="text/javascript">
					d = new dTree('d');
					d.add(0, -1, '部门');
					<s:iterator value="department.data" status="stat">
					d.add(<s:property value='departmentId'/>,<s:property value='parentDepartmentId'/>,'<s:property value='departmentName'/>',
								//	'<a href=javascript:departmentByParent(<s:property value='departmentId'/>) title=<s:property value='departmentName'/>><s:property value='departmentName'/>',
									'javascript:departmentByParent(<s:property value='departmentId'/>,<s:property value='comment_tag'/>)');
					</s:iterator>
					document.write(d);
				</script>
			</div>
		</div>
		<div class="w800 fr">
			<iframe name='frm_home_main1' style="border:0px;" id="frm_home_main1"
				width=100% height="695px"></iframe>
		</div>
		
	<%-- 	<%
		Cookie myCookie[]=request.getCookies();//创建一个Cookie对象数组
		for(int n = 0; n < myCookie.length-1; n++){//设立一个循环，来访问Cookie对象数组的每一个元素
			Cookie newCookie = myCookie[n];
			if(newCookie.getName().equals("username")); //判断元素的值是否为username中的值
			{
				%>
	　			你好,<%=newCookie.getValue()%>!//如果找到后，向他问好
				<%
			}
		}
		%> --%>
		
	 
	</form>
	<script>
		departmentByParent(1,<s:property value='comment_tag'/>);
	</script>
</body>
</html>
