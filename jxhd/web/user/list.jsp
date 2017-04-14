<%@ page language="java" import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>教师列表</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script  src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript" ></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<link rel="StyleSheet" href="dtree.css" type="text/css" />
<script type="text/javascript" src="dtree.js"></script>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script>
	/* function sub1() {
		form1.target = 'frm_home_main1';
		form1.action = "UsersR.action";
		form1.submit();
	} */
	function update(userId) {
		form1.userId.value = userId;
		form1.action = "UserById.action";
		form1.submit();
	}
	function deleteStation(userId) {
		if (window.confirm('你确定要删除吗？')) {
			form1.action = "DeleteUser.action";
			form1.userId.value = userId;
			form1.submit();
		}
	}
	function toView(userId) {
		form1.userId.value = userId;
		form1.action = "ToView.action";
		form1.submit();
	}
	function addStation() {
		form1.action = "ToInsertUser.action";
		form1.submit();
	}
	
	//点击左边的导航，右边列表的显示
	function departmentByParent(departmentId) {
		form1.target = 'frm_home_main1';
		form1.departmentId.value = departmentId;
		form1.action = "DepartmentByParentId2.action";
		form1.submit();
	}
	
</script>

</head>

<body>
	<form id="form1" name="form1" action="Articles.action" method="post">
		<input type="hidden" name="t_user1.userId" id="userId" /> 
		<input type="hidden" name="t_user1.isTeacher" id="isTeacher" value="1" /> 
		<input type="hidden" name="t_course_log.classId" id="departmentId" />
		<!-- 教师信息管理左侧 -->
		<div class="w170 fl"
			style="position:absolute;overflow-y:auto; overflow-x:scroll; width:170px; height:655px;background-color: #E5EFF0">
			<img src="img/jsxxgl.jpg" width="170" height="42" alt="教师信息管理"
				class="mb15" />
			<div class="w400 fl">
				<script type="text/javascript">
				<!--
					d = new dTree('d');
					//从treeBean中获取js代码
					// var treecontent = document.getElementById("tree").innerHTML;
					//执行代码
					//eval(treecontent);
					d.add(0, -1, '部门');
					<s:iterator value="department.data" status="stat">
					d.add(<s:property value='departmentId'/>,
						 <s:property value='parentDepartmentId'/>,
						 '<s:property value='departmentName'/>',
						//'<a href=javascript:departmentByParent(<s:property value='departmentId'/>) title=<s:property value='departmentName'/>><s:property value='departmentName'/></a>',
						'javascript:departmentByParent(<s:property value='departmentId'/>)');
					</s:iterator>
					document.write(d);
				//-->
				</script>
			</div>
		</div>
		
		<div class="w800 fr">
			<iframe name='frm_home_main1' src="gonggao/list1.jsp"
				id="frm_home_main1" width=100% height="690px" style="border: 0px">
			</iframe><!-- 以前iframe有事件onload="iFrameHeight(),现在固定高度" -->
		</div>
	</form>
</body>
<script>
	departmentByParent(1);
	function iFrameHeight() {
		var ifm = document.getElementById("frm_home_main1");
		var subWeb = window.frames ? window.frames["frm_home_main1"].document: ifm.contentDocument;
		if (ifm != null && subWeb != null) {
			var userAgent = navigator.userAgent;
			if(userAgent.indexOf("Chrome")>-1){//适用于chrome和360浏览器
				ifm.height = subWeb.documentElement.scrollHeight;
			}else{//适用于firefox和ie浏览器
				ifm.height = subWeb.body.scrollHeight;
			}
			parent.document.getElementById('frm_home_main').style.height = ifm.height + 'px' ;
		}
	}

	
</script>
</html>