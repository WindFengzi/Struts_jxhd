<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="java.util.*,java.text.SimpleDateFormat,org.apache.struts2.ServletActionContext" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>教学管理系统</title>
        
        <link href="css/css.css" rel="stylesheet" type="text/css">
        <link href="chrometheme/chromestyle.css" rel="stylesheet" id="chrometheme" type="text/css">
<script type="text/javascript">
<!--
function go(){
		form1.submit();
	}
	function monitors(){
		form1.target='frm_home_main';
       	//form1.action="MonitorsByUserId.action";
       	form1.action="Shouyes.action";
       	form1.submit();
       	//window.location.href="station/list.jsp";
	}
	function logs(){
		form1.target='frm_home_main';
       	form1.action="LogsList.action";
       	form1.submit();
	}
	function sjzd(){
		form1.target='frm_home_main';
       	form1.action="Params.action";
       	form1.submit();
	}
	function gonggao(){
		form1.target='frm_home_main';
		form1.action='Articles.action';
		form1.submit();
	}
	function searchColor(){
		if(document.getElementById('rev1').value==1){
			document.getElementById("chrometheme").href="chrometheme/chromestyle.css";
			window.frames["bottom"].document.getElementById("chrometheme1").href="chrometheme/chromestyle.css";
			document.getElementById("img1").src="images/logo.jpg";
			document.getElementById("td1").background="images/bg01.jpg";
		}else if(document.getElementById('rev1').value==2){
			document.getElementById("chrometheme").href="chrometheme/chromestyle1.css";
			window.frames["bottom"].document.getElementById("chrometheme1").href="chrometheme/chromestyle1.css";
			document.getElementById("img1").src="images/logo3.jpg";
			document.getElementById("td1").background="images/bg013.jpg";
		}else if(document.getElementById('rev1').value==3){
			document.getElementById("chrometheme").href="chrometheme/chromestyle2.css";
			window.frames["bottom"].document.getElementById("chrometheme1").href="chrometheme/chromestyle2.css";
			document.getElementById("img1").src="images/logo4.jpg";
			document.getElementById("td1").background="images/bg014.jpg";
		}else{
			document.getElementById("chrometheme").href="chrometheme/chromestyle3.css";
			window.frames["bottom"].document.getElementById("chrometheme1").href="chrometheme/chromestyle3.css";
			document.getElementById("img1").src="images/logo1.jpg";
			document.getElementById("td1").background="images/bg012.jpg";
		}
		
		form1.action="SearchColor.action";
       	form1.submit();
	}
	function dispaly_tjfx(){
		var obj = document.getElementById("tjfx");
		obj.style.display='';  
	}
	function f_ajf_hide(ids){
   	var arr=ids.split(",");
   	var i,num=0;
	var obj = null;
   	num=arr.length;
   	for(i=0;i<num;i++){
     obj = document.getElementById(arr[i]);
     obj.style.display='none';  
}
}
	function f_menu_now(num,id){
	 var table = document.getElementById("topTable");   
  		for(i=0;i<table.rows[0].cells.length;i++){ 
  			if(num==i){
  				table.rows[0].cells[i].style.background="url(images/nav_over02.jpg) no-repeat center bottom";
  			}else{
  				table.rows[0].cells[i].style.background="";
  			}
  		}
	}
	function yhgl(){
		//document.getElementById("zjepuesrid").value="1";
		form1.target='frm_home_main';
		form1.action='Teachers.action';
		form1.submit();
	}
	function xsxx(){
		//document.getElementById("zjepuesrid").value="2";
		form1.target='frm_home_main';
		form1.action='Students.action';
		form1.submit();
	}
	function zhcx(){
		document.getElementById("zjepuesrid").value="3";
		form1.target='frm_home_main';
		form1.action='UserDetails.action';
		form1.submit();
	}
	function jxpj(){
		form1.target='frm_home_main';
		form1.action='Jxpjs.action';
		form1.submit();
	}
	function jxtj(){
		form1.target='frm_home_main';
		form1.action='Jxtj.action';
		form1.submit();
	}
	function notsel(){
		form1.target='frm_home_main';
		form1.action='Items.action';
		form1.submit();
	}
	function pjxm(){
		form1.target='frm_home_main';
		form1.action='EvaluationItems.action';
		form1.submit();
	}
	function pjjb(){
		form1.target='frm_home_main';
		form1.action='EvaluationGrades.action';
		form1.submit();
	}
	function xshp(){
		form1.target='frm_home_main';
		form1.action='EvaluationStudents.action';
		form1.submit();
	}
	function ktwd(){
		document.getElementById("shijuanid").value="1";
		form1.target='frm_home_main';
		form1.action='QuestionPapers.action';
		form1.submit();
	}
	function fzzd(){
		document.getElementById("shijuanid").value="2";
		form1.target='frm_home_main';
		form1.action='QuestionPapers.action';
		form1.submit();
	}
	function f_logout(){
		if(confirm("您确认要退出系统吗")){
			window.location = "./login.jsp";
	 	}
	}
	function ChangeBg(obj){
	var v=document.getElementsByTagName('a'); 
	for (var j=0;j<v.length;j++){ 
		v[j].className="";
	}
		
		obj.className = "licss";
	}
	function fullScreen(){var WshShell = new ActiveXObject("WScript.Shell");WshShell.SendKeys("{F11}");}
	function hidden(){
		var obj = document.getElementById("dropmenu6");
		obj.style.visibility = "hidden";
		var obj1 = document.getElementById("menu6");
		obj1.className = "licss";
		//cssdropdown.delayhidemenu();
	}

