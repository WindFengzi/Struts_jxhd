<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,com.dt.jxhd.action.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>课程设置-课程表设置</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script  src="/jxhd/js/PageCtrl.js"></script>
<script  src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script>
	function sub1(num) {
		form1.week.value = form1.week.value * 1 + num * 1;
		var t2 = document.getElementById("classes");
		var classId = t2.options[t2.selectedIndex].value;
		form1.courseId.value = classId;
		form1.action = "DepartmentByParentId.action";
		form1.submit();
	}

	//课程保存
	function save() {
		var object = document.getElementsByName('date');//得到name=“date”
		var t2 = document.getElementById("classes");//得到班级id
		var t3 = document.getElementById("agentUserId");//得到老师的id
		var agentUserId = t3.options[t3.selectedIndex].value;
		var classId = t2.options[t2.selectedIndex].value;
		var url = 'SaveCourseAjax.action';
		if (classId == '') {
			alert("请选择班级。");
		} else if (agentUserId == '') {
			alert("请选择老师。");
		} else {
			var subjectId1 = "";
			var date1 = "";
			var num = "";
			for ( var i = 0; i < object.length; i++) {
				var date = object[i].value;
				for ( var n = 1; n < 9; n++) {
					var id = date + "," + n;
					var t1 = document.getElementById(id);
					if (t1 != null) {
						var subjectId = t1.options[t1.selectedIndex].value;
						if (subjectId != '') {
							subjectId1 = subjectId1 + subjectId + ",";//保存课程1，1, 1，三节课都是哲学
							date1 = date1 + date + ",";
							num = num + n + ",";
						}
					}
				}
			}
			var params = {
				subjectId : subjectId1,
				classId : classId,
				date : date1,
				agentUserId : agentUserId,
				num : num
			};
			jQuery.post(url, params, callbackFun2, 'json');
		}
	}
	
	//保存成功
	function callbackFun2(data) {
		var msg = data['msg'];
		alert(msg);
	}
	
	
	//选择年级
	function departmentByParent(gradeId) {
		var departmentId = form1.classId.value
		var url = 'ClassByGradeIdAjax.action';
		var params = {
			gradeId : gradeId,
			departmentId : departmentId
		};
		jQuery.post(url, params, callbackFun, 'json');
	}
	
	//选择年级调用
	function callbackFun(data) {
		document.getElementById("classes").options.length = 0;
		var parameters = data['list'];
		document.getElementById("classes").options.add(new Option('全部', ''));
		for (i = 0; i < parameters.length; i++) {
			document.getElementById("classes").options.add(new Option(
					parameters[i].className, parameters[i].classId));
		}
	}
</script>

</head>

