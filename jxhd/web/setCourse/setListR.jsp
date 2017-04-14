<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,com.dt.jxhd.action.*,java.text.SimpleDateFormat,java.text.DateFormat,java.text.ParseException"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script src="/jxhd/js/Time.js"></script>
<script>
	function sub1() {
		//var t2 = document.getElementById("classes"); 
		//var classId = t2.options[t2.selectedIndex].value;
		//form1.courseId.value = classId;
		form1.action = "DepartmentByParentId1.action";
		form1.submit();
	}
	function courseLogs() {
		form1.action = "CourseLogs.action";
		form1.submit();
	}
	function save() {
		var province = document.getElementsByName("radiobutton");//省份
		var courseId;
		for ( var a = 0; a < province.length; a++) {//遍历单选框
			if (province[a].checked) {
				courseId = province[a].value;
			}
		}
		var url = 'SaveCourseLogAjax.action';
		var params = {
			courseId : courseId
		};
		jQuery.post(url, params, callbackFun2, 'json');
	}
	function callbackFun2(data) {
		var msg = data['msg'];
		alert(msg);
	}

	function departmentByParent(gradeId) {
		var departmentId = form1.classId1.value
		var url = 'ClassByGradeIdAjax.action';
		var params = {
			gradeId : gradeId,
			departmentId : departmentId
		};
		jQuery.post(url, params, callbackFun, 'json');
	}
	function callbackFun(data) {
		document.getElementById("classId").options.length = 0;
		var parameters = data['list'];
		document.getElementById("classId").options.add(new Option('全部', ''));
		for (i = 0; i < parameters.length; i++) {
			document.getElementById("classId").options.add(new Option(
					parameters[i].className, parameters[i].classId));
		}
	}
	function classByParent(classNum) {
		var departmentId = form1.classId1.value
		var url = 'ClassByClassNumAjax.action';
		var params = {
			classNum : classNum,
			departmentId : departmentId
		};
		jQuery.post(url, params, callbackFun, 'json');
	}
	function callbackFun(data) {
		document.getElementById("classId").options.length = 0;
		var parameters = data['list'];
		document.getElementById("classId").options.add(new Option('全部', ''));
		for (i = 0; i < parameters.length; i++) {
			document.getElementById("classId").options.add(new Option(
					parameters[i].className, parameters[i].classId));
		}
	}
</script>

</head>

<body>
	<form id="form1" name="form1" action="DepartmentByParentId1.action"
		method="post">
		<s:hidden name="tClass.departmentId" id="classId1"></s:hidden>
		<%
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String today = sf.format(date);
			System.out.println("" + today);
			Calendar cd = Calendar.getInstance();
			try {
				cd.setTime(sf.parse(today));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			cd.add(Calendar.DATE, 1);//增加一天 
			Date date1 = cd.getTime();
			String todayEnd = sf.format(date1);
		%>
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">课程设置</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">课程设置</span> The Course Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:18px">
				年级：
				<s:select id="gradeId" list="t_sys_parameter.data"
					onchange="departmentByParent(this.value)" name="t_user1.gradeId"
					headerKey="" headerValue="全部" listKey="id"
					listValue="parameterName"></s:select>

				班级：
				<s:select id="classId" name="course.classId" onchange="sub1()"
					list="list" listKey="classId" listValue="className" headerKey=""
					headerValue="全部">
				</s:select>
				<%-- 
        老师：<s:select list="list1"  listKey="userId" onchange="sub1()" listValue="name" headerKey = "" headerValue="" id="agentUserId" name="course.agentUserId" >
    </s:select>
     --%>
				开始时间：
				<s:textfield name="course.fromTime" onclick="setday(this)">
					<s:param name="value">
						<s:date name="course.fromTime" format="yyyy-MM-dd HH:mm:ss" />
					</s:param>
				</s:textfield>
				结束时间：
				<s:textfield name="course.endTime" onclick="setday(this)">
					<s:param name="value">
						<s:date name="course.endTime" format="yyyy-MM-dd HH:mm:ss" />
					</s:param>
				</s:textfield>
				<input name="input" type="button" value=" 搜  索" onclick="sub1()"
					class="bt1 fb grey1 ml10" /> <input name="input" type="button"
					value="选课历史" onclick="courseLogs()" class="bt1 fb grey1 ml10" />
			</div>
			<div class="table4 table3">
				<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
					class="all_content">
					<tr>
						<td class="bghui fb">课时节</td>
						<td class="bghui fb">课程名称</td>
						<td class="bghui fb">开始时间</td>
						<td class="bghui fb">结束时间</td>
						<td class="bghui fb">选择</td>
					</tr>
					<s:iterator value="course.data" status="stat">
						<tr>
							<td><s:property value='classSectionId' />
							</td>
							<td><s:property value='subjectId' />
							</td>
							<td><s:date name="fromTime" format="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td><s:date name="endTime" format="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td><input type="radio" name="radiobutton"
								value="<s:property value='courceId'/>" />
							</td>
						</tr>
					</s:iterator>
				</table>
				<p class="tc p30">
					<input name="input" onclick="save()" type="button" value="保 存"
						class="bt3 fb grey1 ml50" />
				</p>
			</div>
		</div>
	</form>
</body>
</html>