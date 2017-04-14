<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>发布预习列表</title>
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

	
	function question(){
		form1.target = "frame1";
		form1.action = "PreviewSelectItems.action";
		form1.submit();
	}
	
	//添加问答
	function chexiao() {
		var chkObjs = document.getElementsByName("radio1");
		var ss = "";
		var classId = document.getElementById("classId").value;
		if (classId == "") {
			alert("请选择班级和预习题目");
		
		} else {
			for (var i = 0; i < chkObjs.length; i++) {
				if (chkObjs[i].checked) {
					ss = ss + chkObjs[i].value + ",";
				}
			}
			document.getElementById("addIds").value = document
					.getElementById("addIds").value
					+ ss;
			if (ss == "") {
				alert("请选择预习题目。");
				return;
			} else {
				//form1.preview_content.value = ss;
				form1.action = "AddPreviewToSend.action";
				form1.submit();
			}
			
		}
		//alert("添加成功！")
	}
	//确定
	function confirm() {
		var content = parent.document.getElementById("preview_content").value;
		var real_content = content.substr(0, content.length - 1);
		form1.preview_content.value = real_content;
		form1.class_id.value = parent.document.getElementById("classId").value;
		form1.preview_title.value = parent.document.getElementById("title").value;
		form1.target = parent.parent.parent.document.getElementById("frm_home_main").name;
		form1.action = "AddPreviewProblem.action";
		form1.submit();
	}

	function sub1() {
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
</script>

</head>
<body>
	<form id="form1" name="form1" action="ReleasePreview.action"
		method="post">
		<input type="hidden" name="askLog.itemId" id="itemId" />
		<input type="hidden"  name="preview.preview_content" id="preview_content"/>
		<s:hidden name="t_course_log.classId" id="classId1"></s:hidden>
		
		<input type="hidden" name="t_preview_add.add_ids" id="addIds" />
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> > 
			<a href="#">系统管理</a> >
			<a href="#">发布预习</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">选择试题</span> The Item Information List
				</h2>
			</div>
			<div class="form1 " style="padding-left:20px;padding-top:10px">
				年级：
				<s:select list="list2" onchange="departmentByParent(this.value)" headerKey="" 
					headerValue="全部" listKey="id" listValue="parameterName">
				</s:select>
				班级：
				<s:select id="classId" name="t_preview_send.temp_id" list="list" onchange="sub1()"
					listKey="classId" listValue="className" headerKey="" headerValue="全部">
				</s:select>
		
				种类： 
				<s:select list="#{'':'全部','0':'文字','1':'图片'}" onchange="sub1()" id="questiontype" name="t_preview_add.preview_tag">
				</s:select>

				试题名称:
				<input name="t_preview_add.preview_title" type="text" class="text" /> 
				<input name="input" type="button" value=" 搜  索" onclick="sub1()" class="bt1 fb grey1" /> 
				<input name="input" type="button" value=" 添  加" onclick="chexiao()" class="bt1 fb grey1" /> 
				<!-- <input name="input" type="button" value=" 确  定" onclick="confirm()" class="bt1 fb grey1 ml50" /> -->
			</div>
			<div class="table4 table3">
				<table style="width:100%;border:1px solid #d7d7d7"
					class="all_content">
					<tr>
						<td style="visibility: hidden;"></td>
						<td width="10%" class="bghui fb"></td>
						<td width="10%" colspan="2" class="bghui fb">序号</td>
						<td class="bghui fb">试题名称</td>
						<td class="bghui fb">内容</td>
						<td width="10%" class="bghui fb">种类</td>
						<td width="10%" class="bghui fb">创建时间</td>
					</tr>
					<%
						int i = 1;
					%>
					<s:iterator value="t_preview_add.data" status="stat">
						<tr>
							<td style="visibility: hidden;"><input type="hidden" value="<s:property value='preview_add_id'/>"></td>
							<td>
							<input type="checkbox" name="radio1" value="<s:property value='preview_add_id'/>" style="zoom:80%" /></td>
							<td colspan="2"><%=i++%></td>
							<td  style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;padding-left: 4px;" title="<s:property value='preview_title' escape="false" />">
								<a onclick="" class="notice_title"><s:property value='preview_title' escape="false" /></a></td>
							<td style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;padding-left: 4px;" title="<s:property value='preview_content' escape="false" />">
								<a onclick="" class="notice_title"><s:property value='preview_content' escape="false" /></a>
							</td>
							<td><s:property value='preview_tag' escape="false"/></td>
							<td><s:property value='create_time' escape="false"/></td>
						</tr>
					</s:iterator>
				</table>
				
				<div class="pages mt20 tc">
					当前是第
					<s:property value="t_preview_add.pageNo" />
					页 共
					<s:property value="t_preview_add.pageNum" />
					页
					<a href="javascript:firstPage(<s:property value="t_preview_add.pageNo"/>,<s:property value="t_preview_add.pageNum"/>);">第一页</a>
					<a href="javascript:prevPage(<s:property value="t_preview_add.pageNo"/>,<s:property value="t_preview_add.pageNum"/>);">上一页</a>
					<a class="blue12_33" href="javascript:nextPage(<s:property value="t_preview_add.pageNo"/>,<s:property value="t_preview_add.pageNum"/>);">下一页</a>
					<a class="blue12_33" href="javascript:lastPage(<s:property value="t_preview_add.pageNo"/>,<s:property value="t_preview_add.pageNum"/>);">最后一页</a>
					转到 
					<input id="inputPageNo" type="text" size="1" name="t_preview_add.pageNo"> 页 
					<a class="blue12_33" href="javascript:checkInputPageNo1('inputPageNo',<s:property value="t_preview_add.pageNum"/>)">go</a>
				</div>
			</div>
		</div>
	
	</form>
	<script>
		//question();
	</script>
</body>
</html>