//-->
</script>
<style type="text/css">



</style>
    </head>
    <%
    Date now=new Date(); 
	SimpleDateFormat f=new SimpleDateFormat("yyyy年MM月dd日 E kk点mm分"); 
	String date = f.format(now);
     %>
    <body>
    <%
	String userName = (String)session.getAttribute("userName");
  	if(userName==null){
	   	response.sendRedirect("nologin.jsp");
	   	return;
  	}
 %>
    <form id="form1" name="form1" action="MonitorByUserId.action" method="post">
     <input type="hidden" name="JXGL_GONGGAO.classId"   id="classId"/>
     <input type="hidden" name="JXGL_KTYJ.classId"   id="KtyjClassId"/>
     <input type="hidden" name="JXGL_KTSJ.classId"   id="KtsjClassId"/>
     <input type="hidden" name="JXGL_KKJL.classId"   id="KkjlClassId"/>
     <input type="hidden" name="JXGL_LWZZ.classId"   id="LwzzClassId"/>
     <input type="hidden" name="JXHD_QuestionPaper.shijuanid"   id="shijuanid"/>
     
     <input type="hidden" name="userDetail.zjepuesrid"   id="zjepuesrid"/>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="57" id="td1" background="images/bg01.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="60%" height="57" align="left"><img src="images/logo.jpg" id="img1" width="100%" height="57"></td>
        <td align="right"><table width="100%" height="57" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="bottom" style="padding-right:40px;"><table width="310" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td><span class="yellow12_b"><%=userName%></span> 用户您好！<a href="#" class="blue12_33"></a></td>
                <td width="15" align="center"><img src="images/logout.gif" width="16" height="16"></td>
                <td width="35" align="center" > <a href="javascript:f_logout()" style="font-size:12px; color:#3366cc; line-height:18px; text-decoration:underline;">退出</a></td>
                <td width="55" align="center" > <a href="javascript:window.open(document.location, 'big', 'fullscreen=yes')" style="font-size:12px; color:#3366cc; line-height:18px; text-decoration:underline;">修改密码</a>
                </td>
                <td width="55" align="center" >
                <s:select id="rev1" name="t_user.rev1" onchange="searchColor()" 
    list="#{0:'选颜色',1:'蓝色',2:'橙色',3:'紫色',4:'绿色'}" listKey="key" listValue="value"  >
    </s:select>
                </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td align="right" valign="bottom" style="padding-right:40px;"><%=date %></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
   <td height="28" align="left" valign="bottom" class="color1" style="padding-left:10px;"><SCRIPT LANGUAGE="JavaScript" src="./js/nav.js"></SCRIPT></td>
  <%-- 
    <td height="28" valign="bottom" bgcolor="#3a80d1" style="padding-left:10px;">

	<table  border="0" cellpadding="0" cellspacing="0" id="topTable">
      <tr>
        <td width="120" align="center" valign="bottom" class="white12" style="background:url(images/nav_over02.jpg) no-repeat center bottom;"><a href="javascript:monitors()" id="jcsjcx" class="white12" onclick="f_menu_now('0','jcsjcx')" onmouseover="f_ajf_hide('tjfx')">检测数据查询</a></td>
        <td width="140" align="center" valign="bottom" class="white12"><a href="javascript:intakes()" class="white12" onclick="f_menu_now('1','jcsjcx')" onmouseover="f_ajf_hide('tjfx')">热量表数据查询</a></td>
        <td width="80" align="center" valign="bottom" class="white12"><a href="javascript:warning()" class="white12" onclick="f_menu_now('2','jcsjcx')" onmouseover="f_ajf_hide('tjfx')">报警查询</a></td>
        <td width="140" align="center" valign="bottom" class="white12"><a href="#" class="white12" onclick="f_menu_now('3','jcsjcx')" onmouseover="f_ajf_hide('tjfx')">缴费与欠费查询</a></td>
        <td width="80" align="center" valign="bottom" class="blue12"  > <a href="javascript:tjfx()" class="white12"  onclick="f_menu_now('4','jcsjcx')" onmouseover="f_ajf_hide('tjfx')">统计分析</a></td>
        <td width="80" height="27" align="center" valign="bottom"   class="white12" ><a href="#" onmouseover="dispaly_tjfx()" class="white12" >系统管理</a></td>
        </tr>
    </table>
    </td>
  </tr>
  <tr> <td height="24"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="border_gray_3d6">
    <tr>
      <td background="images/bg03.jpg" style="padding-left:5px;" height="24">
      <div id='tjfx' style='display:none;'>
      <table  width="700" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="500">&nbsp;</td>
          <td>&nbsp;</td>
          <td>
         <a href="javascript:yhgl()" onclick="f_menu_now('5','jcsjcx')">用户管理</a> 
          </td>
          <td><a href="#" onclick="f_menu_now('5','jcsjcx')">系统参数配置</a> </td>
        </tr>
      </table>
      </div>
      </td>
    </tr>
  </table></td>
  --%>
  </tr>
  
  <tr>
    <td height="695"><table width="100%" border="0" cellspacing="0" cellpadding="0" valign="top">
      <tr>
        <td height="675" valign="top" >
    <iframe name='frm_home_main'  id="frm_home_main"  width=100% height=100% frameborder=0></iframe>
    </td>
    </tr>
    <tr>
    <td height="20" >
    <iframe src="bottom.jsp" name="bottom" id="bottom" width=100% height=100% frameborder=0></iframe>
    </td>
    </tr>
    </table>
    </td>
  </tr>
</table>
</form>
    </body>
<script>
	gonggao();
</script>
</html>
