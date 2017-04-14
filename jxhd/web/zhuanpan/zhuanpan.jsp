<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META http-equiv="X-UA-Compatible" content="IE=9" > </META> 
<title>flash抽奖转盘通用模板</title>
<style type="text/css">
#flashContent { width:510px; height:510px; }
#layer { background:#f5f5f5; border:#000 solid 1px; padding:20px; position:absolute; left:50%; top:50%; display:none; }
</style>
</head>

<body>
<div id="flashContent"></div>
<div id="layer">
  <p></p>
  设置中奖奖品：
  <select name="select" id="select">
    <option value="1" selected>1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
  </select>
  <input type="button" onclick="loadFlash($('#select').val());$(this).parents('#layer').hide()") value="重新抽奖" />
</div>

<script>
flashHoler = "flashContent"     //加载flash的容器ID
autoPlay = "no"                //初始化时是否自动旋转，"yes" or "no"
setPointer="no" 				//初始化时是否设置鼠标指针，"yes" or "no"
url_bg = "bg.png";              //转盘背景图片
url_prize = "prize.png";        //奖品图片
url_pointer = "pointer.png";    //指针图片
url_btnStart = "btnStart.swf";  //开始按钮图片，可以是图片或flash
url_btnOver = "btnOver.gif";    //鼠标经过图片
url_btnWait = "btnWait.gif";    //旋转过程中按钮图片
url_btnSuc = "btnSuc.gif";      //旋转结束后按钮图片
W_bg = "510";                   //背景图片尺寸
W_btn = "124";                  //按钮图片尺寸
W_pointer = "150";              //指针图片宽度
H_pointer = "255";              //指针图片高度
totleNum = 10;                  //奖品个数
turns = 5;                      //旋转圈数
stopNum = 3;                    //中奖奖品 
</script>
<script src="/jxhd/zhuanpan/loadFlash.js"></script> 

<script>
function flashOver(stopNum){
	$("#layer p").html("恭喜中得：" + stopNum +"号奖品！");
	$("#layer").show();
};
</script> 
<script src="/jxhd/zhuanpan/jquery-1.7.min.js"></script>
</body>
</html>
