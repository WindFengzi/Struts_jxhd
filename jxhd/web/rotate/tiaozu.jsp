<!DOCTYPE html>
<%@ page language="java" import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>挑组</title>
		<script src="/jxhd/rotate/js/rotate.js"></script>
		<style>
/* 页面 css */
* { margin: 0; padding: 0;}
h1 { width: 900px; margin: 40px auto; font: 32px "Microsoft Yahei"; text-align: center;}
.vad { margin: 50px 0 5px; font-family: Consolas,arial,宋体; text-align:center;}
.vad a { display: inline-block; height: 36px; line-height: 36px; margin: 0 5px; padding: 0 50px; font-size: 14px; text-align:center; color:#eee; text-decoration: none; background-color: #222;}
.vad a:hover { color: #fff; background-color: #000;}
.thead { width: 728px; height: 90px; margin: 0 auto; border-bottom: 40px solid transparent;}

/* demo css */
#dowebok { position: relative; width: 780px; height: 390px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; background: url(/jxhd/rotate/images/ly-plate-c.gif) 20px 20px no-repeat;}
.plate {margin: 0px 150px 120px; position: relative; float: left; width: 390px; height: 390px; background-image: url(/jxhd/rotate/images/lyplate.png);}
.prize { float: right; width: 360px; height: 390px; font: 14px/1.5 "Microsoft Yahei";}
.prize h4 { margin: 80px 0 20px; padding: 10px; background-color: #eee;}
.prize ul { list-style-type: none;}
.prize li { margin: 10px;}
#plateBtn { 
  position: absolute;
  left: 235px;
  top: 85px;
  width: 260px;
  height: 260px;
  background-image: url(/jxhd/rotate/images/rotate-static.png);
  background-position: 50%;
  text-indent: -9999px;
  overflow: hidden;
}
#result { display: none; position: absolute; left: 65px; top: 155px; width: 300px; height: 120px; background-color: rgba(0,0,0,0.75); filter: alpha(opacity=90);}
#resultTxt { padding: 45px 15px 0; font: 16px "Microsoft Yahei"; color: #fff; text-align: center;}
#resultTxt em { color: #ffea76; font-style: normal;}
#resultBtn { position: absolute; right: 5px; top: 5px; width: 25px; height: 25px; text-indent: -100px; background-image: url(/jxhd/rotate/images/close.png); overflow: hidden;}
li{
	display: inline;
	list-style-type: none;
	padding: 5px 10px;
}
</style>
<script>
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null)
        return decodeURIComponent(r[2]);
    return null;
};

var checkboxIndexs=""; // 被选择下标
var checkboxValues=""; // 被选择内容
var checkboxValue;

window.onload = function(){

    // 数据初始化
    var groupNames = [
<s:iterator value="list" status="stat">
                <s:if test="#stat.last">
                '<s:property value='groupName'/>'
                </s:if><s:else>
                '<s:property value='groupName'/>',
                </s:else>
                 </s:iterator>
];
    for(i=0;i<groupNames.length;i++) {
        $(".groupNames").append("<input type='checkbox' style='display:none;' checked><label style='display:none;'>"+groupNames[i]+"</label>");
        if ((i + 1) > 0 && (i + 1) % 6 == 0) {
            $(".groupNames").append("<br/>");
        }
    }
    show();
    // 重置
    $(".reset").click(function(){
        $("input[type='checkbox']").prop("checked",false);
        show();
    });

    // 选择所有
    $(".selectAll").click(function(){
        $("input[type='checkbox']").prop("checked",true);
        show();
    });

    function choose(){
        checkboxIndexs="";// 重置数据
        checkboxValues="";// 重置数据
        var checkboxs=$("p>input");
        var labels = $("p>label");
        for(i=0;i<checkboxs.length;i++) {
            if (checkboxs[i].checked) {
                if (checkboxValues == "") {
                    checkboxIndexs = i.toString();
                    checkboxValues = $("p>label").eq(i).text();
                } else {
                    checkboxIndexs += "," + i.toString();
                    checkboxValues += "," + $("p>label").eq(i).text();
                }
            }
        }
    }

    // 确定选择，刷新页面
    $(".confirm").click(function(){
        choose();
        console.log(checkboxValues);
        if(window.location.host == ""){
            window.location.href = window.location.host+"?checkboxIndexs="+checkboxIndexs+"&checkboxValues="+checkboxValues;
        }else{
            window.location.href = "http://"+window.location.host+window.location.pathname+"?checkboxIndexs="+checkboxIndexs+"&checkboxValues="+checkboxValues;
        }
    });

    // 恢复选中
    function setValue() {
        if (checkboxIndexs != null && checkboxIndexs != "") {
            var checkboxIndex = checkboxIndexs.split(",");
            var checkboxs = $("p>input");
            for (i = 0; i < checkboxIndex.length; i++) {
                checkboxs.eq(checkboxIndex[i]).attr("checked", "true")
            }
        }
    }

    function sycGroup(){
        checkboxValue = "";// 重置数据
        if(checkboxValues != null && checkboxValues != ""){
            checkboxValue = checkboxValues.split(",");
            
        }
    };

    // 更新转盘，盘面
    function updateDial(){
        if(checkboxValue != null && checkboxValue.length>2){
            $(".plate").css("background-image","url(/jxhd/rotate/images/lyplate_"+checkboxValue.length+".png)");
        }else{
            $(".plate").css("background-image","url(/jxhd/rotate/images/lyplate.png)");
        }
    }

    function appoint_init(){

        checkboxIndexs =  getQueryString("checkboxIndexs") != null?getQueryString("checkboxIndexs"):checkboxIndexs;
        checkboxValues =  getQueryString("checkboxValues") != null?getQueryString("checkboxValues"):checkboxValues;

        setValue();// 恢复选择默认
        sycGroup();// 同步组
        updateDial();// 更新转盘，盘面
    }
    appoint_init();// 指定初始化

    // 动态显示
    function show(){
        choose();// 选择

        $(".groupSetting").empty();
        sycGroup();// 同步组
        updateDial();// 更新转盘，盘面
    }

    $("input[type='checkbox']").click(function(){
        show();
    });
}
</script>

