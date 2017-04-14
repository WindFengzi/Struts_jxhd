<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
    <head>
       <title>教学管理系统</title>
<link href="img/basic.css" type="text/css" rel="stylesheet" />
<link href="img/style.css" type="text/css" rel="stylesheet" />
 <link rel="StyleSheet" href="dtree.css" type="text/css" />
        <script type="text/javascript" src="dtree.js"></script>
        <SCRIPT type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
function save(){
	//alert();
		//form1.action="SaveCourseLog.action";
       //	form1.submit();
       	var obj = document.getElementById("courses"); //定位id
			var index = obj.selectedIndex; // 选中索引
			var text = obj.options[index].text; // 选中文本
			var courseId = obj.options[index].value; // 选中值
       	var url = 'SaveCourseLogAjax.action';
       //	alert(courseId);
             var params = {
                     courseId:courseId
             };
             jQuery.post(url, params, callbackFun2, 'json');
       	//if(window.confirm('你确定要关闭吗？')){
       	//	window.close();
		//}
	}
		function callbackFun2(data){
        	var msg = data['msg'];
  			alert(msg);
        }
		function departmentByParent(districtId){    
             var url = 'DepartmentByParentIdAjax.action';
             var params = {
                     parentId:districtId
             };
             jQuery.post(url, params, callbackFun, 'json');
         }
        function callbackFun(data){
        	document.getElementById("classes").options.length=0; 
        	var parameters = data['list'];
        	document.getElementById("classes").options.add(new Option('全部','')); 
         for(i=0;i<parameters.length;i++){
         	document.getElementById("classes").options.add(new Option(parameters[i].className,parameters[i].classId)); 
         }
        }
        
        function courseByParent(){    
             var url = 'CourseByParentIdAjax.action';
             var obj = document.getElementById("classes"); //定位id
			var index = obj.selectedIndex; // 选中索引
			var text = obj.options[index].text; // 选中文本
			var districtId = obj.options[index].value; // 选中值
             var params = {
                     parentId:districtId
             };
             jQuery.post(url, params, callbackFun1, 'json');
         }
        function callbackFun1(data){
        	document.getElementById("courses").options.length=0; 
        	var parameters = data['list'];
        	document.getElementById("courses").options.add(new Option('全部','')); 
         for(i=0;i<parameters.length;i++){
         	document.getElementById("courses").options.add(new Option(parameters[i].subjectId,parameters[i].courceId)); 
         }
        }
</script>
</head>

<body>
<form id="form1" name="form1" action="SaveCourseLog.action" method="post">
 <script type="text/javascript">
        <!--
        d = new dTree('d');
        //从treeBean中获取js代码
       // var treecontent = document.getElementById("tree").innerHTML;
        //执行代码
        //eval(treecontent);
        d.add(0,-1,'部门');
        <s:iterator value="department.data" status="stat">
        	d.add(<s:property value='departmentId'/>,<s:property value='parentDepartmentId'/>,'<s:property value='departmentName'/>','javascript:departmentByParent(<s:property value='departmentId'/>)');
         </s:iterator>
        document.write(d); 
        //-->
    </script>
    班级：<s:select id="classes" name="classes" onchange="courseByParent()" cssStyle="width:60px" 
    list="#{}" listKey="courceId" listValue="courceId" headerKey = "" headerValue="" >
    </s:select>
课程：<s:select id="courses" name="courses" cssStyle="width:60px" 
    list="#{}"   >
    </s:select>
    
    <p class="tc p30"><input name="input" onclick="save()" type="button" value="保 存"  class="bt3 fb grey1 ml50"/></p>
</form>
</body>
</html>
