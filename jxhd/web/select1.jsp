<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<title>无标题文档</title>
<script type="text/javascript">
function copyToList(from,to){
    
    var fromList=eval('document.forms[0].'+from);
    var toList=eval('document.forms[0].'+to);
    
    if(toList.options.length > 0 && toList.options[0].value == 'temp'){
            toList.options.length=0;
    }
    
    var sel=false;
    
    for(i = 0;i < fromList.options.length;i++){
        var current=fromList.options[i];
        if(current.selected){
            sel=true;
            if(current.value=='temp'){
                alert('不能选择这个项目!');
                return;
            }
            txt="--"+current.text;
            val=current.value;
            //toList.options[toList.length]=new Option(txt,val);
            for(var selIndex=0; selIndex<toList.options.length; selIndex++)
        	{
        	var transferIndex = 0;
                if(toList.options[selIndex].selected)
                {
                //alert(toList.options[selIndex].value);
                    transferIndex = selIndex ;
                    for(var selIndex1=toList.options.length-1; selIndex1>= selIndex; selIndex1--){
                		var tex1 = toList.options[selIndex1].text;
                    	var val1 = toList.options[selIndex1].value;
                    	toList.options[selIndex1+1]=new Option(tex1,val1);
                    }
                    toList.options[transferIndex+1]=new Option(txt,toList.options[selIndex].value+"_"+val);
                }
            }
            fromList.options[i]=null;
            i--;
        }
    }
    
    if(!sel) alert('你还没有选择任何项目!');
}
function copyToList1(from,to){
    
    var fromList=eval('document.forms[0].'+from);
    var toList=eval('document.forms[0].'+to);
    
    if(toList.options.length > 0 && toList.options[0].value == 'temp'){
            toList.options.length=0;
    }
    
    var sel=false;
    
    for(i = 0;i < fromList.options.length;i++){
        var current=fromList.options[i];
        if(current.selected){
            sel=true;
            if(current.value=='temp'){
                alert('不能选择这个项目!');
                return;
            }
            txt=current.text;
            val=current.value;
            toList.options[toList.length]=new Option(txt.replace(/[ ]/g,""),val);
            fromList.options[i]=null;
            i--;
        }
    }
    
    if(!sel) alert('你还没有选择任何项目!');
}
function allSelect(){    
    var chsen=document.getElementById('chosen');
    //如果chsen列表框为0或第一个选项值为'temp'
    if(chsen.length && chsen.options[0].value=="temp")
        return;
    var val = "";    
    for(var i=0;i<chsen.length;i++){
            chsen.options[i].selected=true;
            val  =val+chsen.options[i].value +";";
    }
	form1.studentId.value=val;
	form1.action="GroupSave.action";
	form1.submit();
//得到数据
 //function getdata() {
   //         var List = document.forms[0].RoleList;

　　　　　　　//得到一个隐藏文本框对象
    //        var roles = document.getElementById("TRoleList");
     //       roles.value = "";
     //       var s = "";
     //       if (List.length != 0) {
     //           for (i = 0; i < List.length; i++) {
     //               s += List.options[i].value + ",";
     //           }
     //       }

     //       roles.value = s;
     //   }
}
var num =0;
function addGroup(){
	var toList=eval('document.forms[0].'+'chosen');
	if(toList.options.length > 0 && toList.options[0].value == 'temp'){
            toList.options.length=0;
    }
    num++;
	toList.options[toList.length]=new Option('组'+num,'zu'+num);
}
</script>
</head>
<html>
<body>
<form id="form1" name="form1" onSubmit="allSelect()">

<div class="con1">
  <div class="m5 tuxing p10">
  <p class="pl50"><input name="" type="button" onclick="addGroup()" class="bt2 fb grey1 mr15"  value=" 增加分组" id="jiazu"/>
  
  <input name="" type="button" onclick="allSelect()" class="bt2 fb grey1"  id="jianzu" value=" 保存"/></p>
 
</div>
</div>
<div class="con1 p30">
<div class=" w560 zefz">
  <div class="centent fl">
  <p>学生列表：</p>
		<select name="possible" multiple="multiple" id="select1" >
			<s:iterator value="t_user1.data" status="stat"> 
<option value="<s:property value='userId'/>"><s:property value='name'/></option>
</s:iterator>
		</select>
		<div>
			<span id="add"  class="aniu1"><a href="javascript:copyToList('possible','chosen')"><img src="img/cs32.jpg" width="80" height="24" /></a></span>
			<!--<span id="add_all" class="aniu1" >全部添加到右边&gt;&gt;</span>-->
		</div>
	</div>
	<div class="centent fr">
      <p>分组：</p>
		<select name="chosen" id="chosen" multiple="multiple" >
		<option value="temp">从左边选择用户</option> 
		</select>
		<div>
			<span id="remove" class="aniu2"><a href="javascript:copyToList1('chosen','possible')"><img src="img/cs33.jpg" width="80" height="24" /></a></span>
			<!--<span id="remove_all" class="aniu1">&lt;&lt;全部删除到左边</span>-->
		</div>
	</div>
  </div>
  <div class="cb"></div>
  </div>
<input type="hidden" name="studentGroup.studentId"   id="studentId"/>
<input type="text" style="display:none;" id="TRoleList">
</body>
</html>
