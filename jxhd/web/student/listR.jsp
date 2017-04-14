<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>学生列表底部</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script>
	 $(function() {
           $("#checkAll").click(function() {
                $('input[name="userIds"]').attr("checked",this.checked); 
            });
            var $subBox = $("input[name='userIds']");
            $subBox.click(function(){
                $("#checkAll").attr("checked",$subBox.length == $("input[name='userIds']:checked").length ? true : false);
            });
        });
        //编辑学生
		function update(userId){
			form1.userId.value = userId;
			form1.action="UserById.action";
			form1.submit();
		}
		//删除学生
		function deleteStation(userId){
			if(window.confirm('你确定要删除吗？')){
				form1.action="DeleteUser.action";
				form1.userId.value = userId;
				form1.submit();
			}
		}
		//添加学生
		function addStation(){
			var t2 = document.getElementById("classId"); 
			var classId = t2.options[t2.selectedIndex].value;
			form1.classId.value = classId;
			form1.action="ToInsertUser.action";
			form1.submit();
		}
		//选择班级和搜索后的事件
		function sub1(){
			form1.action="DepartmentByParentId2.action";
			form1.submit();
		}
		//批量删除学生
		function deleteUsers(){
			var a = document.getElementsByName("userIds");
			if(window.confirm('你确定要删除吗？')){
				var ss = "";
				for(var i = 0 ;i<a.length;i++){ 
				if(a[i].checked){
					ss = ss+a[i].value+",";
				}
				}
				if(ss==""){
					alert("请选择一个学生。");
				}else{
					form1.type.value = ss;
				   form1.action="DeletePlUser.action";
				   form1.submit();
			   }
		   }
		 }
		 //excel导入学生
		 function toExcelSave(){
		 	var t2 = document.getElementById("classId"); 
			var classId = t2.options[t2.selectedIndex].value;
			if(classId==''){
				alert("请选择班级。");
			}else{
				form1.action="ToInsertPlUser.action";
				form1.submit();
			}
		 }
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
       /*没用到
         function classByParent(classNum){
		 var departmentId = form1.classId1.value
             var url = 'ClassByClassNumAjax.action';
             var params = {
                     classNum:classNum,
                     departmentId:departmentId
             };
             jQuery.post(url, params, callbackFun, 'json');
         }
        function callbackFun(data){
        	document.getElementById("classId").options.length=0; 
        	var parameters = data['list'];
        	document.getElementById("classId").options.add(new Option('全部','')); 
         for(i=0;i<parameters.length;i++){
         	document.getElementById("classId").options.add(new Option(parameters[i].className,parameters[i].classId)); 
         }
        } */
	</script>

</head>

<body>
	<form id="form1" name="form1" action="DepartmentByParentId2.action"
		method="post">
		<s:hidden name="t_course_log.classId" id="classId1"></s:hidden>
		<input type="hidden" name="t_user1.userId" id="userId" /> <input
			type="hidden" name="t_user1.isTeacher" id="isTeacher" value="0" /> <input
			type="hidden" name="t_user1.type" id="type" />
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">学生信息管理</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">学生信息列表</span> Student Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:20px">
				年级：
				<s:select 
					id="gradeId" 
					list="t_sys_parameter.data"
					onchange="departmentByParent(this.value)" 
					name="t_user1.gradeId"
					headerKey="" 
					headerValue="全部" 
					listKey="id"
					listValue="parameterName">
				</s:select>
				班级：
				<s:select 
					id="classId" 
					name="t_user1.classId" 
					onchange="sub1()"
					list="list" 
					listKey="classId" 
					listValue="className"
					cssStyle="width:80px" 
					headerKey="" 
					headerValue="全部">
				</s:select>
				学生姓名:<input name="t_user1.name" type="text"
					value="<s:property value='t_user1.name'/>" class="text" /> 
					<input
					name="input" type="button" value=" 搜  索" onclick="sub1()"
					class="bt1 fb grey1 ml5" /> <input name="input" type="button"
					value=" 添  加" onclick="addStation()" class="bt1 fb grey1 ml5" /> <input
					name="input" type="button" value="批量删除" onclick="deleteUsers()"
					class="bt1 fb grey1 ml5" /> <input name="input" type="button"
					value="excel导入" onclick="toExcelSave()" class="bt1 fb grey1 ml5" />
			</div>
			<div class="table4 table3">
				<table style="width:100%;border:1px solid #d7d7d7"
					class="all_content">
					<tr>
						<td width="5%" class="bghui fb"><input type='checkbox'
							id='checkAll'></td>
						<td colspan="2" class="bghui fb">序号</td>
						<td width="11%" class="bghui fb">登录名</td>
						<td width="11%" class="bghui fb">学生姓名</td>
						<td width="6%" class="bghui fb">性别</td>
						<td width="12%" class="bghui fb">电话</td>
						<td width="36%" class="bghui fb">住址</td>
						<td width="10%" class="bghui fb">操作</td>
					</tr>
					<%
						int i = 1;
					%>
					<s:iterator value="t_user1.data" status="stat">
						<tr>
							<td><input type='checkbox' name='userIds'
								value="<s:property value='userId'/>"></td>
							<td colspan="2"><%=i++%></td>
							<td><s:property value='loginName' /></td>
							<td><s:property value='name' /></td>
							<td><s:if test="sex==0">
   女
   </s:if> <s:if test="sex==1">
   男
   </s:if></td>
							<td><s:property value='phone' /></td>
							<td><s:property value='address' /></td>
							<td><a href="#"
								onclick="update(<s:property value='userId'/>)" class="grey">编辑</a>
								<a href="#"
								onclick="javascript:deleteStation(<s:property value='userId'/>)"
								class="grey">删除</a>
							</td>
						</tr>
					</s:iterator>
				</table>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="t_user1.pageNo" />
					页 共
					<s:property value="t_user1.pageNum" />
					页 <a
						href="javascript:firstPage(<s:property value="t_user1.pageNo"/>,<s:property value="t_user1.pageNum"/>);">第一页</a>
					<a
						href="javascript:prevPage(<s:property value="t_user1.pageNo"/>,<s:property value="t_user1.pageNum"/>);">上一页</a>
					<a class="blue12_33"
						href="javascript:nextPage(<s:property value="t_user1.pageNo"/>,<s:property value="t_user1.pageNum"/>);">下一页</a>
					<a class="blue12_33"
						href="javascript:lastPage(<s:property value="t_user1.pageNo"/>,<s:property value="t_user1.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1"
						name="t_user1.pageNo"> 页 <a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="t_user1.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>