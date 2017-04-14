<%@ page language="java" import="java.util.*,com.dt.jxhd.domain.*"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>修改分组</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
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
            var num = 0;
            for(var selIndex=0; selIndex<toList.options.length; selIndex++)
        	{
        	var transferIndex = 0;
                if(toList.options[selIndex].selected)
                {
                num++;
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
            if(num>0){
	            fromList.options[i]=null;
	            i--;
            }else{
            	alert("请选择学生对应的分组！");
            }
        }
    }
    
    if(!sel) alert('请选择学生!');
}
//选择学生到左边
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
            txt=current.text;
            val=current.value;
            if(current.value=='temp'){
                alert('不能选择这个项目!');
                return;
            }
            if(val.indexOf("_") < 0){
                alert('不能选择组!');
                return;
            }
            var index = val.indexOf("_");
            val = val.substr(index+1);
            toList.options[toList.length]=new Option(txt.replace("--",""),val);
            fromList.options[i]=null;
            i--;
        }
    }
    
    if(!sel) alert('请选择学生!');
}
//更新保存分组学生
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
	form1.action="GroupUpdate.action";
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
var tag = 1;
//增加分组
function addGroup(){
	var toList=eval('document.forms[0].'+'chosen');//得到每一行的分组
	/* alert(toList); */
	var length = toList.options.length-1;
	if(tag){
		if(toList.options.length > 0 && toList.options[length].value.indexOf('zu') >=0){
				var start = toList.options[length].value.indexOf('zu');
	           	var end = toList.options[length].value.indexOf('_');
	            num = toList.options[length].value.substr(start+2,end-2);
	           	tag = 0;
	    }
	 }
    num++;
	toList.options[toList.length]=new Option('组'+num,'zu'+num);
}
</script>
</head>
<body>
	<form id="form1" name="form1" onSubmit="allSelect()">
		<%
			List list = (List) request.getAttribute("list");
		%>
		<div class="con1">
			<div class="m5 tuxing p10">
				<p class="pl50">
					<input name="" type="button" onclick="addGroup()"
						class="bt2 fb grey1 mr15" value=" 增加分组" id="jiazu" /> <input
						name="" type="button" onclick="allSelect()" class="bt2 fb grey1"
						id="jianzu" value=" 保存" />
				</p>

			</div>
		</div>
		<div class="con1 p30">
			<div class=" w560 zefz">
				<div class="centent fl">
					<p>学生列表：</p>
					<select name="possible" multiple="multiple" id="select1">
						<s:iterator value="t_user1.data" status="stat">
							<option value="<s:property value='userId'/>">
								<s:property value='name' />
							</option>
						</s:iterator>
					</select>
					<div>
						<span id="add" class="aniu1">
							<a href="javascript:copyToList('possible','chosen')">
								<img src="img/cs32.jpg" width="80" height="24" /><!-- 添加到右边 -->
							</a>
						</span>
						<!--<span id="add_all" class="aniu1" >全部添加到右边&gt;&gt;</span>-->
					</div>
				</div>
				<div class="centent fr">
					<p>分组：</p>
					<select name="chosen" id="chosen" multiple="multiple"><!-- multiple属性是支持ctrl多选属性 -->
						<%
							int groupName = 0;
							for (int i = 0; i < list.size(); i++) {
								student_group student_group = (student_group) list.get(i);
								System.out.println("stu　　" + student_group.getGroupName()+" " +student_group.getGroupId());
								if (student_group.getGroupName() != groupName) {
						%>
						<option value="zu<%=student_group.getGroupName()%>">
							组<%=student_group.getGroupName()%></option>
						<option
							value="zu<%=student_group.getGroupName()%>_<%=student_group.getStudentId()%>">
							--<%=student_group.getStudentName()%></option>
						<%
							} else {
						%>
						<option
							value="zu<%=student_group.getGroupName()%>_<%=student_group.getStudentId()%>">
							--<%=student_group.getStudentName()%></option>
						<%
							}
								groupName = student_group.getGroupName();
							}
						%>
					</select>
					<div>
						<span id="remove" class="aniu2">
						<a  href="javascript:copyToList1('chosen','possible')">
							<img src="img/cs33.jpg" width="80" height="24" /><!-- 选择到左边 -->
						</a>
						</span>
						<!--<span id="remove_all" class="aniu1">&lt;&lt;全部删除到左边</span>-->
					</div>
				</div>
			</div>
			<div class="cb"></div>
		</div>
		<input type="hidden" name="studentGroup.studentId" id="studentId" /> <input
			type="text" style="display:none;" id="TRoleList">
	</form>
</body>
</html>
