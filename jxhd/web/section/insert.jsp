<!DOCTYPE html>
<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>课时节数添加</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script>
	function sub1() {
		if (form1.classSectionId.value == '') {
			alert("课时节不能为空");
		} else {
			form1.fromTime.value = form1.hour1.value + ":"
					+ form1.minute1.value + ":" + form1.second1.value;
			form1.toTime.value = form1.hour2.value + ":" + form1.minute2.value
					+ ":" + form1.second2.value;
			form1.action = "SaveSection.action";
			form1.submit();
		}
	}
	function list1() {
		history.go(-1);
	}
</script>
</head>
<body>
	<form name="form1" method="post" action="ToDate.action" id="form1">

		<input type="hidden" name="class_section.fromTime" id="fromTime" /> <input
			type="hidden" name="class_section.toTime" id="toTime" />

		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">班级管理</a>
			》 <a href="#">添加课时节</a>
			<div class="search">
				<input name="" type="text" class="text fl" /><input name=""
					type="button" class="sou fl" value="" />
			</div>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">添加课时节</span> Add ClassSection Information
				</h2>
			</div>
			<div class="table4 table3">
				<div class="fl w370">
					<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
						class="all_content">
						<tr>
							<td width="31%" class="bghui fb">课时节</td>
							<td width="69%"><input type="text"
								name="class_section.classSectionId" id="classSectionId" />
							</td>
						</tr>
						<tr>
							<td width="31%" class="bghui fb">开始时间</td>
							<td width="69%"><s:select
									list="#{'01':'1','02':'2','03':'3','04':'4','05':'5','06':'6','07':'7','08':'8','09':'9','10':'10','11':'11','12':'12'
,'13':'13','14':'14','15':'15','16':'16','17':'17','18':'18','19':'19','20':'20','21':'21','22':'22','23':'23','24':'24'}"
									id="hour1"></s:select> <s:select
									list="#{'00':'00','01':'01','02':'02','03':'03','04':'04','05':'05','06':'06','07':'07','08':'08','09':'09','10':'10'
,'11':'11','12':'12','13':'13','14':'14','15':'15','16':'16','17':'17','18':'18','19':'19','20':'20'
,'21':'21','22':'22','23':'23','24':'24','25':'25','26':'26','27':'27','28':'28','29':'29','30':'30'
,'31':'31','32':'32','33':'33','34':'34','35':'35','36':'36','37':'37','38':'38','39':'39','40':'40'
,'51':'51','52':'52','53':'53','54':'54','55':'55','56':'56','57':'57','58':'58','59':'59','60':'60'}"
									id="minute1"></s:select> <s:select
									list="#{'00':'00','01':'01','02':'02','03':'03','04':'04','05':'05','06':'06','07':'07','08':'08','09':'09','10':'10'
,'11':'11','12':'12','13':'13','14':'14','15':'15','16':'16','17':'17','18':'18','19':'19','20':'20'
,'21':'21','22':'22','23':'23','24':'24','25':'25','26':'26','27':'27','28':'28','29':'29','30':'30'
,'31':'31','32':'32','33':'33','34':'34','35':'35','36':'36','37':'37','38':'38','39':'39','40':'40'
,'51':'51','52':'52','53':'53','54':'54','55':'55','56':'56','57':'57','58':'58','59':'59','60':'60'}"
									id="second1"></s:select>
							</td>
						</tr>

					</table>
				</div>
				<div class="fr">
					<table style="width: 100%;border: 1px; border-color:#d7d7d7;"
						class="all_content">
						<tr>
							<td width="31%" class="bghui fb"></td>
							<td width="69%"></td>
						</tr>
						<tr>
							<td width="31%" class="bghui fb">结束时间</td>
							<td width="69%"><s:select
									list="#{'01':'1','02':'2','03':'3','04':'4','05':'5','06':'6','07':'7','08':'8','09':'9','10':'10','11':'11','12':'12'
,'13':'13','14':'14','15':'15','16':'16','17':'17','18':'18','19':'19','20':'20','21':'21','22':'22','23':'23','24':'24'}"
									id="hour2"></s:select> <s:select
									list="#{'00':'00','01':'01','02':'02','03':'03','04':'04','05':'05','06':'06','07':'07','08':'08','09':'09','10':'10'
,'11':'11','12':'12','13':'13','14':'14','15':'15','16':'16','17':'17','18':'18','19':'19','20':'20'
,'21':'21','22':'22','23':'23','24':'24','25':'25','26':'26','27':'27','28':'28','29':'29','30':'30'
,'31':'31','32':'32','33':'33','34':'34','35':'35','36':'36','37':'37','38':'38','39':'39','40':'40'
,'51':'51','52':'52','53':'53','54':'54','55':'55','56':'56','57':'57','58':'58','59':'59','60':'60'}"
									id="minute2"></s:select> <s:select
									list="#{'00':'00','01':'01','02':'02','03':'03','04':'04','05':'05','06':'06','07':'07','08':'08','09':'09','10':'10'
,'11':'11','12':'12','13':'13','14':'14','15':'15','16':'16','17':'17','18':'18','19':'19','20':'20'
,'21':'21','22':'22','23':'23','24':'24','25':'25','26':'26','27':'27','28':'28','29':'29','30':'30'
,'31':'31','32':'32','33':'33','34':'34','35':'35','36':'36','37':'37','38':'38','39':'39','40':'40'
,'51':'51','52':'52','53':'53','54':'54','55':'55','56':'56','57':'57','58':'58','59':'59','60':'60'}"
									id="second2"></s:select>
							</td>
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
	</form>
</body>
</html>