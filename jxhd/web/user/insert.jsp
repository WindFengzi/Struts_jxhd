<!DOCTYPE HTML>
<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>教师信息管理-新增页面</title>
<link rel="stylesheet" href="/jxhd/css/demo.css" type="text/css">
<link rel="stylesheet" href="/jxhd/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script  src="/jxhd/js/PageCtrl.js"></script>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript" ></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script type="text/javascript" src="/jxhd/js/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="/jxhd/js/ztree/jquery.ztree.excheck-3.5.js"></script>
<script  src="/jxhd/js/Time.js"></script>
<SCRIPT type="text/javascript">		
var setting = {
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
			//var cityObj = $("#citySel");
			//cityObj.attr("value", v);
			document.getElementById("citySel").value=v;
			//alert(v);
			//var departmentIds = $("#classId1");
			ids = ids.substr(0,ids.length-1);
			//departmentIds.attr("value", ids);
			document.getElementById("classId1").value=ids;
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
        	document.getElementById("classes").options.length=0; 
        	var parameters = data['list'];
        	document.getElementById("classes").options.add(new Option('','')); 
         for(i=0;i<parameters.length;i++){
         	document.getElementById("classes").options.add(new Option(parameters[i].className,parameters[i].classId)); 
         }
        }
	
		function sub1(){
			var loginName = document.form1.loginName; 
			if(loginName.value.length==0){ 
				alert("请输入登录名"); 
				loginName.focus(); 
				return false; 
			}
			var pwd1 = document.form1.pwd1; 
			if(pwd1.value.length==0){ 
				alert("请输入密码"); 
				pwd1.focus(); 
				return false; 
			}
			if(pwd1.value.length>18||pwd1.value.length<6){ 
				alert("请输入6-18位密码"); 
				pwd1.focus(); 
				return false; 
			}
			var pwd = document.form1.pwd; 
			if(pwd.value.length==0){ 
				alert("请输入密码"); 
				pwd.focus(); 
				return false; 
			}
			if(pwd.value.length>18||pwd.value.length<6){ 
				alert("请输入6-18位密码"); 
				pwd.focus(); 
				return false; 
			}
			if(pwd.value!=pwd1.value){ 
				alert("密码和确认密码不一致！"); 
				document.form1.pwd.value="";
				pwd.focus(); 
				return false; 
			}
			var name = document.form1.name; 
			if(name.value.length==0){ 
				alert("请输入用户名");
				name.focus(); 
				return false; 
			}
			var idNumber = document.form1.idNumber; 
			if(idNumber.value.length==0){ 
				alert("请输入教师工号"); 
				idNumber.focus(); 
				return false; 
			}
			form1.departmentId.value = form1.classId1.value;
			form1.action="UserSave.action";
			form1.submit();
		}
		function list1(){
			history.go(-1);
		}
		function checkUserName(){
			var loginName = document.form1.loginName.value; 
			var url = 'CheckUsernameAjax.action';
             var params = {
                     loginName:loginName
             };
             jQuery.post(url, params, callbackFun1, 'json');
		}
		function callbackFun1(data){
        	var msg = data['msg'];
        	if(msg=='true'){
        		alert("用户名已存在！");
        		form1.loginName.value="";
        		form1.loginName.onfocus();
        	}else{
        		sub1();
        	}
        }
	</script>

</head>

<body>
	<form name="form1" method="post" action="ToDate.action" id="form1">
		<input type="hidden" name="t_user1.isTeacher" id="isTeacher" value="1" />
		<input type="hidden" name="t_user1.departmentId" id="departmentId" />
		<input type="hidden" name="t_user1.status" id="status" value="1" />
		<s:hidden name="t_course_log.classId" id="classId1"></s:hidden>
		
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span>
			<a href="#">首页</a>》
			<a href="#">教师信息管理</a>》
			<a href="#">添加教师信息</a>
			<div class="search">
				<input name="" type="text" class="text fl" /><input name=""
					type="button" class="sou fl" value="" />
			</div>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">添加教师信息</span> Add Teacher Information
				</h2>
			</div>
			<div class="table4 table3">
				<div class="fl w370">
					<table  style="width:370px;border-color:#d7d7d7;border:1px;" >
						<tr>
							<td width="31%" class="bghui fb">登录名<font color='red'>(*)</font>
							</td>
							<td width="69%"><input type="text" name="t_user1.loginName"
								id="loginName" />
							</td>
						</tr>
						<tr>
							<td width="31%" class="bghui fb">密码<font color='red'>(*6-18)</font>
							</td>
							<td width="69%"><input type="password" id="pwd1" />
							</td>
						</tr>
						<tr>
							<td width="31%" class="bghui fb">确认密码<font color='red'>(*6-18)</font>
							</td>
							<td width="69%"><input type="password" name="t_user1.pwd"
								id="pwd" />
							</td>
						</tr>
						<tr>
							<td width="31%" class="bghui fb">姓名<font color='red'>(*)</font>
							</td>
							<td width="69%"><input type="text" name="t_user1.name"
								id="name" />
							</td>
						</tr>

						<tr>
							<td width="31%" class="bghui fb">部门</td>
							<td width="69%"><input id="citySel" type="text" readonly
								value="<s:property value='department.departmentName'/>"
								onclick="showMenu();" /></td>
						</tr>
						<tr>
							<td width="31%" class="bghui fb">职称</td>
							<td width="69%"
								style="height:28px; line-height:28px; padding-left:15px;text-align:left;">
								<s:select id="titleId" list="t_sys_parameter.data"
									name="t_user1.titleId" listKey="parameterValue"
									listValue="parameterName"></s:select></td>
						</tr>
					</table>
				</div>
				<div class="fr">
					<table style="border-color: #d7d7d7;width: 370px;border:1px;" >
						<tr>
							<td width="31%" class="bghui fb">联系电话</td>
							<td width="69%"><input type="text" name="t_user1.phone"
								id="phone" />
							</td>
						</tr>
						<tr>
							<td class="bghui fb">性别</td>
							<td align="left" width="69%"
								style="height:28px; line-height:28px; padding-left:15px;text-align:left;"><s:select
									list="#{'1':'男','0':'女'}" name="t_user1.sex"></s:select>
							</td>
						</tr>
						<tr>
							<td width="31%" class="bghui fb">民族</td>
							<td width="69%"><input type="text" name="t_user1.nation"
								id="nation" />
							</td>
						</tr>
						<tr>
							<td class="bghui fb">家庭住址</td>
							<td><input type="text" name="t_user1.address" id="address" />
							</td>
						</tr>
						<tr>
							<td width="31%" class="bghui fb">工号<font color='red'>(*)</font>
							</td>
							<td width="69%"><input type="text" name="t_user1.idNumber"
								id="idNumber" /></td>
						</tr>
						<tr>
							<td width="31%" class="bghui fb">角色</td>
							<td width="69%"
								style="height:28px; line-height:28px; padding-left:15px;text-align:left;">
								<s:select list="userlist" name="t_user1.roleId" listKey="roleId"
									listValue="roleName"></s:select></td>
						</tr>
					</table>
				</div>
				<div class="cb"></div>


			</div>
			<p class="tc p30">
				<input name="input" onclick="checkUserName()" type="button"
					value="保 存" class="bt3 fb grey1 ml50" /> <input name="input"
					onclick="list1()" type="button" value="返回"
					class="bt3 fb grey1 ml50" />
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