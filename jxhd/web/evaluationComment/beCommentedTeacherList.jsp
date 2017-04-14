<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>学生评论列表</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />

<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>

<script type="text/javascript">
	
	//选择年级后的事件
		 function departmentByParent(gradeId){
			 var departmentId = form1.classId1.value
             var url = 'ClassByGradeIdAjax.action';
			// alert(gradeId);
             var params = {
                     gradeId:gradeId,
                     departmentId:departmentId
             };
             jQuery.post(url, params, callbackFun, 'json');
         }
		
		function subClassValue(classId) {
			var url = 'ClassTeacherList.action';
			//var commentTag = 
			//alert(classId);
			var params = {
					classId:classId,
					commentTag:0
			};
			jQuery.post(url,params,callbackFunData, 'json');
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

		function callbackFunData(data,textStatus) {
			var paraments = data.t_teacher_comment;
			alert(data.t_teacher_comment.data[0]);
			document.getElementById("commentData").value = paraments;
		}
		
		function question(){
			form1.target = "frame1";
			form1.action = "PreviewSelectItems.action";
			form1.submit();
		}
	
		function sub1() {
			form1.submit();
		}
		
		function chooseClassOrStudent(commentTag) {
			form1.commentTag.value = commentTag;
			form1.submit();
		}
		
		function subClass(classID) {
			form1.class_ID.value = classID;
			form1.commentTag.value = 0;
			form1.submit();
		}
		
		$(function(){
			var names = "";
			$(".notice_title").each(function(){
				var str = $(this).text();
		        if(str.length > 23) {//左右各11个字符串长度
					var s=str.substr(0,20)+"...";// 只显示20个字符串
					$(this).html(s);
				}
		    });
		});
		/* 系统管理 */
		function xtgl() {
			form1.target = 'frm_home_main';
			form1.action = 'ToXtsz.action';
			form1.submit();
		}
</script>

</head>
<body>
	<form id="form1" name="form1" action="StudentCommentList.action"
		method="post">
		
		<s:hidden name="t_course_log.classId" id="classId1"></s:hidden>
		<input type="hidden" name="t_teacher_comment.tag" id="commentTag"/>
		<input type="hidden" name="t_teacher_comment.id" id="addIds" />
		<input type="hidden" name="t_teacher_comment.class_id" id="class_ID" />
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> > 
			<a href="#" id="index_system" onclick="javascript:xtgl()">系统管理</a> >
			<a href="#">老师点评</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">选择试题</span> The Item Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:20px;padding-top:10px">
				年级：
				<s:select list="list2" name="" onchange="departmentByParent(this.value)" headerKey="" 
					headerValue="全部" listKey="id" listValue="parameterName">
				</s:select>
				班级：
				<s:select id="classId" name="t_course_log.name" list="list" onchange="subClass(this.value)"
					listKey="classId" listValue="className" headerKey="" headerValue="全部">
				</s:select>

				<select id="reacher_id" name="">
					<option value="1">老师</option>
					<option value="2">学生</option>
				</select>
				<input name="" type="text" class="text" /> 
				<input name="input" type="button" value=" 搜  索" onclick="sub1()" class="bt1 fb grey1" /> 
				<input name="input" type="button" value=" 老师" onclick="chooseClassOrStudent(2)" class="bt1 fb grey1" /> 
				<input name="input" type="button" value=" 学生" onclick="chooseClassOrStudent(3)" class="bt1 fb grey1" /> 
			</div>
			<div class="table4 table3">
				<table style="width:100%;border:1px solid #d7d7d7"
					class="all_content">
					<tr>
						<td style="visibility: hidden;"></td>
						<td width="10%" colspan="2" class="bghui fb">序号</td>
						<td class="bghui fb">评价内容</td>
						<td width="10%" class="bghui fb">评价人</td>
						<td width="10%" class="bghui fb">操作</td>
					</tr>
					<%
						int i = 1;
					%>
				
						<s:iterator id="commentData" value="t_teacher_comment.data" status="stat">
						<tr>
							<td style="visibility: hidden;"><input type="hidden" value="<s:property value='id'/>"></td>
							<td colspan="2"><%=i++%></td>
							<td  style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;padding-left: 4px;" title="<s:property value='comment' escape="false" />">
								<a onclick="" class="notice_title"><s:property value='comment' escape="false" /></a></td>
							<td>匿名</td>
							<td><a href="#">查看</a></td>
						</tr>
					</s:iterator>
				</table>
				
				<div class="pages mt20 tc">
					当前是第
					<s:property value="t_teacher_comment.pageNo" />
					页 共
					<s:property value="t_teacher_comment.pageNum" />
					页
					<a href="javascript:firstPage(<s:property value="t_teacher_comment.pageNo"/>,<s:property value="t_teacher_comment.pageNum"/>);">第一页</a>
					<a href="javascript:prevPage(<s:property value="t_teacher_comment.pageNo"/>,<s:property value="t_teacher_comment.pageNum"/>);">上一页</a>
					<a class="blue12_33" href="javascript:nextPage(<s:property value="t_teacher_comment.pageNo"/>,<s:property value="t_teacher_comment.pageNum"/>);">下一页</a>
					<a class="blue12_33" href="javascript:lastPage(<s:property value="t_teacher_comment.pageNo"/>,<s:property value="t_teacher_comment.pageNum"/>);">最后一页</a>
					转到 
					<input id="inputPageNo" type="text" size="1" name="t_teacher_comment.pageNo"> 页 
					<a class="blue12_33" href="javascript:checkInputPageNo1('inputPageNo',<s:property value="t_teacher_comment.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	
	</form>
	<script>
		//question();
	</script>
</body>
</html>
