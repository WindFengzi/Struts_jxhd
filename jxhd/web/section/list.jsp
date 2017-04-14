<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>课时节数展示列表</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/img/jquery-1.8.3.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script>
		function sub1(){
			form1.action="Classes.action";
			form1.submit();
		}
		function update(classId){
			form1.classId.value = classId;
			form1.action="ClassById.action";
			form1.submit();
		}
		function deleteStation(classSectionId){
	if(window.confirm('你确定要删除吗？')){
		form1.action="DeleteSection.action";
		form1.classSectionId.value = classSectionId;
		form1.submit();
	}
}
		function toView(Id){
			form1.id.value = Id;
			form1.action="ToView.action";
			form1.submit();
		}
		function addStation(){
			form1.action="ToSaveSection.action";
			form1.submit();
		}
		
/* 	window.onload=function(){
		//alert(document.body.offsetHeight);//firefox和ie显示正确，但是chrome不行
		//alert(document.getElementById("form1").offsetHeight);
		parent.document.getElementById('frm_home_main1').style.height = document.getElementById("form1").offsetHeight + 'px' ;
		parent.parent.document.getElementById('frm_home_main').style.height = document.getElementById("form1").offsetHeight + 'px' ;
	} */
	</script>

</head>

<body>
	<form id="form1" name="form1" action="Params.action" method="post">
		<input type="hidden" name="class_section.classSectionId"
			id="classSectionId" />

		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">系统管理</a>
			》 <a href="#">课时节设置</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">课时节设置</span> The Class Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:20px">
				课时节名称：<input name="class_section.className" type="text" class="text" />

				<input name="input" type="button" value=" 搜  索" onclick="sub1()"
					class="bt1 fb grey1 ml10" /> <input name="input" type="button"
					value=" 添  加" onclick="addStation()" class="bt1 fb grey1 ml10" />
			</div>
			<div class="table4 table3">
				<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
					class="all_content">
					<tr>
						<td width="11%" class="bghui fb">课时节</td>
						<td class="bghui fb">开始时间</td>
						<td class="bghui fb">结束时间</td>
						<td width="15%" class="bghui fb">操作</td>
					</tr>
					<s:iterator value="class_section.data" status="stat">
						<tr>
							<td><s:property value='classSectionId' /></td>
							<td><s:property value='fromTime' /></td>
							<td><s:property value='toTime' /></td>
							<td><a href="#"
								onclick="javascript:deleteStation(<s:property value='classSectionId'/>)"
								class="grey">删除</a>
							</td>
						</tr>
					</s:iterator>
				</table>
				<div class="pages mt20 tc">
					当前是第
					<s:property value="class_section.pageNo" />
					页 共
					<s:property value="class_section.pageNum" />
					页 <a
						href="javascript:firstPage(<s:property value="class_section.pageNo"/>,<s:property value="class_section.pageNum"/>);">第一页</a>
					<a
						href="javascript:prevPage(<s:property value="class_section.pageNo"/>,<s:property value="class_section.pageNum"/>);">上一页</a>
					<a class="blue12_33"
						href="javascript:nextPage(<s:property value="class_section.pageNo"/>,<s:property value="class_section.pageNum"/>);">下一页</a>
					<a class="blue12_33"
						href="javascript:lastPage(<s:property value="class_section.pageNo"/>,<s:property value="class_section.pageNum"/>);">最后一页</a>
					转到 <input id="inputPageNo" type="text" size="1"
						name="class_section.pageNo">页 <a class="blue12_33"
						href="javascript:checkInputPageNo1('inputPageNo',<s:property value="class_section.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>