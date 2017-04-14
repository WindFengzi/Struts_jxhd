<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>提问统计</title>
<link rel="stylesheet" href="/jxhd/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script type="text/javascript"
	src="/jxhd/js/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="/jxhd/js/ztree/jquery.ztree.excheck-3.5.js"></script>
<script src="/jxhd/js/Time.js"></script>
<style type="text/css">
ul.ztree {
	margin-top: 10px;
	border: 1px solid #617775;
	background: #f0f6e4;
	width: 220px;
	height: 360px;
	overflow-y: scroll;
	overflow-x: auto;
}
</style>
<SCRIPT type="text/javascript">		var setting = {
			check: {
				enable: true,
				chkboxType: {"Y":"", "N":""}
			},
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: beforeClick,
				onCheck: onCheck
			}
		};

		var zNodes =[
		<s:iterator value="department.data" status="stat">
			{id:<s:property value='departmentId'/>, pId:<s:property value='parentDepartmentId'/>, name:"<s:property value='departmentName'/>", open:true},
		</s:iterator>
		 ];

		function beforeClick(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}
		
		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			ids = "";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
				ids += nodes[i].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
			var departmentIds = $("#departmentIds");
			//if(ids.length>0){
			//	ids = ids.substring(0,ids.length-1);
			//}
			form1.departmentName.value=v;
			ids = ids.substr(0,ids.length-1);
			departmentIds.attr("value", ids);
			departmentByParent(ids);
		}

		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		</SCRIPT>
