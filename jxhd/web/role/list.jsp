<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>角色管理</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
</head>
<body>
	<form id="form1" name="form1" action="Roles.action" method="post">
		<s:hidden id="roleId" name="t_sys_role.roleId"></s:hidden>

		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">系统管理</a>
			》 <a href="#">权限管理</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">角色管理</span> The Role Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:20px">
				角色名称：<input name="t_sys_role.roleName" type="text"
					value="<s:property value='t_sys_role.roleName'/>" class="text" />
				<input name="input" type="button" value=" 搜  索" onclick="sub1()"
					class="bt1 fb grey1 ml10" /> <input name="input" type="button"
					value=" 添  加" onclick="addStation()" class="bt1 fb grey1 ml10" />
			</div>
			<div class="table4 table3">
				<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
					class="all_content">
					<tr>
						<td width="25%" colspan="2" class="bghui fb">角色编号</td>
						<td class="bghui fb" width="25%">角色名称</td>
						<td width="25%" class="bghui fb">角色描述</td>
						<td width="25%" class="bghui fb">操作</td>
					</tr>
					<s:iterator value="userlist" status="stat">
						<tr>
							<td colspan="2"><s:property value="roleId" /></td>
							<td><s:property value="roleName" /></td>
							<td><s:property value="roleDesc" />
							</td>
							<td><a
								href="javascript:toFpzy('<s:property value="roleId"/>')"
								class="blue12_33"
								onclick="toFpzy('<s:property value="roleId"/>')">分配权限</a> <a
								href="#" onclick="update(<s:property value='roleId'/>)"
								class="grey">编辑</a> <a href="#"
								onclick="javascript:deleteStation(<s:property value='roleId'/>)"
								class="grey">删除</a>
							</td>
						</tr>
					</s:iterator>
				</table>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="t_sys_role.pageNo" />
					页 共
					<s:property value="t_sys_role.pageNum" />
					页 <a
						href="javascript:firstPage(<s:property value="t_sys_role.pageNo"/>,<s:property value="t_sys_role.pageNum"/>);">第一页</a>
					<a
						href="javascript:prevPage(<s:property value="t_sys_role.pageNo"/>,<s:property value="t_sys_role.pageNum"/>);">上一页</a>
					<a class="blue12_33"
						href="javascript:nextPage(<s:property value="t_sys_role.pageNo"/>,<s:property value="t_sys_role.pageNum"/>);">下一页</a>
					<a class="blue12_33"
						href="javascript:lastPage(<s:property value="t_sys_role.pageNo"/>,<s:property value="t_sys_role.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1"
						name="t_sys_role.pageNo"> 页 <a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="t_sys_role.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
		function toFpzy(roleId){
			form1.action="ToFpzy.action";
			form1.roleId.value = roleId;
			form1.submit();
		}
		function sub1(){
				form1.action="Roles.action";
				form1.submit();
			}
			function update(roleId){
			form1.roleId.value = roleId;
			form1.action="RoleById.action";
			form1.submit();
		}
			
		function deleteStation(roleId){
			if(window.confirm('你确定要删除吗？')){
				form1.action="DeleteRole.action";
				form1.roleId.value = roleId;
				form1.submit();
			}
		}
		function addStation(){
			form1.action="ToInsertRole.action";
			form1.submit();
		}	
		
		/* window.onload=function(){
			//alert(document.body.offsetHeight);//firefox和ie显示正确，但是chrome不行
			//alert(document.getElementById("form1").offsetHeight);
			parent.document.getElementById('frm_home_main1').style.height = document.getElementById("form1").offsetHeight + 'px' ;
			parent.parent.document.getElementById('frm_home_main').style.height = document.getElementById("form1").offsetHeight + 'px' ;
		} */
</script>
</html>