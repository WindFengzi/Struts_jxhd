<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,com.dt.jxhd.action.*,java.text.SimpleDateFormat,java.text.DateFormat,java.text.ParseException;"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML >
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
</script>

</head>

<body>
	<form id="form1" name="form1" action="CourseLogs.action" method="post">
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
					<span class="fb f14">课程设置记录</span> The Course Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:18px">

				老师：
				<s:select id="classes" name="t_course_log.userId"
					onchange="courseLogs()" list="list" listKey="userId"
					listValue="name" headerKey="" headerValue="全部">
				</s:select>
				开始时间：
				<s:textfield name="t_course_log.fromTime" onclick="setday(this)">
					<s:param name="value">
						<s:date name="t_course_log.fromTime" format="yyyy-MM-dd HH:mm:ss" />
					</s:param>
				</s:textfield>
				结束时间：
				<s:textfield name="t_course_log.endTime" onclick="setday(this)">
					<s:param name="value">
						<s:date name="t_course_log.endTime" format="yyyy-MM-dd HH:mm:ss" />
					</s:param>
				</s:textfield>
				<input name="input" type="button" value=" 搜  索"
					onclick="courseLogs()" class="bt1 fb grey1 ml10" /> <input
					name="input" type="button" value="课程设置" onclick="sub1()"
					class="bt1 fb grey1 ml10" />
			</div>
			<div class="table4 table3">
				<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
					class="all_content">
					<tr>
						<td class="bghui fb">班级</td>
						<td class="bghui fb">课程名称</td>
						<td class="bghui fb">开始时间</td>
						<td class="bghui fb">结束时间</td>
						<td class="bghui fb">设置老师</td>
					</tr>
					<s:iterator value="t_course_log.data" status="stat">
						<tr>
							<td><s:property value='className' />
							</td>
							<td><s:property value='subjectName' />
							</td>
							<td><s:date name="fromTime" format="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td><s:date name="endTime" format="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td><s:property value='name' />
							</td>
						</tr>
					</s:iterator>
				</table>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="t_course_log.pageNo" />
					页 共
					<s:property value="t_course_log.pageNum" />
					页 <a
						href="javascript:firstPage(<s:property value="t_course_log.pageNo"/>,<s:property value="t_course_log.pageNum"/>);">第一页</a>
					<a
						href="javascript:prevPage(<s:property value="t_course_log.pageNo"/>,<s:property value="t_course_log.pageNum"/>);">上一页</a>
					<a class="blue12_33"
						href="javascript:nextPage(<s:property value="t_course_log.pageNo"/>,<s:property value="t_course_log.pageNum"/>);">下一页</a>
					<a class="blue12_33"
						href="javascript:lastPage(<s:property value="t_course_log.pageNo"/>,<s:property value="t_course_log.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1"
						name="t_course_log.pageNo">页 <a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="t_course_log.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>