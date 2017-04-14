<%@ page language="java" import="java.util.*,com.dt.jxhd.domain.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
        canvas{border:dashed 2px #CCC}
    </style>
    <script type="text/javascript">
    var width = 375;
	var height = 562.5;
	
    function gCL(i){ 
var f=parseInt((i%15)/5); 
i=i%15%5; 
switch(f){ 
case 0:return "#"+cS2(255-i*51)+cS2(i*51)+"00"; 
case 1:return "#00"+cS2(255-i*51)+cS2(i*51); 
case 2:return "#"+cS2(i*51)+"00"+cS2(255-i*51); 
} 
} 
function cS2(i) { 
var s=i.toString(16); 
return ("00"+s).substr(s.length); 
} 
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
        <s:iterator value="t_user1.data" status="stat1" id="id1">
        var id = "can";
        var num = -1;
        img1.src="/jxhd/upload/"+"<s:property value='testItem.picUrl'/>";
        width = img1.width;
		height = img1.height;
		ratio = width/img1.width;
		ratio1 = height/img1.height;
		ratio2 = (width*height)/(img1.width*img1.height);
        <s:iterator value="answerLog.data" status="stat" id="id2">
        num = num+2;
        <s:if test="%{#id1.userId==#id2.studentId}">
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
            cans.strokeStyle = color;
            
            cans.fillStyle = color;
			//cans.fillRect(0,0,400,300);
			cans.font = "italic 15px sans-serif";
			cans.textBaseline = 'top';
			var txt=name;
			cans.fillText(txt,width,height);
			cans.stroke();
        }
    </script>
    <body onload="pageLoad();">
       <%
    String url = request.getRequestURL().toString();
    	url = url.substring(0,url.indexOf("jxhd"));
    List users = (List)request.getAttribute("t_user1.data");
    List answers = (List)request.getAttribute("answerLog.data");
     %>
<div class="con1 pt10">
<div class="m5 rbbd">
  <canvas id="can" width="375px" height="562.5px">sss</canvas>
  <div class="cb"></div>
</div>
</div>



<script type="text/javascript" src="img/index.js"></script>
    </body>
</html>
<script type="text/javascript">
<s:iterator value="t_user1.data" status="stat"> 
var id = "can";
var img=new Image()  
img.src="/jxhd/upload/"+"<s:property value='testItem.picUrl'/>";  

img.onload = function () //确保图片已经加载完毕  
{  
	document.getElementById("can").height = height;
	document.getElementById("can").width = width;
    document.getElementById("can").getContext("2d").drawImage(img,0,0,width,height);  
}  
</s:iterator>
  </script>