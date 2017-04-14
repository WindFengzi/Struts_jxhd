<!DOCTYPE html >
<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>班级管理添加</title>
<link rel="stylesheet" href="/jxhd/css/demo.css" type="text/css">
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
<SCRIPT type="text/javascript">		var setting = {
			check: {
				enable: true,
				chkStyle: "radio",
				radioType: "all"
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
				onClick: onClick,
				onCheck: onCheck
			}
		};

		var zNodes =[
			<s:iterator value="department.data" status="stat">
			{id:<s:property value='departmentId'/>, pId:<s:property value='parentDepartmentId'/>, name:"<s:property value='departmentName'/>", open:true},
		</s:iterator>
		 ];

		function onClick(e, treeId, treeNode) {
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
			var departmentIds = $("#departmentId");
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
		function sub1(){
			var className = document.form1.className; 
			if(className.value.length==0){ 
				alert("班级简称不能为空！"); 
				className.focus(); 
				return false; 
			}
			form1.action="SaveClass.action";
			form1.submit();
		}
		function list1(){
			history.go(-1);
		}
	</script>
</head>
<body>
	<form name="form1" method="post" action="ToDate.action" id="form1">
		<input type="hidden" name="t_class.departmentId" id="departmentId" />
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">班级管理</a>
			》 <a href="#">添加班级信息</a>
			<div class="search">
				<input name="" type="text" class="text fl" /><input name=""
					type="button" class="sou fl" value="" />
			</div>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">添加班级信息</span> Add Class Information
				</h2>
			</div>
			<div class="table4 table3">
				<div class="fl w370">
					<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
						class="all_content">

						<tr>
							<td width="31%" class="bghui fb">所属部门</td>
							<td width="69%"><input id="citySel" type="text" readonly
								value="" onclick="showMenu();" />
							</td>
						</tr>
						<tr>
							<td width="31%" class="bghui fb">所属年级</td>
							<td width="69%"><s:select id="gradeId" list="list"
									name="t_class.gradeId" listKey="id" listValue="parameterName"></s:select>
							</td>
						</tr>
					</table>
				</div>
				<div class="fr">
					<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
						class="all_content">
						<tr>
							<td width="31%" class="bghui fb">班级</td>
							<td width="69%"><input type="text" name="t_class.className"
								id="className" /></td>
						</tr>
					</table>
				</div>
				<div class="cb"></div>
			</div>
			<p class="tc p30">
				<input name="input" onclick="sub1()" type="button" value="保 存"
					class="bt3 fb grey1 ml50" /><input name="input" onclick="list1()"
					type="button" value="返回" class="bt3 fb grey1 ml50" />
			</p>
		</div>
		<div id="menuContent" class="menuContent"
			style="display:none; position: absolute;">
			<ul id="treeDemo" class="ztree"
				style="margin-top:0; width:180px; height: 300px;"></ul>
		</div>
	</form>
</body>
</html>