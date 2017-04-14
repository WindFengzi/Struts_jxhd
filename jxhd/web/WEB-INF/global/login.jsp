<!DOCTYPE HTML >
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html >
<head>
<title>东太教学互动管理系统</title>
<link href="img/basic.css" type="text/css" rel="stylesheet" />
<link href="img/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
//重新提交的时候将提示信息显示为空
function check(){
       	document.getElementById("div1").innerHTML="";
	}
	
function checkRemember(){
	var remember = getCookie("user_password");//调用getCookie函数，返回cookie中存入的值
	if(remember!= ""){
		var user_password = remember.split(".");
	 	document.getElementById("t_user1.loginName").value= user_password[0];
		document.getElementById("t_user1.pwd").value=user_password[1]; 
	}
}

function getCookie(user){
	if (document.cookie.length > 0) {//document.cookie是返回所有cookie的字符串
			c_start = document.cookie.indexOf(user + "=");//c_start第一个c_name=的位置，防止密码有c_start以至取错位置
			if (c_start != -1) {
				c_start = c_start + user.length + 1;//将先前的位置加1，也就是cookie名后面的=的后面
				c_end = document.cookie.indexOf(";", c_start);//从上一步开始的位置查找，直到“；”结束
				if (c_end == -1)
					c_end = document.cookie.length;
				return unescape(document.cookie.substring(c_start, c_end));//unescape进行解码
			}
		}
		return "";
}
</script>
</head>

<body class="login">
	<FORM name=form1 action='Gologin.action' onsubmit="return check()" method=post>
		<div ><!-- 整个背景图片 -->
			<div class="login_con"><!-- 登录的背景图片 -->
				<div class="user"></div>
				<span class="user"> 
					<input name="t_user1.loginName" type="text" id="t_user1.loginName"/> 
				</span>
				
				<div class="psw">
					<input name="t_user1.pwd" type="password" id="t_user1.pwd"/>
				</div>

				<div class="rem lh20"><%-- 记住密码 --%>
					<span class="fl pr10">
						<input name="remember" type="checkbox" value="remember" />
					</span> 
					<img src="img/jz.png" />
					<div id="div1" style='padding:15px;padding-left:60px;color:red;font-size:12px'>
						<s:property value="msg" /><!-- 错误信息提示 -->
					</div>
				</div>
				<div class="deng">
					<input name="" type="submit" class="fwr f14 white" value="登 录" />
				</div>
			</div>

		</div>
	</FORM>
</body>
<script type="text/javascript">
	window.onload = checkRemember();
</script>
</html>
