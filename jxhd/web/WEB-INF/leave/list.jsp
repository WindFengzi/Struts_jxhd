<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>请假信息</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script  src="/jxhd/js/PageCtrl.js"></script>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script  src="/jxhd/js/Time.js"></script>
<style type="text/css"> 
	.all_content td{
		border:1px solid #d7d7d7;
	}
</style>
<script type="text/javascript">
function updateStation(leaveId){
	form1.leaveId.value=leaveId;
	form1.action="LeaveById.action";
	form1.submit();
}
/*搜索*/
function look(){
	form1.submit();
}
function excel(){
		var obj = document.getElementById('div_excel_content');
    	form1.txt_excel_content.value=obj.innerHTML;
    	form1.action='./save2excel.jsp';
    	form1.submit();
	}
	
</script>
</head>
<body>
	<form id="form1" name="form1" action="Leaves.action" method="post">
		<input type="hidden" name="leave.leaveId" id="leaveId" /> 
		<input type=hidden name='txt_excel_content'>
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">请假管理</a> 》 <a href="#">请假管理</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">请假管理</span> The Item Information List
				</h2>
			</div>
			<div class="form1 pb20">
				&nbsp;学生姓名：<input name="leave.studentId" type="text" value="<s:property value='leave.studentId'/>" class="text" />
				开始时间段：
				<input type="text" class="sang_Calender" name="leave.beginTime"/>
				到:
				<input type="text" class="sang_Calender" name="leave.endTime"/>
				<input name="input" type="button" value=" 搜  索" onclick="look()"
					class="bt1 fb grey1 ml10" /> <input name="input" type="button"
					value="excel导出" onclick="excel()" class="bt1 fb grey1 ml10" />
			</div>
			<div class="table4 table3">
				<div id='div_excel_content'>
					<table class="all_content" style="table-layout:fixed;font-size:12px;width: 100%;border:1px solid #d7d7d7;border-color:#d7d7d7 ">
						<tr>
							<td width="5%" colspan="2" class="bghui fb">序号</td>
							<td width="15%" class="bghui fb">班级</td>
							<td width="6%" class="bghui fb">学生姓名</td>
							<td class="bghui fb">请假内容</td>
							<td width="13%" class="bghui fb">开始时间</td>
							<td width="13%" class="bghui fb">结束时间</td>
							<td width="6%" class="bghui fb">审批状态</td>
							<td class="bghui fb">老师意见</td>
							<td width="13%" class="bghui fb">获批时间</td>
							<td width="5%" class="bghui fb">操作</td>
						</tr>
						<s:iterator value="leave.data" status="stat">
							<tr>
								<td colspan="2"><s:property value="#stat.index+1"/></td>
								<td><s:property value='className' />
								</td>
								<td><s:property value='studentId' /></td>
								<td width="50px" style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;padding-left: 4px;" title="<s:property value='content'/>"><s:property value='content' />
								</td>
								<td><s:date name="fromTime" format="yyyy-MM-dd HH:mm" />
								</td>
								<td><s:date name="toTime" format="yyyy-MM-dd HH:mm" />
								</td>
								<td>
									<s:if test="reviewType==1">同意</s:if> 
									<s:if test="reviewType==0">不同意</s:if>
								</td>
								<td style="white-space: nowrap;text-overflow:ellipsis;overflow: hidden;padding-left: 4px;" title="<s:property value='reviewContent' />"><s:property value='reviewContent' /></td>
								<td><s:date name="reviewTime" format="yyyy-MM-dd HH:mm" /></td>
								<td>
									<s:if test="reviewType==null">
										<a href="#" onclick="updateStation(<s:property value='leaveId'/>)" class="grey">批阅</a>
									</s:if>
								</td>
							</tr>
						</s:iterator>
					</table>
				</div>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="leave.pageNo" />
					页 共
					<s:property value="leave.pageNum" />
					页 <a
						href="javascript:firstPage(<s:property value="leave.pageNo"/>,<s:property value="leave.pageNum"/>);">第一页</a>
					<a
						href="javascript:prevPage(<s:property value="leave.pageNo"/>,<s:property value="leave.pageNum"/>);">上一页</a>
					<a class="blue12_33"
						href="javascript:nextPage(<s:property value="leave.pageNo"/>,<s:property value="leave.pageNum"/>);">下一页</a>
					<a class="blue12_33"
						href="javascript:lastPage(<s:property value="leave.pageNo"/>,<s:property value="leave.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1" name="leave.pageNo"> 页

					<a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="leave.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript" src="/jxhd/img/datetime.js"></script>
</html>
