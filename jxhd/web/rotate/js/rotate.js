/**
 * Created by Administrator on 2015/5/19.
 */

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
    var groupNames = ["A-1","A-2","A-3","A-4","A-5","A-6","A-7","A-8","A-9","A-10","A-11","A-12","A-13","A-14","A-15","A-16"];
    for(i=0;i<groupNames.length;i++) {
        $(".groupNames").append("<input type='checkbox'><label>"+groupNames[i]+"</label>");
        if ((i + 1) > 0 && (i + 1) % 6 == 0) {
            $(".groupNames").append("<br/>");
        }
    }

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
            for(i=0;i<checkboxValue.length;i++){
                $(".groupSetting").append("<li><strong>"+(i+1)+"组：</strong>"+checkboxValue[i]+"</li>");
                if((i+1)>1 && (i+1)%3 == 0){
                    $(".groupSetting").append("<br/>");
                }
            }
        }
    };

    // 更新转盘，盘面
    function updateDial(){
        if(checkboxValue != null && checkboxValue.length>2){
            $(".plate").css("background-image","url(images/lyplate_"+checkboxValue.length+".png)");
        }else{
            $(".plate").css("background-image","url(images/lyplate.png)");
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