<%@ page language="java" import="java.util.*,com.dt.jxhd.domain.*"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/jxhd/img/jquery-1.8.3.min.js"></script>
</head>
<style type="text/css">
canvas {
	border: dashed 2px #CCC
}
</style>
<script type="text/javascript">
	    var width = 375;
		var height = 562.5;
        function $$(id){
            return document.getElementById(id);
        }
        function pageLoad(){
        var str= new Array();
        var str1= new Array();
        var picDraw;
        var img1=new Image();
		var ratio = 1;
		var ratio1 = 1;
		var ratio2 = 1;
        <s:iterator value="t_user1.data" status="stat" id="id1">
        var id = "can"+<s:property value='userId'/>;
        var pId = "p"+<s:property value='userId'/>;
        
		img1.src="/jxhd/upload/"+"<s:property value='testItem.picUrl'/>";
		width = img1.width;
		height = img1.height;
		ratio = width/img1.width;
		ratio1 = height/img1.height;
		ratio2 = (width*height)/(img1.width*img1.height);
        <s:iterator value="answerLog.data" status="stat" id="id2">
        <s:if test="%{#id1.userId==#id2.studentId}">
        	document.getElementById(pId).innerHTML = '<s:property value='#id2.answerContent'/>';
        <s:if test="%{#id2.picDraw!=''}">
        	<s:if test="%{#id2.picDraw!=null}">
        	 picDraw = '<s:property value='#id2.picDraw'/>';
        	 str=picDraw.split(";");
        	 </s:if>
        </s:if>
        //遍历画圆
        for (i=0;i<str.length ;i++ ){
            	str1 = str[i].split(",");
            	 for (n=0;n<str1.length ;n++ ){
        			test(id,str1[0]*ratio*375/100,str1[1]*ratio1*562.5/100,'red','<s:property value='#id1.name'/>',ratio2);
        }}
			 </s:if>
			 
           </s:iterator> 
       </s:iterator>
           
        }
        
        function test(id,width,height,color,name,ratio){
        	var can = $$(id);
            var cans = can.getContext('2d');
            cans.beginPath();
            cans.arc(width,height,10*Math.sqrt(ratio),0,Math.PI*2,false);
            cans.closePath();
            cans.lineWidth = 1;
            cans.strokeStyle = 'red';
            cans.fillStyle = "red";
			//cans.fillRect(0,0,400,300);
			cans.font = "italic 15px sans-serif";
			cans.textBaseline = 'top';
			var txt=name;
			cans.fillText(txt, width,height);
			cans.stroke();
        }
    </script>
<body onload="pageLoad();">
	<%
		String url = request.getRequestURL().toString();
		url = url.substring(0, url.indexOf("jxhd"));
		List users = (List) request.getAttribute("t_user1.data");
		List answers = (List) request.getAttribute("answerLog.data");
	%>
	<div class="con1 pt10">

		<div class="m5 tpdb">
			<%
				t_user t_user1 = null;
				if (users != null) {
					for (int n = 0; n < users.size(); n++) {
						t_user1 = (t_user) users.get(n);
			%>
			<div class="unit fl">
				<p class="lh28 pl20">
					姓名1：<%=t_user1.getName()%>
				</p>
				<canvas id="can<%=t_user1.getUserId()%>" width="375px"
					height="562.5px">sss</canvas>
				<p class="lh28 pl20" id="p<%=t_user1.getUserId()%>"></p>
			</div>
			<%
				}
				}
			%>
			<div class="cb"></div>
		</div>
	</div>



	<script type="text/javascript" src="/jxhd/img/index.js"></script>
</body>
</html>
<script type="text/javascript">
<s:iterator value="t_user1.data" status="stat"> 
var id = "can"+<s:property value='userId'/>;

var img=new Image()  
img.src="/jxhd/upload/"+"<s:property value='testItem.picUrl'/>";
img.onload = function () //确保图片已经加载完毕  
{  
	//AutoResizeImage(150,1150,img);
	//img.height=500;
	//img.width=500;
	//alert(img.height);
	document.getElementById("can"+<s:property value='userId'/>).height = height;
	document.getElementById("can"+<s:property value='userId'/>).width = width;
    document.getElementById("can"+<s:property value='userId'/>).getContext("2d").drawImage(img,0,0,width,height);  
}  
</s:iterator>
  </script>