</head>

<body>
<form id="form1" name="form1" action="ToSelectItems.action" method="post">
<s:hidden name="student_group.groupName" id="groupName"></s:hidden>
<s:hidden name="askLog.askId" id="askId"></s:hidden>
<h1>挑组作答&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>

<div id="dowebok">
	<div>
		<div class="plate"></div>
		<div>
			<a id="plateBtn" href="javascript:" title="开始抽奖">开始抽奖</a>
		</div>
	</div>


	<div class="prize">

		<div>
			<p class="groupNames">
				<!--<input type="checkbox"><label>A-1</label>-->
				<!--<input type="checkbox"><label>A-2</label>-->
				<!--<input type="checkbox" value="3"><label>A-3</label>-->
				<!--<input type="checkbox" value="4"><label>A-4</label>-->
				<!--<input type="checkbox" value="5"><label>A-5</label>-->
				<!--<input type="checkbox" value="6"><label>A-6</label>-->
				<!--<br/>-->
				<!--<input type="checkbox" value="7"><label>A-7</label>-->
				<!--<input type="checkbox" value="8"><label>A-8</label>-->
				<!--<input type="checkbox" value="9"><label>A-9</label>-->
				<!--<input type="checkbox" value="10"><label>A-10</label>-->
				<!--<input type="checkbox" value="12"><label>A-11</label>-->
				<!--<input type="checkbox" value="12"><label>A-12</label>-->
			</p>
			

			<p class="log-awar-index"></p>
			<p class="log-minAngle"></p>
			<p class="log-maxAngle"></p>
			<p class="log-angle"></p>
			<p class="log-awar"></p>
		</div>


		
	</div>

	<div id="result">
		<p id="resultTxt"></p>
		<a id="resultBtn" href="javascript:" title="关闭">关闭</a>
	</div>
</div>

<script src="/jxhd/rotate/js/jquery-1.8.3.min.js"></script>
<script src="/jxhd/rotate/js/jquery.rotate.min.js"></script>
<script>
$(function(){
	var $plate = $('.plate');
	var $plateBtn = $('#plateBtn');
	var $result = $('#result');
	var $resultTxt = $('#resultTxt');
	var $resultBtn = $('#resultBtn');

	$plateBtn.click(function(){
		var data = [0, 1, 2, 3, 4, 5, 6, 7];
		data = data[Math.floor(Math.random()*data.length)];
		
		if(checkboxValue == null){
			$resultTxt.html("请选择至少两个分组");
			$result.show();
			return ;
		}

		if(checkboxValue.length<2){
			$resultTxt.html("请选择至少两个分组");
			$result.show();
			return ;
		}

		var awardNum = Math.floor(Math.random()*checkboxValue.length)+1;

		var singleAngle = 360/checkboxValue.length;
		var minAngle = (awardNum - 1) * singleAngle;
		var maxAngle = awardNum*singleAngle;
		var awarAngle = Math.floor(Math.random()*(maxAngle-minAngle)+minAngle);

		if($(".angle").val()>0){
			awarAngle = parseInt($(".angle").val());
		}

		$(".log-awar-index").text("log-awar-index:"+awardNum);
		$(".log-minAngle").text("log-minAngle:"+minAngle);
		$(".log-maxAngle").text("log-maxAngle:"+maxAngle);
		$(".log-angle").text("log-angle:"+awarAngle);
		$(".log-awar").text("log-awar:[第"+awardNum+"组]"+checkboxValue[awardNum-1]);

		rotateFunc(1,awarAngle,checkboxValue[awardNum-1]);
	});

	var rotateFunc = function(awards,angle,text){  //awards:奖项，angle:奖项对应的角度
		$plate.stopRotate();
		$plate.rotate({
			angle: 0,
			duration: 5000,
			animateTo: angle + (360*4),  //angle是图片上各奖项对应的角度，1440是让指针固定旋转4圈
			callback: function(){
				//$resultTxt.html(text);
				var groupId = text;
				form1.groupName.value = groupId;
				form1.action="SendZuApp.action";
				form1.submit();
				//var url = 'SendZuAppAjax.action';
				//            	 var params = {
				 //                    groupId:groupId
				 //           	 };
				//             	jQuery.post(url, params, callbackFun1, 'json');
			}
		});
	};
		function callbackFun1(data){
       		var msg = data['msg'];
 			alert(msg);
   		}
	$resultBtn.click(function(){
		$result.hide();
	});
});
</script>
</form>
</body>
</html>