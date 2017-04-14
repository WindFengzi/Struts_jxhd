<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>点名</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script src="/jxhd/img/tab.js" type="text/javascript"></script>
<script type="text/javascript" src="/jxhd/img/index.js"></script>
<script>
	//查看签到
	function dianmUsers() {
		form1.target = 'frm_home_main';
		form1.action = "DianmUsers.action";
		form1.submit();
	}
	//查看图表
	function qiandaoTb() {
		form1.target = 'frm_home_main';
		form1.action = "QiandaoTb.action";
		form1.submit();
	}
	//看不清的图片，重新加载
	function loadimage() {
		document.getElementById("randImage").src = "image.jsp?" + Math.random();
	}
	//开始点名
	function dianm() {
		var url = 'DianmAjax.action';
		var parentId = "11";
		var params = {
			parentId : parentId
		};
		//url发送请求地址；params待发送key/value参数；callbackFun1发送成功的回调函数，‘json’返回的内容格式
		jQuery.post(url, params, callbackFun1, 'json');//json是返回的数据格式
	}
	function callbackFun1(data) {
		var msg = data['msg'];
		alert(msg);
	}
</script>


</head>

<body>
	<form id="form1" name="form1" action="Articles.action" method="post">
		<input type="hidden" name="student.studentId" id="studentId" />
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> 》 <a href="#">教学互动反馈</a>
			》 <a href="#">点名</a>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">点名</span> The Roll Call
				</h2>
			</div>
			<div class="p10 con1">
				<div class="form1 pb20">

					<img alt="code..." name="randImage" id="randImage" src="image.jsp"
						width="600" height="150" border="1" align="middle"> <a
						href="javascript:loadimage();"> <font class=pt95>看不清点我</font>
					</a> <br /> <br /> 
					<input name="input" type="button" value="开始点名" onclick="javascript:dianm()" class="bt1 fb grey1 ml50" /> 
					<input name="input" type="button" value="查看签到" onclick="javascript:dianmUsers()" class="bt1 fb grey1 ml50" /> 
					<input name="input" type="button" value="查看图表" onclick="javascript:qiandaoTb()" class="bt1 fb grey1 ml50" />
				</div>
			</div>

			<div class="m5 tuxing p20 ">
				<iframe name='frm_home_main' src="DianmUsers.action"
					id="frm_home_main" width=100% height=350px; style="border:0px;"></iframe>
			</div>
		</div>


	</form>
</body>
</html>