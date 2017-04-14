<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page
	import="javax.servlet.http.HttpSession,org.apache.struts2.ServletActionContext"%>
<!DOCTYPE HTML>
<html>
<head>
<title>文件信息</title>
<link href="/jxhd/css/css.css" type="text/css"  rel="stylesheet" />
<script src="/jxhd/js/PageCtrl.js"></script>
<script src="/jxhd/js/Time.js"></script>
<style>
.STYLE1 {
	font-size: 24px;
	font-weight: bold;
	color: #3333FF;
	font-family: "方正舒体";
}
</style>



</head>
<body>

	<form id="form1" name="form1" action="LogsList.action" method="post">
		<s:hidden id="id" name="t_sys_log.id"></s:hidden>
		<s:hidden id="operationType" name="t_sys_log.operationType"></s:hidden>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="border_gray_3d6">
			<tr>
				<td height="35" background="/jxhd/images/bg03.jpg"
					style="padding-left:5px;">当前位置：系统设置>角色管理</td>
			</tr>
			<tr>
				<td height="30" background="images/bg06.jpg"><table width="98%"
						border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="800" align="center"><TABLE>
									<TBODY>
										<TR>
											<td width="180">用户名称：</td>
											<TD><INPUT name="t_sys_log.userName" id="userName"
												value="<s:property value='t_sys_log.userName'/>"></TD>
											<td width="180">日志内容：</td>
											<TD><INPUT name="t_sys_log.memo" id="memo"
												value="<s:property value='t_sys_log.memo'/>"></TD>
											<td width="180">操作者IP：</td>
											<TD><INPUT name="t_sys_log.ip" id="ip"
												value="<s:property value='t_sys_log.ip'/>"></TD>
										</TR>
										<TR>
											<td width="280">开始时间:</td>
											<TD><s:textfield name="t_sys_log.beginTime"
													onclick="setday(this)">
													<s:param name="value">
														<s:date name="t_sys_log.beginTime" format="yyyy-MM-dd" />
													</s:param>
												</s:textfield></TD>
											<td width="280">结束时间:</td>
											<TD><s:textfield name="t_sys_log.endTime"
													onclick="setday(this)">
													<s:param name="value">
														<s:date name="t_sys_log.endTime" format="yyyy-MM-dd" />
													</s:param>
												</s:textfield></TD>
										</TR>
									</TBODY>
								</TABLE>
							</td>
							<td valign="bottom"><input name="button" type="image"
								style="height:20px;" onclick="look()"
								src="/jxhd/images/arrow2_03.jpg">
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#97bce3" class="border_gray_4d6"
			style="margin-top:10px;">
			<tr>
				<td height="30" align="center" background="/jxhd/images/bg06.jpg"
					class="black12_b">日志编号</td>
				<td height="30" align="center" background="/jxhd/images/bg06.jpg"
					class="black12_b">操作时间</td>
				<td height="30" align="center" background="/jxhd/images/bg06.jpg"
					class="black12_b">用户名称</td>
				<td height="30" align="center" background="/jxhd/images/bg06.jpg"
					class="black12_b">日志内容</td>
				<td height="30" align="center" background="/jxhd/images/bg06.jpg"
					class="black12_b">操作者IP</td>
			</tr>
			<s:iterator value="t_sys_log.data" status="stat">
				<s:if test="#stat.odd == true">
					<tr>
						<td height="28" align="center" bgcolor="#f1f4f8"><s:property
								value='id' /></td>
						<td height="28" align="center" bgcolor="#f1f4f8"><s:date
								name="operationDate" format="yyyy-MM-dd HH:mm:ss" /></td>
						<td height="28" align="center" bgcolor="#f1f4f8"><s:property
								value='userName' /></td>
						<td height="28" align="center" bgcolor="#f1f4f8"><s:property
								value='memo' /></td>
						<td height="28" align="center" bgcolor="#f1f4f8"><s:property
								value='ip' /></td>
					</tr>
				</s:if>
				<s:else>
					<tr>
						<td height="28" align="center" bgcolor="#FFFFFF"><s:property
								value='id' /></td>
						<td height="28" align="center" bgcolor="#FFFFFF"><s:date
								name="operationDate" format="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td height="28" align="center" bgcolor="#FFFFFF"><s:property
								value='userName' /></td>
						<td height="28" align="center" bgcolor="#FFFFFF"><s:property
								value='memo' /></td>
						<td height="28" align="center" bgcolor="#FFFFFF"><s:property
								value='ip' /></td>
					</tr>
				</s:else>
			</s:iterator>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" background="/jxhd/images/bg04.jpg" bgcolor="#FFFFFF"
			class="border_blue_4bf" style="margin-top:10px;">

			<tr>
				<td width="50%" height="30" background="/jxhd/images/bg04.jpg"
					style="padding-left:5px;">当前是第 <s:property
						value="t_sys_log.pageNo" /> 页 共 <s:property
						value="t_sys_log.pageNum" /> 页 <a class="blue12_33"
					href="javascript:firstPage(<s:property value="t_sys_log.pageNo"/>,<s:property value="t_sys_log.pageNum"/>);">第一页</a>
					<a class="blue12_33"
					href="javascript:prevPage(<s:property value="t_sys_log.pageNo"/>,<s:property value="t_sys_log.pageNum"/>);">上一页</a>
					<a class="blue12_33"
					href="javascript:nextPage(<s:property value="t_sys_log.pageNo"/>,<s:property value="t_sys_log.pageNum"/>);">下一页</a>
					<a class="blue12_33"
					href="javascript:lastPage(<s:property value="t_sys_log.pageNo"/>,<s:property value="t_sys_log.pageNum"/>);">最后一页</a>
				</td>
				<td width="33%"></td>
				<td>转到 <input id="inputPageNo" type="text"
					size="<s:property value="t_sys_log.pageNo"/>"
					name="t_sys_log.pageNo">页 <a class="blue12_33"
					href="javascript:checkInputPageNo1('inputPageNo',<s:property value="t_sys_log.pageNum"/>)">go</a>
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
function look(){
	form1.target="";
	form1.action="LogsList.action";
	form1.submit();
}
function view(mainId){
		var   previewWindow;
		var width = 1024;
		var height = 728;
		if(previewWindow == null){
      			previewWindow = window.open("","Preview","height="+height+",width="+width+",left="+(window.screen.width-width)/2+",top="+(window.screen.height-height)/2+",scrollbars=yes,resizable=yes");
		  }else if(previewWindow.closed == true){
		      	previewWindow = window.open("","Preview","width=1024,height=480,scrollbars=yes,resizable=yes");
		  }
		  var doc = document.form1;
		  doc.target = previewWindow.name;
		  	doc.action = "MainByIdView.action";
		  doc.mainId.value = mainId;
		  doc.submit();
		  previewWindow.focus();
		  doc.target="";
		  doc.action="";
}
function update(mainId){
		var   previewWindow;
		var width = 1024;
		var height = 728;
		if(previewWindow == null){
      			previewWindow = window.open("","Preview","height="+height+",width="+width+",left="+(window.screen.width-width)/2+",top="+(window.screen.height-height)/2+",scrollbars=yes,resizable=yes");
		  }else if(previewWindow.closed == true){
		      	previewWindow = window.open("","Preview","width=1024,height=480,scrollbars=yes,resizable=yes");
		  }
		  var doc = document.form1;
		  doc.target = previewWindow.name;
		  	doc.action = "ToUpdateMain.action";
		  doc.mainId.value = mainId;
		  doc.submit();
		  previewWindow.focus();
		  doc.target="";
		  doc.action="";
}
function addMain(){
	var   previewWindow2;
		var width = 1024;
		var height = 728;
		if(previewWindow2 == null){
      			previewWindow2 = window.open("","Preview2","height="+height+",width="+width+",left="+(window.screen.width-width)/2+",top="+(window.screen.height-height)/2+",scrollbars=yes,resizable=yes");
		  }else if(previewWindow2.closed == true){
		      	previewWindow2 = window.open("","Preview2","width=1024,height=480,scrollbars=yes,resizable=yes");
		  }
		  var doc = document.form1;
		  doc.target = previewWindow2.name;
		  doc.action = "ToAddMain.action";
		  //doc.docInfoType.value = fId;
		  doc.submit();
		  previewWindow2.focus();
		   doc.target="";
		  doc.action="";
}
function deleteMain(mainId){
	form1.target ="";
	form1.action="DeleteMain.action";
	form1.mainId.value = mainId;
	form1.submit();
}
</script>