<script>

		function departmentByParent(districtId){    
		
		//districtId = districtId.substr(0,districtId.length-1);
             var url = 'DepartmentByParentIdAjax.action';
             var params = {
                     parentId:districtId
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
        }
        function courseByParent(){    
             var url = 'CourseByParentIdAjax.action';
             var obj = document.getElementById("classes"); //定位id
			var index = obj.selectedIndex; // 选中索引
			var text = obj.options[index].text; // 选中文本
			var districtId = obj.options[index].value; // 选中值
			//form1.classId.value = districtId;
             var params = {
                     parentId:districtId
             };
             jQuery.post(url, params, callbackFun1, 'json');
         }
        function callbackFun1(data){
        	document.getElementById("courses").options.length=0; 
        	var parameters = data['list'];
        	document.getElementById("courses").options.add(new Option('全部','')); 
         for(i=0;i<parameters.length;i++){
         	document.getElementById("courses").options.add(new Option(parameters[i].subjectName,parameters[i].subjectId)); 
         }
        }
        function gradeByParent(gradeId){
		 var departmentId = form1.departmentIds.value
             var url = 'ClassByGradeIdAjax.action';
             var params = {
                     gradeId:gradeId,
                     departmentId:departmentId
             };
             jQuery.post(url, params, callbackFun2, 'json');
         }
        function callbackFun2(data){
        	document.getElementById("classId").options.length=0; 
        	var parameters = data['list'];
        	document.getElementById("classId").options.add(new Option('全部','')); 
         for(i=0;i<parameters.length;i++){
         	document.getElementById("classId").options.add(new Option(parameters[i].className,parameters[i].classId)); 
         }
        }
        function classByParent(classNum){
		 var departmentId = form1.departmentIds.value
             var url = 'ClassByClassNumAjax.action';
             var params = {
                     classNum:classNum,
                     departmentId:departmentId
             };
             jQuery.post(url, params, callbackFun3, 'json');
         }
        function callbackFun3(data){
        	document.getElementById("classId").options.length=0; 
        	var parameters = data['list'];
        	document.getElementById("classId").options.add(new Option('全部','')); 
         for(i=0;i<parameters.length;i++){
         	document.getElementById("classId").options.add(new Option(parameters[i].className,parameters[i].classId)); 
         }
        }
		function dianmUsers(){
			form1.target='frm_home_main';
			form1.action="DianmUsers.action";
			form1.submit();
		}
		function test(){
			form1.action="Twtj.action";
			form1.submit();
		}
		function excel(){
			var obj = document.getElementById('div_excel_content');
	    	form1.txt_excel_content.value=obj.innerHTML;
	    	form1.action='./save2excel.jsp';
	    	form1.submit();
		}
	//提问统计
	/* window.onload=function(){
		parent.document.getElementById('frm_home_main1').style.height = document.getElementById("form1").offsetHeight + 'px' ;
		parent.parent.document.getElementById('frm_home_main').style.height = document.getElementById("form1").offsetHeight + 'px' ;
	} */
	</script>
</head>

<body>
	<form id="form1" name="form1" action="Articles.action" method="post">
		<s:hidden name="askLog.departmentId" id="departmentIds"></s:hidden>
		<s:hidden name="askLog.departmentName" id="departmentName"></s:hidden>
		<input type=hidden name='txt_excel_content'>
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">统计分析
			</a> 》 <a href="#">问答统计 </a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">提问统计</span> Questions Statistics
				</h2>
			</div>
			<div class="form1 " style="padding-left:20px">
				部门： <input id="citySel" type="text" readonly
					value="<s:property value='askLog.departmentName'/>"
					style="width:120px;" onclick="showMenu();" /> 年级：
				<s:select id="gradeId" list="t_sys_parameter.data"
					onchange="gradeByParent(this.value)" name="t_user1.gradeId"
					headerKey="" headerValue="全部" listKey="id"
					listValue="parameterName"></s:select>
				班级：
				<s:select id="classId" name="askLog.classId"
					onchange="courseByParent()" cssStyle="width:60px" list="list"
					listKey="classId" listValue="className" headerKey=""
					headerValue="全部">
				</s:select>
				课程：
				<s:select id="courses" name="askLog.courceId" cssStyle="width:60px"
					list="list1" listKey="subjectId" listValue="subjectName"
					headerKey="" headerValue="全部">
				</s:select>

				<div>
					时间段：
					<s:textfield name="askLog.beginTime" onclick="setday(this)">
						<s:param name="value">
							<s:date name="askLog.beginTime" format="yyyy-MM-dd" />
						</s:param>
					</s:textfield>
					到:
					<s:textfield name="askLog.endTime" onclick="setday(this)">
						<s:param name="value">
							<s:date name="askLog.endTime" format="yyyy-MM-dd" />
						</s:param>
					</s:textfield>
					<input name="input" type="button" onclick="test()" value=" 搜  索"
						class="bt1 fb grey1 ml50" /> <input name="input" type="button"
						value="excel导出" onclick="excel()" class="bt1 fb grey1 ml10" />
				</div>
			</div>
			<div id='div_excel_content'>
				<div class="table4 table3">
					<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
						class="all_content">
						<tr>
							<td colspan="2" class="bghui fb">序号</td>
							<td width="12%" class="bghui fb">班级</td>
							<td width="15%" class="bghui fb">课程</td>
							<td width="15%" class="bghui fb">即问即答</td>
							<td width="14%" class="bghui fb">抢答</td>
							<td width="11%" class="bghui fb">挑人作答</td>
							<td width="15%" class="bghui fb">挑组作答</td>
							<td width="12%" class="bghui fb">总数</td>
						</tr>
						<%
							int i = 1;
						%>
						<s:iterator value="askLog.data" status="stat">
							<tr>
								<td colspan="2"><%=i++%></td>
								<td><s:property value='className' />
								</td>
								<td><s:property value='subjectName' />
								</td>
								<td><s:property value='jwjdNum' />
								</td>
								<td><s:property value='qdNum' />
								</td>
								<td><s:property value='trNum' />
								</td>
								<td><s:property value='tzNum' />
								</td>
								<td><s:property value='sumNum' />
								</td>
							</tr>
						</s:iterator>
					</table>
				</div>
			</div>
		</div>
		<div id="menuContent" class="menuContent"
			style="display:none; position: absolute;">
			<ul id="treeDemo" class="ztree"
				style="margin-top:0; width:180px; height: 300px;"></ul>
		</div>
	</form>
</body>
</html>