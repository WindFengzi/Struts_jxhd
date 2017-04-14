<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>老师添加点评界面</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/ckeditor.js"></script>
<script>
	function deleteAttachment(){
		var fistFiles = document.getElementById("fistFiles");
		fistFiles.innerHTML =	"<input type=file name=fjupload />";
	}
	
	//移除附件
	function removeFile(fileIndex) {
		document.getElementById("addUpload").disabled = false;
		var fileIndex1 = "upload" + fileIndex;
		var aa = document.getElementById('files');
		var aElement = document.getElementById(fileIndex1);
		var fileIndex2 = "aa" + fileIndex;
		var aaIndex = document.getElementById(fileIndex2);
		aa.removeChild(aElement);
		aa.removeChild(aaIndex);
		
	}
	
	function saveComment() {
		var content = document.getElementById("previewContentID").value.trim();
		var regu = "^[ ]+$";
		var re = new RegExp(regu);
		if (content.length > 300) {
			$("#contentHint").html("内容字数超过限度(最长为300)");
		} else {
			var classId = document.getElementById("classId").value;
			var studentId = document.getElementById("studentId").value;
			//alert(studentId + " " + classId);
			form1.classId2.value = classId;
			if (studentId != "") {
				form1.studentToId.value = studentId;
				document.getElementById("tag").value = 1;
			}else {
				document.getElementById("tag").value = 0;
			}
			form1.target = '';
			form1.action = "AddCommentByTeacher.action";
			form1.submit();
		}
	}
	
	function getLengthTitle() {
		var regu = "^[ ]+$";
		var re = new RegExp(regu);
		var title = document.getElementById("previewTitleID").value.trim();
		if (title.length > 80){
			$("#titleHint").html("标题字数超过限度(最长为80)");
		} else if (re.test(title) || title == "") {
			$("#titleHint").html("标题不能为空(最长为80)");
		}else {
			$("#titleHint").html("");
		}
		
	}
	
	function getLengthContent(){
		var content = document.getElementById("previewContentID").value.trim();
//		alert(content.length);
		if (content.length > 300) {
			$("#contentHint").html("内容字数超过限度(最长为300)");
		} else {
			$("#contentHint").html("");
		}
	}
	
	function goBackList() {
		history.go(-1);
	}
	
	var i = 1;
	function addComponent() {
		i = i + 1;
		//var isIE = /msie/.test(navigator.userAgent.toLowerCase());
		//alert(isIE);
		if ($.support.msie) {
			var uploadHTML = document.createElement("<input type='file' class='file'  name='upload'/><br/>")
		} else {
	
			var uploadHTML = document.createElement("input");
			var fileIndex = "upload" + i;
			var aaIndex = "aa" + i;
			uploadHTML.type = "file";
			uploadHTML.name = "upload";
			uploadHTML.id = fileIndex;
			
			document.getElementById("files").appendChild(uploadHTML);
			var aa = "javascript:removeFile('" + i + "');";
			uploadHTML = document.createElement('a');
			uploadHTML.href = aa;
			uploadHTML.id = aaIndex;
			uploadHTML.innerText = "<删除>";
		
			document.getElementById("files").appendChild(uploadHTML);
			uploadHTML = document.createElement('br');
			document.getElementById("files").appendChild(uploadHTML);
			document.getElementById("addUpload").disabled = true;
		}
	}
	
	//选择年级后的事件
	 function departmentByParent(gradeId){
		 var departmentId = form1.classId1.value
        var url = 'ClassByGradeIdAjax.action';
		// alert(gradeId);
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
	// 
	function selectStudent(classId){
		var url = 'StudentByClassIdAjax.action';
		var params = {
				classId:classId
		};
		jQuery.post(url, params, callbackStudentFun,'json');
	}
	 function callbackStudentFun(data){
	        document.getElementById("studentId").options.length=0; 
	        var parameters = data['list1'];
	        document.getElementById("studentId").options.add(new Option('全部','')); 
	        for(i=0;i<parameters.length;i++){
	         	document.getElementById("studentId").options.add(new Option(parameters[i].name,parameters[i].userId)); 
   	}
  }
</script>
</head>  
  <body>	
	<form name="form1" method="post" action="ToDate.action" id="form1"  enctype="multipart/form-data">
		<s:hidden name="t_course_log.classId" id="classId1"></s:hidden>
		<s:hidden name="t_teacher_comment.class_id" id="classId2"></s:hidden>
		<s:hidden name="t_teacher_comment.studentTo_id" id="studentToId"></s:hidden>
		<s:hidden name="t_teacher_comment.tag" id="tag"></s:hidden>
		<div class="postion lh28 mb15">
			<span class="fb green">您的位置：</span><a href="#">首页</a> > 
			<a href="#">系统管理</a> > 
			<a href="#">添加点评内容</a>
			<div class="search">
				<input name="" type="text" class="text fl" />
				<input name="" type="button" class="sou fl" value="" />
			</div>
		</div>
		<div class="w800_con ">
			<div class="tit2">
				<h2 class="lh32 pl30">
					<span class="fb f14">添加点评</span> Add Student Information
				</h2>
			</div>
			<div class="form1 " style="padding-left:20px;padding-top:10px;align-content: center; margin: auto;">
				年级：
				<s:select list="list2" name="" onchange="departmentByParent(this.value)" headerKey="" 
					headerValue="全部" listKey="id" listValue="parameterName">
				</s:select>
				班级：
				<s:select id="classId" name="t_course_log.name" list="list" onchange="selectStudent(this.value)"
					listKey="classId" listValue="className" headerKey="" headerValue="全部">
				</s:select>
				学生：
				<s:select id="studentId" list="list1" listKey="userId" listValue="name"  headerKey="" headerValue="全部">
				</s:select>
			</div>
			
			<div >
			<table style="width: 50%;border: 0px;    align-content: center; margin: auto;">
				<tr style="height:10px;"><!-- 标签上面空行 -->
					<td style="width:15%;"></td>
					<td style="width:85%;"></td>
				</tr>
				
				<tr style="height:20px;"><!-- 标签上面空行 -->
					<td style="width:15%;"></td>
					<td style="width:85%;"><label id="titleHint" style="color:red"></label></td>
				</tr>
				<tr>
					<td style="text-align: center;width:15%;">内容：</td>
					<td>
						<textarea style="width: 85%;" onblur="getLengthContent();" name="t_teacher_comment.comment" id="previewContentID" cols="80" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;width:15%;">分数：</td>
					<td>
						<input type="text" name="t_teacher_comment.grade"/>(分数为0~100之间)
					</td>
				</tr>
			</table>
			<p class="tc p30">
				<input name="input" onclick="saveComment()" type="button" value="添加" class="bt3 fb grey1 ml50" /> 
				<input name="input" onclick="goBackList()" type="button" value="返回" class="bt3 fb grey1 ml50" />
			</p>
		</div>
		</div>
		
	</form>
  </body>
</html>
