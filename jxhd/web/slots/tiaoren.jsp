<!DOCTYPE html >
<%@ page language="java"
	import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>挑人作答</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=2.0">
<%-- <link rel="stylesheet" href="http://libs.useso.com/js/bootstrap/3.2.0/css/bootstrap.min.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/jxhd/slots/css/style.css" type="text/css" media="screen" />
<script type="text/javascript" src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="http://libs.useso.com/js/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/jxhd/slots/src/jquery.slotmachine.js"></script> --%>

<link rel="stylesheet" href="slots/css/bootstrap.min.css" type="text/css" media="screen" />
<link rel="stylesheet" href="slots/css/style.css" type="text/css" media="screen" />
<script type="text/javascript" src="slots/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="slots/js/bootstrap.min.js"></script>
<script type="text/javascript" src="slots/src/jquery.slotmachine.js"></script>
</head>

<video loop="loop" name="media" style="display: none;">
<source src="slots/mp3/gear.mp3" type="audio/mpeg"></source>
</video>

<body>
	<form id="form1" name="form1" action="ToSelectItems.action"
		method="post">
		<s:hidden name="t_user1.userId" id="userId"></s:hidden>
		<s:hidden name="askLog.askId" id="askId"></s:hidden>
		<!-- <div id="footer"> -->
		<div class="content" style="">
			<div class="slots">
				<div class="switch"></div><!-- 摇杆 -->
				<div id="textMachine2"></div><!-- 数据显示 -->
			</div>

			<div style="width: 300px;text-align:center;">
				<a class="prev">上一个</a> <a class="next">下一个</a> <a class="shuffle">随机</a>
				<a class="stop">停</a>
			</div>

			<div style="width:300px;text-align:center;">
				中奖目标：<span class="result"></span>
			</div>

			<%-- <s:iterator value="list" status="stat">
                <s:if test="#stat.last">
                	'<s:property value='userId'/> <s:property value='name'/>'
                </s:if>
                <s:else>
                	'<s:property value='userId'/> <s:property value='name'/>',
                </s:else>
           </s:iterator>
			<br/>
			<s:property value="idAndName"/> --%>
			<script>
			
					// 数据初始化
					/* var groups = [
						<s:iterator value="list" status="stat">
		                <s:if test="#stat.last">
		                '<s:property value='userId'/> <s:property value='name'/>'
		                </s:if>
		                <s:else>
		                '<s:property value='userId'/> <s:property value='name'/>',
		                </s:else>
		                </s:iterator>
					]; */
					
					//var groups = ['11515 李煜', '10549 李松', '10548 刘波', '10547 赵鹏'];
					var groups = [<s:property value="idAndName"/>];
					for(i=0;i<groups.length;i++) {
						$("#textMachine2").append("<div>"+groups[i]+"</div>");
					}

					$(document).ready(function(){

						var textMachine2 = $("#textMachine2").slotMachine({
							active	: 1,
							delay	: 450
							,randomize : function(activeElementIndex){
						        return 1;
						    }
							// ,auto	: 1500
						});

						function shuffle(){

							$(".slotMachineContainer>div").css("color","#FFFFFF");
							$(".slotMachineContainer>div").css("font-size","40px");
							$(".temp").remove();// 清理

							result = numRand();
							textMachine2.setRandomize(function(){
								return result;
							});

							if(result == (groups.length-1))
							{
								//alert("1-"+result)
								$(".slotMachineContainer").append("<div class='temp'>"+groups[1]+"</div>");
								$(".slotMachineContainer").append("<div class='temp'>"+groups[2]+"</div>");
								$(".slotMachineContainer").append("<div class='temp'>"+groups[3]+"</div>");
							}
							if(result == (groups.length-2))
							{
								//alert("2-"+result)
								$(".slotMachineContainer").append("<div class='temp'>"+groups[1]+"</div>");
								$(".slotMachineContainer").append("<div class='temp'>"+groups[2]+"</div>");
							}
							if(result == (groups.length-3))
							{
								//alert("3-"+result)
								$(".slotMachineContainer").append("<div class='temp'>"+groups[1]+"</div>");
							}

							$(".result").text(result+"|"+$(".slotMachineContainer>div").eq(result+1+2).text());

							textMachine2.shuffle();
						}

						function stop(){
							textMachine2.stop();

							$(".slotMachineContainer>div").eq(result+1+2).css("color","yellow");
							$(".slotMachineContainer>div").eq(result+1+2).css("font-size","60px");
							
							var aa = $(".slotMachineContainer>div").eq(result+1+2).text();
							var userId = aa.split(" ")[0];
							form1.userId.value = userId;
							form1.action="SendApp.action";
							form1.submit();
							
							//var url = 'SendAppAjax.action';
				            //	 var params = {
				            //         userId:userId,
				             //        itemId:itemId,
				             //        askType:askType
				            //	 };
				             //	jQuery.post(url, params, callbackFun1, 'json');
						}
						function callbackFun1(data){
				        	var msg = data['msg'];
				  			alert(msg);
        				}

						$(".prev").click(function(){
							textMachine2.prev();
						});
						$(".next").click(function(){
							textMachine2.next();
						});

						function aotoStop(){
							$(".switch").click();
						}
						function slotsStop(){
							$(".slots").toggleClass("on");
							stop();
							$('video').trigger('pause');
						}

						$(".switch").click(function(){
//							if(!$(".slots").hasClass('on')){
								if(textMachine2.isRunning){
									return;
								}
								$(".slots").toggleClass("on");
								shuffle();
								window.setTimeout(slotsStop,2000);// 自动停止
								$('video').trigger('play');
//							}else{
//								$(".slots").toggleClass("on");
//								stop();
//								$('video').trigger('pause');
//							}

						});

						var result=0;
						$(".shuffle").click(function(){

							if(textMachine2.isRunning){
								return;
							}

							shuffle();
						});

						$(".stop").click(function(){
							stop();

							// var slot = $(".slotMachineContainer").css("margin-top");
							// var soloMargin = parseInt(slot.substring(0,slot.length-2))+40;
							// var index = soloMargin *-1/20;
							// $(".result").text($(".slotMachineContainer>div").eq(index+5).text());

						});
					});

					function numRand() {
					var x = groups.length; //上限(不含当前值,可达结果为x-1）
					var y = 0; //下限
					var rand = parseInt(Math.random() * (x - y) + y);
					return rand;
}
					
				</script>
		</div>
	</form>
</body>
</html>