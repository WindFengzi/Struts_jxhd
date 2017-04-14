<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>教师信息管理页面右部</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script  src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script>
		//选择和取消全部
	 	$(function() {
           $("#checkAll").click(function() {
                $('input[name="userIds"]').attr("checked",this.checked); 
            });
            var $subBox = $("input[name='userIds']");
            $subBox.click(function(){
                $("#checkAll").attr("checked",$subBox.length == $("input[name='userIds']:checked").length ? true : false);
            });
        });
		function update(userId){
			form1.userId.value = userId;
			form1.action="UserById.action";
			form1.submit();
		}
		function deleteStation(userId){
		if(window.confirm('你确定要删除吗？')){
			form1.action="DeleteUser.action";
			form1.userId.value = userId;
			form1.submit();
		}
		}
		function toView(userId){
			form1.userId.value = userId;
			form1.action="ToView.action";
			form1.submit();
		}
		function addStation(){
			form1.action="ToInsertUser.action";
			form1.submit();
		}
		function sub1(){
			form1.action="DepartmentByParentId2.action";
			form1.submit();
		}
		function deleteUsers(){
			if(window.confirm('你确定要进行批量删除吗？')){
			 	var a = document.getElementsByName("userIds");
				var ss = "";
				for(var i = 0 ;i<a.length;i++){ 
				if(a[i].checked){
					ss = ss+a[i].value+",";
				}
				}
				if(ss==""){
					alert("请选择一个教师。");
				}else{
					form1.type.value = ss;
				    form1.action="DeletePlUser.action";
				    form1.submit();
			   }
		   }
		 }
		 //excel导入
		 function toExcelSave(){
		 	if(window.confirm('您已经选择了要导入的部门了吗？')){
			 	form1.action="ToInsertPlUser.action";
				form1.submit();
			}
		 }
		
	</script>

</head>

<body>
	<form id="form1" name="form1" action="DepartmentByParentId2.action"
		method="post">
		<s:hidden name="t_course_log.classId" id="classId1"></s:hidden>
		<input type="hidden" name="t_user1.userId" id="userId" /> <input
			type="hidden" name="t_user1.isTeacher" id="isTeacher" value="1" /> <input
			type="hidden" name="t_user1.type" id="type" />

		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">教师信息管理</a>
			》 <a href="#">教师信息列表</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">教师信息列表</span> The Teacher Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:10px">
				教师姓名：<input name="t_user1.name" type="text" style="width:125px;"
					value="<s:property value='t_user1.name'/>" class="text" /> <input
					name="input" type="button" value=" 搜  索" onclick="sub1()"
					class="bt1 fb grey1 ml10" /> <input name="input" type="button"
					value=" 添 加" onclick="addStation()" class="bt1 fb grey1 ml10" /> <input
					name="input" type="button" value="批量删除" onclick="deleteUsers()"
					class="bt1 fb grey1 ml10" /> <input name="input" type="button"
					value="excel导入" onclick="toExcelSave()" class="bt1 fb grey1 ml10" />
			</div>
			<div class="table4 table3">
				<table style="width:100%;border:1px solid #d7d7d7" class="all_content" >
					<tr>
						<td width="5%" class="bghui fb"><input type='checkbox'
							id="checkAll" /></td>
						<td colspan="2" class="bghui fb">序号</td>
						<td width="11%" class="bghui fb">登录名</td>
						<td width="11%" class="bghui fb">教师姓名</td>
						<td width="6%" class="bghui fb">性别</td>
						<td width="12%" class="bghui fb">电话</td>
						<td class="bghui fb">住址</td>
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
							<td><s:property value='loginName' />
							</td>
							<td><s:property value='name' />
							</td>
							<td><s:if test="sex==0">
   女
   </s:if>
								<s:if test="sex==1">
   男
   </s:if>
							</td>
							<td><s:property value='phone' />
							</td>
							<td><s:property value='address' />
							</td>
							<td><a href="#"
								onclick="update(<s:property value='userId'/>)" class="grey">编辑</a>
								<a href="#"
								onclick="javascript:deleteStation(<s:property value='userId'/>)"
								class="grey">删除</a></td>
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