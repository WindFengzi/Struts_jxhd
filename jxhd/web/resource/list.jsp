<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>资源管理</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
</head>
<body>
	<form id="form1" name="form1" action="Resources.action" method="post">
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">系统管理</a>
			》 <a href="#">权限管理</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">资源管理</span> The Resource Information List
				</h2>
			</div>
			<div class="table4 table3">
				<table style="width: 100%;border: 1px; border-color:#d7d7d7;" class="all_content">
					<tr>
						<td width="33%" colspan="2" class="bghui fb">权限编号</td>
						<td class="bghui fb" width="33%">权限名称</td>
						<td width="33%" class="bghui fb">权限描述</td>
					</tr>
					<s:iterator value="userlist" status="stat">
						<tr>
							<td colspan="2"><s:property value="resId" />
							</td>
							<td><s:property value="resName" />
							</td>
							<td><s:property value="resDesc" /></td>
						</tr>
					</s:iterator>
				</table>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="T_SYS_RESOURCE.pageNo" />
					页 共
					<s:property value="T_SYS_RESOURCE.pageNum" />
					页 <a
						href="javascript:firstPage(<s:property value="T_SYS_RESOURCE.pageNo"/>,<s:property value="T_SYS_RESOURCE.pageNum"/>);">第一页</a>
					<a
						href="javascript:prevPage(<s:property value="T_SYS_RESOURCE.pageNo"/>,<s:property value="T_SYS_RESOURCE.pageNum"/>);">上一页</a>
					<a class="blue12_33"
						href="javascript:nextPage(<s:property value="T_SYS_RESOURCE.pageNo"/>,<s:property value="T_SYS_RESOURCE.pageNum"/>);">下一页</a>
					<a class="blue12_33"
						href="javascript:lastPage(<s:property value="T_SYS_RESOURCE.pageNo"/>,<s:property value="T_SYS_RESOURCE.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1"
						name="T_SYS_RESOURCE.pageNo"> 页 <a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="T_SYS_RESOURCE.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	function deleteUser(userId) {
		if (window.confirm('你确定要删除吗？')) {
			form1.action = "DeleteUser.action";
			form1.userId.value = userId;
			form1.submit();
			return true;
		} else {
			return false;
		}
	}
	function updateUser(userId) {
		form1.action = "UserById.action";
		form1.userId.value = userId;
		form1.submit();
	}
	function addUser() {
		form1.action = "ToAddUser.action";
		form1.submit();
	}
	function look() {
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