<script>

var orderFlagArr = new Array(0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
var page_size = 20;
function f_sort(i){
var icol = i+1;
var obj = document.getElementById("data");
var flag = 0;
if(i==-1){
  flag=1;
}else{
 flag=0;
}
var order_flag = orderFlagArr[icol];

f_table_sort(obj,1,icol,flag,order_flag);

if(order_flag>0){
orderFlagArr[icol]=0;
}else{
orderFlagArr[icol]=1;
}
}


</script>




<script>
function get_float(s){
    var ss = s+"";
     if(ss.length<1){return 0;}
    return parseFloat(s);
}
function f_table_sort(obj,start_row_index,icol,flag,order_flag){

                                var i =0;
                                var j =0;
                                var b = 0;
                                var s1 = null;
                                var s2 = null;
                                var row_num = obj.rows.length;
 
                              for(i = obj.rows.length - 1; i > 0; i --)
	{

		for(j = start_row_index; j < i; j ++)
		{
                        if(flag>0){
                                s1 = obj.rows(j).cells(icol).innerText;
                                s2 = obj.rows(j+1).cells(icol).innerText;
                                b = get_float(s1)>get_float(s2);
                           
                        }else{
                            b = obj.rows(j).cells(icol).innerText > obj.rows(j+1).cells(icol).innerText;
                        }
                       
                               if(order_flag>0){
                                       if(b){obj.moveRow(j,j+1);}
                               }else{
                                        if(!b){obj.moveRow(j,j+1);}  
                                }
                              
		}
               
	}
             
  f_set_row_index();

                         }
function f_set_row_index(){
var obj = document.getElementById("data");
var rownum = obj.rows.length;
var i =0;


for(i=1;i<rownum;i++){
//obj.rows(i).cells(0).innerText=i;
}

}

function hhh(){
alert(1);
}

function show_page(page){
form1.ipage.value=page;
var obj = document.getElementById("data");
var row_num = obj.rows.length;
var i = 0;

var start = 0;
var end =0;

for(i=1;i<row_num;i++){
obj.rows(i).style.display="none";
}

start = (page-1)*page_size+1;
end = start+page_size;
if(end>row_num){end=row_num;}

for(i=start;i<end;i++){
obj.rows(i).style.display="";
}
 document.getElementById("page_bar").innerHTML=getPageBar();

}

function getPageBar(){
var obj = document.getElementById("data");
var ipage = form1.ipage.value;

var page_num = 0;
var i =0;
var s ="";


var idx = 0;
var row_num = obj.rows.length-1;
var m  =0;
m = row_num%page_size;
if(m>0){
page_num = (row_num-m)/page_size + 1;
}else{
page_num = (row_num-m)/page_size;
}

if(ipage>1){
	s = "<a href='javascript:show_page(1)'>第一页</a>\n";
	idx = ipage-1;
	s =s +"<a href='javascript:show_page("+idx+")'>上一页</a>\n";
}

if(ipage<page_num){

    idx = (ipage-1)+2;
	s =s +"<a href='javascript:show_page("+idx+")'>下一页</a>\n";
	s =s+ "<a href='javascript:show_page("+page_num+")'>最后页</a>\n";
	
}
s = "共 "+row_num+" 条记录 "+page_num+" 页 "+s; 
return s;
}

function getData(){
var obj = document.getElementById("data");
var row_num = obj.rows.length;
var i =0;
var j =0;
var stxt = "";
var shtm = "";
var sv = "";
var col_num =0;

for(i=1;i<row_num;i++){
col_num = obj.rows(i).cells.length;
for(j=0;j<col_num;j++){
 stxt = stxt+obj.rows(i).cells(j).innerText+",";
 shtm = shtm+obj.rows(i).cells(j).innerHTML+",";
  sv = sv+getFloat(obj.rows(i).cells(j).innerText,0)+",";
}
  stxt = stxt +"\n";
  shtm = shtm+"\n";
  sv = sv+"\n";
}
  var s = stxt+"\n\n\n\n"+shtm+"\n\n\n"+sv;
  alert(s);
}
</script>

</html>