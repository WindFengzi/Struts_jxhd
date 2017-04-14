<!DOCTYPE html >
<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat,java.text.DateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
  	<title>试题添加</title>
   	<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
    <script src="/jxhd/js/adapters/jquery.js"></script>
    <link href="/jxhd/css/sample.css" rel="stylesheet">
	<link href="/jxhd/css/css2.css" type="text/css"  rel="stylesheet" />
	<style>
		#editable
		{
			padding: 10px;
			float: left;
		}
	</style>
	<script>
		//提交添加试题
		function sub1(){
			if(form1.questiontype.value==2){//如果是判断题
				form1.answer2.value=form1.answer1.value;
			}else{
				form1.answer2.value=form1.answer.value;
			}
			form1.action="SaveItem.action";
			form1.submit();
		}
		
		//试题类型选择触发的事件
		function test(val){ //val是this.value，选择的试题类型
			if(val==3||val==5){//问答题
				document.getElementById("trA").style.display="none";
				document.getElementById("trB").style.display="none";
				document.getElementById("trC").style.display="none";
				document.getElementById("trD").style.display="none";
				document.getElementById("trE").style.display="none";
				document.getElementById("trF").style.display="none";
				document.getElementById("trG").style.display="none";
				document.getElementById("trNum").style.display="none";
				document.getElementById("answer").style.display="";
				document.getElementById("answer1").style.display="none";
				document.getElementById("div1").style.display="none";
			}else if(val==2){//判断题
				document.getElementById("trA").style.display="none";
				document.getElementById("trB").style.display="none";
				document.getElementById("trC").style.display="none";
				document.getElementById("trD").style.display="none";
				document.getElementById("trE").style.display="none";
				document.getElementById("trF").style.display="none";
				document.getElementById("trG").style.display="none";
				document.getElementById("trNum").style.display="none";
				document.getElementById("answer").style.display="none";
				document.getElementById("answer1").style.display="";//answer1是针对判断题的
				document.getElementById("div1").style.display="none";
			}else if(val==4){//图片对比题
				document.getElementById("trA").style.display="none";
				document.getElementById("trB").style.display="none";
				document.getElementById("trC").style.display="none";
				document.getElementById("trD").style.display="none";
				document.getElementById("trE").style.display="none";
				document.getElementById("trF").style.display="none";
				document.getElementById("trG").style.display="none";
				document.getElementById("trNum").style.display="none";
				document.getElementById("answer").style.display="";
				document.getElementById("answer1").style.display="none";
				document.getElementById("div1").style.display="none";
			}else if(val==1){//多选题
				document.getElementById("trA").style.display="";
				document.getElementById("trB").style.display="";
				document.getElementById("trC").style.display="";
				document.getElementById("trD").style.display="";
				document.getElementById("trE").style.display="";
				document.getElementById("trF").style.display="";
				document.getElementById("trG").style.display="";
				document.getElementById("trNum").style.display="";
				document.getElementById("answer").style.display="";
				document.getElementById("answer1").style.display="none";
				document.getElementById("div1").style.display="";
			}else if(val==0){//单选题
				document.getElementById("trA").style.display="";
				document.getElementById("trB").style.display="";
				document.getElementById("trC").style.display="";
				document.getElementById("trD").style.display="";
				document.getElementById("trE").style.display="none";
				document.getElementById("trF").style.display="none";
				document.getElementById("trG").style.display="none";
				document.getElementById("trNum").style.display="";
				document.getElementById("answer").style.display="";
				document.getElementById("answer1").style.display="none";
				document.getElementById("div1").style.display="none";
			}
		}
		//返回
		function list1(){
			history.go(-1);
		}
	</script>

  </head>
  
  <body>
  <form name="form1" method="post" action="ToDate.action" id="form1" enctype="multipart/form-data">
  <input type="hidden" name="testItem.answer"   id="answer2"/>
		<div class="form">
   <table style="width:100%;border:0px;">
      <tr>
        <th>试题内容：</th>
        <td><textarea name="testItem.question" cols="90"  rows="10"></textarea></td>
      </tr>
      
      <tr id="trA" style="display:none">
        <th width="16%">A选项：</th>
        <td width="84%"><input name="testItem.choicea" type="text" id="choicea" style="width:350px;" /></td>
      </tr>
      <tr id="trB" style="display:none">
        <th width="16%">B选项：</th>
        <td width="84%"><input name="testItem.choiceb" type="text" id="choiceb" style="width:350px;" /></td>
      </tr>
      <tr id="trC" style="display:none">
        <th width="16%">C选项：</th>
        <td width="84%"><input name="testItem.choicec" type="text" id="choicec" style="width:350px;" /></td>
      </tr>
      <tr id="trD" style="display:none">
        <th width="16%">D选项：</th>
        <td width="84%"><input name="testItem.choiced" type="text" id="choiced" style="width:350px;" /></td>
      </tr>
      <tr id="trE" style="display:none">
        <th width="16%">E选项：</th>
        <td width="84%"><input name="testItem.choicee" type="text" id="choicee" style="width:350px;" /></td>
      </tr>
      <tr id="trF" style="display:none">
        <th width="16%">F选项：</th>
        <td width="84%"><input name="testItem.choicef" type="text" id="choicef" style="width:350px;" /></td>
      </tr>
      <tr id="trG" style="display:none">
        <th width="16%">G选项：</th>
        <td width="84%"><input name="testItem.choiceg" type="text" id="choiceg" style="width:350px;" /></td>
      </tr>
      <tr id="trNum" style="display:none">
        <th width="16%">选项数量：</th>
        <td width="84%"><s:select list="#{'1':'1','2':'2','3':'3','4':'4','5':'5','6':'6','7':'7'}" value="1"  name="testItem.choicenum" ></s:select></td>
      </tr>
      <tr>
        <th width="16%">试题答案：</th>
        <td width="84%"><input  type="text" id="answer" style="width:350px;" />
        <div id="div1"  style='color:red;font-size:12px;display:none'>(多选题答案用逗号分开)</div>
        <s:select cssStyle="display:none" list="#{'1':'正确','0':'错误'}" id="answer1"    ></s:select>
        </td>
      </tr>
       <tr>
        <th width="16%">分数：</th>
        <td width="84%"><input name="testItem.score" type="text" id="score" style="width:350px;" /></td>
      </tr>
      <tr>
        <th width="16%">试题类型：</th>
        <td width="84%"><s:select list="#{'0':'单选题','1':'多选题','2':'判断题','3':'问答题','4':'图片比对题'}" value="3" onchange="test(this.value)" id="questiontype" name="testItem.questiontype" ></s:select></td>
      </tr>
      <tr id="trPic" >
        <th width="16%">图片：</th>
        <td width="84%"><input type="file" name="upload" size="50"/></td>
      </tr>
    </table>
<div class="btncase"><input type="button" class="btn1"  id="btn1" onmouseover="this.className='btn1_h'"  onmouseout="this.className='btn1'" onclick="sub1()"  value="确定" />
<input type="button" class="btn1"  id="btn1" onmouseover="this.className='btn1_h'"  onmouseout="this.className='btn1'" onclick="list1()"  value="返回" />
</div>
  </div>
</form>
  </body>
</html>