<body>
	<form id="form1" name="form1" action="DepartmentByParentId.action"
		method="post">
		<s:hidden name="t_course_log.classId" id="classId"></s:hidden>
		<s:hidden name="t_course_log.courseId" id="courseId"></s:hidden>
		<s:hidden name="week" id="week"></s:hidden><!-- CourseAction中有调用 -->
		<input type="hidden" name="department.parentDepartmentId"
			id="parentDepartmentId"
			value="<s:property value='department.parentDepartmentId'/>" />

		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">系统管理</a>
			》 <a href="#">课程设置</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">课程设置</span> The Course Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:18px">
				年级：
				<s:select 
					id="gradeId" 
					list="list2"
					onchange="departmentByParent(this.value)" 
					name="t_user1.gradeId"
					headerKey="" 
					headerValue="全部" 
					listKey="id"
					listValue="parameterName">
				</s:select>

				班级：
				<s:select 
					id="classes" 
					name="classes" 
					onchange="sub1(0)"
					value="#{t_course_log.courseId}" 
					list="list" 
					listKey="classId"
					listValue="className" 
					headerKey="" 
					headerValue="全部">
				</s:select>
				
				年度：
				<s:select
					list="#{'2017':'2017','2016','2015':'2015','2014':'2014','2013':'2013','2012':'2012'}"
					name="year">
				</s:select>
				
				月份：
				<s:select
					list="#{'1':'1月','2':'2月','3':'3月','4':'4月','5':'5月','6':'6月','7':'7月','8':'8月','9':'9月','10':'10月','11':'11月','12':'12月'}"
					name="month">
				</s:select>
				
				老师：
				<s:select 
					list="list1" 
					listKey="userId" 
					onchange="sub1(0)"
					listValue="name" 
					headerKey="" 
					headerValue="全部" 
					id="agentUserId"
					name="course.agentUserId">
				</s:select>
				
				<input name="input" type="button" value="上周" onclick="sub1(-1)"
					class="bt1 fb grey1 ml5" /> 
				<input name="input" type="button"
					value="下周" onclick="sub1(1)" class="bt1 fb grey1 ml5" /> 
				<input 	name="input" type="button" value=" 搜  索" onclick="sub1(0)"
					class="bt1 fb grey1 ml5" />
			</div>
			<%
				List weeks = (List) request.getAttribute("weeks");
				List courses = (List) request.getAttribute("course.data");
				List subjects = (List) request.getAttribute("t_sys_parameter.data");
				DateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
			%>
			<div class="table4 table3">
				<table class="td_color" style="width:100%;border:1px solid #d7d7d7;border-color:#d7d7d7; ">
					<tr>
						<td class="bghui fb" width="300">课节</td>
						<s:iterator value="weeks" status="stat">
							<td class="bghui fb">
								<s:property value='week' /><br /><!-- 星期 --> 
								<s:property value='date' /> <!-- 日期 -->
								<s:hidden name="date"></s:hidden><!-- 循环了7次，上面js会调用 -->
							</td>
						</s:iterator>
					</tr>
					<tr>
						<td>第一节课</td>
						<%
							for (int i = 0; i < weeks.size(); i++) {
								String flag = "false";
								String subject = "";
								date date = (date) weeks.get(i);
								for (int n = 0; n < courses.size(); n++) {
									course course = (course) courses.get(n);
									String date1 = dd.format(course.getFromTime());
									if (date1.equals(date.getDate())) {
										if (course.getClassSectionId().equals(1)) {
											System.out.println("true:" + date1+ course.getSubjectId());//获取的时候是从课程表获取
											flag = "true";
											subject = course.getSubjectId();
										}
									}
								}
						%>
						<td><select id="<%=date.getDate() %>,1" name="">
								<option value=""></option>
								<%
									for (int m = 0; m < subjects.size(); m++) {
											T_SYS_PARAMETER subject1 = (T_SYS_PARAMETER) subjects.get(m);
											String subjectId = subject1.getParameterName().toString();
											if (subjectId.equals(subject)) {
								%>
								<option selected='selected'
									value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									} else {
								%>
								<option value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									}
										}
								%>
						</select></td>
						<%
							}
						%>
					</tr>
					<tr>
						<td>第二节课</td>
						<%
							for (int i = 0; i < weeks.size(); i++) {
								String flag = "false";
								String subject = "";
								date date = (date) weeks.get(i);
								for (int n = 0; n < courses.size(); n++) {
									course course = (course) courses.get(n);
									String date1 = dd.format(course.getFromTime());
									if (date1.equals(date.getDate())) {

										if (course.getClassSectionId().equals(2)) {
											System.out.println("true:" + date1
													+ course.getSubjectId());
											flag = "true";
											subject = course.getSubjectId();
										}
									}
								}
						%>
						<td><select id="<%=date.getDate() %>,2" name="">
								<option value=""></option>
								<%
									for (int m = 0; m < subjects.size(); m++) {
											T_SYS_PARAMETER subject1 = (T_SYS_PARAMETER) subjects
													.get(m);
											String subjectId = subject1.getParameterName().toString();
											if (subjectId.equals(subject)) {
								%>
								<option selected='selected'
									value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									} else {
								%>
								<option value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									}
										}
								%>
						</select></td>
						<%
							}
						%>
					</tr>
					<tr>
						<td>第三节课</td>
						<%
							for (int i = 0; i < weeks.size(); i++) {
								String flag = "false";
								String subject = "";
								date date = (date) weeks.get(i);
								for (int n = 0; n < courses.size(); n++) {
									course course = (course) courses.get(n);
									String date1 = dd.format(course.getFromTime());
									if (date1.equals(date.getDate())) {

										if (course.getClassSectionId().equals(3)) {
											System.out.println("true:" + date1
													+ course.getSubjectId());
											flag = "true";
											subject = course.getSubjectId();
										}
									}
								}
						%>
						<td><select id="<%=date.getDate() %>,3" name="">
								<option value=""></option>
								<%
									for (int m = 0; m < subjects.size(); m++) {
											T_SYS_PARAMETER subject1 = (T_SYS_PARAMETER) subjects
													.get(m);
											String subjectId = subject1.getParameterName().toString();
											if (subjectId.equals(subject)) {
								%>
								<option selected='selected'
									value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									} else {
								%>
								<option value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									}
										}
								%>
						</select></td>
						<%
							}
						%>
					</tr>
					<tr>
						<td>第四节课</td>
						<%
							for (int i = 0; i < weeks.size(); i++) {
								String flag = "false";
								String subject = "";
								date date = (date) weeks.get(i);
								for (int n = 0; n < courses.size(); n++) {
									course course = (course) courses.get(n);
									String date1 = dd.format(course.getFromTime());
									if (date1.equals(date.getDate())) {

										if (course.getClassSectionId().equals(4)) {
											System.out.println("true:" + date1
													+ course.getSubjectId());
											flag = "true";
											subject = course.getSubjectId();
										}
									}
								}
						%>
						<td><select id="<%=date.getDate() %>,4" name="">
								<option value=""></option>
								<%
									for (int m = 0; m < subjects.size(); m++) {
											T_SYS_PARAMETER subject1 = (T_SYS_PARAMETER) subjects
													.get(m);
											String subjectId = subject1.getParameterName().toString();
											if (subjectId.equals(subject)) {
								%>
								<option selected='selected'
									value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									} else {
								%>
								<option value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									}
										}
								%>
						</select></td>
						<%
							}
						%>
					</tr>
					<tr>
						<td>第五节课</td>
						<%
							for (int i = 0; i < weeks.size(); i++) {
								String flag = "false";
								String subject = "";
								date date = (date) weeks.get(i);
								for (int n = 0; n < courses.size(); n++) {
									course course = (course) courses.get(n);
									String date1 = dd.format(course.getFromTime());
									if (date1.equals(date.getDate())) {

										if (course.getClassSectionId().equals(5)) {
											System.out.println("true:" + date1
													+ course.getSubjectId());
											flag = "true";
											subject = course.getSubjectId();
										}
									}
								}
						%>
						<td><select id="<%=date.getDate() %>,5" name="">
								<option value=""></option>
								<%
									for (int m = 0; m < subjects.size(); m++) {
											T_SYS_PARAMETER subject1 = (T_SYS_PARAMETER) subjects
													.get(m);
											String subjectId = subject1.getParameterName().toString();
											if (subjectId.equals(subject)) {
								%>
								<option selected='selected'
									value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									} else {
								%>
								<option value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									}
										}
								%>
						</select></td>
						<%
							}
						%>
					</tr>
					<tr>
						<td>第六节课</td>
						<%
							for (int i = 0; i < weeks.size(); i++) {
								String flag = "false";
								String subject = "";
								date date = (date) weeks.get(i);
								for (int n = 0; n < courses.size(); n++) {
									course course = (course) courses.get(n);
									String date1 = dd.format(course.getFromTime());
									if (date1.equals(date.getDate())) {

										if (course.getClassSectionId().equals(6)) {
											System.out.println("true:" + date1
													+ course.getSubjectId());
											flag = "true";
											subject = course.getSubjectId();
										}
									}
								}
						%>
						<td><select id="<%=date.getDate() %>,6" name="">
								<option value=""></option>
								<%
									for (int m = 0; m < subjects.size(); m++) {
											T_SYS_PARAMETER subject1 = (T_SYS_PARAMETER) subjects
													.get(m);
											String subjectId = subject1.getParameterName().toString();
											if (subjectId.equals(subject)) {
								%>
								<option selected='selected'
									value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									} else {
								%>
								<option value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									}
										}
								%>
						</select></td>
						<%
							}
						%>
					</tr>
					<tr>
						<td>第七节课</td>
						<%
							for (int i = 0; i < weeks.size(); i++) {
								String flag = "false";
								String subject = "";
								date date = (date) weeks.get(i);
								for (int n = 0; n < courses.size(); n++) {
									course course = (course) courses.get(n);
									String date1 = dd.format(course.getFromTime());
									if (date1.equals(date.getDate())) {

										if (course.getClassSectionId().equals(7)) {
											System.out.println("true:" + date1
													+ course.getSubjectId());
											flag = "true";
											subject = course.getSubjectId();
										}
									}
								}
						%>
						<td><select id="<%=date.getDate() %>,7" name="">
								<option value=""></option>
								<%
									for (int m = 0; m < subjects.size(); m++) {
											T_SYS_PARAMETER subject1 = (T_SYS_PARAMETER) subjects
													.get(m);
											String subjectId = subject1.getParameterName().toString();
											if (subjectId.equals(subject)) {
								%>
								<option selected='selected'
									value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									} else {
								%>
								<option value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									}
										}
								%>
						</select></td>
						<%
							}
						%>
					</tr>
					<tr>
						<td>第八节课</td>
						<%
							for (int i = 0; i < weeks.size(); i++) {
								String flag = "false";
								String subject = "";
								date date = (date) weeks.get(i);
								for (int n = 0; n < courses.size(); n++) {
									course course = (course) courses.get(n);
									String date1 = dd.format(course.getFromTime());
									if (date1.equals(date.getDate())) {

										if (course.getClassSectionId().equals(8)) {
											System.out.println("true:" + date1
													+ course.getSubjectId());
											flag = "true";
											subject = course.getSubjectId();
										}
									}
								}
						%>
						<td><select id="<%=date.getDate() %>,8" name="">
								<option value=""></option>
								<%
									for (int m = 0; m < subjects.size(); m++) {
											T_SYS_PARAMETER subject1 = (T_SYS_PARAMETER) subjects
													.get(m);
											String subjectId = subject1.getParameterName().toString();
											if (subjectId.equals(subject)) {
								%>
								<option selected='selected'
									value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									} else {
								%>
								<option value="<%=subject1.getParameterValue()%>"><%=subject1.getParameterName()%></option>
								<%
									}
										}
								%>
						</select></td>
						<%
							}
						%>
					</tr>
				</table>
				<p class="tc p30">
					<input name="input" onclick="save()" type="button" value="保 存" 	class="bt3 fb grey1 ml50" />
				</p>
			</div>
		</div>
	</form>
</body>
</html>