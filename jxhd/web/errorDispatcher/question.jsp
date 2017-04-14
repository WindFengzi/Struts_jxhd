<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>添加错误题目列表</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl1.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script type="text/javascript">
	//选择年级后的事件
		 function departmentByParent(gradeId){
			 var departmentId = form1.classId1.value
             var url = 'ClassByGradeIdAjax.action';
             var params = {
                     gradeId:gradeId,
                     departmentId:departmentId
             };
             jQuery.post(url, params, callbackFun, 'json');
         }
         //上面post的回调函数
        function callbackFun(data){
	        document.getElementById("classId").options.length=0; 
	        var parameters = data['list'];
	        document.getElementById("classId").options.add(new Option('全部','')); 
	        for(i=0;i<parameters.length;i++){
	         	document.getElementById("classId").options.add(new Option(parameters[i].className,parameters[i].classId)); 
         	}
        }

	//添加问答
	function chexiao() {
		var chkObjs = document.getElementsByName("radio1");
		var ss = "";
		
	for ( var i = 0; i < chkObjs.length; i++) {
			if (chkObjs[i].checked) {
				ss = ss + chkObjs[i].value + ",";
			}
		}
		ss = ss.substr(0,ss.length-1);
		alert(ss);
		if (ss == "") {
			alert("请选择预习题目。");
			return;
		} else {
			form1.preview_content.value = ss;
			form1.action = "AddPreviewProblem.action";
			form1.submit();
		}
	}
	
	//选择班级后的事件
	 function sub1(classId){
			form1.target = "frame2";
			form1.action = "GetStudent.action"
			form1.submit();
		} 
		
	
	//选择错误分发题目
	function question(){
		form1.target = "frame1";
		form1.action = "ToErrorSelectItems.action";
		form1.submit();
	}
	//选择课程得到分组
	function course(subject_id){
		form1.class_id.value = document.getElementById("classId").value;
		form1.target = "frame0";
		form1.action = "SelectGroup.action";
		form1.submit();
	}
</script>

</head>
<body>
	<form id="form1" name="form1" action="ToSelectItems.action"
		method="post">
		<input type="hidden" name="askLog.itemId" id="itemId" />
		<input type="hidden"  name="preview.preview_content" id="preview_content"/>
		<input type="hidden"  name="group_error.class_id" id="class_id"/><!-- 选择分组是用到 -->
		<s:hidden name="t_course_log.classId" id="classId1"></s:hidden>

		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">教学互动反馈</a>
			》 <a href="#">错题分发</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">选择试题</span> The Item Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:20px;padding-top:10px">
			
		年级：
				<s:select 
					list="list2"
					onchange="departmentByParent(this.value)" 
					headerKey="" 
					headerValue="全部" 
					listKey="id"
					listValue="parameterName">
				</s:select>

				班级：
				<s:select 
					id="classId" 
					name="t_user1.classId" 
					onchange="sub1(this.value)"
					list="list" 
					listKey="classId"
					listValue="className" 
					headerKey="" 
					headerValue="全部">
				</s:select>
		   课程：
				<s:select 
					id="subject_id" 
					name="group_error.subject_id" 
					list="list1" 
					onchange="course(this.value)"
					listKey="subjectId"
					listValue="subjectName" 
					headerKey="" 
					headerValue="全部">
				</s:select> 
				<!-- 分组列表 -->
			<br/>分组列表：
			<iframe name="frame0" id="frame0" style="border:0px;"  width=100%  height="50px"></iframe>
			<!-- 个人列表 -->
			个人列表：
			<iframe name="frame2" id="frame2" style="border:0px;"  width=100%  height="50px"></iframe>	
			<!-- 题目分发列表 -->
			<iframe name="frame1" id="frame1" style="border:0px;"  width=100%  height="580px"></iframe>
		</div>
	</div>
	</form>
	<script>
		question();
	</script>
</body>
</html>
